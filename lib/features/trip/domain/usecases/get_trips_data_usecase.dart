import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';
import 'package:hive_application/features/trip/domain/repositories/trip_repository.dart';

class GetTripsDataUsecase {
  final TripRepository tripRepository;

  GetTripsDataUsecase({required this.tripRepository});

  Future<List<TripEntity>> call() {
    return tripRepository.getTripsData();
  }
}
