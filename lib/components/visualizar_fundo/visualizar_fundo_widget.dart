import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visualizar_fundo_model.dart';
export 'visualizar_fundo_model.dart';

class VisualizarFundoWidget extends StatefulWidget {
  const VisualizarFundoWidget({
    Key? key,
    required this.fundo,
  }) : super(key: key);

  final FundsBankRow? fundo;

  @override
  _VisualizarFundoWidgetState createState() => _VisualizarFundoWidgetState();
}

class _VisualizarFundoWidgetState extends State<VisualizarFundoWidget> {
  late VisualizarFundoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualizarFundoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'Fundo',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Descrição:',
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.fundo?.desc,
                            'desc',
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
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Data:',
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: Text(
                          dateTimeFormat(
                            'd/M/yy H:mm',
                            widget.fundo!.createdAt!,
                            locale: FFLocalizations.of(context).languageCode,
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
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Valor:',
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.fundo?.quant?.toString(),
                            '0',
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<List<BankRow>>(
                    future: BankTable().querySingleRow(
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
                      List<BankRow> buttonBankRowList = snapshot.data!;
                      final buttonBankRow = buttonBankRowList.isNotEmpty
                          ? buttonBankRowList.first
                          : null;
                      return FFButtonWidget(
                        onPressed: () async {
                          await BankTable().update(
                            data: {
                              'total':
                                  buttonBankRow!.total! - widget.fundo!.quant!,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              1,
                            ),
                          );
                          await FundsBankTable().delete(
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.fundo?.id,
                            ),
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Fundo apagado!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                              50.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
