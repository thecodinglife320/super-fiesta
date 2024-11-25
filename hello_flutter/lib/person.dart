class Name{
  String first='';
  String last='';
  String suffix='';
  Name.name(this.first, this.last, this.suffix);
  Name(){
    first='a';
    last='b';
    suffix='c';
  }
}
class Person {
  String id='';
  Name name = Name.name('a','b','c');
  String email='';
  String phone='';

  @override
  String toString() {
    return 'Person{id: $id, name: $name, email: $email, phone: $phone}';
  }

  Person({required this.id, this.email='a@gmail', this.phone='036'});
}

mixin Employment {
  late String employer;
  String? businessPhone;
  void callBoss() {
    print('Calling my boss');
  }
  @override
  String toString() {
    return '$employer $businessPhone';
  }
}

class Employee extends Person with Employment{
  String position;

  Employee({this.position='nhan vien', required super.id});

  @override
  String toString() {
    return "${super.toString()} - position: $position $id, $email";
  }
}

void main(){
  Map<String, dynamic> person = {
    "first": "George",
    "last": "Blush",
    "dob": DateTime.parse("1972-07-16"),
    "email": "amazingGob@gmail.com",
  };
  String intro = "${person['first']} ${person['last']} was born ${person['dob']}";

  sayHi(String name) => print("Xin chao, $name");
  var meToo = sayHi;
  meToo("Coding life");

  //
  sayBye(String name) =>print('Bye, $name');
  meToo = sayBye;
  meToo("Dat");

  print(sendEmail(subject: 'playing game'));

  var employee = Employee(id: 'id1');
  employee..employer = "hr"..businessPhone='03625';
  print(employee);

  // var em1 =Employee(id: 'id1');
  // em1.email='a1@gmail.com';
  // em1.employer='hr2';
  // print(em1);
}
sendEmail({String toAddress='dat', String? subject}) => '$toAddress $subject';
