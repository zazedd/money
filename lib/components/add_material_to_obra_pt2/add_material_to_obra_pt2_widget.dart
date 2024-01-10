import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_material_to_obra_pt2_model.dart';
export 'add_material_to_obra_pt2_model.dart';

class AddMaterialToObraPt2Widget extends StatefulWidget {
  const AddMaterialToObraPt2Widget({
    Key? key,
    required this.obra,
    required this.material,
  }) : super(key: key);

  final WorkRow? obra;
  final MaterialRow? material;

  @override
  _AddMaterialToObraPt2WidgetState createState() =>
      _AddMaterialToObraPt2WidgetState();
}

class _AddMaterialToObraPt2WidgetState
    extends State<AddMaterialToObraPt2Widget> {
  late AddMaterialToObraPt2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMaterialToObraPt2Model());

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
                CustomLocalizations.lang.get("add_material", "Adicionar Material"),
                style: AppTheme.of(context).headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: FutureBuilder<List<MatWorkRow>>(
                future: MatWorkTable().queryRows(
                  queryFn: (q) => q.eq(
                    'material_id',
                    widget.material?.id,
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
                  List<MatWorkRow> containerMatWorkRowList = snapshot.data!;
                  return Container(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            CustomLocalizations.lang.get("quantity", "Quantidade"),
                            style: AppTheme.of(context).titleSmall,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                showValueIndicator: ShowValueIndicator.always,
                              ),
                              child: Slider(
                                activeColor: AppTheme.of(context).primary,
                                inactiveColor: AppTheme.of(context).primaryText,
                                min: 1.0,
                                max: valueOrDefault<double>(
                                  containerMatWorkRowList.isNotEmpty
                                      ? valueOrDefault<double>(
                                          (int qnt, List<int> qntLst) {
                                            return (qnt -
                                                    qntLst.reduce(
                                                        (value, element) =>
                                                            value + element))
                                                .toDouble();
                                          }(
                                              widget.material!.quantity!,
                                              containerMatWorkRowList
                                                  .map((e) => e.quantity)
                                                  .withoutNulls
                                                  .toList()),
                                          1.0,
                                        )
                                      : valueOrDefault<double>(
                                          widget.material?.quantity?.toDouble(),
                                          1.0,
                                        ),
                                  1.0,
                                ),
                                value: _model.sliderValue ??= 1.0,
                                label: _model.sliderValue.toString(),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  setState(() => _model.sliderValue = newValue);
                                  print_("O valor foi mudado para $newValue");
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.matwork = await MatWorkTable().insert({
                      'material_id': widget.material?.id,
                      'quantity': _model.sliderValue!.toInt(),
                      'work_id': widget.obra?.id,
                    });
                    await MovementTable().insert({
                      'cost': 0.0,
                      'description': CustomLocalizations.lang.get("added_from_stock", "Adicionado material do Stock"),
                      'mat_work_id': _model.matwork?.id,
                      'quantity': _model.sliderValue!.toInt(),
                      'is_stocked': true,
                      'date': supaSerialize<DateTime>(getCurrentTimestamp),
                      'name': widget.material?.name,
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          CustomLocalizations.lang.get("quantity_added", "Quantidade adicionada com sucesso!"),
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
                  text: CustomLocalizations.lang.get("submit", "Submeter"),
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
    );
  }
}
