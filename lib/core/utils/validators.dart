class Validators {

  // Validate Name (Only characters, min 3 chars, required)

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    if (value.length < 3) {
      return "Must be at least 3 characters";
    }
    final regex = RegExp(r"^[a-zA-Z\s]+$");
    if (!regex.hasMatch(value)) {
      return "Only alphabets are allowed";
    }
    return null;
  }

  // Validate Email (Standard email format)
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  // Validate Password (At least 1 letter, 1 number, 1 special char)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Must be at least 6 characters";
    }
    final regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$");
    if (!regex.hasMatch(value)) {
      return "Must include letter, number, and special character";
    }
    return null;
  }

  // Validate Confirm Password (Match with Password)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

  // Validate Mobile Number (Only digits, 10 digits required)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    final regex = RegExp(r"^\d{10}$");
    if (!regex.hasMatch(value)) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  // Validate Profile Photo (Must be selected)
  static String? validateProfilePhoto(String? filePath) {
    if (filePath == null || filePath.isEmpty) {
      return "Profile photo is required";
    }
    return null;
  }
}
