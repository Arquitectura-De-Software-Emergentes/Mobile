enum Modality {
  vitual('VIRTUAL'),
  presencial('PRESENCIAL'),
  semipresencial('SEMIPRESENCIAL');

  const Modality(this.value);
  final String value;

  static Modality parseModality(String typeString) {
    if (typeString == 'VIRTUAL') {
      return Modality.vitual;
    } else if (typeString == 'PRESENCIAL') {
      return Modality.presencial;
    } else if (typeString == 'SEMIPRESENCIAL') {
      return Modality.semipresencial;
    } else {
      throw Exception('Invalid Modality value');
    }
  }
}
