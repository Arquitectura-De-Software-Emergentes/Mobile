enum Availability {
  available('AVAILABLE'),
  unavailable('UNAVAILABLE');

  const Availability(this.value);
  final String value;
  static Availability parseAvailability(String typeString) {
    if (typeString == 'AVAILABLE') {
      return Availability.available;
    } else if (typeString == 'UNAVAILABLE') {
      return Availability.unavailable;
    } else {
      throw Exception('Invalid Availability value');
    }
  }
}
