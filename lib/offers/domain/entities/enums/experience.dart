enum Experience {
  practice('PRACTICE'),
  none('NONE'),
  lessThan3years('LESSTHANTHREEYEARS'),
  moreThan3years('MORETHANTRHEEYEARS');

  const Experience(this.value);
  final String value;

  static Experience parseExperience(String typeString) {
    if (typeString == 'PRACTICE') {
      return Experience.practice;
    } else if (typeString == 'NONE') {
      return Experience.none;
    } else if (typeString == 'LESSTHANTHREEYEARS') {
      return Experience.lessThan3years;
    } else if (typeString == 'MORETHANTRHEEYEARS') {
      return Experience.moreThan3years;
    } else {
      throw Exception('Invalid Experience value');
    }
  }
}
