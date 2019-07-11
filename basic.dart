//A basic Dart program（一个最基本的 Dart 程序）

import 'dart:math';

import 'todo.dart';

printNumber(num aNumber) {
  print('The number is $aNumber.');
}

main() {
  var number = 233;
  printNumber(number);
//  demo1();
  demo21();
}

//Important concepts（重要的概念）

//Keywords（关键字）

//Variables（变量）

var name = 'Bob';

//Default value（默认值）

demo1() {
  int lineCount;
  assert(lineCount == null);
}

//Optional types（可选的类型）

demo2() {
  String name = 'Bob';
}

//Final and const

demo3() {
  final name = "Bob";
//  name = 'Alice';
}

//Built-in types(内置的类型)

//Numbers（数值）

demo4() {
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
}

//Strings（字符串）

//Booleans（布尔值）

demo5() {
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // Check for null.
  var unicorn;
  assert(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}

//Lists（列表）

//Maps

demo6() {
  var gifts = new Map();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
}

//Runes

demo7() {
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
}

//Symbols

//Functions（方法）

demo8() {
  String say(String from, String msg,
      [String device = 'carrier pigeon', String mood]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    if (mood != null) {
      result = '$result (in a $mood mood)';
    }
    return result;
  }

  print(say('Bob', 'Howdy'));

  assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
}

//Anonymous functions（匿名方法）

demo9() {
  var list = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
  list.forEach((i) {
    print(list.indexOf(i).toString() + ': ' + i);
  });
}

//Operators（操作符）

demo10() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an integer
  assert(5 % 2 == 1); // Remainder

  print('5/2 = ${5 ~/ 2} r ${5 % 2}'); // 5/2 = 2 r 1
}

//Type test operators（类型判定操作符）

demo11() {
//  (emp as Person).firstName = 'Bob';
}

//Conditional expressions（条件表达式）

demo12() {
  //  String toString() => msg ?? super.toString();

  // Slightly longer version uses ?: operator.
  //  String toString2() => msg == null ? super.toString() : msg;

  // Very long version uses if-else statement.
  //  String toString3() {
  //    if (msg == null) {
  //      return super.toString();
  //    } else {
  //      return msg;
  //    }
  //  }
}

//Cascade notation (..)（级联操作符）

//Control flow statements（流程控制语句）

//Assert（断言）

//Exceptions（异常）

demo13() {
  try {
    throw new FormatException('Expected at least 1 section');
  } on FormatException catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
    rethrow;
  }
}

//Classes

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
    print(data);
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).

  //  initializer list（初始化参数列表）
  //  superclass’s no-arg constructor（超类的无名构造函数）
  //  main class’s no-arg constructor（主类的无名构造函数）
  //  在构造函数参数后使用冒号 (:) 可以调用 超类构造函数。
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
    print(data);
  }
}

demo14() {
  var emp = new Employee.fromJson({'a': 1});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
}

//Methods（函数）

//Abstract methods（抽象函数）

abstract class Doer {
  // ...Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}

//Abstract classes（抽象类）

// This class is declared abstract and thus
// can't be instantiated.
abstract class AbstractContainer {
  // ...Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

class SpecializedContainer extends AbstractContainer {
  // ...Define more constructors, fields, methods...

  void updateChildren() {
    // ...Implement updateChildren()...
  }

// Abstract method causes a warning but
// doesn't prevent instantiation.
//  void doSomething();
}

//Implicit interfaces（隐式接口）

// A person. The implicit interface contains greet().
class Person2 {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person2(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Imposter implements Person2 {
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}

demo15() {
  greetBob(Person2 person) => person.greet('bob');
  print(greetBob(new Person2('kathy')));
  print(greetBob(new Imposter()));
}

//Extending a class（扩展类）

class Television {
  void turnOn() {}
// ...
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
  }
// ...
}

//Enumerated types（枚举类型）

enum Color { red, green, blue }

demo16() {
  print(Color.values);
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
}

//Adding features to a class: mixins（为类添加新的功能）

//Class variables and methods（类变量和函数）

class Color2 {
  static const red = const Color2('red'); // A constant static variable.
  final String name; // An instance variable.
  const Color2(this.name); // A constant constructor.
}

demo17() {
  print(Color2.red.name);
}

//Static methods（静态函数）

class Point {
  num x;
  num y;

  Point(this.x, this.y);

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

demo18() {
  var a = new Point(2, 2);
  var b = new Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(distance < 2.9 && distance > 2.8);
}

//Generics（泛型）

demo19() {
  var names = new List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  // ...
//  names.add(233); // Fails in checked mode (succeeds in production mode).
  print(names);
}

abstract class Cache<T> {
  T getByKey(String key);

  setByKey(String key, T value);
}

//Libraries and visibility（库和可见性）

//Asynchrony support（异步支持）

lookUpVersion() {}
var expectedVersion;

checkVersion() async {
  var version = await lookUpVersion();
  if (version == expectedVersion) {
    // Do something.
  } else {
    // Do something else.
  }
}

//Callable classes（可调用的类）

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

demo20() {
  var wf = new WannabeFunction();
  var out = wf("Hi", "there,", "gang");
  print('$out');
}

//Typedefs

//Metadata（元数据）

@todo('seth', 'make this do something')
void demo21() {
  print('do something');
}

//Comments（注释）
