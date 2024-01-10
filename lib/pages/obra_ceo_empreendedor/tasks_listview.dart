import '/backend/supabase/supabase.dart';
import '/components/modificar_tarefa/modificar_tarefa_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/internationalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class tasks_listview extends StatelessWidget {
  const tasks_listview({
    super.key,
    required this.state,
    required this.listViewTaskRowList,
    required this.obra,
  });

  final State state;
  final List<TaskRow> listViewTaskRowList;
  final WorkRow? obra;

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
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 460,
                      child: ModificarTarefaWidget(
                        obra: obra!,
                        tarefa: listViewTaskRow,
                      ),
                    ),
                  );
                },
              ).then((value) => state.safeSetState(() {}));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: () {
                  if (listViewTaskRow.status == 0) {
                    return Color(0xFF2B2B2B);
                  } else if (listViewTaskRow.status == 1) {
                    return Color(0x2700FF0A);
                  } else {
                    return Color(0x47FF0000);
                  }
                }(),
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
                              'Tarefa',
                            ),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 23,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: FutureBuilder<List<UsersRow>>(
                              future: UsersTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  listViewTaskRow.userId,
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
                                List<UsersRow> textUsersRowList =
                                    snapshot.data!;
                                final textUsersRow = textUsersRowList.isNotEmpty
                                    ? textUsersRowList.first
                                    : null;
                                return Text(
                                  valueOrDefault<String>(
                                    textUsersRow?.name,
                                    CustomLocalizations.lang
                                        .get("name", "Nome"),
                                  ),
                                  style:
                                      AppTheme.of(context).bodySmall.override(
                                            fontFamily: 'Inter',
                                            fontSize: 18,
                                          ),
                                );
                              },
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
