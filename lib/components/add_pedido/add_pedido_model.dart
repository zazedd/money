import '/geral/util.dart';
import 'add_pedido_widget.dart' show AddPedidoWidget;
import 'package:flutter/material.dart';

class AddPedidoModel extends FlutterFlowModel<AddPedidoWidget> {
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

  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  String? _descControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeController2;
  String? Function(BuildContext, String?)? nomeController2Validator;
  String? _nomeController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomeController1Validator = _nomeController1Validator;
    descControllerValidator = _descControllerValidator;
    nomeController2Validator = _nomeController2Validator;
  }

  void dispose() {
    nomeFocusNode1?.dispose();
    nomeController1?.dispose();

    descFocusNode?.dispose();
    descController?.dispose();

    nomeFocusNode2?.dispose();
    nomeController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
