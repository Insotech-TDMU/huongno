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
                    'Chu??p a??nh h??? s?? b???nh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSize.extraLarge,
                    ),
                  ),
                  const Text(
                    'Vui l??ng canh ch???nh ????ng t??? l??? m??n h??nh! C???m ??n ??? ',
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
                              const Text('M????t th???? 1'),
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
                              const Text('M????t th???? 2'),
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
                    'Chu??p h??nh h??? s?? b???nh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSize.extraLarge,
                    ),
                  ),
                  Text(
                    'Vui l??ng ch???p ???nh ph???i r?? n??t v?? tr??ng kh???p v???i H??? s?? b???nh. '
                        'n???u kh??ng tr??ng kh???p, tr??ch nhi???m thu???c v??? b??c s??',
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