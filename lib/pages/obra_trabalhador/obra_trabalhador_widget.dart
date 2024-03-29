import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/add_pedido/add_pedido_widget.dart';
import '/components/visualizar_pedido/visualizar_pedido_widget.dart';
import '/geral/animations.dart';
import '/geral/icon_button.dart';
import '/geral/internationalization.dart';
import '/geral/no_internet.dart';
import '/geral/colors.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'tasks_listview.dart';
import 'requests_listview.dart';

import 'obra_trabalhador_model.dart';
export 'obra_trabalhador_model.dart';

class ObraTrabalhadorWidget extends StatefulWidget {
  const ObraTrabalhadorWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _ObraTrabalhadorWidgetState createState() => _ObraTrabalhadorWidgetState();
}

class _ObraTrabalhadorWidgetState extends State<ObraTrabalhadorWidget>
    with TickerProviderStateMixin, ConnectivityMixin {
  late ObraTrabalhadorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObraTrabalhadorModel());

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
                  height: 340,
                  child: AddPedidoWidget(
                    obra: widget.obra!,
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: AppTheme.of(context).secondary,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: AppTheme.of(context).primaryText,
          size: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.get("background2", Color(0xFF181818)),
        automaticallyImplyLeading: false,
        leading: CustomIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          CustomLocalizations.lang.get("work_title", "Obra"),
          style: AppTheme.of(context).headlineMedium.override(
                fontFamily: 'Readex Pro',
                fontSize: 20,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        decoration: BoxDecoration(
                          color: colors.get(
                              "secondary_background", Color(0xFF2B2B2B)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF1ED3D3),
                                        Color(0xFF1B8D8D)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0, -1),
                                      end: AlignmentDirectional(0, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 15, 15, 18),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.obra?.name,
                                                'Obra',
                                              ).maybeHandleOverflow(
                                                maxChars: 18,
                                                replacement: '…',
                                              ),
                                              style: AppTheme.of(context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF14181B),
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 10, 0, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                  'MM/yy',
                                                  widget.obra!.startsAt!,
                                                  locale:
                                                      CustomLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                ),
                                                style: AppTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 0),
                                              child: LinearPercentIndicator(
                                                percent: 0.75,
                                                lineHeight: 10,
                                                animation: false,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    Color(0xFF168B8B),
                                                backgroundColor:
                                                    AppTheme.of(context)
                                                        .secondaryText,
                                                barRadius: Radius.circular(16),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 15, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                  'MM/yy',
                                                  widget.obra!.endsAt!,
                                                  locale:
                                                      CustomLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                ),
                                                style: AppTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: colors.get("background", Colors.black),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          width: double.infinity,
                          child: CarouselSlider(
                            items: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          CustomLocalizations.lang.get(
                                              "your_tasks", "As suas Tarefas"),
                                          style: AppTheme.of(context)
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: FutureBuilder<List<TaskRow>>(
                                      future: TaskTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .eq(
                                              'work_id',
                                              widget.obra?.id,
                                            )
                                            .order('status', ascending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitFadingFour(
                                                color: AppTheme.of(context)
                                                    .primary,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<TaskRow> listViewTaskRowList =
                                            snapshot.data!;
                                        if (listViewTaskRowList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/empty.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 400,
                                            ),
                                          );
                                        }
                                        return tasks_listview(
                                            state: this,
                                            listViewTaskRowList:
                                                listViewTaskRowList);
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
                                        0, 16, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          CustomLocalizations.lang.get(
                                              "work_requests",
                                              "Os seus pedidos"),
                                          style: AppTheme.of(context)
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: FutureBuilder<List<RequestRow>>(
                                      future: RequestTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .eq(
                                              'work_id',
                                              widget.obra?.id,
                                            )
                                            .order('status', ascending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitFadingFour(
                                                color: AppTheme.of(context)
                                                    .primary,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<RequestRow>
                                            listViewRequestRowList =
                                            snapshot.data!;
                                        if (listViewRequestRowList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/empty.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 400,
                                            ),
                                          );
                                        }
                                        return requests_listview(
                                            state: this,
                                            listViewRequestRowList:
                                                listViewRequestRowList);
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
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
          ],
        ),
      ),
    );
  }
}
