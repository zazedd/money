import '/backend/supabase/supabase.dart';
import '/components/visualizar_movimento/visualizar_movimento_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class negative_movements_listview extends StatelessWidget {
  const negative_movements_listview({
    super.key,
    required this.state,
    required this.listViewMovementRowList,
  });

  final State state;
  final List<MovementRow> listViewMovementRowList;

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
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
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
                      height: 425.0,
                      child: VisualizarMovimentoWidget(
                        mov: listViewMovementRow.id,
                      ),
                    ),
                  );
                },
              ).then((value) => state.safeSetState(() {}));
            },
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.of(context).error, Color(0x54F06A6A)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(-1.0, 0.0),
                  end: AlignmentDirectional(1.0, 0),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              listViewMovementRow.name,
                              lang.get("name", "Nome"),
                            ),
                            style: AppTheme.of(context).headlineSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '-${valueOrDefault<String>(
                            listViewMovementRow.cost?.toString(),
                            '0',
                          )}€',
                          style: AppTheme.of(context).displaySmall.override(
                                fontFamily: 'Readex Pro',
                                color: AppTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                'd/M/yy',
                                listViewMovementRow.date,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '1/1/2000',
                            ),
                            style: AppTheme.of(context).titleSmall,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Text(
                                  lang.get("quantity", "Quantidade"),
                                  textAlign: TextAlign.end,
                                  style:
                                      AppTheme.of(context).bodySmall.override(
                                            fontFamily: 'Inter',
                                            color: Color(0xB3FFFFFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  listViewMovementRow.quantity?.toString(),
                                  '0',
                                ),
                                textAlign: TextAlign.end,
                                style: AppTheme.of(context).headlineSmall,
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
