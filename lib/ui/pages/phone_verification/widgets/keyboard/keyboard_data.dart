enum KeyBoardButtonType { number, backspace, none }

class KeyBoardButtonData {
  final KeyBoardButtonType type;
  final String? value;

  KeyBoardButtonData({
    required this.type,
    required this.value,
  });
}
