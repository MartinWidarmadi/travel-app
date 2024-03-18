import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_application/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:hive_application/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';
import 'package:hive_application/features/trip/domain/repositories/trip_repository.dart';
import 'package:hive_application/features/trip/domain/usecases/add_trip_data_usecase.dart';
import 'package:hive_application/features/trip/domain/usecases/delete_trip_data_usecase.dart';
import 'package:hive_application/features/trip/domain/usecases/get_trips_data_usecase.dart';

// trip local datasource provider
final tripLocalDatasourceProvider = Provider<TripLocalDatasource>((ref) {
  return TripLocalDatasource(tripBox: Hive.box('trips'));
});

// trip repository provider
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final tripLocalDatasource = ref.read(tripLocalDatasourceProvider);
  return TripRepositoryImpl(tripLocalDatasource: tripLocalDatasource);
});

// add trip data provider
final addTripDataProvider = Provider<AddTripDataUsecase>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTripDataUsecase(tripRepository: repository);
});

// delete trip data provider
final deleteTripDataProvider = Provider<DeleteTripDataUsecase>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTripDataUsecase(tripRepository: repository);
});

// get all trip data provider
final getTripsDataProvider = Provider<GetTripsDataUsecase>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTripsDataUsecase(tripRepository: repository);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<TripEntity>>((ref) {
  final addTripData = ref.read(addTripDataProvider);
  final deleteTripData = ref.read(deleteTripDataProvider);
  final getTripsData = ref.read(getTripsDataProvider);
  return TripListNotifier(
    addTripData,
    deleteTripData,
    getTripsData,
  );
});

class TripListNotifier extends StateNotifier<List<TripEntity>> {
  final AddTripDataUsecase _addTripData;
  final DeleteTripDataUsecase _deleteTripData;
  final GetTripsDataUsecase _getTripsData;

  TripListNotifier(this._addTripData, this._deleteTripData, this._getTripsData)
      : super([]);

  Future<void> addNewTrip(TripEntity trip) async {
    await _addTripData(trip);
  }

  Future<void> removeTrip(int index) async {
    await _deleteTripData(index);
  }

  Future<void> loadTrips() async {
    await _getTripsData();
  }
}
