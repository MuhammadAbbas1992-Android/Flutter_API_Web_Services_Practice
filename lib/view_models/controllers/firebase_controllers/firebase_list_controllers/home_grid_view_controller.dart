import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';

import '../../../../res/constants/app_constants.dart';

class HomeGridViewController extends GetxController {
  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child(AppConstants.firebaseDBName);
  RxString hintText = "Select a number".obs;
  RxInt selectedValue = 2.obs; //default value
  RxList<String> countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo (Congo-Brazzaville)",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czechia (Czech Republic)",
    "Democratic Republic of the Congo",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar (Burma)",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine State",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ].obs;
  RxList<dynamic> items = [].obs;
  RxBool isLoading = false.obs;
  String? lastKey; // To keep track of pagination
  final int limit = 3; // Number of items per page

  // Method to reorder items locally (and you can push update to Firebase here)
  void reorderCountries(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final String movedItem = countries.removeAt(oldIndex);
    countries.insert(newIndex, movedItem);

    // print("ABC Reordered list: $countries");
  }

  Future<void> loadMoreData() async {
    isLoading.value = true;

    print('ABC its working');
    Query query = dbRef.orderByKey().limitToFirst(limit);
    if (lastKey != null) {
      // fetch from the last key onward
      query = dbRef.orderByKey().startAt(lastKey).limitToFirst(limit + 1);
      print('ABC inside if');
    }

    print('ABC outside if');

    DatabaseEvent event = await query.once();
    final snapshot = event.snapshot;

    print('ABC one');
    if (snapshot.exists && snapshot.value is Map) {
      final map = Map<String, dynamic>.from(snapshot.value as Map);
      print('ABC one');

      // Convert to list
      final fetchedItems = map.entries.map((e) => e.value.toString()).toList();
      print('ABC Two');

      // If we already have items, skip the first one (duplicate of last page)
      if (lastKey != null && fetchedItems.isNotEmpty) {
        fetchedItems.removeAt(0);
        print('ABC Three');
      }
      print('ABC Four');

      items.addAll(fetchedItems);
      print('ABC Five');

      // update last key
      lastKey = map.keys.last;
      print('ABC Six');
    }
    print('ABC Seven');
    isLoading.value = false;
  }
}
