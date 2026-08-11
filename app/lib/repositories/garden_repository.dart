import '../models/garden.dart';

abstract class GardenRepository {

  List<Garden> get gardens;

  Garden addGarden(Garden garden);
   

  Garden? getGardenById(String id);

  Garden? updateGarden(String gardenId, Garden updatedGarden);

  bool removeGarden(String id);
}