import '/geral/util.dart';
import '/geral/form_field_controller.dart';
import 'modificar_obra_widget.dart' show ModificarObraWidget;
import 'package:flutter/material.dart';

class ModificarObraModel extends WidgetModel<ModificarObraWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode1;
  TextEditingController? nomeController1;
  String? Function(BuildContext, String?)? nomeController1Validator;
  String? _nomeController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeController2;
  String? Function(BuildContext, String?)? nomeController2Validator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  String? _descControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomeController1Validator = _nomeController1Validator;
    descControllerValidator = _descControllerValidator;
  }

  void dispose() {
    nomeFocusNode1?.dispose();
    nomeController1?.dispose();

    nomeFocusNode2?.dispose();
    nomeController2?.dispose();

    descFocusNode?.dispose();
    descController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
