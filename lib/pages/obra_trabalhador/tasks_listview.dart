import '/backend/supabase/supabase.dart';
import '/components/visualizar_tarefa/visualizar_tarefa_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class tasks_listview extends StatelessWidget {
  const tasks_listview({
    super.key,
    required this.state,
    required this.listViewTaskRowList,
  });

  final State state;
  final List<TaskRow> listViewTaskRowList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewTaskRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewTaskRow = listViewTaskRowList[listViewIndex];
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
                      height: 410,
                      child: VisualizarTarefaWidget(
                        task: listViewTaskRow,
                      ),
                    ),
                  );
                },
              ).then((value) => state.safeSetState(() {}));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: listViewTaskRow.status == 0
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
                              listViewTaskRow.name,
                              'Fazer X',
                            ).maybeHandleOverflow(
                              maxChars: 23,
                              replacement: '…',
                            ),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18,
                                ),
                          ),
                          Flexible(
                            child: Stack(
                              children: [
                                if (listViewTaskRow.status == 1)
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
                                if (listViewTaskRow.status == 2)
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
                                if (listViewTaskRow.status == 0)
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
