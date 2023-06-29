import 'dart:convert';
import 'dart:io';
import 'package:dart_openai/dart_openai.dart';
import 'package:http/http.dart' as http;

class VideoPresentationService {
  final apiKey = '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';

  Future<String> extractText(File file) async {
    const apiUrl = 'https://api.openai.com/v1/audio/transcriptions';

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

  Future<String> recommendations(String extractedText) async {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    try {
      final headers = {
        'Authorization': 'Bearer $apiKey',
        "Content-Type": "Application/JSON"
      };
      final body = {
        "model": "gpt-3.5-turbo",
        'messages': [
          {
            'role': 'system',
            'content':
                'Necesito que mejores el texto para que sea lo mejor en un video de presentacion al momento de postular a un trabajo y en tu redaccion solo dime 5 pasos para mejorarlo'
          },
          {'role': 'user', 'content': 'mi presentacion es:$extractedText'}
        ]
      };

      final response = await http.post(Uri.parse(apiUrl),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(response.body);
        final completion = jsonResponse['choices'][0]['message']['content'];
        return completion;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }

  Future<String> recommendations1(String extractText) async {
    OpenAI.apiKey = apiKey;
    print('entre');
    // Start using!
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt:
          'Necesito que mejores el texto para que sea lo mejor en un video de presentacion al momento de postular a un trabajo y en tu redaccion solo dime 5 pasos para mejorarlo. Mi texto: $extractText',
      maxTokens: 500,
    );

    // Printing the output to the console
    print(completion.choices[0].text);
    return completion.choices[0].text;
  }
}
