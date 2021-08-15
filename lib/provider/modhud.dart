import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class modprogress extends ChangeNotifier
{
bool isLoading=false;

changeLoad(bool val){

  isLoading=val;
  notifyListeners();
}

}