import '/backend/supabase/supabase.dart';
import '/geral/animations.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import '/geral/no_internet.dart';
import '/geral/util.dart';
import '/geral/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'works_carousel.dart';
import 'money_stats_row.dart';

import 'home_page_ceo_model.dart';
export 'home_page_ceo_model.dart';

class HomePageCEOWidget extends StatefulWidget {
  const HomePageCEOWidget({Key? key}) : super(key: key);

  @override
  _HomePageCEOWidgetState createState() => _HomePageCEOWidgetState();
}

class _HomePageCEOWidgetState extends State<HomePageCEOWidget>
    with TickerProviderStateMixin, ConnectivityMixin {
  late HomePageCEOModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
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
    _model = createModel(context, () => HomePageCEOModel());

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
          context.pushNamed('criarObra');
        },
        backgroundColor: Color(0xFF18BDBD),
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
        title: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            CustomLocalizations.lang.get("home_home", 'Home'),
            textAlign: TextAlign.start,
            style: AppTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: AppTheme.of(context).info,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: FutureBuilder<List<BankRow>>(
                        future: BankTable().querySingleRow(
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
                          List<BankRow> baBankRowList = snapshot.data!;
                          final baBankRow = baBankRowList.isNotEmpty
                              ? baBankRowList.first
                              : null;
                          return Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: colors.get(
                                  "secondary_background", Color(0xFF2B2B2B)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x32000000),
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('transacoes');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 23.0,
                                      height: 23.0,
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
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        baBankRow?.name,
                                        CustomLocalizations.lang
                                            .get("name", "Nome"),
                                      ),
                                      style: AppTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 0.0),
                                        child: Text(
                                          '${valueOrDefault<String>(
                                            baBankRow?.total?.toString(),
                                            '0',
                                          )}€',
                                          textAlign: TextAlign.end,
                                          style: AppTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FutureBuilder<List<WorkRow>>(
                      future: WorkTable().queryRows(
                        queryFn: (q) => q.order('status', ascending: true),
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
                        List<WorkRow> carouselWorkRowList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: 158.0,
                          child: works_carousel(
                              carouselWorkRowList: carouselWorkRowList,
                              animationsMap: animationsMap,
                              model: _model),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    CustomLocalizations.lang
                                        .get("home_statistics", 'Estatísticas'),
                                    style: AppTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 22.0,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: FutureBuilder<List<WorkRow>>(
                                  future: WorkTable().queryRows(
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
                                    List<WorkRow> statsWorkRowList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF272727),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x3F14181B),
                                            offset: Offset(0.0, 3.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    CustomLocalizations.lang.get(
                                                        "home_statistics_work_ongoing",
                                                        "Obras em curso"),
                                                    textAlign: TextAlign.start,
                                                    style: AppTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 19.0,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions.countStatuses(
                                                              statsWorkRowList
                                                                  .map((e) =>
                                                                      e.status)
                                                                  .withoutNulls
                                                                  .toList(),
                                                              0),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            AppTheme.of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: AppTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      20.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    CustomLocalizations.lang.get(
                                                        "home_statistics_work_finished",
                                                        "Obras completas"),
                                                    textAlign: TextAlign.start,
                                                    style: AppTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 19.0,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions.countStatuses(
                                                              statsWorkRowList
                                                                  .map((e) =>
                                                                      e.status)
                                                                  .withoutNulls
                                                                  .toList(),
                                                              1),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            AppTheme.of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: AppTheme.of(
                                                                          context)
                                                                      .success,
                                                                  fontSize:
                                                                      20.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  CustomLocalizations.lang.get(
                                                      "home_statistics_work_canceled",
                                                      "Obras canceladas"),
                                                  textAlign: TextAlign.start,
                                                  style: AppTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 19.0,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions.countStatuses(
                                                            statsWorkRowList
                                                                .map((e) =>
                                                                    e.status)
                                                                .withoutNulls
                                                                .toList(),
                                                            2),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          AppTheme.of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: AppTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 20.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation3']!);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('transacoes');
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    CustomLocalizations.lang.get(
                                        "home_statistics_last_30days",
                                        'Últimos 30 dias'),
                                    style: AppTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 22.0,
                                        ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: money_stats_row(
                                      animationsMap: animationsMap),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
