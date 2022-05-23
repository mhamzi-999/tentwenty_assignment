
import '../views/widgets/custom_snackbar.dart';

class APISTATUS{
  static apiStatuses(int statusCode, String message) async {
    if(statusCode==7)
    {
      errorSnackbar(message);
    }
    if(statusCode==404)
    {
      ///no record
    }
    if(statusCode==401)
    {
    }
    else{
      errorSnackbar(message);
    }
  }
}
