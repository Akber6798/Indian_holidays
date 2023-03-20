import 'package:http/http.dart' as http;
import 'package:indian_holidays/services/model_class.dart';

class ApiService {
  Future<HolidayModel> getHolidays(var year) async {
    var data;
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(
          "https://calendarific.com/api/v2/holidays?api_key=8ef322780443ca7deb848dc6ca973b1013a3aadf&country=in&year=$year"));
      if (response.statusCode == 200) {
        data = holidayModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString())
;    }
    return data;
  }
}
