class FileProcessingException implements Exception {
  FileProcessingException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
