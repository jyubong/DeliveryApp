import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

final storage = FlutterSecureStorage();

const _emulatorIp = '10.0.2.0:3000';
const _simulatorIp = '127.0.0.1:3000';
final ip = Platform.isIOS ? _simulatorIp : _emulatorIp;