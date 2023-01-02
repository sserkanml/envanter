import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';
part 'take_picture_mobx.g.dart';

class TakePicture = _TakePictureBase with _$TakePicture;

abstract class _TakePictureBase with Store {
  @observable
  ObservableList<XFile> takePicture = ObservableList<XFile>();

  @computed
  bool get is3TakenPhoto => takePicture.length == 3;

  @computed
  int get getListLength => takePicture.length;

  @action
  void refreshState() {
    takePicture = ObservableList<XFile>();
  }

  @action
  void addPhoto(XFile file) {
    takePicture.add(file);

  }
}
