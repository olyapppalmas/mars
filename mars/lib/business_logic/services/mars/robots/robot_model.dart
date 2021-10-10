class Robot {
  String type = '';
  String robotName = '';
  bool isLost = false;
  String robotPosition = '';
  String robotOrientation = '';
  int robotIndex = 0;
  Robot(
    this.isLost,
    this.robotIndex,
    this.robotName,
    this.robotOrientation,
    this.robotPosition,
    this.type,
  );
}
