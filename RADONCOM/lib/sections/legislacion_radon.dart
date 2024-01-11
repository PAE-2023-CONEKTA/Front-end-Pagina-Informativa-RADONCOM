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
            SizedBox(height: 20.0),
            Text(
              "El Real Decreto 1029/2022 de España aborda la protección de la salud frente a riesgos de radiaciones ionizantes, transponiendo parcialmente la Directiva 2013/59/Euratom. Establece principios de justificación, optimización y limitación de dosis para exposiciones existentes, planificadas y de emergencia. Incluye regulaciones para proteger a trabajadores, público y en contextos médicos. Se fijan límites de dosis, se trata la protección contra el radón y otras fuentes naturales de radiación, y se detallan medidas para emergencias radiológicas. No menciona compensaciones económicas específicas.\n\nPara más detalles, puedes consultar el texto completo del decreto en este enlace.",
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
