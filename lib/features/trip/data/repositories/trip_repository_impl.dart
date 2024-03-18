import 'package:hive_application/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:hive_application/features/trip/data/models/trip_model.dart';
import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';
import 'package:hive_application/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDatasource tripLocalDatasource;

  TripRepositoryImpl({required this.tripLocalDatasource});

  @override
  Future<void> addTripData(TripEntity trip) async {
    final tripModel = TripModel.fromEntity(trip);
    tripLocalDatasource.addTripData(tripModel);
  }

  @override
  Future<void> deleteTripData(int index) async {
    tripLocalDatasource.deleteTripData(index);
  }

  @override
  Future<List<TripEntity>> getTripsData() async {
    final tripsModel = tripLocalDatasource.getTripsData();
    List<TripEntity> results =
        tripsModel.map((model) => model.toEntity()).toList();
    return results;
  }
}
