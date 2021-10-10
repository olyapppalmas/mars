String readableInstrctionLabel(String instruction) {
  String instructionLabel = 'label';
  switch (instruction) {
    case 'R':
      {
        instructionLabel = 'Right';
      }
      break;

    case 'L':
      {
        instructionLabel = 'Left';
      }
      break;

    case 'F':
      {
        instructionLabel = 'Forward';
      }
      break;

    default:
      {
        instructionLabel = 'label';
      }
      break;
  }

  return instructionLabel;
}

String readableOrientationLabel(String orientation) {
  String orientationLabel = 'label';
  switch (orientation) {
    case 'N':
      {
        orientationLabel = 'North';
      }
      break;

    case 'S':
      {
        orientationLabel = 'South';
      }
      break;

    case 'W':
      {
        orientationLabel = 'West';
      }
      break;
    case 'E':
      {
        orientationLabel = 'East';
      }
      break;

    default:
      {
        orientationLabel = 'label';
      }
      break;
  }

  return orientationLabel;
}

String readablePositionLabel(String position) {
  final List<String> splitPosition = position.split(' ');
  final String xPosition = splitPosition[0];
  final String yPosition = splitPosition[1];
  final String readablePosition = xPosition + ', ' + yPosition;
  return readablePosition;
}
