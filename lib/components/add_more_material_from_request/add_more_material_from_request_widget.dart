import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_more_material_from_request_model.dart';
import '/geral/colors.dart';
import '/geral/internationalization.dart';
export 'add_more_material_from_request_model.dart';

class AddMoreMaterialFromRequestWidget extends StatefulWidget {
  const AddMoreMaterialFromRequestWidget({
    Key? key,
    required this.material,
    this.qnt,
    required this.obra,
  }) : super(key: key);

  final MaterialRow? material;
  final int? qnt;
  final WorkRow? obra;

  @override
  _AddMoreMaterialFromRequestWidgetState createState() =>
      _AddMoreMaterialFromRequestWidgetState();
}

class _AddMoreMaterialFromRequestWidgetState
    extends State<AddMoreMaterialFromRequestWidget> {
  late AddMoreMaterialFromRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMoreMaterialFromRequestModel());

    _model.nomeController ??=
        TextEditingController(text: widget.material?.name);
    _model.nomeFocusNode ??= FocusNode();

    _model.quantController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.qnt?.toString(),
      '0',
    ));
    _model.quantFocusNode1 ??= FocusNode();

    _model.quantController2 ??= TextEditingController(
        text: (valueOrDefault<int>(
                  int.tryParse(_model.quantController1.text),
                  0,
                ) *
                valueOrDefault<double>(
                  widget.material?.cost,
                  0.0,
                ))
            .toString());
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
    return FutureBuilder<List<BankRow>>(
      future: BankTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
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
        List<BankRow> bottomSheetMaterialBankRowList = snapshot.data!;
        final bottomSheetMaterialBankRow =
            bottomSheetMaterialBankRowList.isNotEmpty
                ? bottomSheetMaterialBankRowList.first
                : null;
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
                    CustomLocalizations.lang.get("buy_material_to_work", "Compra de Material para a Obra"),
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
                                labelText: CustomLocalizations.lang.get("name", "Nome"),
                                labelStyle: AppTheme.of(context).bodySmall,
                                hintText: CustomLocalizations.lang.get("name", "Nome"),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.quantController1,
                            focusNode: _model.quantFocusNode1,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.quantController2,
                            focusNode: _model.quantFocusNode2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: CustomLocalizations.lang.get("cost", "Custo"),
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
                            validator: _model.quantController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 15.0, 0.0),
                  child: FutureBuilder<List<MatWorkRow>>(
                    future: MatWorkTable().querySingleRow(
                      queryFn: (q) => q
                          .eq(
                            'material_id',
                            widget.material?.id,
                          )
                          .eq(
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
                      List<MatWorkRow> rowMatWorkRowList = snapshot.data!;
                      final rowMatWorkRow = rowMatWorkRowList.isNotEmpty
                          ? rowMatWorkRowList.first
                          : null;
                      return Row(
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
                                          ) +
                                          int.parse(
                                              _model.quantController1.text),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.material?.id,
                                    ),
                                  );
                                  if (rowMatWorkRow?.id != null) {
                                    _model.matwork1 =
                                        await MatWorkTable().update(
                                      data: {
                                        'quantity': rowMatWorkRow!.quantity! +
                                            int.parse(
                                                _model.quantController1.text),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        rowMatWorkRow?.id,
                                      ),
                                      returnRows: true,
                                    );
                                    await MovementTable().insert({
                                      'cost': double.tryParse(
                                          _model.quantController2.text),
                                      'quantity': int.tryParse(
                                          _model.quantController1.text),
                                      'mat_work_id': _model.matwork1?.first?.id,
                                      'description':
                                          'Criado automaticamente de um pedido',
                                      'name': widget.material?.name,
                                      'date': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'is_stocked': false,
                                    });
                                  } else {
                                    _model.matwork2 =
                                        await MatWorkTable().insert({
                                      'work_id': widget.obra?.id,
                                      'material_id': widget.material?.id,
                                      'quantity': int.tryParse(
                                          _model.quantController1.text),
                                    });
                                    await MovementTable().insert({
                                      'cost': double.tryParse(
                                          _model.quantController2.text),
                                      'quantity': int.tryParse(
                                          _model.quantController1.text),
                                      'mat_work_id': _model.matwork2?.id,
                                      'description':
                                          'Criado automaticamente de um pedido',
                                      'name': widget.material?.name,
                                      'date': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'is_stocked': false,
                                    });
                                  }

                                  await WorkTable().update(
                                    data: {
                                      'used_budget': widget.obra!.usedBudget! +
                                          double.parse(
                                              _model.quantController2.text),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.obra?.id,
                                    ),
                                  );
                                  await BankTable().update(
                                    data: {
                                      'total':
                                          bottomSheetMaterialBankRow!.total! -
                                              double.parse(
                                                  _model.quantController2.text),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      1,
                                    ),
                                  );
                                  print_("Foi adicionado material para request");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        CustomLocalizations.lang.get("quantity_added", "Quantidade adicionada com sucesso!"),
                                        style: TextStyle(
                                          color:
                                              AppTheme.of(context).primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          AppTheme.of(context).success,
                                    ),
                                  );

                                  setState(() {});
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
                      );
                    },
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
