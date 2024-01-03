import '/backend/supabase/supabase.dart';
import '/components/visualizar_pessoa_disponivel/visualizar_pessoa_disponivel_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class workers_grid extends StatelessWidget {
  const workers_grid({
    super.key,
    required this.state,
    required this.gridViewUsersRowList,
    required this.obra,
  });

  final State state;
  final List<UsersRow> gridViewUsersRowList;
  final WorkRow? obra;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: gridViewUsersRowList.length,
      itemBuilder: (context, gridViewIndex) {
        final gridViewUsersRow = gridViewUsersRowList[gridViewIndex];
        return FutureBuilder<List<ProfilePicRow>>(
          future: ProfilePicTable().querySingleRow(
            queryFn: (q) => q.eq(
              'user_id',
              gridViewUsersRow.id,
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
            List<ProfilePicRow> workerProfilePicRowList = snapshot.data!;
            final workerProfilePicRow = workerProfilePicRowList.isNotEmpty
                ? workerProfilePicRowList.first
                : null;
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x8C353535),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    valueOrDefault<String>(
                      workerProfilePicRow?.fileName,
                      'https://edhxculkccbyptgfhwds.supabase.co/storage/v1/object/public/profile_pic/pics/uploads/default.jpg',
                    ),
                  ).image,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xA6181818),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
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
                            height: 400,
                            child: VisualizarPessoaDisponivelWidget(
                              user: gridViewUsersRow,
                              obra: obra!.id,
                            ),
                          ),
                        );
                      },
                    ).then((value) => state.safeSetState(() {}));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                          child: Text(
                            valueOrDefault<String>(
                              () {
                                if (gridViewUsersRow.role == 1) {
                                  return 'Empreiteiro';
                                } else if (gridViewUsersRow.role == 2) {
                                  return 'Trabalhador';
                                } else {
                                  return '...';
                                }
                              }(),
                              '...',
                            ),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                            child: Text(
                              valueOrDefault<String>(
                                gridViewUsersRow.name,
                                'Nome',
                              ),
                              style: AppTheme.of(context).displaySmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
