import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_fundos_widget.dart' show AddFundosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
