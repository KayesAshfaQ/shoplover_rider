import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
//import 'package:uuid/uuid.dart';

var logger = Logger();

const Transition transition = Transition.cupertino;
final appDB = GetStorage();
//var uuid = const Uuid();

const termConditionUrl = "https://someurl.com";

const transitionDuration = 300; // in millisecond
const otpResendDuration = 60; //in second
const buttonCornerRadius = 20.0;
const layoutLRPadding = 24.0;
const buttonHeight = 64.0;
const buttonLRPadding = 26.0;
const cornerRadius = 7.4; // Updated according to First Trip design
const tableRadius = 5.0;
const dropdownToTitle = 12.0;
const titleToDropdown = 5.0;
const mainPadding = 20.0;
const mainPadding12 = 12.0;
const mainButtonBottomPadding = 75.0;
const mainInsidePadding = 12.0;
const mainInsideTopBottomPadding = 16.0;
const appbarPadding = 70.0;

const backButtonHeightWidth = 24.0;

const keyBoardHeight = 300.00;

const int loggerLineLength = 120;
const int loggerErrorMethodCount = 8;
const int loggerMethodCount = 2;
