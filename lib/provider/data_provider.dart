import 'package:flutter/widgets.dart';

class DataProvider extends ChangeNotifier{
String userName='Habiba';
int currentBottonIndex=0;
void updateUserName({required String NewUserName})
{
  userName=NewUserName;
notifyListeners();
}
void UpdateBottonIndex(int index)
{
currentBottonIndex=index;
notifyListeners();
}

}