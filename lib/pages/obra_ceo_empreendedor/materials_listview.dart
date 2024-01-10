import '/backend/supabase/supabase.dart';
import '/components/modificar_material_obra/modificar_material_obra_widget.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/internationalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class materials_listview extends StatelessWidget {
  const materials_listview({
    super.key,
    required this.state,
    required this.listViewMaterialRowList,
    required this.bottomSheetMatWorkRowList,
    required this.obra,
  });

  final State state;
  final List<MaterialRow> listViewMaterialRowList;
  final List<MatWorkRow> bottomSheetMatWorkRowList;
  final WorkRow? obra;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewMaterialRowList.length,
      itemBuilder: (context, listViewIndex) {
        final listViewMaterialRow = listViewMaterialRowList[listViewIndex];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 255,
                      child: ModificarMaterialObraWidget(
                        material: listViewMaterialRow,
                        work: obra!,
                      ),
                    ),
                  );
                },
              ).then((value) => state.safeSetState(() {}));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFF2B2B2B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              listViewMaterialRow.name,
                              CustomLocalizations.lang
                                  .get("material_title", "Material"),
                            ),
                            style: AppTheme.of(context).displaySmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 23,
                                ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppTheme.of(context).secondaryText,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              child: Text(
                                CustomLocalizations.lang
                                    .get("quantity", "Quantidade"),
                                textAlign: TextAlign.end,
                                style: AppTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xB3FFFFFF),
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text(
                                '${valueOrDefault<String>(
                                  bottomSheetMatWorkRowList
                                      .where((e) =>
                                          e.materialId ==
                                          listViewMaterialRow.id)
                                      .toList()
                                      .first
                                      .quantity
                                      ?.toString(),
                                  '0',
                                )}${listViewMaterialRow.isUnits! ? ' un.' : ' Kg'}',
                                textAlign: TextAlign.end,
                                style:
                                    AppTheme.of(context).headlineSmall.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20,
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
          ),
        );
      },
    );
  }
}
