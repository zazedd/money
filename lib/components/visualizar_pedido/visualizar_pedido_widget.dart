import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'visualizar_pedido_model.dart';
export 'visualizar_pedido_model.dart';

class VisualizarPedidoWidget extends StatefulWidget {
  const VisualizarPedidoWidget({
    Key? key,
    required this.pedido,
  }) : super(key: key);

  final RequestRow? pedido;

  @override
  _VisualizarPedidoWidgetState createState() => _VisualizarPedidoWidgetState();
}

class _VisualizarPedidoWidgetState extends State<VisualizarPedidoWidget> {
  late VisualizarPedidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualizarPedidoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MaterialRow>>(
      future: MaterialTable().querySingleRow(
        queryFn: (q) => q.eq(
          'name',
          widget.pedido?.name,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingFour(
                color: AppTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<MaterialRow> bottomSheetMaterialRowList = snapshot.data!;
        final bottomSheetMaterialRow = bottomSheetMaterialRowList.isNotEmpty
            ? bottomSheetMaterialRowList.first
            : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.get("secondary_background", Color(0xFF2B2B2B)),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                      child: Text(
                        CustomLocalizations.lang.get("visualize_request", "Pedido"),
                        style: AppTheme.of(context).headlineSmall,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          if (widget.pedido?.status == 1)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("accepted", "Aceite"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(
                                                          context)
                                                      .success,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.done,
                                      color:
                                          AppTheme.of(context).success,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.pedido?.status == 0)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("pendent", "Pendente"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(
                                                          context)
                                                      .warning,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_control_sharp,
                                      color:
                                          AppTheme.of(context).warning,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.pedido?.status == 2)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("canceled2", "Cancelado"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(
                                                          context)
                                                      .error,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: AppTheme.of(context).error,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Nome:',
                              style: AppTheme.of(context).titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.pedido?.name,
                                CustomLocalizations.lang.get("name", "Nome"),
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 5.0),
                            child: Text(
                              CustomLocalizations.lang.get("description_dots", "Descrição:"),
                              style: AppTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.pedido?.description,
                                CustomLocalizations.lang.get("description", "Descrição"),
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 5.0),
                            child: Text(
                              CustomLocalizations.lang.get("quantity_dots", "Quantidade:"),
                              style: AppTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.pedido?.quantity?.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (bottomSheetMaterialRow?.id != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Color(0x8C353535)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(-1.0, 0.0),
                          end: AlignmentDirectional(1.0, 0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 5.0),
                              child: Text(
                                CustomLocalizations.lang.get("validate_request_value", "Valor Calculado:"),
                                style: AppTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 10.0),
                              child: Text(
                                '${valueOrDefault<String>(
                                  (widget.pedido!.quantity! *
                                          bottomSheetMaterialRow!.cost!)
                                      .toString(),
                                  '0',
                                )}€',
                                textAlign: TextAlign.start,
                                style: AppTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
