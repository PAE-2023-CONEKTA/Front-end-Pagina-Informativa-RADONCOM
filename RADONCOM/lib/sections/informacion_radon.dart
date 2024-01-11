import 'package:flutter/material.dart';

class InformacionRadonSection extends StatelessWidget {
  final GlobalKey sectionKey;
  // Lista de tarjetas personalizadas
  final List<Map<String, String>> tarjetas = [
    {
      'titulo': '¿Qué es el Radón?',
      'contenido':
          'El radón es un gas radioactivo incoloro, inodoro e insípido que se forma de manera natural a partir de la descomposición del uranio en el suelo y las rocas.',
    },
    {
      'titulo': 'Origen y Fuentes',
      'contenido':
          'El radón se encuentra en el suelo y las rocas y puede ingresar a los edificios a través de grietas en los cimientos y otras aberturas. También puede estar presente en el agua subterránea.',
    },
    {
      'titulo': 'Consecuencias Peligrosas',
      'contenido':
          'Se estima que el radón es la segunda causa principal de cáncer de pulmón después del tabaquismo. Por lo tanto, es esencial tomar medidas preventivas.',
    },
    {
      'titulo': '¿Dónde se Encuentra?',
      'contenido':
          'Los niveles de radón varían según la ubicación geográfica. Algunas áreas tienen niveles más altos que otras. Realizar pruebas es clave.',
    },
    {
      'titulo': 'Pruebas y Paz Mental',
      'contenido':
          'Las pruebas de radón son sencillas y puedes hacerlas en casa. Detectar niveles elevados es el primer paso para proteger tu salud.',
    },
    {
      'titulo': 'Respira con Seguridad',
      'contenido':
          'Si se encuentran niveles peligrosos de radón, no te preocupes. La mitigación es posible con sistemas de ventilación y sellado adecuado.',
    },
    {
      'titulo': 'Prevención Inteligente',
      'contenido':
          'Sellando grietas y asegurando una buena ventilación, puedes reducir la entrada de radón y garantizar un aire más limpio.',
    },
    {
      'titulo': 'Áreas de Mayor Riesgo',
      'contenido':
          'Algunas áreas geográficas tienen niveles más altos de radón debido a su geología. Conoce tu entorno.',
    },
    // Agrega más tarjetas según sea necesario
  ];
  InformacionRadonSection({required this.sectionKey});

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
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Información sobre el Radón",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tarjetas.length,
                clipBehavior:
                    Clip.antiAliasWithSaveLayer, // Configura el clipBehavior
                itemBuilder: (context, index) {
                  final tarjeta = tarjetas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tarjeta['titulo'] ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            tarjeta['contenido'] ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
