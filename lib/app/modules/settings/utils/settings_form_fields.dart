enum SettingsFormFields {
  PHONE,
  CITY,
}

extension Decoder on SettingsFormFields {
  static SettingsFormFields? fromString(String string) => {
    'phone': SettingsFormFields.PHONE,
    'city': SettingsFormFields.CITY,
  }[string];

  String toSimpleString() => {
    SettingsFormFields.PHONE: 'phone',
    SettingsFormFields.CITY: 'city',
  }[this]!;
}
