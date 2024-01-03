import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/colors.dart';
import '/geral/language.dart';
import 'package:flutter/material.dart';
import 'add_movimento_to_obra_model.dart';
export 'add_movimento_to_obra_model.dart';

class AddMovimentoToObraWidget extends StatefulWidget {
  const AddMovimentoToObraWidget({
    Key? key,
    required this.obra,
    this.qnt,
  }) : super(key: key);

  final WorkRow? obra;
  final int? qnt;

  @override
  _AddMovimentoToObraWidgetState createState() =>
      _AddMovimentoToObraWidgetState();
}

class _AddMovimentoToObraWidgetState extends State<AddMovimentoToObraWidget> {
  late AddMovimentoToObraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMovimentoToObraModel());

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.descController ??= TextEditingController();
    _model.descFocusNode ??= FocusNode();

    _model.qntController ??= TextEditingController(
        text: widget.qnt != null ? widget.qnt?.toString() : '0');
    _model.qntFocusNode ??= FocusNode();

    _model.precoController ??= TextEditingController();
    _model.precoFocusNode ??= FocusNode();

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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                child: Text(
                  'Adicionar Movimento',
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
                              fillColor: Color(0xD4000000),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
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
                height: 60.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
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
                            fillColor: Color(0xD4000000),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 20.0, 24.0),
                          ),
                          style: AppTheme.of(context).bodyMedium,
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
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.qntController,
                          focusNode: _model.qntFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Quantidade (opcional)',
                            labelStyle: AppTheme.of(context).bodySmall,
                            hintStyle: AppTheme.of(context).bodySmall,
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
                            fillColor: Color(0xD4000000),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 20.0, 24.0),
                          ),
                          style: AppTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: _model.qntControllerValidator
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
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.precoController,
                          focusNode: _model.precoFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Preço',
                            labelStyle: AppTheme.of(context).bodySmall,
                            hintStyle: AppTheme.of(context).bodySmall,
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
                            fillColor: Color(0xD4000000),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 20.0, 24.0),
                          ),
                          style: AppTheme.of(context).bodyMedium,
                          validator: _model.precoControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 15.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.matwork = await MatWorkTable().insert({
                                'work_id': widget.obra?.id,
                              });
                              await MovementTable().insert({
                                'cost':
                                    double.tryParse(_model.qntController.text),
                                'description': _model.descController.text,
                                'date': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'name': _model.nomeController.text,
                                'mat_work_id': _model.matwork?.id,
                                'is_stocked': false,
                                'quantity': _model.qntController.text != null &&
                                        _model.qntController.text != ''
                                    ? int.tryParse(_model.qntController.text)
                                    : null,
                              });
                              await WorkTable().update(
                                data: {
                                  'used_budget': widget.obra!.usedBudget! +
                                      double.parse(_model.qntController.text),
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  widget.obra?.id,
                                ),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Movimento adicionado com sucesso!',
                                    style: TextStyle(
                                      color: AppTheme.of(context).primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: AppTheme.of(context).success,
                                ),
                              );

                              setState(() {});
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
