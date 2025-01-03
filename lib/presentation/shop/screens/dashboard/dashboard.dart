import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_shapes/containers/rounded_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Graphs
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      /// Bar Graphs
                      SiajRoundedContainer(
                        child: Column(
                          children: [
                            Text('Weekly Sales', style: Theme.of(context).textTheme.headlineSmall),
                            SizedBox(height: AppSizes.spaceBtwSections),

                            // Graph
                            SizedBox(
                              child: BarChart(
                                BarChartData(
                                  titlesData: FlTitlesData()
                                )
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: AppSizes.spaceBtwSections),
                  
                      /// Orders
                      SiajRoundedContainer()
                    ]
                  ),
                ),

                /// Pie Chart
                SiajRoundedContainer(

                )
              ])
          ])
      ));
  }
}
