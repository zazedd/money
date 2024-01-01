import '/backend/supabase/supabase.dart';
import '/components/modificar_material_obra/modificar_material_obra_widget.dart';
import '/components/modificar_tarefa/modificar_tarefa_widget.dart';
import '/components/select_what_to_add/select_what_to_add_widget.dart';
import '/components/select_what_to_do/select_what_to_do_widget.dart';
import '/components/validar_pedido/validar_pedido_widget.dart';
import '/components/visualizar_movimento/visualizar_movimento_widget.dart';
import '/components/visualizar_pedido/visualizar_pedido_widget.dart';
import '/components/visualizar_pessoa_disponivel/visualizar_pessoa_disponivel_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'obra_ceo_empreendedor_widget.dart' show ObraCEOEmpreendedorWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ObraCEOEmpreendedorModel
    extends FlutterFlowModel<ObraCEOEmpreendedorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
