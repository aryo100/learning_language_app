/// Reads a value from JSON supporting snake_case and camelCase keys.
T? jsonField<T>(Map<String, dynamic> json, String snake, String camel) {
  if (json.containsKey(snake)) return json[snake] as T?;
  if (json.containsKey(camel)) return json[camel] as T?;
  return null;
}

String jsonString(Map<String, dynamic> json, String snake, String camel,
    {String fallback = ''}) {
  return jsonField<String>(json, snake, camel) ?? fallback;
}

int jsonInt(Map<String, dynamic> json, String snake, String camel,
    {int fallback = 0}) {
  final value = jsonField<dynamic>(json, snake, camel);
  if (value is int) return value;
  if (value is num) return value.toInt();
  return fallback;
}

num jsonNum(Map<String, dynamic> json, String snake, String camel,
    {num fallback = 0}) {
  final value = jsonField<dynamic>(json, snake, camel);
  if (value is num) return value;
  return fallback;
}

bool jsonBool(Map<String, dynamic> json, String snake, String camel,
    {bool fallback = false}) {
  final value = jsonField<dynamic>(json, snake, camel);
  if (value is bool) return value;
  return fallback;
}

List<dynamic> jsonList(Map<String, dynamic> json, String snake, String camel) {
  final value = jsonField<dynamic>(json, snake, camel);
  if (value is List<dynamic>) return value;
  return const [];
}

Map<String, dynamic> jsonMap(Map<String, dynamic> json, String snake,
    String camel) {
  final value = jsonField<dynamic>(json, snake, camel);
  if (value is Map<String, dynamic>) return value;
  if (value is Map) return Map<String, dynamic>.from(value);
  return const {};
}
