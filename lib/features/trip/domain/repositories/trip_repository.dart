import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';

abstract class TripRepository {
  Future<List<TripEntity>> getTripsData();
  Future<void> addTripData(TripEntity trip);
  Future<void> deleteTripData(int index);
}
