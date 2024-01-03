import '/backend/supabase/supabase.dart';
import '/components/visualizar_fundo/visualizar_fundo_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class fund_listview extends StatelessWidget {
  const fund_listview({
    super.key,
    required this.state,
    required this.listViewFundsBankRowList,
  });

  final State state;
  final List<FundsBankRow> listViewFundsBankRowList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewFundsBankRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewFundsBankRow = listViewFundsBankRowList[listViewIndex];
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
                      height: 340.0,
                      child: VisualizarFundoWidget(
                        fundo: listViewFundsBankRow,
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
                  colors: [AppTheme.of(context).success, Color(0x542ABD10)],
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '+${valueOrDefault<String>(
                            listViewFundsBankRow.quant?.toString(),
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
                              listViewFundsBankRow.desc,
                              'isso',
                            ),
                            style: AppTheme.of(context).titleSmall,
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
