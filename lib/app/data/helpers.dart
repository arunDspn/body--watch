import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';

DateTime enumToStartDate(DurationsEnum durationsEnum) {
  switch (durationsEnum) {
    case DurationsEnum.month1:
      return DateTime.now().subtract(const Duration(days: 30));
    case DurationsEnum.month2:
      return DateTime.now().subtract(const Duration(days: 60));
    case DurationsEnum.month3:
      return DateTime.now().subtract(const Duration(days: 90));
    case DurationsEnum.month4:
      return DateTime.now().subtract(const Duration(days: 120));
    case DurationsEnum.month6:
      return DateTime.now().subtract(const Duration(days: 180));
    case DurationsEnum.month12:
      return DateTime.now().subtract(const Duration(days: 365));
  }
}
