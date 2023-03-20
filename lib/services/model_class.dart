// To parse this JSON data, do
//
//     final holidayModel = holidayModelFromJson(jsonString);

import 'dart:convert';

HolidayModel holidayModelFromJson(String str) => HolidayModel.fromJson(json.decode(str));

String holidayModelToJson(HolidayModel data) => json.encode(data.toJson());

class HolidayModel {
    HolidayModel({
        required this.meta,
        required this.response,
    });

    Meta meta;
    Response response;

    factory HolidayModel.fromJson(Map<String, dynamic> json) => HolidayModel(
        meta: Meta.fromJson(json["meta"]),
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "response": response.toJson(),
    };
}

class Meta {
    Meta({
        required this.code,
    });

    int code;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
    };
}

class Response {
    Response({
        required this.holidays,
    });

    List<Holiday> holidays;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        holidays: List<Holiday>.from(json["holidays"].map((x) => Holiday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "holidays": List<dynamic>.from(holidays.map((x) => x.toJson())),
    };
}

class Holiday {
    Holiday({
        required this.name,
        required this.description,
        required this.country,
        required this.date,
        required this.type,
        required this.primaryType,
        required this.canonicalUrl,
        required this.urlid,
        required this.locations,
        required this.states,
    });

    String name;
    String description;
    Country country;
    Date date;
    List<Type> type;
    PrimaryType primaryType;
    String canonicalUrl;
    String urlid;
    Locations locations;
    Locations states;

    factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
        name: json["name"],
        description: json["description"],
        country: Country.fromJson(json["country"]),
        date: Date.fromJson(json["date"]),
        type: List<Type>.from(json["type"].map((x) => typeValues.map[x]!)),
        primaryType: primaryTypeValues.map[json["primary_type"]]!,
        canonicalUrl: json["canonical_url"],
        urlid: json["urlid"],
        locations: locationsValues.map[json["locations"]]!,
        states: locationsValues.map[json["states"]]!,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "country": country.toJson(),
        "date": date.toJson(),
        "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
        "primary_type": primaryTypeValues.reverse[primaryType],
        "canonical_url": canonicalUrl,
        "urlid": urlid,
        "locations": locationsValues.reverse[locations],
        "states": locationsValues.reverse[states],
    };
}

class Country {
    Country({
        required this.id,
        required this.name,
    });

    Id id;
    Name name;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: idValues.map[json["id"]]!,
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id { IN }

final idValues = EnumValues({
    "in": Id.IN
});

enum Name { INDIA }

final nameValues = EnumValues({
    "India": Name.INDIA
});

class Date {
    Date({
        required this.iso,
        required this.datetime,
        this.timezone,
    });

    dynamic iso;
    Datetime datetime;
    Timezone? timezone;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        iso: json["iso"],
        datetime: Datetime.fromJson(json["datetime"]),
        timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "iso": iso,
        "datetime": datetime.toJson(),
        "timezone": timezone?.toJson(),
    };
}

class Datetime {
    Datetime({
        required this.year,
        required this.month,
        required this.day,
        this.hour,
        this.minute,
        this.second,
    });

    int year;
    int month;
    int day;
    int? hour;
    int? minute;
    int? second;

    factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        year: json["year"],
        month: json["month"],
        day: json["day"],
        hour: json["hour"],
        minute: json["minute"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
        "second": second,
    };
}

class Timezone {
    Timezone({
        required this.offset,
        required this.zoneabb,
        required this.zoneoffset,
        required this.zonedst,
        required this.zonetotaloffset,
    });

    String offset;
    String zoneabb;
    int zoneoffset;
    int zonedst;
    int zonetotaloffset;

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        zoneabb: json["zoneabb"],
        zoneoffset: json["zoneoffset"],
        zonedst: json["zonedst"],
        zonetotaloffset: json["zonetotaloffset"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "zoneabb": zoneabb,
        "zoneoffset": zoneoffset,
        "zonedst": zonedst,
        "zonetotaloffset": zonetotaloffset,
    };
}

enum Locations { ALL }

final locationsValues = EnumValues({
    "All": Locations.ALL
});

enum PrimaryType { RESTRICTED_HOLIDAY, OBSERVANCE, GAZETTED_HOLIDAY, SEASON, CHRISTIAN, COMMON_LOCAL_HOLIDAY, HINDUISM }

final primaryTypeValues = EnumValues({
    "Christian": PrimaryType.CHRISTIAN,
    "Common local holiday": PrimaryType.COMMON_LOCAL_HOLIDAY,
    "Gazetted Holiday": PrimaryType.GAZETTED_HOLIDAY,
    "Hinduism": PrimaryType.HINDUISM,
    "Observance": PrimaryType.OBSERVANCE,
    "Restricted Holiday": PrimaryType.RESTRICTED_HOLIDAY,
    "Season": PrimaryType.SEASON
});

enum Type { OPTIONAL_HOLIDAY, HINDUISM, OBSERVANCE, NATIONAL_HOLIDAY, SEASON, CHRISTIAN, MUSLIM, COMMON_LOCAL_HOLIDAY }

final typeValues = EnumValues({
    "Christian": Type.CHRISTIAN,
    "Common local holiday": Type.COMMON_LOCAL_HOLIDAY,
    "Hinduism": Type.HINDUISM,
    "Muslim": Type.MUSLIM,
    "National holiday": Type.NATIONAL_HOLIDAY,
    "Observance": Type.OBSERVANCE,
    "Optional holiday": Type.OPTIONAL_HOLIDAY,
    "Season": Type.SEASON
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
