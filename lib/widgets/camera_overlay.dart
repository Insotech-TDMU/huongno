import 'package:flutter/material.dart';
import 'package:huongno/constant/app_font_size.dart';

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({Key? key, this.imageCaptured = 0, this.ratio = 1.44}) : super(key: key);

  final int imageCaptured;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    double width = media.orientation == Orientation.portrait ? size.shortestSide * 0.9 : size.longestSide * 0.5;
    double height = width / ratio;

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: height,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (ratio == 1.44)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chụp ảnh hồ sơ bệnh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSize.extraLarge,
                    ),
                  ),
                  const Text(
                    'Vui lòng canh chỉnh đúng tỉ lệ màn hình! Cảm ơn ạ ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Mặt thứ 1'),
                              if (imageCaptured > 0)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.green,
                                )
                              else
                                const Icon(
                                  Icons.error_rounded,
                                  color: Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Mặt thứ 2'),
                              if (imageCaptured > 1)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.green,
                                )
                              else
                                const Icon(
                                  Icons.error_rounded,
                                  color: Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        else
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Chụp hình hồ sơ bệnh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSize.extraLarge,
                    ),
                  ),
                  Text(
                    'Vui lòng chụp ảnh phải rõ nét và trùng khớp với Hồ sơ bệnh. '
                        'nếu không trùng khớp, trách nhiệm thuộc về bác sĩ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}