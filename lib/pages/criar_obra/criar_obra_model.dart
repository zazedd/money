import '/backend/supabase/supabase.dart';
import '/geral/util.dart';
import '/geral/form_field_controller.dart';
import 'criar_obra_widget.dart' show CriarObraWidget;
import 'package:flutter/material.dart';

class CriarObraModel extends WidgetModel<CriarObraWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameController1;
  String? Function(BuildContext, String?)? nameController1Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameController2;
  String? Function(BuildContext, String?)? nameController2Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode3;
  TextEditingController? nameController3;
  String? Function(BuildContext, String?)? nameController3Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  WorkRow? obra;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameFocusNode1?.dispose();
    nameController1?.dispose();

    nameFocusNode2?.dispose();
    nameController2?.dispose();

    nameFocusNode3?.dispose();
    nameController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
