import 'package:flutter/material.dart';
import 'package:huongno/widgets/master_layout.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailCheckoutPage extends StatefulWidget {
  const DetailCheckoutPage({Key? key}) : super(key: key);

  @override
  State<DetailCheckoutPage> createState() => _DetailCheckoutPageState();
}

class _DetailCheckoutPageState extends State<DetailCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: Text('Bảng giá dịch vụ'.toUpperCase()),
      body:  SfPdfViewer.network('https://datlich.thuybinhduong.com/storage/BangGiaDichVu.pdf'),
    );
  }
}
