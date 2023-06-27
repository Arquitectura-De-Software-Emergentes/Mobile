import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class VideoPresentationService {
  final apiKey = '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';
  final apiUrl = 'https://api.openai.com/v1/audio/transcriptions';

  Future<String> extractText(File file) async {
    try {
      final headers = {'Authorization': 'Bearer $apiKey'};
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('file', file.path))
        ..fields.addAll({
          'model': 'whisper-1',
          'response_format': 'text',
        });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw response.body;
      }
    } catch (e) {
      print('error:::$e');
      throw Exception(e);
    }
  }
}
