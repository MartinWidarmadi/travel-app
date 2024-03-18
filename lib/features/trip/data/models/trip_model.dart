import 'package:hive/hive.dart';
import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel(
      {required this.title,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});

  // convert from entity to model
  factory TripModel.fromEntity(TripEntity tripEntity) => TripModel(
        title: tripEntity.title,
        photos: tripEntity.photos,
        description: tripEntity.description,
        date: tripEntity.date,
        location: tripEntity.location,
      );

  // convert from model to entity
  TripEntity toEntity() => TripEntity(
        title: title,
        photos: photos,
        description: description,
        date: date,
        location: location,
      );
}
