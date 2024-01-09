import '/backend/supabase/supabase.dart';
import '/components/add_material_to_storage/add_material_to_storage_widget.dart';
import '/components/select_add_mod/select_add_mod_widget.dart';
import '/geral/animations.dart';
import '/geral/language.dart';
import '/geral/colors.dart';
import '/geral/no_internet.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'materiais_model.dart';
export 'materiais_model.dart';

class MateriaisWidget extends StatefulWidget {
  const MateriaisWidget({Key? key}) : super(key: key);

  @override
  _MateriaisWidgetState createState() => _MateriaisWidgetState();
}

class _MateriaisWidgetState extends State<MateriaisWidget>
    with TickerProviderStateMixin, ConnectivityMixin {
  late MateriaisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MateriaisModel());

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 360.0,
                  child: AddMaterialToStorageWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: AppTheme.of(context).secondary,
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: AppTheme.of(context).primaryText,
          size: 32.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.get("background2", Color(0xFF181818)),
        automaticallyImplyLeading: false,
        title: Text(
          lang.get("materials", "Materiais"),
          style: AppTheme.of(context).headlineMedium.override(
                fontFamily: 'Readex Pro',
                color: AppTheme.of(context).info,
                fontSize: 20.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            lang.get("material_total", "Total de Materiais"),
                            style: AppTheme.of(context).headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List<MaterialRow>>(
                      future: MaterialTable().queryRows(
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
                        List<MaterialRow> listViewMaterialRowList =
                            snapshot.data!;
                        if (listViewMaterialRowList.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/empty.png',
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.5,
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewMaterialRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewMaterialRow =
                                listViewMaterialRowList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 210.0,
                                          child: SelectAddModWidget(
                                            material: listViewMaterialRow,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: colors.get("secondary_background",
                                        Color(0xFF2B2B2B)),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewMaterialRow.name,
                                                  lang.get("name", "Nome"),
                                                ),
                                                style: AppTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 23.0,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.add_rounded,
                                                color: AppTheme.of(context)
                                                    .secondaryText,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    lang.get("quantity",
                                                        "Quantidade"),
                                                    textAlign: TextAlign.end,
                                                    style: AppTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xB3FFFFFF),
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    '${valueOrDefault<String>(
                                                      listViewMaterialRow
                                                          .quantity
                                                          ?.toString(),
                                                      '0',
                                                    )}${listViewMaterialRow.isUnits! ? ' un.' : ' Kg'}',
                                                    textAlign: TextAlign.end,
                                                    style: AppTheme.of(context)
                                                        .headlineSmall,
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
                      },
                    ),
                  ],
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
