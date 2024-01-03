import '/backend/supabase/supabase.dart';
import '/components/select_what_to_add/select_what_to_add_widget.dart';
import '/components/select_what_to_do/select_what_to_do_widget.dart';
import '/geral/animations.dart';
import '/geral/icon_button.dart';
import '/geral/theme.dart';
import '/geral/language.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'worker_gridview.dart';
import 'tasks_listview.dart';
import 'movement_listview.dart';
import 'request_listview.dart';
import 'materials_listview.dart';

import 'obra_ceo_empreendedor_model.dart';
export 'obra_ceo_empreendedor_model.dart';

class ObraCEOEmpreendedorWidget extends StatefulWidget {
  const ObraCEOEmpreendedorWidget({
    Key? key,
    required this.obra,
  }) : super(key: key);

  final WorkRow? obra;

  @override
  _ObraCEOEmpreendedorWidgetState createState() =>
      _ObraCEOEmpreendedorWidgetState();
}

class _ObraCEOEmpreendedorWidgetState extends State<ObraCEOEmpreendedorWidget>
    with TickerProviderStateMixin {
  late ObraCEOEmpreendedorModel _model;

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
    _model = createModel(context, () => ObraCEOEmpreendedorModel());

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
                  height: 310,
                  child: SelectWhatToAddWidget(
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
          'Obra',
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
                                  height: 190,
                                  child: SelectWhatToDoWidget(
                                    obra: widget.obra!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            color: colors.get(
                                "secondary_background", Color(0xFF2B2B2B)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x32000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 75,
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
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 10, 15, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
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
                                                          -1, 0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      widget.obra?.name,
                                                      'Nome',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 16,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: AppTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    minFontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  '${valueOrDefault<String>(
                                                    widget.obra?.usedBudget
                                                        ?.toString(),
                                                    '0',
                                                  )}€ restantes de ${valueOrDefault<String>(
                                                    widget.obra?.budget
                                                        ?.toString(),
                                                    '0',
                                                  )}€',
                                                  style: AppTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: colors.get(
                                                            "background",
                                                            Colors.black),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 5)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: colors.get(
                                                        "background",
                                                        Colors.black),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.settings,
                                                    color: Color(0xD51ED3D3),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 3, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 10, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'MM/yy',
                                                        widget.obra!.startsAt!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          AppTheme.of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 10,
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
                                                                10, 10, 10, 0),
                                                    child:
                                                        LinearPercentIndicator(
                                                      percent: valueOrDefault<
                                                          double>(
                                                        ((getCurrentTimestamp
                                                                        .secondsSinceEpoch
                                                                        .toDouble() -
                                                                    widget
                                                                        .obra!
                                                                        .startsAt!
                                                                        .secondsSinceEpoch
                                                                        .toDouble()) /
                                                                (widget
                                                                        .obra!
                                                                        .endsAt!
                                                                        .secondsSinceEpoch
                                                                        .toDouble() -
                                                                    widget
                                                                        .obra!
                                                                        .startsAt!
                                                                        .secondsSinceEpoch
                                                                        .toDouble()))
                                                            .clamp(0.0, 1.0),
                                                        0.0,
                                                      ),
                                                      lineHeight: 10,
                                                      animation: false,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          Color(0xFF168B8B),
                                                      backgroundColor:
                                                          AppTheme.of(context)
                                                              .secondaryText,
                                                      barRadius:
                                                          Radius.circular(16),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 15, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'MM/yy',
                                                        widget.obra!.endsAt!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          AppTheme.of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 10,
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
                                  Stack(
                                    children: [
                                      if (widget.obra?.status == 1)
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 7, 0, 0),
                                            child: Text(
                                              'Completa',
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: AppTheme.of(context)
                                                        .success,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget.obra?.status == 2)
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 7, 0, 0),
                                            child: Text(
                                              'Cancelada',
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: AppTheme.of(context)
                                                        .error,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget.obra?.status == 0)
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 7, 0, 0),
                                            child: Text(
                                              'Pode gastar mais ${((widget.obra!.budget! - widget.obra!.usedBudget!) / (((widget.obra!.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil())).toStringAsFixed(2)}€/dia durante ${((widget.obra!.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil().toString()} dias',
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: colors.get("accent3",
                                                        Color(0x8BABB9BF)),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            ),
            Expanded(
              child: FutureBuilder<List<MatWorkRow>>(
                future: MatWorkTable().queryRows(
                  queryFn: (q) => q.eq(
                    'work_id',
                    widget.obra?.id,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitFadingFour(
                          color: AppTheme.of(context).primary,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<MatWorkRow> bottomSheetMatWorkRowList = snapshot.data!;
                  return Container(
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
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Container(
                                width: double.infinity,
                                child: CarouselSlider(
                                  items: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                lang.get("work_workers",
                                                    "Trabalhadores"),
                                                style: AppTheme.of(context)
                                                    .headlineMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder<List<TaskRow>>(
                                            future: TaskTable().queryRows(
                                              queryFn: (q) => q.eq(
                                                'work_id',
                                                widget.obra?.id,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primary,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TaskRow>
                                                  containerTaskRowList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: FutureBuilder<
                                                    List<UsersRow>>(
                                                  future:
                                                      UsersTable().queryRows(
                                                    queryFn: (q) => q
                                                        .in_(
                                                          'id',
                                                          containerTaskRowList
                                                              .map((e) =>
                                                                  e.userId)
                                                              .withoutNulls
                                                              .toList(),
                                                        )
                                                        .order('role',
                                                            ascending: true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitFadingFour(
                                                            color: AppTheme.of(
                                                                    context)
                                                                .primary,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRow>
                                                        gridViewUsersRowList =
                                                        snapshot.data!;
                                                    return workers_grid(
                                                        state: this,
                                                        gridViewUsersRowList:
                                                            gridViewUsersRowList,
                                                        obra: widget.obra);
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                lang.get(
                                                    "work_tasks", "Tarefas"),
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
                                                    'work_id',
                                                    widget.obra?.id,
                                                  )
                                                  .neq(
                                                    'status',
                                                    3,
                                                  )
                                                  .order('status',
                                                      ascending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primary,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TaskRow>
                                                  listViewTaskRowList =
                                                  snapshot.data!;
                                              if (listViewTaskRowList.isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/Screenshot_2023-12-27_at_21.57.03.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }
                                              return tasks_listview(
                                                  state: this,
                                                  listViewTaskRowList:
                                                      listViewTaskRowList,
                                                  obra: widget.obra);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                lang.get("moviments_title",
                                                    "Movimentos"),
                                                style: AppTheme.of(context)
                                                    .headlineMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                              FutureBuilder<List<MovementRow>>(
                                            future: MovementTable().queryRows(
                                              queryFn: (q) => q
                                                  .in_(
                                                    'mat_work_id',
                                                    bottomSheetMatWorkRowList
                                                        .map((e) => e.id)
                                                        .toList(),
                                                  )
                                                  .order('date'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primary,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MovementRow>
                                                  listViewMovementRowList =
                                                  snapshot.data!;
                                              if (listViewMovementRowList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/Screenshot_2023-12-27_at_21.57.03.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                  ),
                                                );
                                              }
                                              return moviments_listview(
                                                  state: this,
                                                  listViewMovementRowList:
                                                      listViewMovementRowList,
                                                  bottomSheetMatWorkRowList:
                                                      bottomSheetMatWorkRowList);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Pedidos',
                                                style: AppTheme.of(context)
                                                    .headlineMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                              FutureBuilder<List<RequestRow>>(
                                            future: RequestTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'work_id',
                                                    widget.obra?.id,
                                                  )
                                                  .order('status',
                                                      ascending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primary,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<RequestRow>
                                                  listViewRequestRowList =
                                                  snapshot.data!;
                                              if (listViewRequestRowList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/Screenshot_2023-12-27_at_21.57.03.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                  ),
                                                );
                                              }
                                              return request_listview(
                                                  state: this,
                                                  listViewRequestRowList:
                                                      listViewRequestRowList,
                                                  obra: widget.obra);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Materiais',
                                                style: AppTheme.of(context)
                                                    .headlineMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                              FutureBuilder<List<MaterialRow>>(
                                            future: MaterialTable().queryRows(
                                              queryFn: (q) => q
                                                  .in_(
                                                    'id',
                                                    bottomSheetMatWorkRowList
                                                        .map(
                                                            (e) => e.materialId)
                                                        .withoutNulls
                                                        .toList(),
                                                  )
                                                  .order('quantity'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          AppTheme.of(context)
                                                              .primary,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MaterialRow>
                                                  listViewMaterialRowList =
                                                  snapshot.data!;
                                              if (listViewMaterialRowList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/Screenshot_2023-12-27_at_21.57.03.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                  ),
                                                );
                                              }
                                              return materials_listview(
                                                  state: this,
                                                  listViewMaterialRowList:
                                                      listViewMaterialRowList,
                                                  bottomSheetMatWorkRowList:
                                                      bottomSheetMatWorkRowList,
                                                  obra: widget.obra);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  carouselController:
                                      _model.carouselController ??=
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
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
