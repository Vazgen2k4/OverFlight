final class AppValidator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Почта не может быть пустой';
    }

    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Некорректный формат почты';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пароль не может быть пустым';
    }

    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
      caseSensitive: true,
      multiLine: false,
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Пароль должен содержать минимум одну маленькую букву, одну большую букву, одну цифру и один специальный символ, и быть не менее 8 символов';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Номер телефона не может быть пустым';
    }

    final RegExp phoneRegex = RegExp(
      r'^\+?([0-9]{1,3})?([0-9]{10,12})$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!phoneRegex.hasMatch(value)) {
      return 'Некорректный формат номера телефона';
    }
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле обязательно для заполнения';
    }
    return null;
  }
}
