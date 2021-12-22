import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  final List<Color> colors;
  final Function(int i) onTap;
  final Color selectedColor;
  ColorPalette(this.colors, {required this.onTap, required this.selectedColor});

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                color: widget.selectedColor,
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.colorize,
                  color: Colors.white,
                ),
              ),
            ),
            ...List.generate(
                widget.colors.length,
                (i) => _ColorPicker(widget.colors[i],
                    index: i, onTap: widget.onTap))
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color color;
  final int index;
  final Function(int i) onTap;
  _ColorPicker(this.color, {required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
