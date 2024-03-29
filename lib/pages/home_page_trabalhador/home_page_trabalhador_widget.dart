import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/geral/animations.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/no_internet.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'home_page_trabalhador_model.dart';
export 'home_page_trabalhador_model.dart';

class HomePageTrabalhadorWidget extends StatefulWidget {
  const HomePageTrabalhadorWidget({Key? key}) : super(key: key);

  @override
  _HomePageTrabalhadorWidgetState createState() =>
      _HomePageTrabalhadorWidgetState();
}

class _HomePageTrabalhadorWidgetState extends State<HomePageTrabalhadorWidget>
    with TickerProviderStateMixin, ConnectivityMixin {
  late HomePageTrabalhadorModel _model;

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
    _model = createModel(context, () => HomePageTrabalhadorModel());

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
            backgroundColor: colors.get("background", Colors.black),
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
        List<TaskRow> homePageTrabalhadorTaskRowList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: colors.get("background", Colors.black),
          appBar: AppBar(
            backgroundColor: colors.get("background2", Color(0xFF181818)),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'Home',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: FutureBuilder<List<WorkRow>>(
                future: WorkTable().queryRows(
                  queryFn: (q) => q
                      .in_(
                        'id',
                        homePageTrabalhadorTaskRowList
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
                        'assets/images/empty.png',
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
                              'obraTrabalhador',
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF1ED3D3),
                                          Color(0xFF1B8D8D)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 18.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewWorkRow.name,
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
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: colors.get(
                                                        "background",
                                                        Colors.black),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: colors.get("secondary_background",
                                          Color(0xFF2B2B2B)),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'MM/yy',
                                                    listViewWorkRow.startsAt!,
                                                    locale:
                                                        CustomLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                  ),
                                                  style: AppTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: LinearPercentIndicator(
                                                  percent:
                                                      valueOrDefault<double>(
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
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFF1B8D8D),
                                                  backgroundColor:
                                                      Color(0xFFE4EFE9),
                                                  barRadius:
                                                      Radius.circular(16.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 15.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'MM/yy',
                                                    listViewWorkRow.endsAt!,
                                                    locale:
                                                        CustomLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                  ),
                                                  style: AppTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 10.0,
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
                                  ),
                                ],
                              ),
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
