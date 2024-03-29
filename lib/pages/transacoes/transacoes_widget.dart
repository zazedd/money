import '/backend/supabase/supabase.dart';
import '/components/add_fundos/add_fundos_widget.dart';
import '/geral/animations.dart';
import '/geral/icon_button.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/no_internet.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import '/geral/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'negative_movements_listview.dart';
import 'fund_listview.dart';

import 'transacoes_model.dart';
export 'transacoes_model.dart';

class TransacoesWidget extends StatefulWidget {
  const TransacoesWidget({Key? key}) : super(key: key);

  @override
  _TransacoesWidgetState createState() => _TransacoesWidgetState();
}

class _TransacoesWidgetState extends State<TransacoesWidget>
    with TickerProviderStateMixin, ConnectivityMixin {
  late TransacoesModel _model;

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
          duration: 600.ms,
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
          delay: 50.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
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
    _model = createModel(context, () => TransacoesModel());

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
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 275.0,
                  child: AddFundosWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: AppTheme.of(context).secondary,
        elevation: 8.0,
        child: Icon(
          Icons.post_add_rounded,
          color: AppTheme.of(context).primaryText,
          size: 32.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.get("background2", Color(0xFF181818)),
        automaticallyImplyLeading: false,
        leading: CustomIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          CustomLocalizations.lang.get("moviments_title", "Movimentos"),
          style: AppTheme.of(context).headlineMedium.override(
                fontFamily: 'Readex Pro',
                fontSize: 20.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: colors.get("secondary_background", Color(0xFF2B2B2B)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x32000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
                    List<BankRow> rowBankRowList = snapshot.data!;
                    final rowBankRow =
                        rowBankRowList.isNotEmpty ? rowBankRowList.first : null;
                    return Row(
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
                                colors: [Color(0xFF1ED3D3), Color(0xFF1B8D8D)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
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
                              rowBankRow?.name,
                              CustomLocalizations.lang.get("name", "Nome"),
                            ),
                            style: AppTheme.of(context).displaySmall.override(
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
                                  rowBankRow?.total?.toString(),
                                  '0',
                                )}€',
                                textAlign: TextAlign.end,
                                style:
                                    AppTheme.of(context).headlineSmall.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 15.0, 0.0, 0.0),
                        child: Text(
                          CustomLocalizations.lang.get(
                              "home_statistics_last_30days", "Últimos 30 dias"),
                          style: AppTheme.of(context).displaySmall.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<FundsBankRow>>(
                            future: FundsBankTable().queryRows(
                              queryFn: (q) => q.gte(
                                'created_at',
                                supaSerialize<DateTime>(
                                    functions.aMonthAgo(getCurrentTimestamp)),
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
                              List<FundsBankRow> incomeCardFundsBankRowList =
                                  snapshot.data!;
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.43,
                                decoration: BoxDecoration(
                                  color: Color(0xFF272727),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x3F14181B),
                                      offset: Offset(0.0, 3.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Receitas',
                                        textAlign: TextAlign.start,
                                        style:
                                            AppTheme.of(context).headlineSmall,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 12.0),
                                        child: Text(
                                          '+\$${(List<double> fundLst) {
                                            return fundLst
                                                .reduce((previous, current) =>
                                                    previous + current)
                                                .toString();
                                          }(incomeCardFundsBankRowList.map((e) => e.quant).withoutNulls.toList())}',
                                          textAlign: TextAlign.start,
                                          style: AppTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: AppTheme.of(context)
                                                    .success,
                                                fontSize: 25.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 28.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x4D39D2C0),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${(List<double> fundLst) {
                                                return ((fundLst.reduce(
                                                                (v, e) =>
                                                                    v + e) -
                                                            5000) /
                                                        5000 *
                                                        100)
                                                    .toStringAsFixed(2);
                                              }(incomeCardFundsBankRowList.map((e) => e.quant).withoutNulls.toList())}%',
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: AppTheme.of(context)
                                                        .success,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.trending_up_rounded,
                                              color:
                                                  AppTheme.of(context).success,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!);
                            },
                          ),
                          Expanded(
                            child: FutureBuilder<List<MovementRow>>(
                              future: MovementTable().queryRows(
                                queryFn: (q) => q.gte(
                                  'date',
                                  supaSerialize<DateTime>(
                                      functions.aMonthAgo(getCurrentTimestamp)),
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
                                List<MovementRow> spendingCardMovementRowList =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF272727),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x3F14181B),
                                        offset: Offset(0.0, 3.0),
                                      )
                                    ],
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
                                        Text(
                                          'Despesas',
                                          textAlign: TextAlign.start,
                                          style: AppTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 12.0),
                                          child: Text(
                                            '-\$${(List<double> fundLst) {
                                              return fundLst
                                                  .reduce((previous, current) =>
                                                      previous + current)
                                                  .toString();
                                            }(spendingCardMovementRowList.map((e) => e.cost).withoutNulls.toList())}',
                                            textAlign: TextAlign.start,
                                            style: AppTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(context)
                                                      .error,
                                                  fontSize: 25.0,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 28.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x54F06A6A),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${(List<double> fundLst) {
                                                  return ((fundLst.reduce(
                                                                  (v, e) =>
                                                                      v + e) -
                                                              8700) /
                                                          8700 *
                                                          100)
                                                      .toStringAsFixed(2);
                                                }(spendingCardMovementRowList.map((e) => e.cost).withoutNulls.toList())}%',
                                                textAlign: TextAlign.start,
                                                style: AppTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          AppTheme.of(context)
                                                              .error,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.trending_up_rounded,
                                                color:
                                                    AppTheme.of(context).error,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!);
                              },
                            ),
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 570.0,
                decoration: BoxDecoration(
                  color: Color(0xB3000000),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 570.0,
                    child: CarouselSlider(
                      items: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    CustomLocalizations.lang
                                        .get("moviments_title", "Movimentos"),
                                    style: AppTheme.of(context).headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<MovementRow>>(
                                future: MovementTable().queryRows(
                                  queryFn: (q) => q.order('date'),
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
                                  List<MovementRow> listViewMovementRowList =
                                      snapshot.data!;
                                  if (listViewMovementRowList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/empty.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height: 400.0,
                                      ),
                                    );
                                  }
                                  return negative_movements_listview(
                                          state: this,
                                          listViewMovementRowList:
                                              listViewMovementRowList)
                                      .animateOnPageLoad(animationsMap[
                                          'listViewOnPageLoadAnimation1']!);
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    CustomLocalizations.lang
                                        .get("moviments_funds", "Fundos"),
                                    style: AppTheme.of(context).headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<FundsBankRow>>(
                                future: FundsBankTable().queryRows(
                                  queryFn: (q) => q.order('created_at'),
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
                                  List<FundsBankRow> listViewFundsBankRowList =
                                      snapshot.data!;
                                  if (listViewFundsBankRowList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/empty.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height: 400.0,
                                      ),
                                    );
                                  }
                                  return fund_listview(
                                          state: this,
                                          listViewFundsBankRowList:
                                              listViewFundsBankRowList)
                                      .animateOnPageLoad(animationsMap[
                                          'listViewOnPageLoadAnimation2']!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 0.9,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.22,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
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
