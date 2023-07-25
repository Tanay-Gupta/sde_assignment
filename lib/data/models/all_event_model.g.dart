// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllEventModel _$$_AllEventModelFromJson(Map<String, dynamic> json) =>
    _$_AllEventModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      bannerImage: json['banner_image'] as String?,
      dateTime: json['date_time'] as String?,
      organiserName: json['organiser_name'] as String?,
      organiserIcon: json['organiser_icon'] as String?,
      venueName: json['venue_name'] as String?,
      venueCity: json['venue_city'] as String?,
      venueCountry: json['venue_country'] as String?,
    );

Map<String, dynamic> _$$_AllEventModelToJson(_$_AllEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'bannerImage': instance.bannerImage,
      'dateTime': instance.dateTime,
      'organiserName': instance.organiserName,
      'organiserIcon': instance.organiserIcon,
      'venueName': instance.venueName,
      'venueCity': instance.venueCity,
      'venueCountry': instance.venueCountry,
    };
