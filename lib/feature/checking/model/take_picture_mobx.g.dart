// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_picture_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TakePicture on _TakePictureBase, Store {
  Computed<bool>? _$is3TakenPhotoComputed;

  @override
  bool get is3TakenPhoto =>
      (_$is3TakenPhotoComputed ??= Computed<bool>(() => super.is3TakenPhoto,
              name: '_TakePictureBase.is3TakenPhoto'))
          .value;
  Computed<int>? _$getListLengthComputed;

  @override
  int get getListLength =>
      (_$getListLengthComputed ??= Computed<int>(() => super.getListLength,
              name: '_TakePictureBase.getListLength'))
          .value;

  late final _$takePictureAtom =
      Atom(name: '_TakePictureBase.takePicture', context: context);

  @override
  ObservableList<XFile> get takePicture {
    _$takePictureAtom.reportRead();
    return super.takePicture;
  }

  @override
  set takePicture(ObservableList<XFile> value) {
    _$takePictureAtom.reportWrite(value, super.takePicture, () {
      super.takePicture = value;
    });
  }

  late final _$_TakePictureBaseActionController =
      ActionController(name: '_TakePictureBase', context: context);

  @override
  void refreshState() {
    final _$actionInfo = _$_TakePictureBaseActionController.startAction(
        name: '_TakePictureBase.refreshState');
    try {
      return super.refreshState();
    } finally {
      _$_TakePictureBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPhoto(XFile file) {
    final _$actionInfo = _$_TakePictureBaseActionController.startAction(
        name: '_TakePictureBase.addPhoto');
    try {
      return super.addPhoto(file);
    } finally {
      _$_TakePictureBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
takePicture: ${takePicture},
is3TakenPhoto: ${is3TakenPhoto},
getListLength: ${getListLength}
    ''';
  }
}
