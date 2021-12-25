
import 'package:discover_app/models/places_model.dart';

abstract class DiscoverStates{}

class DiscoverInitialState extends DiscoverStates{}

class DiscoverChangeNavState extends DiscoverStates{}

class DiscoverChangeColorSelctedState extends DiscoverStates{}

class DiscoverGetDataLoadingState extends DiscoverStates{}
class DiscoverGetDataSuccessState extends DiscoverStates{
  final List<PlacesModel> places;
  DiscoverGetDataSuccessState(this.places);
}