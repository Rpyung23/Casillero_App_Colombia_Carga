import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _icons = <String, IconData>{
  "add_alert": FontAwesomeIcons.lightBell,
  "accessibility": FontAwesomeIcons.lightPersonBooth,
  "folder_open": FontAwesomeIcons.lightFolderOpen,
  "input": FontAwesomeIcons.lightSignInAlt,
  "list": FontAwesomeIcons.lightList,
  "fal fa-exclamation-triangle": FontAwesomeIcons.lightExclamationTriangle,
  "fal fa-boxes": FontAwesomeIcons.lightBoxes,
  "fal fa-person-carry": FontAwesomeIcons.lightPersonCarry,
  "fal fa-pallet": FontAwesomeIcons.lightPallet,
  "fal fa-shipping-fast": FontAwesomeIcons.lightShippingFast,
  "fal fa-hand-holding-box": FontAwesomeIcons.lightHandHoldingBox,
  "fal fa-plane-departure": FontAwesomeIcons.lightPlaneDeparture,
  "fal fa-plane-arrival": FontAwesomeIcons.lightPlaneArrival,
  "fal fa-clipboard-check": FontAwesomeIcons.lightClipboardCheck,
  "fal fa-truck-loading": FontAwesomeIcons.lightTruckLoading,
};

Icon getIconsString(String? nameIcon, Color color, double size) =>
    Icon(_icons[nameIcon!], color: color, size: size);
