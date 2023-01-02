import 'package:aden_envanterus/feature/checking/model/check_qr_model.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:mobx/mobx.dart';
part 'scanned_list.g.dart';

class ScannedListMobx = _ScannedListMobxBase with _$ScannedListMobx;

abstract class _ScannedListMobxBase with Store {
  @observable
  ObservableList<NewCheckedList> scannedList = ObservableList<NewCheckedList>();

  @action
  void addDoneList(
      {required String name,
      required String itemId,
      required String customerId,
      required String unit,
      required ItemsModel item,

      required double quantity}) {
    scannedList.add(NewCheckedList(
        name: name,
        item: item,
        quantity: quantity,
        unit: unit,
        itemId: itemId,
        customerId: customerId));
  }

  @action
  void clearList() {
    scannedList.clear();
  }

  @action
  bool  isContain(String name) => scannedList.contains(name);

  @action
  void updateList({required String name, required double quantity}) {
    scannedList.where((element) => element.name == name).first.quantity =
        quantity;
  }
}
