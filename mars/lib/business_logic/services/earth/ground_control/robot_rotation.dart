String robotRotation(
  bool rightRotation,
  String robotOrientation,
) {
  String newOrientation = '';
  switch (robotOrientation) {
    case 'N':
      {
        newOrientation = rightRotation ? 'E' : 'W';
      }
      break;

    case 'S':
      {
        newOrientation = rightRotation ? 'W' : 'E';
      }
      break;

    case 'W':
      {
        newOrientation = rightRotation ? 'N' : 'S';
      }
      break;

    case 'E':
      {
        newOrientation = rightRotation ? 'S' : 'N';
      }
      break;
  }
  return newOrientation;
}
