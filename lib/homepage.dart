import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _qrContentController = TextEditingController();
  String content = "12345";
  List<String> _listOfGeneratedQr = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _qrContentController,
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),
          ),
          Text(
            "QR CODE",
            style: GoogleFonts.nanumGothic(
                fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: QrImageView(
              data: content,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      content = _qrContentController.text;
                    });
                  },
                  icon: Icon(Icons.qr_code_2_rounded),
                  label: Text("Generate")),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    _listOfGeneratedQr.add(_qrContentController.text);
                    _qrContentController.clear();
                    print(_listOfGeneratedQr);
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add to List"))
            ],
          )
        ],
      ),
    );
  }
}
