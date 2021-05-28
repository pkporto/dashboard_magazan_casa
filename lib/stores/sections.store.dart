import 'package:dashboard_magazan_casa/models/sections_model.dart';
import 'package:dashboard_magazan_casa/repositories/sections_repository.dart';
import 'package:mobx/mobx.dart';
part 'sections.store.g.dart';

class SectionStore = _SectionStore with _$SectionStore;

abstract class _SectionStore with Store {
  late SectionsRepository _repository = SectionsRepository();

  @observable
  ObservableList<Sections> sections = ObservableList<Sections>();

  @action
  get_sections(int cod) async {
    print('entrou' + cod.toString());
    sections = ObservableList<Sections>.of(await _repository.get(cod));
  }
}
