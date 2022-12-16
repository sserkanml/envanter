import 'dart:convert';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:aden_envanterus/models/member.dart';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'member_service.g.dart';

class MemberMobx = _MemberMobxBase with _$MemberMobx;

abstract class _MemberMobxBase with Store {
  @observable
  List<Member> members = [];

  @action
  Future<void> getAllMembers() async {
    var url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetUyeler');

    final response = await http.get(url, headers: {
      'cookie': getIt.get<Shared>().pref.getString('sessionID') ?? ''
    });
    late final result;
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      result = jsonDecode(response.body);
      members = result.map<Member>((element) {
        return Member.fromMap(element);
      }).toList();
    } else {
      result = 'Hatayla Karşılaşıldı';
    }

    print(response.body);
  }
}
