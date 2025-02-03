import 'package:flutter/material.dart';
import 'package:mytailor/models/userdetails.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserDetails _userDetails = UserDetails();

  UserDetails get userDetails => _userDetails;

  // Update the whole details
  void updateDetails(UserDetails newDetails) {
    _userDetails = newDetails;
    notifyListeners();
  }

  // Update individual fields based on the key
  void updateDetail(String key, dynamic value) {
    switch (key) {
      case 'apparel':
        _userDetails = _userDetails.copyWith(apparel: value);
        break;
      case 'collar':
        _userDetails = _userDetails.copyWith(collar: value);
        break;
      case 'sleeve':
        _userDetails = _userDetails.copyWith(sleeve: value);
        break;
      case 'cuff':
        _userDetails = _userDetails.copyWith(cuff: value);
        break;
      case 'placket':
        _userDetails = _userDetails.copyWith(placket: value);
        break;
      case 'pocket':
        _userDetails = _userDetails.copyWith(pocket: value);
        break;
      case 'yoke':
        _userDetails = _userDetails.copyWith(yoke: value);
        break;
      case 'pleat':
        _userDetails = _userDetails.copyWith(pleat: value);
        break;
      case 'hem':
        _userDetails = _userDetails.copyWith(hem: value);
        break;
      case 'seam':
        _userDetails = _userDetails.copyWith(seam: value);
        break;
      case 'button':
        _userDetails = _userDetails.copyWith(button: value);
        break;
      case 'body':
        _userDetails = _userDetails.copyWith(body: value);
        break;
      case 'chest':
        _userDetails = _userDetails.copyWith(chest: value);
        break;
      case 'waist':
        _userDetails = _userDetails.copyWith(waist: value);
        break;
      case 'hip':
        _userDetails = _userDetails.copyWith(hip: value);
        break;
      case 'thigh':
        _userDetails = _userDetails.copyWith(thigh: value);
        break;
      case 'sleeveLen':
        _userDetails = _userDetails.copyWith(sleeveLen: value);
        break;
      case 'legLen':
        _userDetails = _userDetails.copyWith(legLen: value);
        break;
      case 'fabric':
        _userDetails = _userDetails.copyWith(fabric: value);
        break;
    }
    notifyListeners();
  }
}
