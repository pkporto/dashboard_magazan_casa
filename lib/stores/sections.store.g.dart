// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SectionStore on _SectionStore, Store {
  final _$sectionsAtom = Atom(name: '_SectionStore.sections');

  @override
  ObservableList<Sections> get sections {
    _$sectionsAtom.reportRead();
    return super.sections;
  }

  @override
  set sections(ObservableList<Sections> value) {
    _$sectionsAtom.reportWrite(value, super.sections, () {
      super.sections = value;
    });
  }

  final _$get_sectionsAsyncAction = AsyncAction('_SectionStore.get_sections');

  @override
  Future get_sections(int cod) {
    return _$get_sectionsAsyncAction.run(() => super.get_sections(cod));
  }

  @override
  String toString() {
    return '''
sections: ${sections}
    ''';
  }
}
