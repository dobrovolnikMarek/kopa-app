enum SignUpFormFields {
  FIRSTNAME,
  LASTNAME,
  CITY,
  PHONE
}

extension Decoder on SignUpFormFields {
  static SignUpFormFields? fromString(String string) => {
    'firstName': SignUpFormFields.FIRSTNAME,
    'lastName': SignUpFormFields.LASTNAME,
    'city': SignUpFormFields.CITY,
    'phone': SignUpFormFields.PHONE,
  }[string];

  String toSimpleString() => {
    SignUpFormFields.FIRSTNAME: 'firstName',
    SignUpFormFields.LASTNAME: 'lastName',
    SignUpFormFields.CITY: 'city',
    SignUpFormFields.PHONE: 'phone',
  }[this]!;
}
