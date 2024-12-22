// ignore_for_file: unused_element, unnecessary_type_check

export 'map.dart';

// Map型

/// Map型は`{}`を使用し、キーと値のペアを保持する
final _map1 = {
  200: 'OK',
  301: 'Moved Permanently',
  404: 'Not Found',
  500: 'Internal Server Error'
};

/// Map型は`Map<キーの型, 値の型>`を使用して宣言もしくは`<キーの型, 値の型>{}`を使用して定義する
final Map<int, String> _map2 = {
  200: 'OK',
  301: 'Moved Permanently',
  404: 'Not Found',
  500: 'Internal Server Error'
};

final Map<int, String> _map3 = <int, String>{
  200: 'OK',
  301: 'Moved Permanently',
  404: 'Not Found',
  500: 'Internal Server Error'
};

/// set型とmap型は似ているが、下記はmap型として認識される
final setOrMap = {};

void addToMap() {
  _map1[400] = 'Bad Request';
  // 重複するキーもしくはkey-valueの型が異なる場合はエラーが発生する
  // _map1['400'] = 'Bad Request';
  // _map1[400] = 400;
}

void printMap() {
  print(_map1);
  addToMap();
  print(_map1);
  print(setOrMap is Map);
}
