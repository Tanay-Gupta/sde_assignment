// class AllEventModel {
//   int? id;
//   String? title;
//   String? description;
//   String? bannerImage;
//   String? dateTime;
//   String? organiserName;
//   String? organiserIcon;
//   String? venueName;
//   String? venueCity;
//   String? venueCountry;

//   AllEventModel(
//       {this.id,
//       this.title,
//       this.description,
//       this.bannerImage,
//       this.dateTime,
//       this.organiserName,
//       this.organiserIcon,
//       this.venueName,
//       this.venueCity,
//       this.venueCountry});

//   AllEventModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     bannerImage = json['banner_image'];
//     dateTime = json['date_time'];
//     organiserName = json['organiser_name'];
//     organiserIcon = json['organiser_icon'];
//     venueName = json['venue_name'];
//     venueCity = json['venue_city'];
//     venueCountry = json['venue_country'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['banner_image'] = bannerImage;
//     data['date_time'] = dateTime;
//     data['organiser_name'] = organiserName;
//     data['organiser_icon'] = organiserIcon;
//     data['venue_name'] = venueName;
//     data['venue_city'] = venueCity;
//     data['venue_country'] = venueCountry;
//     return data;
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_event_model.freezed.dart';
part 'all_event_model.g.dart';

@freezed
class AllEventModel with _$AllEventModel {
  const factory AllEventModel({
    int? id,
    String? title,
    String? description,
    String? bannerImage,
    String? dateTime,
    String? organiserName,
    String? organiserIcon,
    String? venueName,
    String? venueCity,
    String? venueCountry,
  }) = _AllEventModel;

  factory AllEventModel.fromJson(Map<String, dynamic> json) =>
      _$AllEventModelFromJson(json);
}
