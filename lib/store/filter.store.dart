import 'package:get/get.dart';
import 'package:kopa_app/app/core/utils/local_storage.dart';

class FilterStore extends GetxService {
  static const _SELECTED_MODEL = 'selected_model';
  static const _SELECTED_MATERIAL = 'selected_material';
  static const _SELECTED_SIZE_FROM = 'selected_size_from';
  static const _SELECTED_SIZE_TO = 'selected_size_to';
  static const _SELECTED_PRICE_FROM = 'selected_price_from';
  static const _SELECTED_PRICE_TO = 'selected_price_to';
  final selectedModel = ''.obs;
  final selectedMaterial = ''.obs;
  final selectedSizeFrom = ''.obs;
  final selectedSizeTo = ''.obs;
  final selectedPriceFrom = ''.obs;
  final selectedPriceTo = ''.obs;

  Future<FilterStore> init() async {
    final selectedModel = await LocalStorage.read(_SELECTED_MODEL);
    final selectedMaterial = await LocalStorage.read(_SELECTED_MATERIAL);
    final selectedSizeFrom = await LocalStorage.read(_SELECTED_SIZE_FROM);
    final selectedSizeTo = await LocalStorage.read(_SELECTED_SIZE_TO);
    final selectedPriceFrom = await LocalStorage.read(_SELECTED_PRICE_FROM);
    final selectedPriceTo = await LocalStorage.read(_SELECTED_PRICE_TO);
    if (selectedModel != null) setModel(selectedModel);
    if (selectedMaterial != null) setMaterial(selectedMaterial);
    if (selectedSizeFrom != null) setSizeFrom(selectedSizeFrom);
    if (selectedSizeTo != null) setSizeTo(selectedSizeTo);

    if (selectedPriceFrom != null) setPriceFrom(selectedPriceFrom);
    if (selectedPriceTo != null) setPriceTo(selectedPriceTo);
    return this;
  }

  bool isStoreNotEmpty() {
    if (selectedModel.value.isNotEmpty ||
        selectedMaterial.value.isNotEmpty ||
        selectedSizeFrom.value.isNotEmpty ||
        selectedSizeTo.value.isNotEmpty ||
        selectedPriceFrom.value.isNotEmpty ||
        selectedPriceTo.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  setModel(String model) {
    LocalStorage.write(_SELECTED_MODEL, model);
    selectedModel.value = model;
  }

  setMaterial(String material) {
    LocalStorage.write(_SELECTED_MATERIAL, material);
    selectedMaterial.value = material;
  }

  setSizeFrom(String sizeFrom) {
    LocalStorage.write(_SELECTED_SIZE_FROM, sizeFrom);
    selectedSizeFrom.value = sizeFrom;
  }

  setSizeTo(String sizeTo) {
    LocalStorage.write(_SELECTED_SIZE_TO, sizeTo);
    selectedSizeTo.value = sizeTo;
  }

  setPriceFrom(String priceFrom) {
    LocalStorage.write(_SELECTED_PRICE_FROM, priceFrom);
    selectedPriceFrom.value = priceFrom;
  }

  setPriceTo(String priceTo) {
    LocalStorage.write(_SELECTED_PRICE_TO, priceTo);
    selectedPriceTo.value = priceTo;
  }

  removeModel() {
    LocalStorage.remove(_SELECTED_MODEL);
    selectedModel.value = '';
  }

  removeMaterial() {
    LocalStorage.remove(_SELECTED_MATERIAL);
    selectedMaterial.value = '';
  }

  removeSizeFrom() {
    LocalStorage.remove(_SELECTED_SIZE_FROM);
    selectedSizeFrom.value = '';
  }

  removeSizeTo() {
    LocalStorage.remove(_SELECTED_SIZE_TO);
    selectedSizeTo.value = '';
  }

  removePriceFrom() {
    LocalStorage.remove(_SELECTED_PRICE_FROM);
    selectedPriceFrom.value = '';
  }

  removePriceTo() {
    LocalStorage.remove(_SELECTED_PRICE_TO);
    selectedPriceTo.value = '';
  }

  reset() {
    removeModel();
    removeMaterial();
    removeSizeFrom();
    removeSizeTo();
    removePriceFrom();
    removePriceTo();
  }
}
