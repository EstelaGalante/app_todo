import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final TextEditingController formController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final formKey = '';
  final List<String> tasks = [];
  String palavra = '';

  @override
  Widget build(BuildContext context) {
    void _voltar() {
      Navigator.pop(context, palavra);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.task),
                    hintText: 'Digite  a  nova  tarefa',
                    labelText: 'Nova  Tarefa',
                  ),
                  controller: formController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo  Obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    palavra = formController.text;
                    formController.clear();
                    _voltar();
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
