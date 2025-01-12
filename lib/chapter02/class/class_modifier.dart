export 'class_modifier.dart';

import 'class_modifier/abstract.dart';
import 'class_modifier/base.dart';
import 'class_modifier/interface.dart';
import 'class_modifier/final.dart';
import 'class_modifier/sealed.dart';

// base
// エラーになる
// base class _BaseDog implements BaseAnimal {}

base class _BaseDog extends BaseAnimal {
  @override
  String greet() => 'Bow-wow';
}

void printBase() {
  final dog = _BaseDog();
  print(dog.greet());
}

// interface
// エラーになる
// class _InterfaceCat extends InterfaceAnimal {}

class _InterfaceCat implements InterfaceAnimal {
  @override
  String greet() => 'Meow';
}

void printInterface() {
  final cat = _InterfaceCat();
  print(cat.greet());
}

// final
// エラーになる
// class _FinalDog extends FinalAnimal {}
// class _FinalDog implements FinalAnimal {}

void printFinal() {
  final dog = FinalAnimal();
  print(dog.greet());
}

// sealed

void printSealed() {
  final SealedShape sealedShape = getSealedShape('rectangle');

  switch (sealedShape) {
    case SealedRectangle():
      print('Rectangle');
    case SealedTriangle():
      print('Triangle');
    case SealedCircle():
      print('Circle');
  }
}

void printClassModifier() {
  printAbstract();
  printBase();
  printInterface();
  printFinal();
  printSealed();
}
