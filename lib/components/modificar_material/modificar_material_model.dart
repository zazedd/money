import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'modificar_material_widget.dart' show ModificarMaterialWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModificarMaterialModel extends FlutterFlowModel<ModificarMaterialWidget> {
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
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

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

  String? get radioButtonValue => radioButtonValueController?.value;
}
