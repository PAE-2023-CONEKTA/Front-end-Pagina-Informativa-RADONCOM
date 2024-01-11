import 'package:flutter/material.dart';

class BienvenidaSection extends StatelessWidget {
  final GlobalKey sectionKey;

  BienvenidaSection({required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: sectionKey,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildTextSection(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'images/clinic.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Proyecto de Concienciación sobre el Gas Radón",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        Text(
          "¡Gracias por participar en nuestra campaña de concienciación sobre el gas radón! Este proyecto es una iniciativa del Hospital Clinic de Barcelona y tiene como objetivo brindarte información detallada sobre el radón y resolver cualquier duda que puedas tener después de completar nuestro cuestionario sobre este gas radioactivo.",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
