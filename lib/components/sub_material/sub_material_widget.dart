import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/colors.dart';
import '/geral/internationalization.dart';
import '/geral/widgets.dart';
import 'package:flutter/material.dart';
import 'sub_material_model.dart';
export 'sub_material_model.dart';

class SubMaterialWidget extends StatefulWidget {
  const SubMaterialWidget({
    Key? key,
    required this.material,
  }) : super(key: key);

  final MaterialRow? material;

  @override
  _SubMaterialWidgetState createState() => _SubMaterialWidgetState();
}

class _SubMaterialWidgetState extends State<SubMaterialWidget> {
  late SubMaterialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubMaterialModel());

    _model.nomeController ??=
        TextEditingController(text: widget.material?.name);
    _model.nomeFocusNode ??= FocusNode();

    _model.quantController ??= TextEditingController();
    _model.quantFocusNode ??= FocusNode();

    _model.descController ??= TextEditingController();
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
                CustomLocalizations.lang.get("sub_material", "Subtrair Material"),
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
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.nomeController,
                          focusNode: _model.nomeFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: CustomLocalizations.lang.get("name", "Nome"),
                            labelStyle: AppTheme.of(context).bodySmall,
                            hintText: CustomLocalizations.lang.get("name", "Nome"),
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
                        controller: _model.quantController,
                        focusNode: _model.quantFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: CustomLocalizations.lang.get("quantity", "Quantidade"),
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
                        validator: _model.quantControllerValidator
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
                        controller: _model.descController,
                        focusNode: _model.descFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: CustomLocalizations.lang.get("description", "Descrição"),
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
                        maxLines: 4,
                        validator:
                            _model.descControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await MaterialTable().update(
                            data: {
                              'quantity': valueOrDefault<int>(
                                    widget.material?.quantity,
                                    0,
                                  ) -
                                  int.parse(_model.quantController.text),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.material?.id,
                            ),
                          );
                          print_("Material table atualizada");
                          await MovementTable().insert({
                            'quantity': -int.parse(_model.quantController.text),
                            'description': _model.descController.text,
                          });
                          print_("Movement table modificada");
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                CustomLocalizations.lang.get("quantity_sub", "Quantidade subtraída com sucesso."),
                                style: TextStyle(
                                  color: AppTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: AppTheme.of(context).success,
                            ),
                          );
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
          ],
        ),
      ),
    );
  }
}
