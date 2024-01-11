import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class EfectosSaludSection extends StatelessWidget {
  final GlobalKey sectionKey;

  EfectosSaludSection({required this.sectionKey});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace: $url';
    }
  }

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
                child: Image.asset("images/efectos.png", fit: BoxFit.cover),
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
          "Efectos del Radón en la Salud",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        _buildTextItem("Cáncer de pulmón",
            "La exposición crónica al radón es la principal causa de cáncer de pulmón en personas no fumadoras y la segunda causa principal después del tabaquismo en fumadores."),
        _buildTextItem("Mayor riesgo para fumadores",
            "Los fumadores expuestos al radón tienen un riesgo significativamente mayor de desarrollar cáncer de pulmón que los no fumadores expuestos."),
        _buildTextItem("Radiación ionizante",
            "El radón emite partículas alfa, una forma de radiación ionizante, que puede dañar el ADN de las células pulmonares y aumentar el riesgo de cáncer."),
        _buildTextItem("No hay un nivel seguro",
            "No se ha establecido un umbral de exposición seguro al radón, lo que significa que cualquier nivel de exposición se considera potencialmente peligroso."),
        SizedBox(height: 20.0),
        _buildLinkText(
            "Organización Mundial de la Salud (OMS): Radon and Health. [Radón y salud]",
            "https://www.who.int/news-room/fact-sheets/detail/radon-and-health"),
        SizedBox(height: 10.0),
        _buildLinkText(
            "Agencia de Protección Ambiental de los Estados Unidos (EPA): Health Risk of Radon. [Riesgo para la salud del radón]",
            "https://www.epa.gov/radon/health-risk-radon"),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildTextItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildLinkText(String text, String url) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchURL(url);
          },
        children: <TextSpan>[
          TextSpan(
            text: " (Ver más)",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
