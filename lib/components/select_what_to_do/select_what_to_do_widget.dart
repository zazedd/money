import '/backend/supabase/supabase.dart';
import '/components/modificar_obra/modificar_obra_widget.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'select_what_to_do_model.dart';
export 'select_what_to_do_model.dart';

class SelectWhatToDoWidget extends StatefulWidget {
  const SelectWhatToDoWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _SelectWhatToDoWidgetState createState() => _SelectWhatToDoWidgetState();
}

class _SelectWhatToDoWidgetState extends State<SelectWhatToDoWidget> {
  late SelectWhatToDoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectWhatToDoModel());

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
                CustomLocalizations.lang.get("select_what_to_do", "O que pretender fazer?"),
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
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 465.0,
                                      child: ModificarObraWidget(
                                        obra: widget.obra!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {})); print_("Obra modificada");
                            },
                            text: CustomLocalizations.lang.get("modify_work", "Modificar Obra"),
                            options: FFButtonOptions(
                              height: 89.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppTheme.of(context).primary,
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
                      () => Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (widget.obra?.status == 0)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await WorkTable().update(
                                            data: {
                                              'status': 2,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.obra?.id,
                                            ),
                                          );
                                          print_("Obra Cancelada");
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                CustomLocalizations.lang.get("canceled_work", "Obra cancelada."),
                                                style: TextStyle(
                                                  color: AppTheme.of(context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  AppTheme.of(context).error,
                                            ),
                                          );
                                        },
                                        text: CustomLocalizations.lang.get("select_what_to_do_cancel", "Cancelar"),
                                        icon: Icon(
                                          Icons.close,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: AppTheme.of(context).error,
                                          textStyle: AppTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    if (widget.obra?.status == 0)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await WorkTable().update(
                                                data: {
                                                  'status': 1,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.obra?.id,
                                                ),
                                              );
                                              print_("Obra concluida");
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    CustomLocalizations.lang.get("done_work", "Obra concluída!"),
                                                    style: TextStyle(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      AppTheme.of(context)
                                                          .success,
                                                ),
                                              );
                                            },
                                            text: CustomLocalizations.lang.get("select_what_to_do_conclude", "Concluír"),
                                            icon: Icon(
                                              Icons.done,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  AppTheme.of(context).success,
                                              textStyle: AppTheme.of(context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (widget.obra?.status != 0)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await WorkTable().update(
                                        data: {
                                          'status': 0,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.obra?.id,
                                        ),
                                      );
                                      print_("Obra resumida");
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            CustomLocalizations.lang.get("resume_work", "Obra resumida."),
                                            style: TextStyle(
                                              color: AppTheme.of(context)
                                                  .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              AppTheme.of(context).secondary,
                                        ),
                                      );
                                    },
                                    text: CustomLocalizations.lang.get("work_to_resume", "Resumir Obra"),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 89.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: AppTheme.of(context).tertiary,
                                      textStyle: AppTheme.of(context)
                                          .headlineSmall
                                          .override(
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
                              ],
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
