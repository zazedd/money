import '/backend/supabase/supabase.dart';
import '/geral/util.dart';
import 'add_movimento_to_obra_widget.dart' show AddMovimentoToObraWidget;
import 'package:flutter/material.dart';

class AddMovimentoToObraModel
    extends WidgetModel<AddMovimentoToObraWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  String? _nomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  // State field(s) for qnt widget.
  FocusNode? qntFocusNode;
  TextEditingController? qntController;
  String? Function(BuildContext, String?)? qntControllerValidator;
  String? _qntControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for preco widget.
  FocusNode? precoFocusNode;
  TextEditingController? precoController;
  String? Function(BuildContext, String?)? precoControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MatWorkRow? matwork;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomeControllerValidator = _nomeControllerValidator;
    qntControllerValidator = _qntControllerValidator;
  }

  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    descFocusNode?.dispose();
    descController?.dispose();

    qntFocusNode?.dispose();
    qntController?.dispose();

    precoFocusNode?.dispose();
    precoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
