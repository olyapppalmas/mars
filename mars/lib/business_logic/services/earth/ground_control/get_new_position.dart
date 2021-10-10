List<int> getNewPosition(
  String robotOrientation,
  int xPosition,
  int yPosition,
  List<String> scentsPositions,
) {
  final List<int> oldPosition = [xPosition, yPosition];
  List<int> newPostion = [xPosition, yPosition];
  switch (robotOrientation) {
    case 'N':
      {
        newPostion = [xPosition, yPosition + 1];
      }
      break;

    case 'S':
      {
        newPostion = [xPosition, yPosition - 1];
      }
      break;

    case 'W':
      {
        newPostion = [xPosition - 1, yPosition];
      }
      break;

    case 'E':
      {
        newPostion = [xPosition + 1, yPosition];
      }
      break;
  }
//🤖: Before moving the robot forward We must check if the new position is
// a scent position, so our robot is safe to go.
  if (scentsPositions
      .contains(newPostion[0].toString() + ' ' + newPostion[1].toString())) {
    //🤖: If the new position is present on the scents database
    // we just keep the robot on the same old position.
    return oldPosition;
  } else {
    //🤖: If the new position seems safe, we can proceed the forward instruction.
    return newPostion;
  }
}
