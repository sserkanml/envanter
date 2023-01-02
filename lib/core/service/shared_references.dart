import 'package:aden_envanterus/core/model/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends ICacheManager {
  Future<void> getRef() async {
    super.preferences = await SharedPreferences.getInstance();
    return;
  }

  @override
  bool isContains(SharedPreferences pref, String id) {
    return super.getPref.containsKey(id);
  }

  @override
  Future<bool> clearAllData<T extends IBaseModel>() async {
    return await super.getPref.clear();
  }

  @override
  Future<bool> getSetStrings<T extends IBaseModel>(
      String id, IBaseModel model) async {
    return await super
        .getPref
        .setString('${T.runtimeType}-$id', model.toJsonBase());
  }

  @override
  Future<bool> getSetStringList(
      String id,) async {
   
    return await super.getPref.setStringList(
          'getSavedList',
          super.getCacheList
        );
  }

  @override
  List<String>? getGetStringsList(String id) {
    return super.getPref.getStringList(id);
  }
}

abstract class ICacheManager {
  late SharedPreferences preferences;

  SharedPreferences get getPref => preferences;
  List<String> _cacheList = [];

  void set setCacheList(List<String> value) {
    _cacheList = value;
  }

  List<String> get getCacheList => _cacheList;
  bool isContains(SharedPreferences pref, String id);

  Future<bool> clearAllData<T extends IBaseModel>();
  Future<bool> getSetStrings<T extends IBaseModel>(String id, IBaseModel model);
  Future<bool> getSetStringList(
      String id);
  List<String>? getGetStringsList(
    String id,
  );
}
