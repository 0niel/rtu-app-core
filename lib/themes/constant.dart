class ConstantData {
  final double containerRadius;
  final double cardRadius;
  final double buttonRadius;

  ConstantData({
    this.containerRadius = 30,
    this.cardRadius = 10,
    this.buttonRadius = 13,
  });
}

class NinjaConstant {
  static ConstantData constant = ConstantData();

  static setConstant(ConstantData constantData) {
    constant = constantData;
  }
}
