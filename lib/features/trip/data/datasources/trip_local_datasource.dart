import 'package:hive/hive.dart';
import 'package:hive_application/features/trip/data/models/trip_model.dart';

class TripLocalDatasource {
  final Box<TripModel> tripBox;

  TripLocalDatasource({required this.tripBox});

  List<TripModel> getTripsData() {
    return tripBox.values.toList();
  }

  void addTripData(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTripData(int index) {
    tripBox.deleteAt(index);
  }
}
