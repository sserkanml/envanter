// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectsMobx on _ProjectsMobxBase, Store {
  late final _$projectsAtom =
      Atom(name: '_ProjectsMobxBase.projects', context: context);

  @override
  List<ProjectsModel> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(List<ProjectsModel> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_ProjectsMobxBase.result', context: context);

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$getAllProjectsAsyncAction =
      AsyncAction('_ProjectsMobxBase.getAllProjects', context: context);

  @override
  Future<void> getAllProjects() {
    return _$getAllProjectsAsyncAction.run(() => super.getAllProjects());
  }

  @override
  String toString() {
    return '''
projects: ${projects},
result: ${result}
    ''';
  }
}
