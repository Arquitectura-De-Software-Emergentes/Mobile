enum TypeX {
  partTime('PART_TIME'),
  fullTime('FULL_TIME');

  const TypeX(this.value);
  final String value;
  static TypeX parseModality(String typeString) {
    if (typeString == 'PART_TIME') {
      return TypeX.partTime;
    } else if (typeString == 'FULL_TIME') {
      return TypeX.fullTime;
    } else {
      throw Exception('Invalid Type value');
    }
  }
}
