import 'package:hive_application/features/trip/domain/repositories/trip_repository.dart';

class DeleteTripDataUsecase {
  final TripRepository tripRepository;

  DeleteTripDataUsecase({required this.tripRepository});

  Future<void> call(int index) {
    return tripRepository.deleteTripData(index);
  }
}
