import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handwriting to Text',
      home: const HandwritingToTextScreen(),
    );
  }
}

class HandwritingToTextScreen extends StatefulWidget {
  const HandwritingToTextScreen({super.key});

  @override
  State<HandwritingToTextScreen> createState() =>
      _HandwritingToTextScreenState();
}

class _HandwritingToTextScreenState extends State<HandwritingToTextScreen> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 4,
    penColor: Colors.black,
  );

  final GlobalKey _repaintKey = GlobalKey();
  String _recognizedText = '';

  Future<void> _convertDrawingToText() async {
    try {
      // Capture the drawing as an image
      RenderRepaintBoundary boundary =
          _repaintKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image temporarily
      final tempDir = await getTemporaryDirectory();
      final imagePath = join(tempDir.path, 'drawing.png');
      File imageFile = await File(imagePath).writeAsBytes(pngBytes);

      // Use ML Kit to recognize text
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );

      setState(() {
        _recognizedText = recognizedText.text;
      });

      await textRecognizer.close();
    } catch (e) {
      print("Error converting drawing to text: $e");
    }
  }

  void _clearDrawing() {
    _signatureController.clear();
    setState(() {
      _recognizedText = '';
    });
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Handwriting to Text')),
      body: Column(
        children: [
          RepaintBoundary(
            key: _repaintKey,
            child: Container(
              margin: const EdgeInsets.all(16),
              color: Colors.grey[300],
              height: 300,
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _convertDrawingToText,
                child: const Text('Convert to Text'),
              ),
              ElevatedButton(
                onPressed: _clearDrawing,
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Recognized Text:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_recognizedText),
          ),
        ],
      ),
    );
  }
}
