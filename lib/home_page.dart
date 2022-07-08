import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista  de  Tarefas'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final variavel = await Navigator.pushNamed(context, '/item');
          variavel;
          setState(() {
            if (variavel != null) {
              tasks.add(variavel);
            }
          });
        },
        tooltip: 'Adicionar  nova  tarefa',
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(
                '${index + 1} - ${tasks[index]}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ),
    );
  }
}
