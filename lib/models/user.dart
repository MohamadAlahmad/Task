class User {
  String? name;
  int? age;
  String? gender;
  String? country;
  String? city;
  int? phone;
  String? email;
  String? password;

  User({this.name, this.age, this.gender, this.country, this.city, this.phone, this.email, this.password});

  static User fromJason(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      country: map['country'],
      city: map['city'],
      phone: map['phone'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toJason() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'country': country,
      'city': city,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

}