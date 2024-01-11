import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class PrevencionRadonSection extends StatelessWidget {
  final GlobalKey sectionKey;

  PrevencionRadonSection({required this.sectionKey});

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
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'images/proteccion.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildTextSection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prevención Anti Radón",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Text(
          "La prevención de los efectos del radón se centra en reducir la exposición al gas radioactivo en entornos interiores. Aquí hay una serie de medidas preventivas respaldadas por la Agencia de Protección Ambiental de los Estados Unidos (EPA) y la Organización Mundial de la Salud (OMS):",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20.0),
        _buildExpandableText("Pruebas de detección de radón",
            "La primera medida preventiva es realizar pruebas de detección de radón en su hogar o lugar de trabajo. Las pruebas de radón son simples y asequibles, y están disponibles en el mercado. Las pruebas pueden ser de corto plazo (de varios días a semanas) o de largo plazo (más de tres meses), y pueden medir la concentración de radón en el aire interior."),
        _buildExpandableText("Mitigación del radón",
            "Si las pruebas revelan niveles elevados de radón en su hogar o lugar de trabajo, se recomienda tomar medidas para reducir la concentración de radón. Esto se logra mediante la instalación de sistemas de mitigación del radón, como sistemas de ventilación de subsuelo o sistemas de barrera de radón, que evitan que el gas radón ingrese a los espacios interiores."),
        _buildExpandableText("Ventilación adecuada",
            "Mantener una buena ventilación en el hogar es esencial para reducir la acumulación de radón en espacios interiores. Asegúrese de abrir ventanas y usar sistemas de ventilación adecuados para permitir la circulación del aire fresco."),
        _buildExpandableText("Sellado de grietas y fisuras",
            "El radón puede ingresar a través de grietas y fisuras en el suelo y las paredes. Sellando estas áreas problemáticas, se puede reducir la entrada de radón en el edificio."),
        _buildExpandableText("Profesionales certificados",
            "Para pruebas de detección de radón y mitigación, es recomendable contratar a profesionales certificados en mitigación de radón para garantizar que las medidas sean efectivas y seguras."),
        _buildExpandableText("Educación y concienciación",
            "Fomentar la concienciación sobre los riesgos del radón y las medidas de prevención entre la población es esencial. Esto incluye la educación sobre los riesgos para la salud y la importancia de las pruebas y la mitigación del radón."),
        _buildLinkText("Fuente EPA: 'Radon Testing'",
            "https://www.epa.gov/radon/radon-testing"),
        _buildLinkText("Fuente EPA: 'Radon Mitigation'",
            "https://www.epa.gov/radon/radon-mitigation"),
        _buildLinkText("Fuente OMS: 'Radon and Health'",
            "https://www.who.int/news-room/fact-sheets/detail/radon-and-health"),
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

  Widget _buildExpandableText(String title, String content) {
    return ExpandableTextWidget(title: title, content: content);
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

class ExpandableTextWidget extends StatefulWidget {
  final String title;
  final String content;

  ExpandableTextWidget({required this.title, required this.content});

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        isExpanded
            ? Text(widget.content)
            : Text(
                widget.content.length > 100
                    ? "${widget.content.substring(0, 100)}..."
                    : widget.content,
              ),
        SizedBox(height: 10.0),
        InkWell(
          child: Text(
            isExpanded ? "Leer menos..." : "Leer más...",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
      ],
    );
  }
}
