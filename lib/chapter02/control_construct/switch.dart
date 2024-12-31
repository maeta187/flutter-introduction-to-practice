export 'switch.dart';

final String _color = 'red';

/// `continue`を使用するとラベル定義した箇所に処理が移動する
/// `case`が複数定義も可能
/// `continue`は処理を共通化させつつ、一部の`case`だけ処理を追加する場合に有効
String getColor(String value) {
  switch (value) {
    case 'red':
      // return '0xFFF44336';
      continue other;
    case 'green':
      return '0xFF4CAF50';
    case 'blue':
      return '0xFF2196F3';
    other: // ラベル定義
    case 'black':
      return 'Unexpected color';
    default:
      throw ArgumentError('Invalid color: $value');
  }
}

final int? _statusCode = null;

/// `case`に`when`を使用することで条件を追加できる
void getPrintStatusCode(value) {
  switch (value) {
    case (int value) when 100 <= value && value < 200:
      print('Informational: $value');
      break;
    case (int value) when 200 <= value && value < 300:
      print('Success: $value');
      break;
    case (int value) when 300 <= value && value < 400:
      print('Redirection: $value');
      break;
    case (int value) when 400 <= value && value < 500:
      print('Client Error: $value');
      break;
    case (int value) when 500 <= value && value < 600:
      print('Server Error: $value');
      break;
    case null:
      print('No status code');
      break;
    default:
      print('Unknown status code: $value');
  }
}

final int _statusCodeInfo = 404;

/// `switch`を式のように使用できる
/// `case`と処理の区切りに`=>`を使用する
/// 但し、`default`は必須
/// アンダースコアを使用することで、`default`の代わりに使用できる
final message = switch (_statusCodeInfo) {
  >= 100 && < 200 => 'Informational: $_statusCodeInfo',
  >= 200 && < 300 => 'Success: $_statusCodeInfo',
  >= 300 && < 400 => 'Redirection: $_statusCodeInfo',
  >= 400 && < 500 => 'Client Error: $_statusCodeInfo',
  >= 500 && < 600 => 'Server Error: $_statusCodeInfo',
  _ => 'Unknown status code: $_statusCodeInfo',
};

void printSwitch() {
  print(getColor(_color));
  print(getColor('green'));
  getPrintStatusCode(200);
  getPrintStatusCode(_statusCode);
  print(message);
}
