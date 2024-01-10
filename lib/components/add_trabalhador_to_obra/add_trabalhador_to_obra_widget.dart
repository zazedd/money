import '/backend/supabase/supabase.dart';
import '/geral/drop_down.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/colors.dart';
import '/geral/internationalization.dart';
import '/geral/widgets.dart';
import '/geral/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_trabalhador_to_obra_model.dart';
export 'add_trabalhador_to_obra_model.dart';

class AddTrabalhadorToObraWidget extends StatefulWidget {
  const AddTrabalhadorToObraWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _AddTrabalhadorToObraWidgetState createState() =>
      _AddTrabalhadorToObraWidgetState();
}

class _AddTrabalhadorToObraWidgetState
    extends State<AddTrabalhadorToObraWidget> {
  late AddTrabalhadorToObraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTrabalhadorToObraModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TaskRow>>(
      future: TaskTable().queryRows(
        queryFn: (q) => q.eq(
          'work_id',
          widget.obra?.id,
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
        List<TaskRow> bottomSheetMaterialTaskRowList = snapshot.data!;
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
                    CustomLocalizations.lang.get("add_worker_to_work", "Adicionar Trabalhador"),
                    style: AppTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 0.0, 0.0, 0.0),
                            child: FutureBuilder<List<UsersRow>>(
                              future: UsersTable().queryRows(
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
                                        color: AppTheme.of(context).primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRow> dropDownUsersRowList =
                                    snapshot.data!;
                                return DropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      dropDownUsersRowList
                                          .map((e) => e.id)
                                          .toList()),
                                  optionLabels: dropDownUsersRowList
                                      .map((e) => e.name)
                                      .withoutNulls
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.93,
                                  height: 50.0,
                                  textStyle: AppTheme.of(context).bodyMedium,
                                  hintText: CustomLocalizations.lang.get("select_worker", "Selecione um Trabalhador..."),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppTheme.of(context).secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: Colors.black,
                                  elevation: 2.0,
                                  borderColor: AppTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x47353535)],
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
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (!(bottomSheetMaterialTaskRowList
                            .where((e) => e.userId == _model.dropDownValue)
                            .toList()
                            .isNotEmpty)) {
                          await TaskTable().insert({
                            'work_id': widget.obra?.id,
                            'user_id': _model.dropDownValue,
                            'description':
                                CustomLocalizations.lang.get("working_auto", "Trabalhar (inserido automaticamente)"),
                            'starts_at':
                                supaSerialize<DateTime>(widget.obra?.startsAt),
                            'ends_at':
                                supaSerialize<DateTime>(widget.obra?.endsAt),
                            'status': 3,
                            'name': CustomLocalizations.lang.get("working", "Trabalhar"),
                          });
                          print_("Adicionado um trabalhador à obra");
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                CustomLocalizations.lang.get("added_worker", "Trabalhador adicionado com sucesso."),
                                style: TextStyle(
                                  color: AppTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: AppTheme.of(context).success,
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                CustomLocalizations.lang.get("worker_in_work", "O trabalhador já está na obra!"),
                                style: TextStyle(
                                  color: AppTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: AppTheme.of(context).error,
                            ),
                          );
                        }
                      },
                      text: CustomLocalizations.lang.get("submit", "Submeter"),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: AppTheme.of(context).success,
                        textStyle: AppTheme.of(context).titleSmall.override(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
