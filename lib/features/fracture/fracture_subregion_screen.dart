import 'package:bonewise/app_strings.dart';
import 'package:flutter/material.dart';
import 'fracture_detail_screen.dart';

class FractureSubRegionScreen extends StatelessWidget {
  final String region;
  final String subRegion;

  const FractureSubRegionScreen({super.key, required this.region, required this.subRegion});

  List<String> getFractures() {
    /// UPPER LIMB
    if (region == "Upper Limb" && subRegion == "Shoulder") {
      return [
        AppStrings.clavicleShaftFracture,
        AppStrings.lateralEndClavicleFracture,
        AppStrings.proximalHumerusFracture,
        AppStrings.scapulaFracture,
        AppStrings.shoulderDislocation,
      ];
    }

    if (region == "Upper Limb" && subRegion == "Arm") {
      return [AppStrings.humerusShaftFracture];
    }

    if (region == "Upper Limb" && subRegion == "Elbow") {
      return [
      AppStrings.distalHumerusFracture,
        AppStrings.radialHeadFracture,
        AppStrings.radialNeckFracture,
        AppStrings.olecranonFracture,
        AppStrings.coronoidFracture,
        AppStrings.terribleTriadOfElbow,
        AppStrings.elbowDislocation,
      ];
    }

    if (region == "Upper Limb" && subRegion == "Forearm") {
      return [
        AppStrings.radiusShaftFracture,
        AppStrings.ulnaShaftFracture,
        AppStrings.bothBoneForearmFracture,
      ];
    }

    if (region == "Upper Limb" && subRegion == "Wrist") {
      return [
        AppStrings.distalRadiusFracture,
        AppStrings.distalUlnaFracture,
        AppStrings.carpalFractures,
      ];
    }

    if (region == "Upper Limb" && subRegion == "Hand") {
      return [
        AppStrings.phalangealFractures,
        AppStrings.metacarpalFractures,
      ];
    }

    /// LOWER LIMB
    if (region == "Lower Limb" && subRegion == "Hip") {
      return [
        AppStrings.femoralHeadFracture,
        AppStrings.femoralNeckFracture,
        AppStrings.intertrochantericFemurFracture,
        AppStrings.subtrochantericFemurFracture,
        AppStrings.hipDislocation,
      ];
    }

    if (region == "Lower Limb" && subRegion == "Thigh") {
      return [
        AppStrings.femurShaftFracture,
      ];
    }

    if (region == "Lower Limb" && subRegion == "Knee") {
      return [
        AppStrings.distalFemurFracture,
        AppStrings.patellaFracture,
        AppStrings.proximalTibiaFracture,
        AppStrings.proximalFibulaFracture,
        AppStrings.kneeDislocation,
      ];
    }

    if (region == "Lower Limb" && subRegion == "Leg") {
      return [
        AppStrings.tibiaShaftFracture,
        AppStrings.fibulaShaftFracture,
      ];
    }

    if (region == "Lower Limb" && subRegion == "Ankle") {
      return [
        AppStrings.distalTibiaFracture,
        AppStrings.lateralMalleolusFracture,
        AppStrings.medialMalleolusFracture,
        AppStrings.bimalleolarFracture,
        AppStrings.trimalleolarFracture,
        AppStrings.talusFracture,
        AppStrings.ankleDislocation,
      ];
    }

    if (region == "Lower Limb" && subRegion == "Foot") {
      return [
        AppStrings.calcaneumFracture,
        AppStrings.chopartFracture,
        AppStrings.navicularFracture,
        AppStrings.cuboidFracture,
        AppStrings.lisfrancFracture,
        AppStrings.jonesFracture,
        AppStrings.metatarsalFractures,
        AppStrings.phalanxFractures,
      ];
    }

    /// TRUNK
    if (region == "Trunk" && subRegion == "Spine") {
      return [
        AppStrings.cervicalSpineFracture,
        AppStrings.thoracicSpineFracture,
        AppStrings.lumbarSpineFracture,
        AppStrings.sacralFracture,
        AppStrings.coccyxFracture,
      ];
    }

    if (region == "Trunk" && subRegion == "Pelvis") {
      return [
        AppStrings.pelvicRingFracture,
        AppStrings.acetabularFracture,
        AppStrings.pubicRamiFracture,
      ];
    }

    if (region == "Trunk" && subRegion == "Chest Wall") {
      return [
        AppStrings.ribFracture
      ];
    }

    /// Head
    if (region == "Head" && subRegion == "Skull") {
      return [AppStrings.skullFracture];
    }

    if (region == "Head" && subRegion == "Face") {
      return [
        AppStrings.nasalBoneFracture,
        AppStrings.zygomaticFracture,
        AppStrings.maxillaFracture,
        AppStrings.mandleFracture,
        AppStrings.orbitalFracture,
      ];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final fractures = getFractures();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: Text(subRegion, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: fractures.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => FractureDetailScreen(title: fractures[index])),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: Text(fractures[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
