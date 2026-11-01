class Leap {
  // Put your code here
  bool leapYear(int year) {
    // this works too
    // if (year % 100 == 0) {
    //   if (year % 400 == 0) return true;
    // } else if (year % 4 == 0) {
    //   return true;
    // }

    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
}
