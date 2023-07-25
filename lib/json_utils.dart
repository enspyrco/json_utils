/// Provides typedefs for apps using JSON data.
/// This helps to avoid type conflicts between packages that depend on other
/// packages defining the same type.
library json_utils;

// Get a nullable type object, idea taken from https://github.com/dart-lang/sdk/issues/48856
typedef Nullable<T> = T?;

typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;
typedef Json = Object?;

class MalformedJsonException implements Exception {
  MalformedJsonException(this.message, this.json);

  final String message;
  final JsonMap json;

  @override
  String toString() => message;
}

class MalformedJsonMapException implements Exception {
  MalformedJsonMapException(this.expected, this.json);

  final Map<String, Type> expected;
  final JsonMap json;

  @override
  String toString() {
    String s = '';
    for (String key in json.keys) {
      if (json[key].runtimeType != expected[key]) {
        s +=
            '$key should be ${expected[key]} but was ${json[key].runtimeType}\n';
      }
    }

    return s;
  }
}
