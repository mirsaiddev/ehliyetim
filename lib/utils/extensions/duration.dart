extension MyExtension on Duration {
  String visualize() {
    Duration duration = this;
    int inMinutes = duration.inMinutes.remainder(60);
    int inSeconds = duration.inSeconds.remainder(60);
    String result = '';
    if (inMinutes > 0) {
      result = '${inMinutes}:${inSeconds.toString().padLeft(2, '0')}';
    } else {
      result = '${inSeconds}';
    }
    return result;
  }
}
