import '/backend/supabase/supabase.dart';
import '/components/visualizar_movimento/visualizar_movimento_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class moviments_listview extends StatelessWidget {
  const moviments_listview({
    super.key,
    required this.state,
    required this.listViewMovementRowList,
    required this.bottomSheetMatWorkRowList,
  });

  final State state;
  final List<MovementRow> listViewMovementRowList;
  final List<MatWorkRow> bottomSheetMatWorkRowList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewMovementRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewMovementRow = listViewMovementRowList[listViewIndex];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 425,
                      child: VisualizarMovimentoWidget(
                        mov: listViewMovementRow.id,
                      ),
                    ),
                  );
                },
              ).then((value) => state.safeSetState(() {}));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFF2B2B2B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              listViewMovementRow.name,
                              lang.get("name", "Nome"),
                            ).maybeHandleOverflow(maxChars: 15),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                ),
                          ),
                          Text(
                            listViewMovementRow.isStocked!
                                ? 'Stock'
                                : '-${listViewMovementRow.cost?.toString()}€',
                            style: AppTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: listViewMovementRow.isStocked!
                                      ? AppTheme.of(context).success
                                      : AppTheme.of(context).error,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateTimeFormat(
                              'd/M/yy',
                              listViewMovementRow.date!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: AppTheme.of(context).bodySmall,
                          ),
                          if (listViewMovementRow.quantity != null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Text(
                                      lang.get("quantity", "Quantidade"),
                                      textAlign: TextAlign.end,
                                      style: AppTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xB3FFFFFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<MaterialRow>>(
                                  future: MaterialTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'id',
                                      bottomSheetMatWorkRowList
                                          .where((e) =>
                                              e.id ==
                                              listViewMovementRow.matWorkId)
                                          .toList()
                                          .first
                                          .materialId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitFadingFour(
                                            color: AppTheme.of(context).primary,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MaterialRow> textMaterialRowList =
                                        snapshot.data!;
                                    final textMaterialRow =
                                        textMaterialRowList.isNotEmpty
                                            ? textMaterialRowList.first
                                            : null;
                                    return Text(
                                      valueOrDefault<String>(
                                        textMaterialRow?.id != null
                                            ? '${listViewMovementRow.quantity?.toString()}${textMaterialRow!.isUnits! ? ' un.' : ' Kg'}'
                                            : listViewMovementRow.quantity
                                                ?.toString(),
                                        '0',
                                      ),
                                      textAlign: TextAlign.end,
                                      style: AppTheme.of(context).headlineSmall,
                                    );
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
