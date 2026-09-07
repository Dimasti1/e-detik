import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class MonitorRiwayatScreen extends StatelessWidget {
  const MonitorRiwayatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Riwayat"),
          leadingWidth: 56.h,
          backgroundColor: appTheme.red300,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 22.h,
              vertical: 48.h,
            ),
            child: Column(
              children: [
                _buildStatisticsSection(context),
                Spacer(flex: 46),
                Container(
                  height: 206.h,
                  width: 336.h,
                  margin: EdgeInsets.only(left: 6.h),
                  child: BarChart(
                    BarChartData(
                      minY: 0,
                      maxY: 6,
                      barTouchData: BarTouchData(enabled: true),
                      borderData: FlBorderData(show: false),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 7,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 8,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                        BarChartGroupData(
                          x: 9,
                          barRods: [
                            BarChartRodData(
                                toY: 1.23,
                                width: 4.84,
                                color: appTheme.deepPurpleA200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(2.42.h)))
                          ],
                        ),
                      ],
                      gridData: FlGridData(
                        verticalInterval: 1,
                        horizontalInterval: 1,
                        drawHorizontalLine: false,
                        drawVerticalLine: false,
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              var title = '';
                              switch (value) {
                                case 1:
                                  title = "0";
                                  break;
                                case 2:
                                  title = "1";
                                  break;
                                case 3:
                                  title = "2";
                                  break;
                                case 4:
                                  title = "3";
                                  break;
                                case 5:
                                  title = "4";
                                  break;
                                case 6:
                                  title = "5";
                                  break;
                              }
                              return Text(
                                title,
                                style: TextStyle(
                                  color: appTheme.blueGray600,
                                  fontSize: 16.fSize,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    swapAnimationDuration: const Duration(
                      milliseconds: 500,
                    ),
                  ),
                ),
                Spacer(flex: 53),
              ],
            ),
          ),
          Positioned(
            bottom: 8.h,
            right: 0.h,
            left: 2.h,
            child: _buildNavigationControls(context),
          ),
        ]),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 92.h,
      // leadingWidth: 24.h,
      // leading: AppbarLeadingImage(
      //   imagePath: ImageConstant.imgArrowLeft,
      //   margin: EdgeInsets.only(left: 24.h),
      //   onTap: () {
      //     onTapArrowLeftOne(context);
      //   },
      // ),
      title: AppbarTitle(
        text: "Riwayat",
        margin: EdgeInsets.only(left: 32.h),
      ),
      styleType: Style.bgFillRed300,
    );
  }

  /// Section Widget
  Widget _buildStatisticsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistik",
            style: CustomTextStyles.bodyLargeInterGray50001,
          ),
          SizedBox(height: 4.h),
          Text(
            "Riwayat Sakit",
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationControls(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 12.h,
      ),
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomIconButton(
            height: 85.h,
            width: 85.h,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.none,
            onTap: () {
              onTapBtnVectorOne(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgVector,
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  void onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the monitor RekapScreen when the action is triggered.
  void onTapBtnVectorOne(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.monitorRekapScreen,
    );
  }
}
