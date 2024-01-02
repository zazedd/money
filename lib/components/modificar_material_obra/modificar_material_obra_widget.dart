import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'modificar_material_obra_model.dart';
export 'modificar_material_obra_model.dart';

class ModificarMaterialObraWidget extends StatefulWidget {
  const ModificarMaterialObraWidget({
    Key? key,
    required this.material,
    required this.work,
  }) : super(key: key);

  final MaterialRow? material;
  final WorkRow? work;

  @override
  _ModificarMaterialObraWidgetState createState() =>
      _ModificarMaterialObraWidgetState();
}

class _ModificarMaterialObraWidgetState
    extends State<ModificarMaterialObraWidget> {
  late ModificarMaterialObraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModificarMaterialObraModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MatWorkRow>>(
      future: MatWorkTable().querySingleRow(
        queryFn: (q) => q
            .eq(
              'work_id',
              widget.work?.id,
            )
            .eq(
              'material_id',
              widget.material?.id,
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
        List<MatWorkRow> bottomSheetMatWorkRowList = snapshot.data!;
        final bottomSheetMatWorkRow = bottomSheetMatWorkRowList.isNotEmpty
            ? bottomSheetMatWorkRowList.first
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
                    'Modificar Material',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
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
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.material?.name,
                                'Nome',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: FutureBuilder<List<MatWorkRow>>(
                    future: MatWorkTable().queryRows(
                      queryFn: (q) => q
                          .neq(
                            'work_id',
                            widget.work?.id,
                          )
                          .neq(
                            'material_id',
                            widget.material?.id,
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
                      List<MatWorkRow> containerMatWorkRowList = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black, Color(0x47353535)],
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Quantidade',
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    showValueIndicator:
                                        ShowValueIndicator.always,
                                  ),
                                  child: Slider(
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    min: 0.0,
                                    max: valueOrDefault<double>(
                                      containerMatWorkRowList.isNotEmpty
                                          ? valueOrDefault<double>(
                                              (int qnt, List<int> qntLst) {
                                                return (qnt -
                                                        qntLst.reduce((value,
                                                                element) =>
                                                            value + element))
                                                    .toDouble();
                                              }(
                                                  widget.material!.quantity!,
                                                  containerMatWorkRowList
                                                      .map((e) =>
                                                          valueOrDefault<int>(
                                                            e.quantity,
                                                            0,
                                                          ))
                                                      .toList()),
                                              1.0,
                                            )
                                          : widget.material?.quantity
                                              ?.toDouble(),
                                      1.0,
                                    ),
                                    value: _model.sliderValue ??=
                                        valueOrDefault<double>(
                                      bottomSheetMatWorkRow?.quantity
                                          ?.toDouble(),
                                      0.0,
                                    ),
                                    label: _model.sliderValue.toString(),
                                    onChanged: (newValue) {
                                      newValue = double.parse(
                                          newValue.toStringAsFixed(0));
                                      setState(
                                          () => _model.sliderValue = newValue);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await MatWorkTable().delete(
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  bottomSheetMatWorkRow?.id,
                                ),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Material removido da obra.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            },
                            text: 'Remover',
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
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await MovementTable().insert({
                                  'cost': 0.0,
                                  'description': 'Mudança no Stock',
                                  'mat_work_id': bottomSheetMatWorkRow?.id,
                                  'quantity': _model.sliderValue!.toInt() -
                                      bottomSheetMatWorkRow!.quantity!,
                                  'is_stocked': true,
                                  'date': supaSerialize<DateTime>(
                                      dateTimeFromSecondsSinceEpoch(
                                          getCurrentTimestamp
                                              .secondsSinceEpoch)),
                                  'name': widget.material?.name,
                                });
                                await MatWorkTable().update(
                                  data: {
                                    'quantity': _model.sliderValue!.toInt(),
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    bottomSheetMatWorkRow?.id,
                                  ),
                                );
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Quantidade atualizada com sucesso.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).success,
                                  ),
                                );
                              },
                              text: 'Submeter',
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
