import 'package:flutter/material.dart';

import 'model/class.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  static List<String> daysOfWeek = [
    "Segunda-Feira",
    "Terça-Feira",
    "Quarta-Feira",
    "Quinta-Feira",
    "Sexta-Feira",
    "Sábado"
  ];

  late String dropdownValue;

  _NewClassState() : dropdownValue = daysOfWeek[0];

  final _nomeController = TextEditingController();
  final _localController = TextEditingController();
  final _horaController = TextEditingController();

  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova aula"),
        actions: [
          IconButton(
              onPressed: () {
                MyClass myClass = MyClass(
                    name: _nomeController.text,
                    dayOfWeek: dropdownValue,
                    local: _localController.text,
                    hora: _horaController.text);
                Navigator.pop(context, myClass);
              },
              icon: const Icon(Icons.save_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextFormField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome',
              //errorText: 'Informe o nome da aula',
              border: OutlineInputBorder(),
              /*suffixIcon: Icon(
                Icons.error,
              ),*/
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: _localController,
            decoration: const InputDecoration(
              labelText: 'Local',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DropdownButton(
            icon: const Icon(Icons.calendar_today),
            isExpanded: true,
            value: dropdownValue,
            items: buildListItens(),
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: _selectTime,
            child: const Text('Início da aula'),
          ),
          const SizedBox(height: 8),
          Text(
            'Horário: ${_time.format(context)}',
          ),
        ]),
      ),
    );
  }

  List<DropdownMenuItem> buildListItens() => List.generate(
      6,
      (index) => DropdownMenuItem(
            value: daysOfWeek[index],
            child: Text(daysOfWeek[index]),
          ));
}
