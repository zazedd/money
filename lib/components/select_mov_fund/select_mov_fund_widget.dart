import '/backend/supabase/supabase.dart';
import '/components/add_transaction/add_transaction_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import '/geral/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'select_mov_fund_model.dart';
export 'select_mov_fund_model.dart';

class SelectMovFundWidget extends StatefulWidget {
  const SelectMovFundWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _SelectMovFundWidgetState createState() => _SelectMovFundWidgetState();
}

class _SelectMovFundWidgetState extends State<SelectMovFundWidget> {
  late SelectMovFundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectMovFundModel());

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
                    color: AppTheme.of(context).secondaryText,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
              child: Text(
                CustomLocalizations.lang.get("select_mov_fund", "Transação ou Fundo?"),
                style: AppTheme.of(context).headlineSmall,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return [
                      () => FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 350.0,
                                      child: AddTransactionWidget(
                                        isFund: false,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {})); print_("Transação adicionada");

                              Navigator.pop(context);
                            },
                            text: CustomLocalizations.lang.get("select_mov_fund_trans", "Transação"),
                            icon: Icon(
                              Icons.trending_down_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppTheme.of(context).error,
                              textStyle:
                                  AppTheme.of(context).headlineSmall.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                      () => FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 350.0,
                                      child: AddTransactionWidget(
                                        isFund: true,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {})); print_("Fundo modificado");

                              Navigator.pop(context);
                            },
                            text: CustomLocalizations.lang.get("select_add_mod_fund", "Fundo"),
                            icon: Icon(
                              Icons.trending_up_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppTheme.of(context).success,
                              textStyle:
                                  AppTheme.of(context).headlineSmall.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                    ][index]();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
