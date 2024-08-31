import 'package:flutter/material.dart';
import 'package:over_flight/ui/pages/phone_verification/widgets/keyboard/keyboard.dart';



class CustomKeyBoard extends StatelessWidget {
  const CustomKeyBoard({super.key});

  KeyBoardButtonData generator(int index) {
    if (index == 9) {
      return KeyBoardButtonData(
        type: KeyBoardButtonType.none,
        value: null,
      );
    }

    if (index == 11) {
      return KeyBoardButtonData(
        type: KeyBoardButtonType.backspace,
        value: null,
      );
    }

    return KeyBoardButtonData(
      type: KeyBoardButtonType.number,
      value: index < 9 ? '${index + 1}' : '0',
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<KeyBoardButtonData> list = List.generate(12, generator);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 60,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, index) {
        return KeyBoardButtonWidget(
          data: list[index],
        );
      },
    );
  }
}
