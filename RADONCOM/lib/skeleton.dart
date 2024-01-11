import 'package:flutter/material.dart';
import 'section_nav.dart';
import 'sections/bienvenida.dart';
import 'sections/contacto.dart';
import 'sections/efectos_salud.dart';
import 'sections/informacion_radon.dart';
import 'sections/legislacion_radon.dart';
import 'sections/prevencion_radon.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(6, (_) => GlobalKey());
  int _currentSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateCurrentSection);
  }

  void _updateCurrentSection() {
    for (int i = 0; i < sectionKeys.length; i++) {
      final RenderObject? renderObject =
          sectionKeys[i].currentContext?.findRenderObject();
      if (renderObject != null && renderObject.paintBounds.top <= 0) {
        setState(() {
          _currentSectionIndex = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Radoncom",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SectionNav(
            sectionKeys: sectionKeys,
            sectionTitles: [
              "Bienvenida",
              "Información Radón",
              "Efectos en la Salud",
              "Prevención Radón",
              "Legislación Radón",
              "Contacto",
            ],
            onSectionSelected: _scrollToSection,
            currentSectionIndex: _currentSectionIndex,
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                BienvenidaSection(sectionKey: sectionKeys[0]),
                InformacionRadonSection(sectionKey: sectionKeys[1]),
                EfectosSaludSection(sectionKey: sectionKeys[2]),
                PrevencionRadonSection(sectionKey: sectionKeys[3]),
                LegislacionRadonSection(sectionKey: sectionKeys[4]),
                ContactoSection(sectionKey: sectionKeys[5]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scrollToSection(int index) async {
    print('1');
    if (index >= 0 && index < sectionKeys.length) {
      print('2');
      final context = sectionKeys[index].currentContext;
      if (context != null) {
        print('3');
        await Future.delayed(Duration(
            milliseconds:
                100)); // Pequeña pausa para asegurarse de que la sección se haya construido
        final renderObject = context.findRenderObject() as RenderBox?;
        if (renderObject != null) {
          print('4');
          _scrollController.animateTo(
            renderObject.localToGlobal(Offset.zero).dy,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    }
  }
}
