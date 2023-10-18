import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shoplover_rider/app/core/utils/extension/app_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelper {
  showLoader() {
    return EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
  }

  hideLoader() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    // Navigator.of(context, rootNavigator: true).pop();
  }

  logout() {
    // AuthHelper().clearUserData();
    // Get.find<HomeController>().isUpdateStage.value = false;
    // Get.until((route) => route.settings.name == AppRoutes.dashboard);
    // Get.toNamed(AppRoutes.sign_in);
  }

  String minutesToHourMinutes(Duration duration) {
    var date = duration.toString().split(":");
    var hrs = date[0];
    var mns = date[1];
    var sds = date[2].split(".")[0];
    return hrs.toInt() == 0 ? "${mns}m" : "${hrs}h ${mns}m";
  }

  Future refreshLogin() async {
    if (kDebugMode) {
      // print(expiredTime.$.toString());
      // print(timeDifference(expiredTime: expiredTime.$).toString());
    }

    // if (timeDifference(expiredTime: expiredTime.$) <= 0) {
    //   var data = await AuthRepository().getRefreshToken();

    //   printLog("The data is: " + data.toString());

    //   if (data != null && data.data != null) {
    //     await AuthHelper().clearUserData();
    //     await AuthHelper().setUserData(data.data, true);
    //   } else {
    // await AuthHelper().clearRememberMe();
    // await AuthHelper().clearUserData();
    // await AuthHelper().clearUserDetailsData();
    //   }
    // }
  }

  String getDayNameAndDateYearOnly(DateTime dateTime) {
    //Input: "2022-11-14 12:15:20"
    //Output: "12:15"
    return DateFormat('dd MMMM yyyy, EEEE').format(dateTime);
  }

  timeDifference({expiredTime}) {
    final expiredTimeData = DateTime.parse(expiredTime);
    final todayTime = DateTime.now();
    final difference = expiredTimeData.difference(todayTime).inMinutes;
    return difference;
  }

  getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  hideKeyboard() {
    // FocusManager.instance.primaryFocus?.unfocus();
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  bool isKeyBoardVisible(context) {
    return MediaQuery.of(context).viewInsets.bottom != 0 ? false : true;
  }

  Future<void> openUrl(url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  String getFormattedDateOnly(
    DateTime dateTime, {
    isWeekDayNameOnly = false,
    isDateOnly = true,
    isDayNameAndDateOnly = false,
  }) {
    if (isWeekDayNameOnly) {
      return DateFormat('EEEE').format(dateTime);
    } else if (isDateOnly) {
      return DateFormat('dd MMM, yyyy').format(dateTime);
    } else if (isDayNameAndDateOnly) {
      return DateFormat('EEEE').format(dateTime);
    }
    return DateFormat('EE, dd MMM, yyyy').format(dateTime);
  }

  String getDayAndMonthOnly(DateTime dateTime) {
    return DateFormat('dd MMM').format(dateTime);
  }

  String getDayNameOnly(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }

  String durationListToFormattedHour(List<String> durationList,
      {bool isSecondNeeded = false}) {
    // List<String> dList = ['1h0m', '20m', '1h', '20m', '20m'];

    List<String> dList = durationList;
    // debugPrint(dList.reduce((value, element) => '$value,$element'));
    int totalSeconds = 0;
    for (var element in dList) {
      if (element.contains('h') && element.contains('m')) {
        int hour = ((int.parse(element.split('h').first) * 60) * 60);
        int minute =
            (int.parse(element.split('h').last.toString().split('m').first) *
                60);

        totalSeconds += hour + minute;
      } else if (element.contains('h')) {
        int hour = ((int.parse(element.split('h').first) * 60) * 60);

        totalSeconds += hour;
      } else {
        int minute = int.parse(element.split('m').first) * 60;

        totalSeconds += minute;
      }
    }

    /* for (int i = 0; i <= dList.length; i++) {
      printLog("durationList : ${durationList[i]} ${durationList.length}",
          key: "12");
      if (dList[i].contains('h') && dList[i].contains('m')) {
        int hour = ((int.parse(dList[i].split('h').first) * 60) * 60);
        int minute =
            (int.parse(dList[i].split('h').last.toString().split('m').first) *
                60);

        totalSeconds += hour + minute;
      } else if (dList[i].contains('h')) {
        int hour = ((int.parse(dList[i].split('h').first) * 60) * 60);

        totalSeconds += hour;
      } else {
        int minute = int.parse(dList[i].split('m').first) * 60;

        totalSeconds += minute;
      }
    }*/

    Duration duration = Duration(seconds: totalSeconds);
    var date = duration.toString().split(":");
    var hrs = date[0];
    var mns = date[1];
    var sds = date[2].split(".")[0];
    return isSecondNeeded
        ? "$totalSeconds"
        : hrs.toInt() == 0
            ? "${mns}m"
            : "${hrs}h ${mns}m"; //
  }

  String get12HourTime(String timeStamp24HR) {
    //Input: "2022-11-14 12:15:20"
    //Output: "12:15"
    return DateFormat.jm().format(DateTime.parse(timeStamp24HR));
  }

  String getDayNameAndDateOnly(DateTime dateTime) {
    //Input: "2022-11-14 12:15:20"
    //Output: "12:15"
    return DateFormat('EEEE, dd MMM').format(dateTime);
  }

  scrollFlightListToTop(scrollController) {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  pickImageFromDevice({isCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = isCamera
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);
    return image?.path ?? null;
  }
}
