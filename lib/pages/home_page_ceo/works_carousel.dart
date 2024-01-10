import '/backend/supabase/supabase.dart';
import '/geral/animations.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import '/geral/util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'home_page_ceo_model.dart';

class works_carousel extends StatelessWidget {
  const works_carousel({
    super.key,
    required this.carouselWorkRowList,
    required this.animationsMap,
    required HomePageCEOModel model,
  }) : _model = model;

  final List<WorkRow> carouselWorkRowList;
  final Map<String, AnimationInfo> animationsMap;
  final HomePageCEOModel _model;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselWorkRowList.length,
      itemBuilder: (context, carouselIndex, _) {
        final carouselWorkRow = carouselWorkRowList[carouselIndex];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
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
                    carouselWorkRow,
                    ParamType.SupabaseRow,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              width: double.infinity,
              height: 130.0,
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
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 75.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF1ED3D3), Color(0xFF1B8D8D)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          carouselWorkRow.name,
                                          'Obra',
                                        ).maybeHandleOverflow(
                                          maxChars: 18,
                                          replacement: '…',
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: AppTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        minFontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      '${valueOrDefault<String>(
                                        carouselWorkRow.usedBudget?.toString(),
                                        '0',
                                      )}€ ${CustomLocalizations.lang.get("home_work_budget", "usados de")} ${carouselWorkRow.budget?.toString()}€',
                                      style: AppTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color:
                                        colors.get("background", Colors.black),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'MM/yy',
                                            carouselWorkRow.startsAt!,
                                            locale:
                                                CustomLocalizations.of(context)
                                                    .languageCode,
                                          ),
                                          style: AppTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: valueOrDefault<double>(
                                            ((getCurrentTimestamp
                                                            .secondsSinceEpoch
                                                            .toDouble() -
                                                        carouselWorkRow
                                                            .startsAt!
                                                            .secondsSinceEpoch
                                                            .toDouble()) /
                                                    (carouselWorkRow.endsAt!
                                                            .secondsSinceEpoch
                                                            .toDouble() -
                                                        carouselWorkRow
                                                            .startsAt!
                                                            .secondsSinceEpoch
                                                            .toDouble()))
                                                .clamp(0.0, 1.0),
                                            0.0,
                                          ),
                                          lineHeight: 10.0,
                                          animation: false,
                                          animateFromLastPercent: true,
                                          progressColor: Color(0xFF168B8B),
                                          backgroundColor: AppTheme.of(context)
                                              .secondaryText,
                                          barRadius: Radius.circular(16.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'MM/yy',
                                            carouselWorkRow.endsAt!,
                                            locale:
                                                CustomLocalizations.of(context)
                                                    .languageCode,
                                          ),
                                          style: AppTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
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
                          if (carouselWorkRow.status == 1)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 7.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang
                                      .get("completed", "Completa"),
                                  textAlign: TextAlign.start,
                                  style: AppTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: AppTheme.of(context).success,
                                        fontSize: 9.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          if (carouselWorkRow.status == 2)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 7.0, 0.0, 0.0),
                                child: Text(
                                  CustomLocalizations.lang
                                      .get("canceled", "Cancelada"),
                                  textAlign: TextAlign.start,
                                  style: AppTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: AppTheme.of(context).error,
                                        fontSize: 9.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          if (carouselWorkRow.status == 0)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 7.0, 0.0, 0.0),
                                child: Text(
                                  '${CustomLocalizations.lang.get("home_work_budget_usage_part1", "Pode gastar mais")} ${((carouselWorkRow.budget! - carouselWorkRow.usedBudget!) / (((carouselWorkRow.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil())).toStringAsFixed(2)}${CustomLocalizations.lang.get("home_work_budget_usage_part2", "€/dia durante")} ${((carouselWorkRow.endsAt!.secondsSinceEpoch.toDouble() - getCurrentTimestamp.secondsSinceEpoch.toDouble()) / (24 * 60 * 60)).ceil().toString()} ${CustomLocalizations.lang.get("day", "dia")}s',
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
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
        );
      },
      carouselController: _model.carouselController ??= CarouselController(),
      options: CarouselOptions(
        initialPage: min(0, carouselWorkRowList.length - 1),
        viewportFraction: 0.9,
        disableCenter: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        autoPlay: false,
        onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
      ),
    );
  }
}
