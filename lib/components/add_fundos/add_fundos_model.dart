import '/geral/util.dart';
import 'add_fundos_widget.dart' show AddFundosWidget;
import 'package:flutter/material.dart';

class AddFundosModel extends FlutterFlowModel<AddFundosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    descFocusNode?.dispose();
    descController?.dispose();

    nomeFocusNode?.dispose();
    nomeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
