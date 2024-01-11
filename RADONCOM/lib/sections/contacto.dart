import 'package:flutter/material.dart';

class ContactoSection extends StatefulWidget {
  final GlobalKey sectionKey;

  ContactoSection({required this.sectionKey});
  @override
  _ContactoSectionState createState() => _ContactoSectionState();
}

class _ContactoSectionState extends State<ContactoSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contacta con nosotros",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Nombre:",
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Tu nombre",
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Pregunta:",
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  controller: _questionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Escribe tu pregunta aquí",
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Recibirás una respuesta a la dirección de correo electrónico asociada con tu cuenta.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para enviar la pregunta por correo electrónico
                    String name = _nameController.text;
                    String question = _questionController.text;
                    // Puedes enviar la pregunta y el nombre por correo electrónico aquí
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _questionController.dispose();
    super.dispose();
  }
}
