enum HomeFormFields {
  MODEL,
  MATERIAL,
  SIZE_FROM,
  SIZE_TO,
  PRICE_FROM,
  PRICE_TO,
}

extension Decoder on HomeFormFields {
  static HomeFormFields? fromString(String string) => {
    'model': HomeFormFields.MODEL,
    'material': HomeFormFields.MATERIAL,
    'sizeFrom': HomeFormFields.SIZE_FROM,
    'sizeTo': HomeFormFields.SIZE_TO,
    'priceFrom': HomeFormFields.PRICE_FROM,
    'priceTo': HomeFormFields.PRICE_TO,
  }[string];

  String toSimpleString() => {
    HomeFormFields.MODEL: 'model',
    HomeFormFields.MATERIAL: 'material',
    HomeFormFields.SIZE_FROM: 'sizeFrom',
    HomeFormFields.SIZE_TO: 'sizeTo',
    HomeFormFields.PRICE_FROM: 'priceFrom',
    HomeFormFields.PRICE_TO: 'priceTo',
  }[this]!;
}
