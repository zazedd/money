import '/backend/supabase/supabase.dart';
import '/geral/drop_down.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/colors.dart';
import '/geral/language.dart';
import '/geral/widgets.dart';
import '/geral/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'modificar_tarefa_model.dart';
export 'modificar_tarefa_model.dart';

class ModificarTarefaWidget extends StatefulWidget {
  const ModificarTarefaWidget({
    Key? key,
    required this.obra,
    required this.tarefa,
  }) : super(key: key);

  final WorkRow? obra;
  final TaskRow? tarefa;

  @override
  _ModificarTarefaWidgetState createState() => _ModificarTarefaWidgetState();
}

class _ModificarTarefaWidgetState extends State<ModificarTarefaWidget> {
  late ModificarTarefaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModificarTarefaModel());

    _model.nomeController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.tarefa?.name,
      'Nome',
    ));
    _model.nomeFocusNode ??= FocusNode();

    _model.descController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.obra?.description,
      'Desc',
    ));
    _model.descFocusNode ??= FocusNode();

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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'Modificar Tarefa',
                      style: AppTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.nomeController,
                                focusNode: _model.nomeFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  labelStyle: AppTheme.of(context).bodySmall,
                                  hintStyle: AppTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colors.get(
                                          "background", Colors.black),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colors.get(
                                          "background", Colors.black),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colors.get(
                                          "background", Colors.black),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colors.get(
                                          "background", Colors.black),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xD4000000),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 2.0, 20.0, 24.0),
                                ),
                                style: AppTheme.of(context).bodyMedium,
                                validator: _model.nomeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 86.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.descController,
                              focusNode: _model.descFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                                labelStyle: AppTheme.of(context).bodySmall,
                                hintStyle: AppTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        colors.get("background", Colors.black),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        colors.get("background", Colors.black),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        colors.get("background", Colors.black),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        colors.get("background", Colors.black),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                fillColor: Color(0xD4000000),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 2.0, 20.0, 24.0),
                              ),
                              style: AppTheme.of(context).bodyMedium,
                              maxLines: 3,
                              validator: _model.descControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<UsersRow>>(
                            future: UsersTable().queryRows(
                              queryFn: (q) => q.in_(
                                'id',
                                bottomSheetMaterialTaskRowList
                                    .map((e) => e.userId)
                                    .withoutNulls
                                    .toList(),
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
                              List<UsersRow> dropDownUsersRowList =
                                  snapshot.data!;
                              return DropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue1 ??=
                                      widget.tarefa?.userId,
                                ),
                                options: List<String>.from(dropDownUsersRowList
                                    .map((e) => e.id)
                                    .toList()),
                                optionLabels: dropDownUsersRowList
                                    .map((e) => e.name)
                                    .withoutNulls
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue1 = val),
                                width: MediaQuery.sizeOf(context).width * 0.93,
                                height: 50.0,
                                textStyle: AppTheme.of(context).bodyMedium,
                                hintText: 'Selecione um Trabalhador...',
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          DropDown<int>(
                            controller: _model.dropDownValueController2 ??=
                                FormFieldController<int>(
                              _model.dropDownValue2 ??= widget.tarefa?.status,
                            ),
                            options: List<int>.from([0, 1, 2]),
                            optionLabels: ['Pendente', 'Completa', 'Cancelada'],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue2 = val),
                            width: MediaQuery.sizeOf(context).width * 0.93,
                            height: 50.0,
                            textStyle: AppTheme.of(context).bodyMedium,
                            hintText: 'Selecione um Estado...',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final _datePicked1Date = await showDatePicker(
                                context: context,
                                initialDate:
                                    (widget.tarefa?.startsAt ?? DateTime.now()),
                                firstDate: DateTime(1900),
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
                                    pickerBackgroundColor: AppTheme.of(context)
                                        .secondaryBackground,
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
                            text: 'Data de Início',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppTheme.of(context).primary,
                              textStyle:
                                  AppTheme.of(context).titleSmall.override(
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
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final _datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      (widget.tarefa?.endsAt ?? DateTime.now()),
                                  firstDate: DateTime(1900),
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
                                          AppTheme.of(context)
                                              .secondaryBackground,
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
                              text: 'Data de Fim',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: AppTheme.of(context).primary,
                                textStyle:
                                    AppTheme.of(context).titleSmall.override(
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
                          await TaskTable().update(
                            data: {
                              'description': _model.descController.text,
                              'starts_at':
                                  supaSerialize<DateTime>(_model.datePicked1),
                              'ends_at':
                                  supaSerialize<DateTime>(_model.datePicked2),
                              'name': _model.nomeController.text,
                              'user_id': _model.dropDownValue1,
                              'status': _model.dropDownValue2,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.tarefa?.id,
                            ),
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tarefa atualizada com sucesso.',
                                style: TextStyle(
                                  color: AppTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: AppTheme.of(context).success,
                            ),
                          );
                        },
                        text: 'Submeter',
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
          ),
        );
      },
    );
  }
}
