import 'package:flutter/material.dart';
import 'package:text_editor/src/text_style_model.dart';

enum FontOptionStatus { colorPalette, fontFamily }

class FontFamilyModel {
  final String font;
  bool isSelected = false;

  FontFamilyModel(this.font, this.isSelected);
}

class FontOptionModel extends ChangeNotifier {
  final TextStyleModel textStyleModel;
  FontOptionStatus status = FontOptionStatus.colorPalette;

  // Font family options
  late List<FontFamilyModel> fonts;
  late String selectedFont;

  // Font color options
  List<Color>? colors;
  // late Color pickedColor;

  FontOptionModel(this.textStyleModel, List<String> fonts, {this.colors}) {
    // Set default selected font
    selectedFont = textStyleModel.textStyle?.fontFamily ?? fonts[0];

    // Map fonts to fontFamilyModel
    this.fonts = fonts
        .map((font) => FontFamilyModel(font, font == selectedFont))
        .toList();

    // Set default colors
    colors = colors ??
        [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ];

    // Set default picked color
    // pickedColor = textStyleModel.textStyle?.color ?? colors![0];
    // Set new text color
    // textStyleModel.editTextColor(textStyleModel.textStyle?.color ?? colors![0]);
  }

  void selectFontFamily(String value) {
    textStyleModel.changeFontFamily(value);

    // Set new selected font
    fonts = fonts
        .map<FontFamilyModel>((fontModel) =>
            FontFamilyModel(fontModel.font, fontModel.font == value))
        .toList();

    notifyListeners();
  }

  // Set new text color
  void pickColor(Color value) => textStyleModel.editTextColor(value);

  void changeFontOptionStatus(FontOptionStatus value) {
    status = value == FontOptionStatus.fontFamily
        ? FontOptionStatus.colorPalette
        : FontOptionStatus.fontFamily;

    notifyListeners();
  }
}
