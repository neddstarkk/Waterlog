import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:waterlog/services/user_provider.dart';

class WaterIntakeTracker extends StatefulWidget {
  const WaterIntakeTracker({super.key});

  @override
  State<WaterIntakeTracker> createState() => _WaterIntakeTrackerState();
}

class _WaterIntakeTrackerState extends State<WaterIntakeTracker> {
  double waterIntake = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              showLabels: false,
              showTicks: false,
              minimum: 0,
              maximum: double.parse(
                  Provider.of<UserProvider>(context).waterIntake.toString()),
              axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor),
              pointers: [
                RangePointer(
                  value: waterIntake,
                  cornerStyle: CornerStyle.startCurve,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Colors.blue,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Text("${waterIntake.round()} ml", style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold) ,)
                )
              ],
            ),
          ],
        ),
        FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              waterIntake += 300;
            });
          },
          label: Text("Add 300 ml"),
        )
      ],
    ));
  }
}
