enum Modality {
  vitual('VIRTUAL'),
  onSite('ON_SITE'),
  blended('BLENDED');

  const Modality(this.value);
  final String value;

  static Modality parseModality(String typeString) {
    if (typeString == 'VIRTUAL') {
      return Modality.vitual;
    } else if (typeString == 'ON_SITE') {
      return Modality.onSite;
    } else if (typeString == 'BLENDED') {
      return Modality.blended;
    } else {
      throw Exception('Invalid Modality value');
    }
  }
}
