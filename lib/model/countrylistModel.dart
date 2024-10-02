// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) =>
    List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  Name name;
  String cca2 = "";
  String ccn3 = "";
  String cca3 = "";
  String cioc = "";
  bool independent = true;
  String status = "";
  bool unMember = true;
  Map<String, Currency>? currencies;
  List<String> capital = [];
  String region = "";
  String subregion = "";
  Languages languages;
  // bool landlocked;
  // List<String> borders = [];
  // int area;
  // Demonyms demonyms;
  // String flag;
  // Maps maps;
  // int population;
  // Gini gini;
  // String fifa;
  // Car car;
  // List<String> timezones;
  List<String> continents;
  Flags flags;
  // CoatOfArms coatOfArms;
  // String startOfWeek;
  // PostalCode postalCode;

  CountryModel({
    required this.name,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.languages,
    // required this.landlocked,
    // required this.borders,
    // required this.area,
    // required this.demonyms,
    // required this.flag,
    // required this.maps,
    // required this.population,
    // required this.gini,
    // required this.fifa,
    // required this.car,
    // required this.timezones,
    required this.continents,
    required this.flags,
    // required this.coatOfArms,
    // required this.startOfWeek,
    // required this.postalCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: Name.fromJson(json["name"]),
        cca2: json["cca2"] ?? "",
        ccn3: json["ccn3"] ?? "",
        cca3: json["cca3"] ?? "",
        cioc: json["cioc"] ?? "",
        independent: json["independent"],
        status: json["status"] ?? "",
        unMember: json["unMember"],
        currencies: Map.from(json["currencies"]!)
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
        capital: List<String>.from(json["capital"].map((x) => x)),
        region: json["region"] ?? "",
        subregion: json["subregion"] ?? "",
        languages: Languages.fromJson(json["languages"]),
        // landlocked: json["landlocked"],
        // borders: List<String>.from(json["borders"].map((x) => x)),
        // area: json["area"],
        // demonyms: Demonyms.fromJson(json["demonyms"]),
        // flag: json["flag"],
        // maps: Maps.fromJson(json["maps"]),
        // population: json["population"],
        // gini: Gini.fromJson(json["gini"]),
        // fifa: json["fifa"],
        // car: Car.fromJson(json["car"]),
        // timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: Flags.fromJson(json["flags"]),
        // coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        // startOfWeek: json["startOfWeek"],
        // postalCode: PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": Map.from(currencies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages.toJson(),
        // "landlocked": landlocked,
        // "borders": List<dynamic>.from(borders.map((x) => x)),
        // "area": area,
        // "demonyms": demonyms.toJson(),
        // "flag": flag,
        // "maps": maps.toJson(),
        // "population": population,
        // "gini": gini.toJson(),
        // "fifa": fifa,
        // "car": car.toJson(),
        // "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toJson(),
        // "coatOfArms": coatOfArms.toJson(),
        // "startOfWeek": startOfWeek,
        // "postalCode": postalCode.toJson(),
      };
}

// class CapitalInfo {
//   List<double> latlng;

//   CapitalInfo({
//     required this.latlng,
//   });

//   factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
//         latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
//       );

//   Map<String, dynamic> toJson() => {
//         "latlng": List<dynamic>.from(latlng.map((x) => x)),
//       };
// }

class CoatOfArms {
  String png;
  String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Currency {
  String name = "";
  String symbol = "";

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"] ?? "",
        symbol: json["symbol"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  Eng eng;
  Eng fra;

  Demonyms({
    required this.eng,
    required this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra.toJson(),
      };
}

class Eng {
  String f;
  String m;

  Eng({
    required this.f,
    required this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  String png;
  String svg;
  String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"] ?? "",
        svg: json["svg"] ?? "",
        alt: json["alt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Gini {
  double the2016;

  Gini({
    required this.the2016,
  });

  factory Gini.fromJson(Map<String, dynamic> json) => Gini(
        the2016: json["2016"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "2016": the2016,
      };
}

class Idd {
  String root;
  List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
      };
}

class Languages {
  String deu = "";

  Languages({
    required this.deu,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        deu: json["deu"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "deu": deu,
      };
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  String common = "";
  String official = "";

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"] ?? "",
        official: json["official"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}

class NativeName {
  Translation deu;

  NativeName({
    required this.deu,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        deu: Translation.fromJson(json["deu"]),
      );

  Map<String, dynamic> toJson() => {
        "deu": deu.toJson(),
      };
}

class Translation {
  String official;
  String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  String format;
  String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}
