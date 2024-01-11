import 'package:flutter/material.dart';

class SectionNav extends StatelessWidget {
  final List<GlobalKey> sectionKeys;
  final List<String> sectionTitles;
  final Function(int) onSectionSelected;
  final int currentSectionIndex;

  SectionNav({
    required this.sectionKeys,
    required this.sectionTitles,
    required this.onSectionSelected,
    required this.currentSectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.white,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 16.0,
        runSpacing: 8.0,
        children: List.generate(sectionTitles.length, (index) {
          return InkWell(
            onTap: () {
              onSectionSelected(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                color: currentSectionIndex == index
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                sectionTitles[index],
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: currentSectionIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: currentSectionIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
