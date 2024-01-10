import '/backend/supabase/supabase.dart';
import '/geral/drop_down.dart';
import '/geral/icon_button.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/no_internet.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'criar_obra_model.dart';
export 'criar_obra_model.dart';

class CriarObraWidget extends StatefulWidget {
  const CriarObraWidget({Key? key}) : super(key: key);

  @override
  _CriarObraWidgetState createState() => _CriarObraWidgetState();
}

class _CriarObraWidgetState extends State<CriarObraWidget>
    with ConnectivityMixin {
  late CriarObraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarObraModel());

    _model.nameController1 ??= TextEditingController();
    _model.nameFocusNode1 ??= FocusNode();

    _model.nameController2 ??= TextEditingController();
    _model.nameFocusNode2 ??= FocusNode();

    _model.nameController3 ??= TextEditingController();
    _model.nameFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: colors.get("background", Colors.black),
      appBar: AppBar(
        backgroundColor: colors.get("background2", Color(0xFF181818)),
        automaticallyImplyLeading: false,
        leading: CustomIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          CustomLocalizations.lang.get("work_create_title", "Criar Obra"),
          style: AppTheme.of(context).headlineMedium.override(
                fontFamily: 'Readex Pro',
                color: AppTheme.of(context).info,
                fontSize: 20.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  CustomLocalizations.lang.get("basic_data", "Dados Básicos"),
                  style: AppTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: TextFormField(
                  controller: _model.nameController1,
                  focusNode: _model.nameFocusNode1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: CustomLocalizations.lang.get("name", "Nome"),
                    labelStyle: AppTheme.of(context).bodySmall,
                    hintStyle: AppTheme.of(context).bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Color(0x4C666666),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 24.0),
                  ),
                  style: AppTheme.of(context).bodyMedium,
                  validator:
                      _model.nameController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: TextFormField(
                  controller: _model.nameController2,
                  focusNode: _model.nameFocusNode2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: CustomLocalizations.lang
                        .get("description", "Descrição"),
                    labelStyle: AppTheme.of(context).bodySmall,
                    hintStyle: AppTheme.of(context).bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Color(0x4C666666),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 24.0),
                  ),
                  style: AppTheme.of(context).bodyMedium,
                  validator:
                      _model.nameController2Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: TextFormField(
                  controller: _model.nameController3,
                  focusNode: _model.nameFocusNode3,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.nameController3',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: CustomLocalizations.lang
                        .get("work_create_budget", "Budget (Opcional)"),
                    labelStyle: AppTheme.of(context).bodySmall,
                    hintStyle: AppTheme.of(context).bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.get("background", Colors.black),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Color(0x4C666666),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 24.0),
                    suffixIcon: _model.nameController3!.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              _model.nameController3?.clear();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22.0,
                            ),
                          )
                        : null,
                  ),
                  style: AppTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator:
                      _model.nameController3Validator.asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final _datePicked1Date = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: getCurrentTimestamp,
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    AppTheme.of(context).primary,
                                headerForegroundColor:
                                    AppTheme.of(context).info,
                                headerTextStyle:
                                    AppTheme.of(context).headlineLarge.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                pickerBackgroundColor:
                                    AppTheme.of(context).secondaryBackground,
                                pickerForegroundColor:
                                    AppTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    AppTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    AppTheme.of(context).info,
                                actionButtonForegroundColor:
                                    AppTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePicked1Date != null) {
                            safeSetState(() {
                              _model.datePicked1 = DateTime(
                                _datePicked1Date.year,
                                _datePicked1Date.month,
                                _datePicked1Date.day,
                              );
                            });
                          }
                        },
                        text: CustomLocalizations.lang
                            .get("date_init", "Data de Início"),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: AppTheme.of(context).primary,
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
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final _datePicked2Date = await showDatePicker(
                              context: context,
                              initialDate:
                                  (_model.datePicked1 ?? DateTime.now()),
                              firstDate: (_model.datePicked1 ?? DateTime.now()),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return wrapInMaterialDatePickerTheme(
                                  context,
                                  child!,
                                  headerBackgroundColor:
                                      AppTheme.of(context).primary,
                                  headerForegroundColor:
                                      AppTheme.of(context).info,
                                  headerTextStyle: AppTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  pickerBackgroundColor:
                                      AppTheme.of(context).secondaryBackground,
                                  pickerForegroundColor:
                                      AppTheme.of(context).primaryText,
                                  selectedDateTimeBackgroundColor:
                                      AppTheme.of(context).primary,
                                  selectedDateTimeForegroundColor:
                                      AppTheme.of(context).info,
                                  actionButtonForegroundColor:
                                      AppTheme.of(context).primaryText,
                                  iconSize: 24.0,
                                );
                              },
                            );

                            if (_datePicked2Date != null) {
                              safeSetState(() {
                                _model.datePicked2 = DateTime(
                                  _datePicked2Date.year,
                                  _datePicked2Date.month,
                                  _datePicked2Date.day,
                                );
                              });
                            }
                          },
                          text: CustomLocalizations.lang
                              .get("date_end", "Data de Fim"),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: AppTheme.of(context).primary,
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
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  CustomLocalizations.lang.get("contractor", "Empreiteiro"),
                  style: AppTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
                  child: FutureBuilder<List<UsersRow>>(
                    future: UsersTable().queryRows(
                      queryFn: (q) => q.eq(
                        'role',
                        1,
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
                      List<UsersRow> dropDownUsersRowList = snapshot.data!;
                      return DropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= '',
                        ),
                        options: List<String>.from(
                            dropDownUsersRowList.map((e) => e.id).toList()),
                        optionLabels: dropDownUsersRowList
                            .map((e) => e.name)
                            .withoutNulls
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: MediaQuery.sizeOf(context).width * 0.93,
                        height: 50.0,
                        textStyle: AppTheme.of(context).bodyMedium,
                        hintText: CustomLocalizations.lang
                            .get("work_create_select", "Selecione..."),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: AppTheme.of(context).secondaryBackground,
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
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.obra = await WorkTable().insert({
                          'name': _model.nameController1.text,
                          'budget':
                              double.tryParse(_model.nameController3.text),
                          'description': _model.nameController2.text,
                          'starts_at':
                              supaSerialize<DateTime>(_model.datePicked1),
                          'ends_at':
                              supaSerialize<DateTime>(_model.datePicked2),
                          'used_budget': 0.0,
                        });
                        print_("Work Table da obra inserida");
                        await TaskTable().insert({
                          'work_id': _model.obra?.id,
                          'user_id': _model.dropDownValue,
                          'description':
                              'Supervisionar (inserido automáticamente)',
                          'starts_at':
                              supaSerialize<DateTime>(_model.datePicked1),
                          'ends_at':
                              supaSerialize<DateTime>(_model.datePicked2),
                          'status': 4,
                          'name': 'Supervisionar',
                        });
                        print_("Task Table da obra inserida");

                        context.pushNamed('homePageCEO');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              CustomLocalizations.lang.get(
                                  "work_added", "Obra criada com sucesso."),
                              style: TextStyle(
                                color: AppTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: AppTheme.of(context).secondary,
                          ),
                        );

                        setState(() {});
                      },
                      text: CustomLocalizations.lang.get("create_btn", "Criar"),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 121.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: AppTheme.of(context).primary,
                        textStyle: AppTheme.of(context).titleSmall,
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
