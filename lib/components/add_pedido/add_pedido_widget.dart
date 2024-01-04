import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/colors.dart';
import '/geral/language.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_pedido_model.dart';
export 'add_pedido_model.dart';

class AddPedidoWidget extends StatefulWidget {
  const AddPedidoWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _AddPedidoWidgetState createState() => _AddPedidoWidgetState();
}

class _AddPedidoWidgetState extends State<AddPedidoWidget> {
  late AddPedidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPedidoModel());

    _model.nomeController1 ??= TextEditingController();
    _model.nomeFocusNode1 ??= FocusNode();

    _model.descController ??= TextEditingController();
    _model.descFocusNode ??= FocusNode();

    _model.nomeController2 ??= TextEditingController();
    _model.nomeFocusNode2 ??= FocusNode();

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
                  lang.get("add_request_title", "Fazer Pedido"),
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
                            controller: _model.nomeController1,
                            focusNode: _model.nomeFocusNode1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: lang.get(
                                  "add_request_name", "Nome do Material"),
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
                            validator: _model.nomeController1Validator
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
                height: 94.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                            alignLabelWithHint: false,
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
                      EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.nomeController2,
                          focusNode: _model.nomeFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nomeController2',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          textCapitalization: TextCapitalization.none,
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
                            suffixIcon: _model.nomeController2!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.nomeController2?.clear();
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
                          validator: _model.nomeController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await RequestTable().insert({
                        'name': _model.nomeController1.text,
                        'quantity': int.tryParse(_model.nomeController2.text),
                        'description': _model.descController.text,
                        'user_id': currentUserUid,
                        'work_id': widget.obra?.id,
                        'status': 0,
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Obrigado, por favor aguarde que o seu pedido seja aceite.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: AppTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: AppTheme.of(context).secondary,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
