import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:docx_template/docx_template.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';

class ReportService {
  Future<String> createWordReport(
      String title, String content, String filename) async {
    final docx = await DocxTemplate.fromAsset('assets/template.docx'); // Create template.docx
    final data = {
      'title': title,
      'content': content,
    };

    Content? contentData = Content();

    if (data.containsKey('title')) {
      contentData.add(TextContent('title', data['title']));
    }

    if (data.containsKey('content')) {
      contentData.add(TextContent('content', data['content']));
    }
    
    final docxBytes = await docx.generate(contentData);

    final output = await getTemporaryDirectory();
    final filePath = '${output.path}/$filename.docx';
    final file = File(filePath);
    await file.writeAsBytes(docxBytes);

    return filePath;
  }

  Future<String> createPdfReport(
      String title, String content, String filename) async {
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final PdfGraphics graphics = page.graphics;
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);

    graphics.drawString(title, font,
        bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, 50));

    graphics.drawString(content, font,
        bounds: Rect.fromLTWH(0, 60, page.getClientSize().width, 0));

    final output = await getTemporaryDirectory();
    final filePath = '${output.path}/$filename.pdf';
    final file = File(filePath);
    await file.writeAsBytes(document.save());

    document.dispose();

    return filePath;
  }

  Future<String> createMarkdownReport(
      String title, String content, String filename) async {
    final markdownContent = '# $title\n\n$content';
    final output = await getTemporaryDirectory();
    final filePath = '${output.path}/$filename.md';
    final file = File(filePath);
    await file.writeAsString(markdownContent);
    return filePath;
  }

  Future<void> sendReportByEmail(
      String recipient, String filePath, String subject) async {
    final smtpServer = gmail('your_email@gmail.com', 'your_password');
    final message = Message()
      ..from = Address('your_email@gmail.com')
      ..recipients.add(recipient)
      ..subject = subject
      ..attachments.add(FileAttachment(File(filePath)))
      ..text = 'Please find the attached report.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent: ' + e.toString());
    }
  }
}