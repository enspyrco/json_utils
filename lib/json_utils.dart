/// Provides typedefs for apps using JSON data.
/// This helps to avoid type conflicts between packages that depend on other
/// packages defining the same type.
library json_utils;

typedef JsonMap = Map<String, dynamic>;
typedef JsonList = List<dynamic>;
typedef Json = dynamic;

class MalformedJsonException implements Exception {
  MalformedJsonException(this.message, this.json);

  final String message;
  final JsonMap json;

  @override
  String toString() => message;
}
