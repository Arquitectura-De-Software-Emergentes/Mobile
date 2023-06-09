enum Currency {
  pen('PEN'),
  usd('USD'),
  eur('EUR'),
  gbp('GBP'),
  jpy('JPY'),
  cny('CNY');

  const Currency(this.value);
  final String value;
  static Currency parseModality(String typeString) {
    if (typeString == 'PEN') {
      return Currency.pen;
    } else if (typeString == 'USD') {
      return Currency.usd;
    } else if (typeString == 'EUR') {
      return Currency.eur;
    } else if (typeString == 'GBP') {
      return Currency.gbp;
    } else if (typeString == 'JPY') {
      return Currency.jpy;
    } else if (typeString == 'CNY') {
      return Currency.cny;
    } else {
      throw Exception('Invalid Modality value');
    }
  }
}
