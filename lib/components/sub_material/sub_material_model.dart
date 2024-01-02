import '/geral/util.dart';
import 'sub_material_widget.dart' show SubMaterialWidget;
import 'package:flutter/material.dart';

class SubMaterialModel extends FlutterFlowModel<SubMaterialWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for quant widget.
  FocusNode? quantFocusNode;
  TextEditingController? quantController;
  String? Function(BuildContext, String?)? quantControllerValidator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    quantFocusNode?.dispose();
    quantController?.dispose();

    descFocusNode?.dispose();
    descController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
