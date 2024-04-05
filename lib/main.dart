import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/on_boarding_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const DetailsScreen(),
    );
  }
}

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  Future<List<Book>>? book;

  //CRUD

  Future<List<Book>> getData() async {
    final response = await http
        .get(Uri.parse('https://66014b9687c91a11641a886f.mockapi.io/books'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Произошла ошибка!');
    }
  }

  Future<void> deleteData(String id) async {
    final response = await http.delete(
        Uri.parse('https://66014b9687c91a11641a886f.mockapi.io/books/$id'));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Данные удалены')));
      setState(() {
        book = getData();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${response.statusCode}')));
    }
  }

  Future<void> postData(String name, String author) async {
    final body = jsonEncode({"name": name, "author": author});

    final response = await http.post(
      Uri.parse('https://66014b9687c91a11641a886f.mockapi.io/books'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Данные успешно созданы')));
      setState(() {
        book = getData();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${response.statusCode}')));
    }
  }

  Future<void> putData(String name, String author, String id) async {
    final body = jsonEncode({"name": name, "author": author, });

    final response = await http.put(
      Uri.parse('https://66014b9687c91a11641a886f.mockapi.io/books/$id'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Данные успешно обнавлены')));
      setState(() {
        book = getData();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${response.statusCode}')));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    book = getData();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: book,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final _book = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.indigo,
                        child: Column(
                          children: [
                            Text(_book.name),
                            Text(_book.author),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Обнавить данные  данные'),
                                              content: Container(
                                                height: 150,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      controller: nameController,
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(), labelText: 'Name'),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      controller: authorController,
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(),
                                                          labelText: 'Author'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel')),
                                                TextButton(
                                                    onPressed: () {
                                                      if (nameController.text.isNotEmpty &&
                                                          authorController.text.isNotEmpty) {
                                                        putData(nameController.text, authorController.text, _book.id);
                                                        Navigator.pop(context);
                                                      } else if (nameController.text.isEmpty) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                                content: Text('Имя не может быть пустым')));
                                                      }
                                                    },
                                                    child: const Text('Update')),
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.edit, color: Colors.white, size: 30,)),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Вы реально хотите удалить данные?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      deleteData(_book.id);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Yes'))
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Добавить данные'),
                  content: Container(
                    height: 150,
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Name'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: authorController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Author'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              authorController.text.isNotEmpty) {
                            postData(
                                nameController.text, authorController.text);
                            Navigator.pop(context);
                          } else if (nameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Имя не может быть пустым')));
                          }
                        },
                        child: const Text('Add')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  String name;
  String author;
  String id;

  Book({
    required this.name,
    required this.author,
    required this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        name: json["name"],
        author: json["author"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "id": id,
      };
}
