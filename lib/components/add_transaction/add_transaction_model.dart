import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_transaction_widget.dart' show AddTransactionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTransactionModel extends FlutterFlowModel<AddTransactionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode1;
  TextEditingController? nomeController1;
  String? Function(BuildContext, String?)? nomeController1Validator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeController2;
  String? Function(BuildContext, String?)? nomeController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
