enum AddProductFormFields {
  PHOTOS,
  MODEL,
  MATERIAL,
  DESCRIPTION,
  PRICE,
  SIZE,
  LENGTH,
  WIDTH,
  SIZETYPE,
}

extension Decoder on AddProductFormFields {
  static AddProductFormFields? fromString(String string) => {
    'photos': AddProductFormFields.PHOTOS,
    'model': AddProductFormFields.MODEL,
    'material': AddProductFormFields.MATERIAL,
    'description': AddProductFormFields.DESCRIPTION,
    'price': AddProductFormFields.PRICE,
    'size': AddProductFormFields.SIZE,
    'length': AddProductFormFields.LENGTH,
    'width': AddProductFormFields.WIDTH,
    'sizeType': AddProductFormFields.SIZETYPE,
  }[string];

  String toSimpleString() => {
    AddProductFormFields.PHOTOS: 'photos',
    AddProductFormFields.MODEL: 'model',
    AddProductFormFields.MATERIAL: 'material',
    AddProductFormFields.DESCRIPTION: 'description',
    AddProductFormFields.PRICE: 'price',
    AddProductFormFields.SIZE: 'size',
    AddProductFormFields.LENGTH: 'length',
    AddProductFormFields.WIDTH: 'width',
    AddProductFormFields.SIZETYPE: 'sizeType',
  }[this]!;
}
