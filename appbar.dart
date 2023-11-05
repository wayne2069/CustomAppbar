import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/app_string.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final bool showBack;
  final bool showDivider;
  final Function? actionPressed;
  final GestureTapCallback? onBackPressed;
  final String? actionIcon;
  final Color backgroundColor;
  final Widget? middleIcon;
  final Widget? logoIcon;

  const AppbarWidget(
      {this.title = '',
      this.backgroundColor = AppColor.backgroundColor,
      this.showBack = true,
      this.showDivider = true,
      this.actionPressed,
      this.actionIcon,
      Key? key,
      this.middleIcon,
      this.onBackPressed,
      this.logoIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              children: [
                showBack
                    ? GestureDetector(
                        onTap: onBackPressed ??
                            () {
                              Get.back();
                            },
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          height: 38,
                          width: 38,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)), color: AppColor.gray),
                          child: RotatedBox(
                            quarterTurns: Directionality.of(context) == TextDirection.ltr ? 2 : 0,
                            child: SvgPicture.asset(
                              'assets/icons/arrow_down.svg',
                            ),
                          ),
                        ),
                      )
                    : logoIcon != null
                        ? logoIcon!
                        : const SizedBox(
                            height: 38,
                            width: 38,
                          ),
                Expanded(
                  child: middleIcon != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColor.text),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 2),
                            middleIcon!
                          ],
                        )
                      : Text(
                          title,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColor.text),
                          textAlign: TextAlign.center,
                        ),
                ),
                actionPressed != null
                    ? GestureDetector(
                        onTap: () {
                          actionPressed!();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          height: 38,
                          width: 38,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)), color: AppColor.gray),
                          child: SvgPicture.asset(
                            actionIcon!,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 38,
                        width: 38,
                      )
              ],
            ),
          ),
          if (showDivider)
            Container(
              color: AppColor.dividerLine,
              width: double.infinity,
              height: 1,
            ),
        ],
      ),
    );
  }
}
