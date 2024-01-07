import '/backend/supabase/supabase.dart';
import '/geral/radio_button.dart';
import '/geral/colors.dart';
import '/geral/language.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'add_material_to_storage_model.dart';
export 'add_material_to_storage_model.dart';

class AddMaterialToStorageWidget extends StatefulWidget {
  const AddMaterialToStorageWidget({Key? key}) : super(key: key);

  @override
  _AddMaterialToStorageWidgetState createState() =>
      _AddMaterialToStorageWidgetState();
}

class _AddMaterialToStorageWidgetState
    extends State<AddMaterialToStorageWidget> {
  late AddMaterialToStorageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMaterialToStorageModel());

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.quantController1 ??= TextEditingController();
    _model.quantFocusNode1 ??= FocusNode();

    _model.quantController2 ??= TextEditingController();
    _model.quantFocusNode2 ??= FocusNode();

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
                  lang.get("add_material", "Adicionar Material"),
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
                              labelText: lang.get("name", "Nome"),
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
                          controller: _model.quantController1,
                          focusNode: _model.quantFocusNode1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: lang.get("quantity", "Quantidade"),
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
                          validator: _model.quantController1Validator
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
                          controller: _model.quantController2,
                          focusNode: _model.quantFocusNode2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: lang.get("add_material_cost", "Custo por unidade/kg"),
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
                          validator: _model.quantController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                child: CustomRadioButton(
                  options: ['Unidades', 'Kilogramas'].toList(),
                  onChanged: (val) => setState(() {}),
                  controller: _model.radioButtonValueController ??=
                      FormFieldController<String>('Unidades'),
                  optionHeight: 32.0,
                  textStyle: AppTheme.of(context).labelMedium,
                  selectedTextStyle: AppTheme.of(context).bodyMedium,
                  buttonPosition: RadioButtonPosition.left,
                  direction: Axis.horizontal,
                  radioButtonColor: AppTheme.of(context).primary,
                  inactiveRadioButtonColor: AppTheme.of(context).secondaryText,
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.start,
                  verticalAlignment: WrapCrossAlignment.start,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await MaterialTable().insert({
                        'name': _model.nomeController.text,
                        'cost': double.tryParse(_model.quantController2.text),
                        'quantity': int.tryParse(_model.quantController1.text),
                        'is_units': _model.radioButtonValue == 'Unidades',
                      });
                      print_("Foi adicionado material ao storage");
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            lang.get("added_material", "Material adicionado com sucesso!"),
                            style: TextStyle(
                              color: AppTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: AppTheme.of(context).success,
                        ),
                      );
                    },
                    text: lang.get("submit", "Submeter"),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
      ),
    );
  }
}
