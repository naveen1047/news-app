import '../enums.dart';

String getCategory(Categories category) {
  if (category == Categories.business) {
    return 'business';
  }
  if (category == Categories.entertainment) {
    return 'entertainment';
  }
  if (category == Categories.general) {
    return 'general';
  }
  if (category == Categories.health) {
    return 'health';
  }
  if (category == Categories.science) {
    return 'science';
  }
  if (category == Categories.sports) {
    return 'sports';
  }
  if (category == Categories.technology) {
    return 'technology';
  } else {
    return 'general';
  }
}

String getCountry(Country country) {
  if (country == Country.ae) {
    return 'ae';
  }
  if (country == Country.ar) {
    return 'ar';
  }
  if (country == Country.at) {
    return 'at';
  }
  if (country == Country.au) {
    return 'au';
  }
  if (country == Country.be) {
    return 'be';
  }
  if (country == Country.bg) {
    return 'bg';
  }
  if (country == Country.br) {
    return 'br';
  }
  if (country == Country.ca) {
    return 'ca';
  }
  if (country == Country.ch) {
    return 'ch';
  }
  if (country == Country.cn) {
    return 'cn';
  }
  if (country == Country.co) {
    return 'co';
  }
  if (country == Country.cu) {
    return 'cu';
  }
  if (country == Country.cz) {
    return 'cz';
  }
  if (country == Country.de) {
    return 'de';
  }
  if (country == Country.eg) {
    return 'eg';
  }
  if (country == Country.fr) {
    return 'fr';
  }
  if (country == Country.gb) {
    return 'gb';
  }
  if (country == Country.gr) {
    return 'gr';
  }
  if (country == Country.hk) {
    return 'hk';
  }
  if (country == Country.hu) {
    return 'hu';
  }
  if (country == Country.id) {
    return 'id';
  }
  if (country == Country.ie) {
    return 'ie';
  }
  if (country == Country.il) {
    return 'il';
  }
  if (country == Country.ind) {
    return 'in';
  }
  if (country == Country.it) {
    return 'it';
  }
  if (country == Country.jp) {
    return 'jp';
  }
  if (country == Country.kr) {
    return 'kr';
  }
  if (country == Country.lt) {
    return 'lt';
  }
  if (country == Country.lv) {
    return 'lv';
  }
  if (country == Country.ma) {
    return 'ma';
  }
  if (country == Country.mx) {
    return 'mx';
  }
  if (country == Country.my) {
    return 'my';
  }
  if (country == Country.ng) {
    return 'ng';
  }
  if (country == Country.nl) {
    return 'nl';
  }
  if (country == Country.no) {
    return 'no';
  }
  if (country == Country.nz) {
    return 'nz';
  }
  if (country == Country.ph) {
    return 'ph';
  }
  if (country == Country.pl) {
    return 'pl';
  }
  if (country == Country.pt) {
    return 'pt';
  }
  if (country == Country.ro) {
    return 'ro';
  }
  if (country == Country.rs) {
    return 'rs';
  }
  if (country == Country.ru) {
    return 'ru';
  }
  if (country == Country.sa) {
    return 'sa';
  }
  if (country == Country.se) {
    return 'se';
  }
  if (country == Country.sg) {
    return 'sg';
  }
  if (country == Country.si) {
    return 'si';
  }
  if (country == Country.sk) {
    return 'sk';
  }
  if (country == Country.th) {
    return 'th';
  }
  if (country == Country.tr) {
    return 'tr';
  }
  if (country == Country.tw) {
    return 'tw';
  }
  if (country == Country.ua) {
    return 'ua';
  }
  if (country == Country.us) {
    return 'us';
  }
  if (country == Country.ve) {
    return 've';
  }
  if (country == Country.za) {
    return 'za';
  } else {
    //default
    return 'us';
  }
}
