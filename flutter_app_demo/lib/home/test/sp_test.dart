import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest {
  ///sp 读取以及删除数据
  testWriteData() async* {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
// Save an integer value to 'counter' key.
    await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
    await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
    await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
    await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

    /*Map<String, Object> values = <String, Object>{'counter': 1};
    SharedPreferences.setMockInitialValues(values);*/
  }

  testReadData() async* {
    final prefs = await SharedPreferences.getInstance();
    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int counter = prefs.getInt('counter')??0;
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
    final bool repeat = prefs.getBool('repeat')??false;
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
    final double decimal = prefs.getDouble('decimal')??0.0;
// Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String action = prefs.getString('action')??"";
// Try reading data from the 'items' key. If it doesn't exist, returns null.
    final List<String> items = prefs.getStringList('items')??List.empty();

    ///获取sp中所有的key
    var keys = prefs.getKeys();
    for (var value in keys) {

    }
  }

  remove() async* {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    final success = await prefs.remove('counter');
  }
}

void main() {}
