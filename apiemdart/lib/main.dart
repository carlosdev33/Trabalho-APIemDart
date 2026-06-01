import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/typicode.dart';

Future<List<TypiCode>> buscarPosts() async {

  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts")
  );

  if (response.statusCode == 200) {

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((post) => TypiCode.fromMap(post)).toList();

  } else {

    throw Exception("Erro ao consultar Posts");

  }
}

Future<void> main() async {

  print("\n------------------------ Lista de Posts ------------------------");

  try {

    List<TypiCode> posts = await buscarPosts();

    for (var post in posts) {

      print("\nID: ${post.id}");
      print("\nTítulo: ${post.title}");
      print("\nDescrição: ${post.body}");
      print("\n-------------------------");

    }
  } catch (e) {

    print(e);

  }
}