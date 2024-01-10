import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/colors.dart';
import '/geral/internationalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'visualizar_movimento_model.dart';
export 'visualizar_movimento_model.dart';

class VisualizarMovimentoWidget extends StatefulWidget {
  const VisualizarMovimentoWidget({
    Key? key,
    required this.mov,
  }) : super(key: key);

  final int? mov;

  @override
  _VisualizarMovimentoWidgetState createState() =>
      _VisualizarMovimentoWidgetState();
}

class _VisualizarMovimentoWidgetState extends State<VisualizarMovimentoWidget> {
  late VisualizarMovimentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualizarMovimentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovementRow>>(
      future: MovementTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.mov,
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
        List<MovementRow> bottomSheetMovementRowList = snapshot.data!;
        final bottomSheetMovementRow = bottomSheetMovementRowList.isNotEmpty
            ? bottomSheetMovementRowList.first
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
            child: FutureBuilder<List<MatWorkRow>>(
              future: MatWorkTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'id',
                  bottomSheetMovementRow?.matWorkId,
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
                List<MatWorkRow> columnMatWorkRowList = snapshot.data!;
                final columnMatWorkRow = columnMatWorkRowList.isNotEmpty
                    ? columnMatWorkRowList.first
                    : null;
                return Column(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          bottomSheetMovementRow?.name,
                          CustomLocalizations.lang.get("visualize_funds", "Fundo"),
                        ),
                        style: AppTheme.of(context).headlineSmall,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang.get("description_dots", "Descrição:"),
                                  style:
                                      AppTheme.of(context).titleSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    bottomSheetMovementRow?.description,
                                    CustomLocalizations.lang.get("description", "Descrição"),
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      AppTheme.of(context).bodyMedium,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang.get("date_dots", "Data:"),
                                  style:
                                      AppTheme.of(context).titleSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    bottomSheetMovementRow?.date?.toString(),
                                    '1/1/2000',
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      AppTheme.of(context).bodyMedium,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang.get("quantity_dots", "Quantidade:"),
                                  style:
                                      AppTheme.of(context).titleSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    bottomSheetMovementRow?.quantity
                                        ?.toString(),
                                    '0',
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      AppTheme.of(context).bodyMedium,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang.get("cost_dots", "Custo:"),
                                  style:
                                      AppTheme.of(context).titleSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    bottomSheetMovementRow?.cost?.toString(),
                                    '0',
                                  )}€',
                                  textAlign: TextAlign.start,
                                  style:
                                      AppTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FutureBuilder<List<MaterialRow>>(
                        future: MaterialTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            columnMatWorkRow?.materialId,
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
                          List<MaterialRow> rowMaterialRowList = snapshot.data!;
                          final rowMaterialRow = rowMaterialRowList.isNotEmpty
                              ? rowMaterialRowList.first
                              : null;
                          return Row(
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
                                          color: AppTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BankRow> buttonBankRowList =
                                      snapshot.data!;
                                  final buttonBankRow =
                                      buttonBankRowList.isNotEmpty
                                          ? buttonBankRowList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      await MatWorkTable().delete(
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          bottomSheetMovementRow?.matWorkId,
                                        ),
                                      );
                                      if (bottomSheetMovementRow!.isStocked!) {
                                        await MaterialTable().update(
                                          data: {
                                            'quantity':
                                                rowMaterialRow!.quantity! +
                                                    columnMatWorkRow!.quantity!,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            columnMatWorkRow?.materialId,
                                          ),
                                        );
                                      } else {
                                        await BankTable().update(
                                          data: {
                                            'total': buttonBankRow!.total! +
                                                bottomSheetMovementRow!.cost!,
                                          },
                                          matchingRows: (rows) => rows,
                                        );
                                      }
                                      print_("Bank Table e Material Table atualizadas");

                                      await MovementTable().delete(
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          bottomSheetMovementRow?.id,
                                        ),
                                      );
                                      print_("Movement Table deletado id");
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            CustomLocalizations.lang.get("removed_moviment", "Movimento removido."),
                                            style: TextStyle(
                                              color:
                                                  AppTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              AppTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    },
                                    text: CustomLocalizations.lang.get("erase", "Remover"),
                                    icon: Icon(
                                      Icons.close,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          50.0, 0.0, 50.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: AppTheme.of(context).error,
                                      textStyle: AppTheme.of(context)
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
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
