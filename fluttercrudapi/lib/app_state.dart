import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _accountId = await secureStorage.getInt('ff_accountId') ?? _accountId;
    });
    await _safeInitAsync(() async {
      _accountRole =
          await secureStorage.getString('ff_accountRole') ?? _accountRole;
    });
    await _safeInitAsync(() async {
      _accountName =
          await secureStorage.getString('ff_accountName') ?? _accountName;
    });
    await _safeInitAsync(() async {
      _loggedIn = await secureStorage.getBool('ff_loggedIn') ?? _loggedIn;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _accountId = 0;
  int get accountId => _accountId;
  set accountId(int _value) {
    _accountId = _value;
    secureStorage.setInt('ff_accountId', _value);
  }

  void deleteAccountId() {
    secureStorage.delete(key: 'ff_accountId');
  }

  String _accountRole = '';
  String get accountRole => _accountRole;
  set accountRole(String _value) {
    _accountRole = _value;
    secureStorage.setString('ff_accountRole', _value);
  }

  void deleteAccountRole() {
    secureStorage.delete(key: 'ff_accountRole');
  }

  String _accountName = '';
  String get accountName => _accountName;
  set accountName(String _value) {
    _accountName = _value;
    secureStorage.setString('ff_accountName', _value);
  }

  void deleteAccountName() {
    secureStorage.delete(key: 'ff_accountName');
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool _value) {
    _loggedIn = _value;
    secureStorage.setBool('ff_loggedIn', _value);
  }

  void deleteLoggedIn() {
    secureStorage.delete(key: 'ff_loggedIn');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
