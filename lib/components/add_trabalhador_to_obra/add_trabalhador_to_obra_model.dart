import '/geral/util.dart';
import '/geral/form_field_controller.dart';
import 'add_trabalhador_to_obra_widget.dart' show AddTrabalhadorToObraWidget;
import 'package:flutter/material.dart';

class AddTrabalhadorToObraModel
    extends WidgetModel<AddTrabalhadorToObraWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
