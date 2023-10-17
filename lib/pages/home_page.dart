import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:projeto_lista_contato/model/lista_de_contatos_model.dart';
import 'package:projeto_lista_contato/repositories/back4app.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Back4App back4app = Back4App();
  var list = listContatoList([]);
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    list = await back4app.readingObjects();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade400,
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            photo = await picker.pickImage(
                                                source: ImageSource.camera);
                                            if (photo != null) {
                                              String path = (await path_provider
                                                      .getApplicationDocumentsDirectory())
                                                  .path;
                                              String name =
                                                  basename(photo!.path);
                                              await photo!
                                                  .saveTo("$path/$name");
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(Icons.camera),
                                              Text("Acessar câmera")
                                            ],
                                          )),
                                      const Divider(),
                                      TextButton(
                                          onPressed: () async {
                                            photo = await picker.pickImage(
                                                source: ImageSource.gallery);
                                            if (photo != null) {
                                              String path = (await path_provider
                                                      .getApplicationDocumentsDirectory())
                                                  .path;
                                              String name =
                                                  basename(photo!.path);
                                              await photo!
                                                  .saveTo("$path/$name");
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(Icons.image),
                                              Text("Acessar galeria")
                                            ],
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))
                ],
              )
            ],
            title: const Text("Lista de contatos",
                style: TextStyle(color: Colors.white))),
        body: ListView.builder(
          shrinkWrap: false,
          itemCount: list.listaContato.length,
          itemBuilder: (context, index) {
            var lista = list.listaContato[index];
            return Dismissible(
                key: Key(lista.objectId!),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.amber,
                          child: Text(
                            "${lista.nome}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        title: Text(
                          "${lista.nome}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text("${lista.telefone}",
                            style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.amber,
                          child: Text(
                            "${lista.nome}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        title: Text(
                          "${lista.nome}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text("${lista.telefone}",
                            style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
