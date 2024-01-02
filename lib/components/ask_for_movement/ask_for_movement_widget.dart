import '/backend/supabase/supabase.dart';
import '/components/add_more_material_from_request/add_more_material_from_request_widget.dart';
import '/components/add_movimento_to_obra/add_movimento_to_obra_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ask_for_movement_model.dart';
export 'ask_for_movement_model.dart';

class AskForMovementWidget extends StatefulWidget {
  const AskForMovementWidget({
    Key? key,
    required this.obra,
    required this.nome,
    int? qnt,
  })  : this.qnt = qnt ?? 0,
        super(key: key);

  final WorkRow? obra;
  final String? nome;
  final int qnt;

  @override
  _AskForMovementWidgetState createState() => _AskForMovementWidgetState();
}

class _AskForMovementWidgetState extends State<AskForMovementWidget> {
  late AskForMovementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AskForMovementModel());

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
          widget.nome,
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
                color: FlutterFlowTheme.of(context).primary,
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
            color: Color(0xFF2B2B2B),
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
                        color: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'O Pedido precisa de Transação?',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                    child: MasonryGridView.builder(
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return [
                          () => FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Não',
                                icon: Icon(
                                  Icons.close,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                          () => FFButtonWidget(
                                onPressed: () async {
                                  if (bottomSheetMaterialRow?.id != null) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 310.0,
                                            child:
                                                AddMoreMaterialFromRequestWidget(
                                              material: bottomSheetMaterialRow!,
                                              qnt: widget.qnt,
                                              obra: widget.obra!,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 370.0,
                                            child: AddMovimentoToObraWidget(
                                              obra: widget.obra!,
                                              qnt: widget.qnt,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  Navigator.pop(context);
                                },
                                text: 'Sim',
                                icon: Icon(
                                  Icons.done,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                        ][index]();
                      },
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
