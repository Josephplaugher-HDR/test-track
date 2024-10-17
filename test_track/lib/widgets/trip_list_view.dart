//
// Copyright 2024 Esri
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import 'package:test_track/models/trip.dart';
import 'package:test_track/models/project.dart';
import 'package:test_track/widgets/trip_detail_page.dart';
import 'package:test_track/widgets/sample_detail_page.dart';
import 'package:flutter/material.dart';

class TripListView extends StatelessWidget {
  const TripListView({super.key, required this.trips});

  //final List<Sample> samples;
  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Card(
          child: ListTile(
            title: Text(trip.name),
            subtitle: Text(trip.formattedDate),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailPage(trip: trip),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
