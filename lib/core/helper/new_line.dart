String addNewlines(String text, int chunkSize) {
  List<String> chunks = [];
  int startIndex = 0;
  int endIndex = chunkSize;
  while (startIndex < text.length) {
    if (endIndex >= text.length) {
      chunks.add(text.substring(startIndex));
      break;
    }
    int spaceIndex = text.lastIndexOf(' ', endIndex);
    if (spaceIndex >= startIndex) {
      chunks.add(text.substring(startIndex, spaceIndex));
      startIndex = spaceIndex + 1;
      endIndex = startIndex + chunkSize;
    } else {
      chunks.add(text.substring(startIndex, endIndex));
      startIndex = endIndex;
      endIndex = startIndex + chunkSize;
    }
  }
  return chunks.join('\n');
}
