import 'package:flutter/material.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';

class AppDialog {
  AppDialog._();

  static void show(
      BuildContext context, {
        required String title,
        required String content,
        bool canCancel = false,
        required String primaryButtonTitle,
        required Function() onPrimaryTap,
        Future<bool> Function()? onWillPop,
      }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: onWillPop ??
                  () async {
                return true;
              },
          child: AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(content),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: onPrimaryTap,
                child: Text(primaryButtonTitle),
              ),
              if (canCancel)
                TextButton(
                  child:const Text('Thoát'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  static void showLoading(BuildContext context, {required String content}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircularProgressIndicator(
                color: AppColor.primary,
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: AppFontSize.normal,
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        );
      },
    );
  }

  static Future showWidget(
      BuildContext context, {
        String? title,
        required Widget child,
        required String primaryButtonTitle,
        required Function() onPrimaryTap,
        bool canCancel = false,
      }) async {
    double width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          titlePadding: const EdgeInsets.all(10),
          scrollable: true,
          title: title != null
              ? Text(
            title,
            style: const TextStyle(
              fontSize: AppFontSize.medium,
            ),
          )
              : null,
          content: child,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actionsOverflowButtonSpacing: 5,
          actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(width, 50),
                side: const BorderSide(color: AppColor.lightGrey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: AppColor.primary,
                elevation: 0,
              ),
              onPressed: onPrimaryTap,
              child: Text(
                primaryButtonTitle,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: AppFontSize.medium,
                ),
              ),
            ),
            canCancel
                ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(width, 50),
                shape: RoundedRectangleBorder(
                  side:const BorderSide(
                    color: AppColor.primary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:const Text(
                'Thoát',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: AppFontSize.medium,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }

  static void showSimpleDialog(BuildContext context,
      {required List<Widget> children}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          titlePadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          children: children,
        );
      },
    );
  }
}
