//check Email Format
bool IsEmail(String input) {
  if (input == null || input.isEmpty) return false;
  //Email ReFormat
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

//check the length of string
bool CheckStringLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
