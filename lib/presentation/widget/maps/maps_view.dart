// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keiko_good_day/core/platform/current_location.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key, this.latLng}) : super(key: key);
  final LatLng? latLng;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(-6.2295712, 106.7594781), zoom: 12);
  final Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor? _markerIcon;

  final _lastPos = ValueNotifier(const LatLng(-6.2295712, 106.7594781));
  final address = ValueNotifier('');

  Future<void> getCurrentPosittion() async {
    final controller = await _controller.future;
    final currentLocation = await CurrentLocation.getPosition();

    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 17)));

    _lastPos.value =
        LatLng(currentLocation.latitude, currentLocation.longitude);

    await getAddress();
  }

  @override
  void initState() {
    super.initState();

    if (widget.latLng != null) {
      onMapTap(widget.latLng!);
    } else {
      getCurrentPosittion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ValueListenableBuilder(
              valueListenable: _lastPos,
              builder: (context, value, child) {
                return GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    onTap: onMapTap,
                    markers: <Marker>{_createMarker()},
                    onMapCreated: _controller.complete);
              }),
          ValueListenableBuilder(
              valueListenable: address,
              builder: (context, value, child) {
                if (address.value.isNotEmpty) {
                  return Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Data Lokasi',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(height: 8),
                          Text(address.value),
                          if (widget.latLng == null)
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0)),
                              child: const Text('Save'),
                            )
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              })
        ],
      ),
    );
  }

  Future<void> getAddress() async {
    final addressResult = await placemarkFromCoordinates(
        _lastPos.value.latitude, _lastPos.value.longitude);

    final administrativeArea = addressResult.first.administrativeArea ?? '';
    final locality = addressResult.first.locality ?? '';
    final street = addressResult.first.street ?? '';
    final subAdministrativeArea =
        addressResult.first.subAdministrativeArea ?? '';
    final subLocality = addressResult.first.subLocality ?? '';

    address.value =
        '$street, $subLocality, $locality, $subAdministrativeArea, $administrativeArea';
  }

  Future<void> onMapTap(LatLng latLng) async {
    final controller = await _controller.future;

    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(latLng.latitude, latLng.longitude), zoom: 17)));

    _lastPos.value = LatLng(latLng.latitude, latLng.longitude);

    await getAddress();
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _lastPos.value,
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _lastPos.value,
      );
    }
  }
}
