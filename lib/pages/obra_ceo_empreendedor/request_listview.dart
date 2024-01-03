import '/backend/supabase/supabase.dart';
import '/components/validar_pedido/validar_pedido_widget.dart';
import '/components/visualizar_pedido/visualizar_pedido_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class request_listview extends StatelessWidget {
  const request_listview({
    super.key,
    required this.state,
    required this.listViewRequestRowList,
    required this.obra,
  });

  final State state;
  final List<RequestRow> listViewRequestRowList;
  final WorkRow? obra;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewRequestRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewRequestRow = listViewRequestRowList[listViewIndex];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (listViewRequestRow.status == 0) {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: 465,
                        child: ValidarPedidoWidget(
                          pedido: listViewRequestRow,
                          obra: obra!,
                        ),
                      ),
                    );
                  },
                ).then((value) => state.safeSetState(() {}));
              } else {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: 415,
                        child: VisualizarPedidoWidget(
                          pedido: listViewRequestRow,
                        ),
                      ),
                    );
                  },
                ).then((value) => state.safeSetState(() {}));
              }
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: listViewRequestRow.status == 0
                    ? Color(0xFF2B2B2B)
                    : Color(0xA5171717),
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
                              listViewRequestRow.name,
                              'Pedido',
                            ).maybeHandleOverflow(
                              maxChars: 20,
                              replacement: '…',
                            ),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                ),
                          ),
                          Flexible(
                            child: Stack(
                              children: [
                                if (listViewRequestRow.status == 1)
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Icon(
                                        Icons.done,
                                        color: AppTheme.of(context).success,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                if (listViewRequestRow.status == 2)
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Icon(
                                        Icons.clear,
                                        color: AppTheme.of(context).error,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                if (listViewRequestRow.status == 0)
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Icon(
                                        Icons.keyboard_control,
                                        color: AppTheme.of(context).warning,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppTheme.of(context).secondaryText,
                            size: 16,
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
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              child: Text(
                                'Quantidade',
                                textAlign: TextAlign.end,
                                style: AppTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xB3FFFFFF),
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  listViewRequestRow.quantity?.toString(),
                                  '0',
                                ),
                                textAlign: TextAlign.end,
                                style:
                                    AppTheme.of(context).headlineSmall.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18,
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
            ),
          ),
        );
      },
    );
  }
}
