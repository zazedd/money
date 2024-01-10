import '/backend/supabase/supabase.dart';
import '/geral/animations.dart';
import '/geral/theme.dart';
import '/geral/internationalization.dart';
import '/geral/util.dart';
import '/geral/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class money_stats_row extends StatelessWidget {
  const money_stats_row({
    super.key,
    required this.animationsMap,
  });

  final Map<String, AnimationInfo> animationsMap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        FutureBuilder<List<FundsBankRow>>(
          future: FundsBankTable().queryRows(
            queryFn: (q) => q.gte(
              'created_at',
              supaSerialize<DateTime>(functions.aMonthAgo(getCurrentTimestamp)),
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
            List<FundsBankRow> incomeCardFundsBankRowList = snapshot.data!;
            return Container(
              width: MediaQuery.sizeOf(context).width * 0.42,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomLocalizations.lang
                          .get("home_statistics_revenues", "Receitas"),
                      textAlign: TextAlign.start,
                      style: AppTheme.of(context).headlineSmall,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                      child: Text(
                        '+${(List<double> fundLst) {
                          return fundLst
                              .reduce((previous, current) => previous + current)
                              .toString();
                        }(incomeCardFundsBankRowList.map((e) => e.quant).withoutNulls.toList())}€',
                        textAlign: TextAlign.start,
                        style: AppTheme.of(context).displaySmall.override(
                              fontFamily: 'Readex Pro',
                              color: AppTheme.of(context).success,
                              fontSize: 25.0,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 28.0,
                      decoration: BoxDecoration(
                        color: Color(0x4D39D2C0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(List<double> fundLst) {
                              return ((fundLst.reduce((v, e) => v + e) - 5000) /
                                      5000 *
                                      100)
                                  .toStringAsFixed(2);
                            }(incomeCardFundsBankRowList.map((e) => e.quant).withoutNulls.toList())}%',
                            textAlign: TextAlign.start,
                            style: AppTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: AppTheme.of(context).success,
                                ),
                          ),
                          Icon(
                            Icons.trending_up_rounded,
                            color: AppTheme.of(context).success,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation4']!);
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
              List<MovementRow> spendingCardMovementRowList = snapshot.data!;
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
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomLocalizations.lang
                            .get("home_statistics_expenses", "Despesas"),
                        textAlign: TextAlign.start,
                        style: AppTheme.of(context).headlineSmall,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: Text(
                          '-${(List<double> fundLst) {
                            return fundLst
                                .reduce(
                                    (previous, current) => previous + current)
                                .toString();
                          }(spendingCardMovementRowList.map((e) => e.cost).withoutNulls.toList())}€',
                          textAlign: TextAlign.start,
                          style: AppTheme.of(context).displaySmall.override(
                                fontFamily: 'Readex Pro',
                                color: AppTheme.of(context).error,
                                fontSize: 25.0,
                              ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 28.0,
                        decoration: BoxDecoration(
                          color: Color(0x54F06A6A),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${(List<double> fundLst) {
                                return ((fundLst.reduce((v, e) => v + e) -
                                            8700) /
                                        8700 *
                                        100)
                                    .toStringAsFixed(2);
                              }(spendingCardMovementRowList.map((e) => e.cost).withoutNulls.toList())}%',
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: AppTheme.of(context).error,
                                  ),
                            ),
                            Icon(
                              Icons.trending_up_rounded,
                              color: AppTheme.of(context).error,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation5']!);
            },
          ),
        ),
      ].divide(SizedBox(width: 20.0)),
    );
  }
}
