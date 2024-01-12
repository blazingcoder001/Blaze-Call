import 'dart:typed_data';
import 'dart:ui' as ui;




  Future<ByteData?> createPic(String initial) async {
    // Create a new image with a white background.
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    final size = ui.Size(200, 200);
    canvas.drawRect(ui.Rect.fromLTRB(0, 0, size.width, size.height), ui.Paint()..color = const ui.Color(0xFFFFFFFF));

// Set the font and font size.
    final textStyle = ui.TextStyle(fontSize: 100, color: const ui.Color(0xFF000000));
    final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle(textAlign: ui.TextAlign.center));
    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText(initial);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));

// Calculate the position of the text.
    final x = (size.width - paragraph.width) / 2;
    final y = (size.height - paragraph.height) / 2;

// Draw the text on the image.
    canvas.drawParagraph(paragraph, ui.Offset(x, y));

// Save the image to a file.
    final image = await recorder.endRecording().toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return pngBytes;
  }



