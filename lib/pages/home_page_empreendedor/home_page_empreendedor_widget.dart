import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/geral/animations.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'home_page_empreendedor_model.dart';
export 'home_page_empreendedor_model.dart';

class HomePageEmpreendedorWidget extends StatefulWidget {
  const HomePageEmpreendedorWidget({Key? key}) : super(key: key);

  @override
  _HomePageEmpreendedorWidgetState createState() =>
      _HomePageEmpreendedorWidgetState();
}

class _HomePageEmpreendedorWidgetState extends State<HomePageEmpreendedorWidget>
    with TickerProviderStateMixin {
  late HomePageEmpreendedorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageEmpreendedorModel());

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

    return FutureBuilder<List<TaskRow>>(
      future: TaskTable().queryRows(
        queryFn: (q) => q.eq(
          'user_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: AppTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<TaskRow> homePageEmpreendedorTaskRowList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color(0xFF181818),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'Home',
                style: AppTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      color: AppTheme.of(context).info,
                      fontSize: 20.0,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: FutureBuilder<List<WorkRow>>(
                future: WorkTable().queryRows(
                  queryFn: (q) => q
                      .in_(
                        'id',
                        homePageEmpreendedorTaskRowList
                            .map((e) => e.workId)
                            .withoutNulls
                            .toList(),
                      )
                      .eq(
                        'status',
                        0,
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
                  List<WorkRow> listViewWorkRowList = snapshot.data!;
                  if (listViewWorkRowList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/Screenshot_2023-12-27_at_21.57.03.png',
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: MediaQuery.sizeOf(context).height * 0.7,
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewWorkRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewWorkRow =
                          listViewWorkRowList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'obraCEOEmpreendedor',
                              queryParameters: {
                                'obra': serializeParam(
                                  listViewWorkRow,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B2B),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x32000000),
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 75.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF1ED3D3),
                                            Color(0xFF1B8D8D)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        listViewWorkRow.name,
                                                        'Obra',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 18,
                                                        replacement: '…',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: AppTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 25.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      minFontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      listViewWorkRow.usedBudget
                                                          ?.toString(),
                                                      '0',
                                                    )}€ usados de ${listViewWorkRow.budget?.toString()}€',
                                                    style: AppTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'MM/yy',
                                                          listViewWorkRow
                                                              .startsAt!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style: AppTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: valueOrDefault<
                                                            double>(
                                                          ((getCurrentTimestamp
                                                                          .secondsSinceEpoch
                                                                          .toDouble() -
                                                                      listViewWorkRow
                                                                          .startsAt!
                                                                          .secondsSinceEpoch
                                                                          .toDouble()) /
                                                                  (listViewWorkRow
                                                                          .endsAt!
                                                                          .secondsSinceEpoch
                                                                          .toDouble() -
                                                                      listViewWorkRow
                                                                          .startsAt!
                                                                          .secondsSinceEpoch
                                                                          .toDouble()))
                                                              .clamp(0.0, 1.0),
                                                          0.0,
                                                        ),
                                                        lineHeight: 10.0,
                                                        animation: false,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            Color(0xFF168B8B),
                                                        backgroundColor:
                                                            AppTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        barRadius:
                                                            Radius.circular(
                                                                16.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'MM/yy',
                                                          listViewWorkRow
                                                              .endsAt!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style: AppTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 0.0),
                                      child: Text(
                                        'Pode gastar mais ${((listViewWorkRow.budget! - listViewWorkRow.usedBudget!) / (((listViewWorkRow.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil())).toStringAsFixed(2)}€/dia durante ${((listViewWorkRow.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil().toString()} dias',
                                        textAlign: TextAlign.start,
                                        style: AppTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Color(0x8BABB9BF),
                                              fontSize: 9.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
