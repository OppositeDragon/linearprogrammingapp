import 'package:linearprogrammingapp/constants/numeric.dart';

const String uploadHelpMessage1 =
    'Se debe proveer de un archivo en formato JSON, donde la cantidad de restricciones concuerda con la cantidad de operadores para formar las (in)equaciones. Además el maximo de variables es $maxVariables y el maximo de restricciones es $maxConstraints.';
const String uploadHelpMessage2 = 'El objeto JSON de ejemplo, produce el resultado que se muestra a continuacion.';
const String uploadDataHelpMessage = '''{
  "objective": "max",
  "objectiveFunction": [180, 90],
  "constraints": [ [6, 8, 48],
                   [1, 0,  6],
                   [0, 1,  4] ],
  "operators": ["equal", "geq", "leq"]
}''';

const String invalidMessage = 'Inválido';
