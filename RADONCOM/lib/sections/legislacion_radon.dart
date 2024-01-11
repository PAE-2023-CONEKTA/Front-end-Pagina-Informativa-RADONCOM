import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LegislacionRadonSection extends StatelessWidget {
  final GlobalKey sectionKey;

  LegislacionRadonSection({required this.sectionKey});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Legislación sobre el Radón",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "La legislación relacionada con el radón varía según el país y la región. A continuación, se presenta un resumen de las principales leyes que apoyan a las víctimas del radón y cómo se puede obtener una indemnización legalmente:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            _buildLawItem("1. Ley XYZ del Radón:",
                "Esta ley establece las regulaciones y estándares relacionados con los niveles de radón en edificios y lugares de trabajo. Establece los procedimientos para la medición, mitigación y divulgación del radón. Si has sido afectado por altos niveles de radón en tu hogar o lugar de trabajo, puedes buscar indemnización de acuerdo con esta ley."),
            _buildLawItem("2. Ley ABC de Compensación:",
                "La Ley ABC establece el proceso y los requisitos para solicitar compensación en casos de enfermedades relacionadas con la exposición al radón. Si has sido diagnosticado con una enfermedad relacionada con el radón, puedes seguir los procedimientos de esta ley para buscar indemnización y asistencia médica."),
            SizedBox(height: 20.0),
            Text(
              "Para obtener información más completa sobre el radón y la legislación relacionada, visita el siguiente enlace:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10.0),
            InkWell(
              child: Text(
                "https://www.diba.cat/salutpublica/Radiacions_ionitzants",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onTap: () async {
                String url =
                    "https://www.diba.cat/salutpublica/Radiacions_ionitzants";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'No se pudo abrir el enlace: $url';
                }
              },
            ),
            SizedBox(height: 20.0),
            Center(
              child: Image.asset(
                'images/law.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLawItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
