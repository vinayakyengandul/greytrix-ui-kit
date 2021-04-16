import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GTGoogleMap extends StatelessWidget {
  GTGoogleMap({
    this.mapType = MapType.normal,
    @required this.initialLocation,
    this.circle,
    this.marker,
    this.onMapCreated,
    this.compassEnabled = true,
    this.mapToolbarEnabled = true,
    this.cameraTargetBounds = CameraTargetBounds.unbounded,
    this.minMaxZoomPreference = MinMaxZoomPreference.unbounded,
    this.rotateGesturesEnabled = true,
    this.scrollGesturesEnabled = true,
    this.zoomControlsEnabled = true,
    this.zoomGesturesEnabled = true,
    this.liteModeEnabled = false,
    this.tiltGesturesEnabled = true,
    this.myLocationEnabled = false,
    this.myLocationButtonEnabled = true,
    this.padding = const EdgeInsets.all(0),
  }) : assert(initialLocation != null);

  final MapType mapType;
  final CameraPosition initialLocation;
  final Marker marker;
  final Circle circle;
  final MapCreatedCallback onMapCreated;
  final bool compassEnabled;
  final bool mapToolbarEnabled;
  final CameraTargetBounds cameraTargetBounds;
  final MinMaxZoomPreference minMaxZoomPreference;
  final bool rotateGesturesEnabled;
  final bool scrollGesturesEnabled;
  final bool zoomControlsEnabled;
  final bool zoomGesturesEnabled;
  final bool liteModeEnabled;
  final bool tiltGesturesEnabled;
  final EdgeInsets padding;
  final bool myLocationEnabled;
  final bool myLocationButtonEnabled;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: initialLocation,
      markers: Set.of((marker != null) ? [marker] : []),
      circles: Set.of((circle != null) ? [circle] : []),
      onMapCreated: onMapCreated,
      compassEnabled: compassEnabled,
      mapToolbarEnabled: mapToolbarEnabled,
      cameraTargetBounds:  cameraTargetBounds,
      minMaxZoomPreference:  minMaxZoomPreference,
      rotateGesturesEnabled: rotateGesturesEnabled,
      scrollGesturesEnabled: scrollGesturesEnabled,
      zoomControlsEnabled: zoomControlsEnabled,
      zoomGesturesEnabled: zoomGesturesEnabled,
      liteModeEnabled: liteModeEnabled,
      tiltGesturesEnabled: tiltGesturesEnabled,
      myLocationEnabled: myLocationEnabled,
      myLocationButtonEnabled: myLocationButtonEnabled,
      padding: padding,
    );
  }
}
