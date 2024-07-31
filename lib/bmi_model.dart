// bmi_model.dart

enum BMICategory {
  underweight,
  normal,
  overweight,
}

class BMICategoryDetails {
  final String description;
  final String color;

  BMICategoryDetails(this.description, this.color);
}

class Person {
  double weight; // in kilograms
  double height; // in meters
  String gender;

  Person(this.weight, this.height, this.gender);

  // Method to calculate BMI
  double calculateBMI() {
    return weight / (height * height);
  }

  // Method to get BMI category
  BMICategoryDetails getBMICategory() {
    double bmi = calculateBMI();
    if (bmi < 18.5) {
      return BMICategoryDetails("You are underweight", "red");
    } else if (bmi < 24.9) {
      return BMICategoryDetails("Your weight is normal", "green");
    } else {
      return BMICategoryDetails("You are overweight", "red");
    }
  }
}
