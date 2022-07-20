enum LoginFormFields {
  PHONE,
  CODE,
}

extension Decoder on LoginFormFields {
  static LoginFormFields? fromString(String string) => {
    'phone': LoginFormFields.PHONE,
    'code': LoginFormFields.CODE,
  }[string];

  String toSimpleString() => {
    LoginFormFields.PHONE: 'phone',
    LoginFormFields.CODE: 'code',
  }[this]!;
}
