class AppConstants{
  //RegExp
  static RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]*$');
  static RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z]).{6,}$');
  //table name
  static const String baseUrl = 'https://imtihon-4oy-default-rtdb.europe-west1.firebasedatabase.app/';
}
