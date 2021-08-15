
class validating {

  String? validatePassword(String password) {
    if (password.isEmpty)
      return 'Password is empty';
    else {
      if (password.length < 8) {
        return 'Password must be at least 8 characters';
      }
    }
  }

  String? validateEmail(String email){
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please make sure your email address is valid';

  }
  String? validateUserName(String userName) {
    if (userName.isEmpty)
      return 'UserName is empty';
    else {
      if (userName.length < 8) {
        return 'Username must be at least 8 characters';
      }
    }
  }
  String? validAll(String type,String value){
    switch(type){
      case 'u':
       return validateUserName(value);

      case 'p':
       return validatePassword(value);

      case 'e':
        return validateEmail(value);
    }

  }
}
