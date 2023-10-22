import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_helper_model/drop_down_model.dart';
import '../common/widgets/app_widgets.dart';
import '../constants/app_constants.dart';
import '../style/app_colors.dart';
import '../style/app_style.dart';

class RoundedButton extends StatefulWidget {
  final dynamic clickEvent, buttonStyle;
  final double height, width, borderRadius, buttonFontSize;
  final Color levelColor, backgroundColor, borderColor;
  final bool isWhiteBackground,
      isTextBtnOnly,
      isDataRequired,
      isInactive,
      isCustomHeight,
      hasPrefixIcon,
      isSvgIcon,
      isPngIcon,
      isIconAlignWithText;

  final int selectedIndex;
  final List<DropDownModel>? dataList;
  final String label;

  final dynamic icon;

  const RoundedButton(
    BuildContext context,
    this.label, {
    this.clickEvent,
    Key? key,
    this.buttonStyle,
    this.dataList = const [],
    this.height = buttonHeight,
    this.width = double.infinity,
    this.borderRadius = buttonCornerRadius,
    this.buttonFontSize = 14.0,
    this.selectedIndex = -99,
    this.levelColor = AppColors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.accentColor,
    this.isWhiteBackground = false,
    this.isDataRequired = false,
    this.isCustomHeight = false,
    this.isTextBtnOnly = false,
    this.isInactive = false,
    this.hasPrefixIcon = false,
    this.isSvgIcon = false,
    this.isPngIcon = false,
    this.isIconAlignWithText = false,
    this.icon = null,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isCustomHeight ? widget.height : null,
      width: widget.width,
      child: TextButton(
        style: ButtonStyle(
            /* overlayColor: isTextBtnOnly
                ? MaterialStateProperty.all<Color>(
                    AppColors.primaryColor.withOpacity(.1))
                : MaterialStateProperty.all<Color>(AppColors.secondaryColor),*/
            foregroundColor:
                MaterialStateProperty.all<Color>(widget.levelColor),
            backgroundColor:
                MaterialStateProperty.all<Color>(widget.isWhiteBackground
                    ? AppColors.white
                    : widget.isInactive
                        ? AppColors.liteGray
                        : widget.backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              side: BorderSide(
                  color: widget.isInactive
                      ? AppColors.liteGray
                      : widget.borderColor,
                  width: 1,
                  style: BorderStyle.solid),
            ))),
        onPressed: () async {
          if (widget.isDataRequired) {
            if (kDebugMode) {
              debugPrint(
                  'selectedIndex: ${widget.selectedIndex} dataList: ${widget.dataList!.length}   ');
            }

            if (widget.selectedIndex >= 0 && widget.dataList!.isNotEmpty) {
              if (kDebugMode) {
                debugPrint(
                    'selectedIndex: ${widget.selectedIndex} dataList: ${widget.dataList!.length}   ');
              }
              widget.clickEvent(context, widget.selectedIndex, widget.dataList);
            } else if (widget.selectedIndex >= 0) {
              try {
                widget.clickEvent(context, widget.selectedIndex);
              } catch (e) {
                if (kDebugMode) {
                  debugPrint('e: $e');
                }
              }
            } else {
              widget.clickEvent(context);
            }
          } else {
            widget.clickEvent(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Visibility(
            visible: widget.hasPrefixIcon,
            replacement: Text(
              widget.label,
              style: widget.buttonStyle ??
                  textButtonStyle(
                      color: widget.isWhiteBackground
                          ? AppColors.primaryColor
                          : widget.isInactive
                              ? AppColors.gray.withOpacity(.5)
                              : widget.levelColor,
                      fontSize: widget.buttonFontSize),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.isIconAlignWithText)
                  widget.isSvgIcon
                      ? SvgPicture.asset(widget.icon ?? null)
                      : widget.isPngIcon
                          ? Image.asset(
                              widget.icon ?? null,
                              color: Colors.white,
                            )
                          : Icon(
                              widget.icon ?? null,
                              color: Colors.white,
                            ),
                Expanded(
                  child: widget.isIconAlignWithText
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.isSvgIcon
                                ? SvgPicture.asset(
                                    widget.icon ?? null,
                                    width: 20,
                                    height: 20,
                                  )
                                : widget.isPngIcon
                                    ? Image.asset(
                                        widget.icon ?? null,
                                        color: Colors.white,
                                        width: 20,
                                        height: 20,
                                      )
                                    : Icon(
                                        widget.icon ?? null,
                                        color: Colors.white,
                                      ),
                            AppWidgets().gapW8(),
                            Text(
                              widget.label,
                              textAlign: TextAlign.center,
                              style: widget.buttonStyle ??
                                  textButtonStyle(
                                      color: widget.isWhiteBackground
                                          ? AppColors.primaryColor
                                          : widget.isInactive
                                              ? AppColors.gray.withOpacity(.5)
                                              : widget.levelColor,
                                      fontSize: widget.buttonFontSize),
                            ),
                          ],
                        )
                      : Text(
                          widget.label,
                          textAlign: TextAlign.center,
                          style: widget.buttonStyle ??
                              textButtonStyle(
                                  color: widget.isWhiteBackground
                                      ? AppColors.primaryColor
                                      : widget.isInactive
                                          ? AppColors.gray.withOpacity(.5)
                                          : widget.levelColor,
                                  fontSize: widget.buttonFontSize),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
