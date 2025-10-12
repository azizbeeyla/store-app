import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import '../widgets/new_address_bottomsheet.dart';
class NewAddressPage extends StatefulWidget {
  const NewAddressPage({super.key});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}
class _NewAddressPageState extends State<NewAddressPage>
    with TickerProviderStateMixin {
  final controller = MapController();
  LatLng? currentCenter;
  String fullAddress = '';
  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

  Future<void> _loadCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    final point = LatLng(position.latitude, position.longitude);

    await _getAddressFromLatLng(point);
    setState(() {
      currentCenter = point;
    });
  }
  Future<void> _getAddressFromLatLng(LatLng point) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        setState(() {
          fullAddress =
              "${p.street ?? ''}, ${p.locality ?? ''}, ${p.administrativeArea ?? ''}, ${p.country ?? ''}";
        });
      }
    } catch (e) {
      setState(() {
        fullAddress = 'Address Not found';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,

      appBar: CustomAppBarMain(title: 'New Address'),

      body: currentCenter == null
          ?  Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter: currentCenter!,
                initialZoom: 15,
                onTap: (tapPosition, point) async {
                  await _getAddressFromLatLng(point);

                  if (context.mounted) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.white,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (_) => NewAddressBottomSheet(
                        fullAddress: fullAddress,
                        latLng: point,
                      ),
                    );
                  }
                },
              ),

              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: "store_app",
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentCenter!,
                      width: 50,
                      height: 50,
                      child:SvgPicture.asset('assets/Location_filled.svg')
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
