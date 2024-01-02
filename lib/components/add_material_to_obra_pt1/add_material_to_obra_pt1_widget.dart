import '/backend/supabase/supabase.dart';
import '/components/add_material_to_obra_pt2/add_material_to_obra_pt2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_material_to_obra_pt1_model.dart';
export 'add_material_to_obra_pt1_model.dart';

class AddMaterialToObraPt1Widget extends StatefulWidget {
  const AddMaterialToObraPt1Widget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _AddMaterialToObraPt1WidgetState createState() =>
      _AddMaterialToObraPt1WidgetState();
}

class _AddMaterialToObraPt1WidgetState
    extends State<AddMaterialToObraPt1Widget> {
  late AddMaterialToObraPt1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMaterialToObraPt1Model());

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
      future: MatWorkTable().queryRows(
        queryFn: (q) => q.eq(
          'work_id',
          widget.obra?.id,
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
        List<MatWorkRow> bottomSheetMaterialMatWorkRowList = snapshot.data!;
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
                    'Adicionar Material',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FutureBuilder<List<MaterialRow>>(
                      future: MaterialTable().queryRows(
                        queryFn: (q) => q,
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
                        List<MaterialRow> gridViewMaterialRowList =
                            snapshot.data!;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 3.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewMaterialRowList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewMaterialRow =
                                gridViewMaterialRowList[gridViewIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                    if (!(bottomSheetMaterialMatWorkRowList
                                        .where((e) =>
                                            e.materialId ==
                                            gridViewMaterialRow.id)
                                        .toList()
                                        .isNotEmpty)) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: 200.0,
                                              child: AddMaterialToObraPt2Widget(
                                                obra: widget.obra!,
                                                material: gridViewMaterialRow,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'O Material já está na obra!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x9A105DFB),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            gridViewMaterialRow.name,
                                            'Material',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
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
