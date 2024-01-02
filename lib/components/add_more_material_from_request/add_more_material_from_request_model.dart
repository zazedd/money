import '/backend/supabase/supabase.dart';
import '/geral/util.dart';
import 'add_more_material_from_request_widget.dart'
    show AddMoreMaterialFromRequestWidget;
import 'package:flutter/material.dart';

class AddMoreMaterialFromRequestModel
    extends FlutterFlowModel<AddMoreMaterialFromRequestWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for quant widget.
  FocusNode? quantFocusNode1;
  TextEditingController? quantController1;
  String? Function(BuildContext, String?)? quantController1Validator;
  // State field(s) for quant widget.
  FocusNode? quantFocusNode2;
  TextEditingController? quantController2;
  String? Function(BuildContext, String?)? quantController2Validator;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<MatWorkRow>? matwork1;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MatWorkRow? matwork2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    quantFocusNode1?.dispose();
    quantController1?.dispose();

    quantFocusNode2?.dispose();
    quantController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
