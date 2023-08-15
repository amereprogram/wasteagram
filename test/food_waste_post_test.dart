import 'package:test/test.dart';
import 'package:wasteagram/models/food_WastePost.dart';

void main() {
  // setup
  group("Test post model", () {
      test('Post created from Map should have appropriate property values 1', () {
        final date = '2023-03-16';
        const url = 'FAKE';
        const quantity = 1;
        const latitude = 1.0;
        const longitude = 2.0;

        // exercise subject under test
        final foodEntryPost = FoodEntry.fromMap({
          'date' : date,
          'imageURL' : url,
          'quantity' : quantity,
          'latitude' : latitude,
          'longitude' : longitude
        });

        //verify
        expect(foodEntryPost.date, date);
        expect(foodEntryPost.imageURL, url);
        expect(foodEntryPost.quantity, quantity);
        expect(foodEntryPost.latitude, latitude);
        expect(foodEntryPost.longitude, longitude);
      });

      test('Post created from Map should have appropriate property values 2', () {
        final date = '2021-03-17';
        const url = 'https//';
        const quantity = 20;
        const latitude = 76.87;
        const longitude = 122.456;


        // exercise subject under test
        final foodEntryTest = FoodEntry.fromMap({
          'date' : date,
          'imageURL' : url,
          'quantity' : quantity,
          'latitude' : latitude,
          'longitude' : longitude
        });

        //verify
        expect(foodEntryTest.date, date);
        expect(foodEntryTest.imageURL, url);
        expect(foodEntryTest.quantity, quantity);
        expect(foodEntryTest.latitude, latitude);
        expect(foodEntryTest.longitude, longitude);
      });
      
    });
}
