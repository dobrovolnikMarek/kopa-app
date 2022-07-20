enum AddProductFormFields {
  PHOTOS,
  MODEL,
  MATERIAL,
  DESCRIPTION,
  PRICE
}

extension Decoder on AddProductFormFields {
  static AddProductFormFields? fromString(String string) => {
    'photos': AddProductFormFields.PHOTOS,
    'model': AddProductFormFields.MODEL,
    'material': AddProductFormFields.MATERIAL,
    'description': AddProductFormFields.DESCRIPTION,
    'price': AddProductFormFields.PRICE,
  }[string];

  String toSimpleString() => {
    AddProductFormFields.PHOTOS: 'photos',
    AddProductFormFields.MODEL: 'model',
    AddProductFormFields.MATERIAL: 'material',
    AddProductFormFields.DESCRIPTION: 'description',
    AddProductFormFields.PRICE: 'price',
  }[this]!;
}
