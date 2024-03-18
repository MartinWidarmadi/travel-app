import 'package:hive_application/features/trip/domain/entities/trip_entity.dart';
import 'package:hive_application/features/trip/domain/repositories/trip_repository.dart';

class AddTripDataUsecase {
  final TripRepository tripRepository;

  AddTripDataUsecase({required this.tripRepository});

  Future<void> call(TripEntity trip) {
    return tripRepository.addTripData(trip);
  }
}
