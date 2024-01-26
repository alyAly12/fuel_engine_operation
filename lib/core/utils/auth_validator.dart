

class AuthValidator
{
  static String? userNameValidator(String?userName){
    if(userName == null || userName.isEmpty){
      return 'please enter your user name';
    }
    if(userName.length<3 || userName.length>20){
      return 'This field must be between 3 and 10 characters';
    }
    return null;
  }

  static String? passWordValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter Password';
    }
    if(value.length<3){
      return 'This field must be between 3 and 6 characters';
    }
    return null;
  }
  static String? deviceSecretValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter device secret';
    }
    if(value.length<6){
      return 'device secret is too short';
    }
    return null;
  }

  static String? agentCodeValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter device secret';
    }
    if(value.length<6){
      return 'device secret is too short';
    }
    return null;
  }
  static String? pinCodeValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter pin code';
    }
    if(value.length<5){
      return 'wrong pin code Try Again';
    }
    return null;
  }
  static String? vehicleLetterValidator(String?value){
    if(value!.isEmpty){
      return 'Vehicle letters';
    }
    if(value.length<3 || value.length>6){
      return 'This field must be between 3 and 6 characters';
    }
    return null;
  }
  static String? vehicleNumberValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter Vehicle numbers';
    }
    if(value.length<4 || value.length>4){
      return 'This field must be between 4 characters';
    }
    return null;
  }
  static String? fuelMeterValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter Fuel amount';
    }
    if(value.isEmpty || value.length>3){
      return 'This field must be between 1 to 3 characters';
    }
    return null;
  }
  static String? odooMeterValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter Odoo Meter numbers';
    }
    if(value.length<2 || value.length>6){
      return 'This field must be between 2 to 6 characters';
    }
    return null;
  }
  static String? titleValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter your title first';
    }
    return null;
  }
  static String? messageValidator(String?value){
    if(value!.isEmpty){
      return 'This field can not be empty ';
    }
    return null;
  }
}

