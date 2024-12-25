export 'conditional_operator.dart';

int _a = 128;
int _b = 256;

final max = _a > _b ? _a : _b;

void printConditionalOperator() {
  print(max);
}
