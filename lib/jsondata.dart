// import 'dart:convert';

// Student? studentFromJson(String str) => Student.fromJson(json.decode(str));

// String studentToJson(Student? data) => json.encode(data!.toJson());

// class Student {
//   Student({
//     this.name,
//     this.father,
//     this.designation,
//     this.living,
//     this.profession,
//     required this.education,
//     required this.experiance,
//     required this.skills,
//     required this.contactNumber,
//     required this.hobies,
//     required this.personalInformation,
//   });

//   String? name;
//   String? father;
//   String? designation;
//   String? living;
//   String? profession;
//   List<Education?> education;
//   List<Experiance?> experiance;
//   List<String?> skills;
//   List<ContactNumber?> contactNumber;
//   List<Hoby?> hobies;
//   List<PersonalInformation?> personalInformation;

//   factory Student.fromJson(Map<String, dynamic> json) => Student(
//         name: json["Name"],
//         father: json["father"],
//         designation: json["Designation"],
//         living: json["Living"],
//         profession: json["profession"],
//         education: json["Education"] == null
//             ? []
//             : List<Education?>.from(
//                 json["Education"]!.map((x) => Education.fromJson(x))),
//         experiance: json["Experiance"] == null
//             ? []
//             : List<Experiance?>.from(
//                 json["Experiance"]!.map((x) => Experiance.fromJson(x))),
//         skills: json["Skills"] == null
//             ? []
//             : List<String?>.from(json["Skills"]!.map((x) => x)),
//         contactNumber: json["Contact Number"] == null
//             ? []
//             : List<ContactNumber?>.from(
//                 json["Contact Number"]!.map((x) => ContactNumber.fromJson(x))),
//         hobies: json["Hobies"] == null
//             ? []
//             : List<Hoby?>.from(json["Hobies"]!.map((x) => Hoby.fromJson(x))),
//         personalInformation: json["Personal Information"] == null
//             ? []
//             : List<PersonalInformation?>.from(json["Personal Information"]!
//                 .map((x) => PersonalInformation.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Name": name,
//         "father": father,
//         "Designation": designation,
//         "Living": living,
//         "profession": profession,
//         "Education": education == null
//             ? []
//             : List<dynamic>.from(education.map((x) => x!.toJson())),
//         "Experiance": experiance == null
//             ? []
//             : List<dynamic>.from(experiance.map((x) => x!.toJson())),
//         "Skills":
//             skills == null ? [] : List<dynamic>.from(skills.map((x) => x)),
//         "Contact Number": contactNumber == null
//             ? []
//             : List<dynamic>.from(contactNumber.map((x) => x!.toJson())),
//         "Hobies": hobies == null
//             ? []
//             : List<dynamic>.from(hobies.map((x) => x!.toJson())),
//         "Personal Information": personalInformation == null
//             ? []
//             : List<dynamic>.from(personalInformation.map((x) => x!.toJson())),
//       };
// }

// class ContactNumber {
//   ContactNumber({
//     this.phoneNumber,
//     this.emergenyNumber,
//     this.email,
//     this.skype,
//   });

//   String? phoneNumber;
//   String? emergenyNumber;
//   String? email;
//   String? skype;

//   factory ContactNumber.fromJson(Map<String, dynamic> json) => ContactNumber(
//         phoneNumber: json["phone_Number"],
//         emergenyNumber: json["Emergeny Number"],
//         email: json["email"],
//         skype: json["Skype"],
//       );

//   Map<String, dynamic> toJson() => {
//         "phone_Number": phoneNumber,
//         "Emergeny Number": emergenyNumber,
//         "email": email,
//         "Skype": skype,
//       };
// }

// class Education {
//   Education({
//     this.name,
//     this.title,
//     this.percentage,
//     this.field,
//     this.board,
//     this.passingGrade,
//     this.passingYear,
//     this.address,
//     this.educationImportance,
//     this.passingGreade,
//   });

//   String? name;
//   String? title;
//   String? percentage;
//   String? field;
//   String? board;
//   String? passingGrade;
//   String? passingYear;
//   String? address;
//   String? educationImportance;
//   String? passingGreade;

//   factory Education.fromJson(Map<String, dynamic> json) => Education(
//         name: json["name"],
//         title: json["title"],
//         percentage: json["percentage"],
//         field: json["field"],
//         board: json["Board"],
//         passingGrade: json["Passing  grade"],
//         passingYear: json["passing year"],
//         address: json["Address"],
//         educationImportance: json["Education Importance"],
//         passingGreade: json["passing greade"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "title": title,
//         "percentage": percentage,
//         "field": field,
//         "Board": board,
//         "Passing  grade": passingGrade,
//         "passing year": passingYear,
//         "Address": address,
//         "Education Importance": educationImportance,
//         "passing greade": passingGreade,
//       };
// }

// class Experiance {
//   Experiance({
//     this.company,
//     this.position,
//     this.year,
//     this.experiance,
//     this.experianceDescription,
//   });

//   String? company;
//   String? position;
//   String? year;
//   String? experiance;
//   String? experianceDescription;

//   factory Experiance.fromJson(Map<String, dynamic> json) => Experiance(
//         company: json["company"],
//         position: json["Position"],
//         year: json["year"],
//         experiance: json["experiance"],
//         experianceDescription: json["Experiance Description"],
//       );

//   Map<String, dynamic> toJson() => {
//         "company": company,
//         "Position": position,
//         "year": year,
//         "experiance": experiance,
//         "Experiance Description": experianceDescription,
//       };
// }

// class Hoby {
//   Hoby({
//     this.football,
//     this.kiting,
//     this.cricket,
//   });

//   String? football;
//   String? kiting;
//   String? cricket;

//   factory Hoby.fromJson(Map<String, dynamic> json) => Hoby(
//         football: json["football"],
//         kiting: json["Kiting"],
//         cricket: json["Cricket"],
//       );

//   Map<String, dynamic> toJson() => {
//         "football": football,
//         "Kiting": kiting,
//         "Cricket": cricket,
//       };
// }

// class PersonalInformation {
//   PersonalInformation({
//     this.name,
//     this.fatherName,
//     this.living,
//     this.identityNumber,
//     this.placeOfBirth,
//   });

//   String? name;
//   String? fatherName;
//   String? living;
//   String? identityNumber;
//   String? placeOfBirth;

//   factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
//       PersonalInformation(
//         name: json["name"],
//         fatherName: json["father name"],
//         living: json["Living"],
//         identityNumber: json["Identity Number"],
//         placeOfBirth: json["Place of Birth"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "father name": fatherName,
//         "Living": living,
//         "Identity Number": identityNumber,
//         "Place of Birth": placeOfBirth,
//       };
// }

import 'dart:convert';

Student? studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student? data) => json.encode(data!.toJson());

class Student {
  Student({
    this.name,
    this.father,
    this.designation,
    this.living,
    this.profession,
    required this.education,
    required this.experiance,
    required this.skills,
    required this.contactNumber,
    required this.hobies,
    required this.personalInformation,
  });

  String? name;
  String? father;
  String? designation;
  String? living;
  String? profession;
  List<Education?> education;
  List<Experiance?> experiance;
  List<String?> skills;
  List<ContactNumber?> contactNumber;
  List<String?> hobies;
  List<PersonalInformation?> personalInformation;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["Name"],
        father: json["father"],
        designation: json["Designation"],
        living: json["Living"],
        profession: json["profession"],
        education: json["Education"] == null
            ? []
            : List<Education?>.from(
                json["Education"]!.map((x) => Education.fromJson(x))),
        experiance: json["Experiance"] == null
            ? []
            : List<Experiance?>.from(
                json["Experiance"]!.map((x) => Experiance.fromJson(x))),
        skills: json["Skills"] == null
            ? []
            : List<String?>.from(json["Skills"]!.map((x) => x)),
        contactNumber: json["Contact Number"] == null
            ? []
            : List<ContactNumber?>.from(
                json["Contact Number"]!.map((x) => ContactNumber.fromJson(x))),
        hobies: json["Hobies"] == null
            ? []
            : List<String?>.from(json["Hobies"]!.map((x) => x)),
        personalInformation: json["Personal Information"] == null
            ? []
            : List<PersonalInformation?>.from(json["Personal Information"]!
                .map((x) => PersonalInformation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "father": father,
        "Designation": designation,
        "Living": living,
        "profession": profession,
        "Education": education == null
            ? []
            : List<dynamic>.from(education.map((x) => x!.toJson())),
        "Experiance": experiance == null
            ? []
            : List<dynamic>.from(experiance.map((x) => x!.toJson())),
        "Skills":
            skills == null ? [] : List<dynamic>.from(skills.map((x) => x)),
        "Contact Number": contactNumber == null
            ? []
            : List<dynamic>.from(contactNumber.map((x) => x!.toJson())),
        "Hobies":
            hobies == null ? [] : List<dynamic>.from(hobies.map((x) => x)),
        "Personal Information": personalInformation == null
            ? []
            : List<dynamic>.from(personalInformation.map((x) => x!.toJson())),
      };
}

class ContactNumber {
  ContactNumber({
    this.phoneNumber,
    this.emergenyNumber,
    this.email,
    this.skype,
  });

  String? phoneNumber;
  String? emergenyNumber;
  String? email;
  String? skype;

  factory ContactNumber.fromJson(Map<String, dynamic> json) => ContactNumber(
        phoneNumber: json["phone_Number"],
        emergenyNumber: json["Emergeny Number"],
        email: json["email"],
        skype: json["Skype"],
      );

  Map<String, dynamic> toJson() => {
        "phone_Number": phoneNumber,
        "Emergeny Number": emergenyNumber,
        "email": email,
        "Skype": skype,
      };
}

class Education {
  Education({
    this.name,
    this.title,
    this.percentage,
    this.field,
    this.board,
    this.passingGrade,
    this.passingYear,
    this.address,
    this.educationImportance,
    this.passingGreade,
  });

  String? name;
  String? title;
  String? percentage;
  String? field;
  String? board;
  String? passingGrade;
  String? passingYear;
  String? address;
  String? educationImportance;
  String? passingGreade;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        name: json["name"],
        title: json["title"],
        percentage: json["percentage"],
        field: json["field"],
        board: json["Board"],
        passingGrade: json["Passing  grade"],
        passingYear: json["passing year"],
        address: json["Address"],
        educationImportance: json["Education Importance"],
        passingGreade: json["passing greade"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "percentage": percentage,
        "field": field,
        "Board": board,
        "Passing  grade": passingGrade,
        "passing year": passingYear,
        "Address": address,
        "Education Importance": educationImportance,
        "passing greade": passingGreade,
      };
}

class Experiance {
  Experiance({
    this.company,
    this.position,
    this.year,
    this.experiance,
    this.experianceDescription,
  });

  String? company;
  String? position;
  String? year;
  String? experiance;
  String? experianceDescription;

  factory Experiance.fromJson(Map<String, dynamic> json) => Experiance(
        company: json["company"],
        position: json["Position"],
        year: json["year"],
        experiance: json["experiance"],
        experianceDescription: json["Experiance Description"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "Position": position,
        "year": year,
        "experiance": experiance,
        "Experiance Description": experianceDescription,
      };
}

class PersonalInformation {
  PersonalInformation({
    this.name,
    this.fatherName,
    this.living,
    this.identityNumber,
    this.placeOfBirth,
  });

  String? name;
  String? fatherName;
  String? living;
  String? identityNumber;
  String? placeOfBirth;

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation(
        name: json["name"],
        fatherName: json["father name"],
        living: json["Living"],
        identityNumber: json["Identity Number"],
        placeOfBirth: json["Place of Birth"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "father name": fatherName,
        "Living": living,
        "Identity Number": identityNumber,
        "Place of Birth": placeOfBirth,
      };
}
