import 'package:waterlog/services/user_provider.dart';

class IntakeCalculator {
  IntakeCalculator();

  static String hello(height, weight, wakeUpTime, gender) {
    num heightAdjustmentFactor = 1 + (height / 100) * 0.001;
    double wakeUpFactor =
        int.parse(wakeUpTime[0]) == 1 && int.parse(wakeUpTime[1]) < 3
            ? 0.9
            : int.parse(wakeUpTime[0]) > 6
                ? 1.0
                : 1.2;
    double genderFactor = gender == Genders.MALE ? 0.33 : 0.23;
    double intakeValue =
        (genderFactor * weight) * (heightAdjustmentFactor) * (wakeUpFactor);
    return (intakeValue * 100).round().toStringAsFixed(0);
  }
}
