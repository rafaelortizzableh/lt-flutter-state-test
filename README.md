# Respuestas al Challenge de Flutter

## Ejercicio 1

### Pregunta

> Se requiere realizar la arquitectura de una aplicación del tipo red social, los usuarios podrán enviar fotos a su perfil, ver otros perfiles, realizar videos... Propón las librerías (Preferiblemente Dart, se pueden mencionar librerías de Kotlin o Swift) y qué organización de código utilizaras para cumplir los principios SOLID y conseguir un código limpio - no utilizar más de una página.

### Respuesta

La arquitectura basada en desarrollo por funcionalidad, siendo ésta la unidad principal de desarrollo. Cada funcionalidad se desarrolla en un módulo separado con todo el código relevante. Buscaría una clara separación de responsabilidades con una base de código modularizada. Además procuraría mantener una clara separación de la interfaz de usuario y la lógica de negocio.

En relación a las librerías, dadas las características de la aplicación, utilizaría [image_picker](https://pub.dev/packages/image_picker) (capturar y selecciona imágenes y vídeos), [image_cropper](https://pub.dev/packages/image_cropper) (editar las imágenes seleccionadas), [video_player](https://pub.dev/packages/video_player) (reproducir videos), [permission_handler](https://pub.dev/packages/permission_handler) (solicitar permisos al usuario), [flutter_contacts](https://pub.dev/packages/flutter_contacts) (acceder a los contactos del dispositivo).

Dependiendo del backend, se necesitarían otros paquetes como: [http](https://pub.dev/packages/http) o [dio](https://pub.dev/packages/dio) para peticiones HTTP, [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) para almacenar de forma segura los tokens de autenticación. Es posible que también se necesiten paquetes para manejar la autenticación con proveedores externos como Google y Apple. Para ello se pueden utilizar paquetes como [google_sign_in](https://pub.dev/packages/google_sign_in) y [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple).

Para manejo de estados y dependencias, utilizaría [flutter_riverpod](https://pub.dev/packages/flutter_riverpod). Lo encuentro práctico, conveniente y potente. Aunque dependiendo de las necesidades, también se pueden utilizar soluciones como [bloc](https://pub.dev/packages/bloc) o [mobx](https://pub.dev/packages/mobx) estados y [get_it](https://pub.dev/packages/get_it) para inyección de dependencias. Para un proyecto nuevo, evitaría [provider](https://pub.dev/packages/provider), pues su autor paró su desarrollo y recomienda Riverpod en su lugar.

Para la organización del código, utilizaría una estructura de carpetas como la siguiente:

- core
  - models
  - services
  - utils
  - widgets
- features
  - feature_1
    - models/
      - feature_1_model.dart
    - service/
      - feature_1_service.dart
    - state/
      - feature_1_controller.dart
      - feature_1_state.dart
    - feature_1_repository.dart
    - ui/
      - widgets/
        - feature_1_widget.dart
      - feature_1_screen.dart
    - feature_1_subfeature_1
      - service/
      - etc...
  - feature_2
    - model/
    - etc...

En cuanto a los principios SOLID:
Procuraría crear convenciones para el desarrollo de nuevas funcionalidades, pues considero que, además de elegir una estructura de carpetas que lo facilite, es importante tenerlos presentes a la hora escribir código. Por lo mismo, considero que estas convenciones pueden ayudar a generar código de mayor calidad.

Considero que mantener cada funcionalidad en su propia carpeta, con el código compartido en `core` es conveniente para el principio de responsabilidad única.

Además, procuraría aprovechar las funcionalidades de Dart en cuánto a la implementación y extensión de clases para cumplir con los principios de sustitución de Liskov, "open-close" y de segregación de interfaces. En cuanto a la dependencia de abstracciones, utilizaría interfaces para los servicios y repositorios, de forma que se puedan cambiar las implementaciones sin tener que cambiar el código que las usa.

## Ejercicio 2

### Pregunta

> En este ejercicio puedes descargar el código de este [repositorio​](https://github.com/leadtechcorp/flutter-state-test). Como puedes ver al ejecutarlo tenemos varios widgets montando dos matrioskas. Lo que tenemos que conseguir es que el botón ‘+’ aumente el número que tiene la matrioska inferior. Las condiciones a cumplir son:
>
> 1. Solo puedes cambiar tener 1 nuevo ​StatefulWidget en el proyecto (es decir, convertir un stateless a stateful).
> 2. Puedes añadir tantas variables/constantes, constructores, parámetros/argumentos como necesites.
> 3. Solo puedes añadir una función (si necesitas más justificarlo).
> 4. No puedes crear nuevas clases que hereden de StatefulWidget ni StatelessWidget (lógicamente al cambiar a Stateful si puedes tener la clase asociada).
> 5. NO PUEDES USAR NINGÚN PAQUETE.

## Sobre esta aplicación

Es una aplicación de contador simple que tiene un texto que muestra la cuenta actual y un botón para incrementarlo.

La solución consiste en arreglar el botón para que incremente el contador y actualizar el código para admitir la última versión de Flutter.

### Soluciones

Hay **dos** soluciones propuestas:

- 1. [Rama `solution-1-set-state`](https://github.com/rafaelortizzableh/lt-flutter-state-test/tree/solution-1-set-state): La primera utiliza un widget Stateful para mantener el estado compartido y pasa a los widgets hijos el valor del contador y un callback para actualizar el estado. Como se solicita en las instrucciones del ejercicio, el único widget Stateful es el previamente mencionado. Los cambios se pueden ver en esta PR:
  - [PR #1 - setState](https://github.com/rafaelortizzableh/lt-flutter-state-test/pull/2/files)
- 2. [Rama `solution-2-inherited-model`](https://github.com/rafaelortizzableh/lt-flutter-state-test/tree/solution-2-inherited-model): La segunda utiliza InheritedModel y ValueNotifier para mantener el estado compartido y notificar a los widgets hijos cuando cambia el estado. Hay un "wrapper widget" que crea el InheritedModel y elimina el ValueNotifier a través del método `dispose`, Al tratarse de una aplicación cuya única funcionalidad es ésta, esto no es estrictamente necesario, pero se implementa como medida preventiva para evitar "memory leaks". El "wrapper" encargado de dicho `dispose` es el único widget Stateful, como se solicita en las instrucciones del ejercicio. Los cambios se pueden ver en esta PR:
  - [PR #2 - InheritedModel](https://github.com/rafaelortizzableh/lt-flutter-state-test/pull/1/files)

Ambas soluciones deberían pasar el `widget_test.dart` de la carpeta `test`.

### Cómo ejecutar

- Clonar el repositorio
- Hacer checkout en la rama con la solución que desea ejecutar
- Ejecutar `flutter run` en la raíz del proyecto

# Ejericio 3

### Pregunta

> Considera una matriz de letras como la de la imágen (de tamaño variable), y una lista de palabras (de tamaño variable también). Se pide diseñar un algoritmo que devuelva una lista de palabras que se formar con las letras del tablero, teniendo en cuenta la siguiente restricción:
>
> - Las letras de las palabras deben formar una cadena cada letra debe estar adyacente - ortogonal o diagonalmente - con la siguiente.
> - Cada letra sólo se puede recorrer una vez por palabra.

> Se debe entregar una función en Dart/Swift/Kotlin que siga una cabecera similar a la siguiente (ejemplo en Dart):

```dart
List​<​String​> findWords(​List​<​List​<​String​>> matrix, ​List​<​String​> words);
```

> Parámetros de ejemplo:

```dart
List​<​List​<​String​>> matrix = [
    [​'a'​, ​'e'​, ​'t'​, ​'l'​],
    [​'d'​, ​'a'​, ​'e'​, ​'u'​],
    [​'t'​, ​'e'​, ​'a'​, ​'r'​],
    [​'c'​, ​'h'​, ​'x'​, ​'g'​],
];
```

```dart
List​<​String​> words = [ ​'leadtech'​, ​'notleadtech'​, ​'potato'​, ​'anotherCompany'​,
];​'great'​,
```

> Output:

```dart
[​'leadtech'​, ​'great'​]
```

### Respuesta

```dart
List<String> findWords(List<List<String>> matrix, List<String> words) {
  const cellMoves = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1],
  ];

  final foundWords = <String>[];

  for (final word in words) {
    // Check if the first letter of the word is present in the grid.
    // Skip the word if it is not.
    final isFirstCharPresent = matrix.any((row) => row.contains(word[0]));
    if (!isFirstCharPresent) {
      continue;
    }

    // Check if all the letters of the word are present in the grid.
    // Skip the word if they are not.
    final areAllCharsPresent = word.split('').every((char) {
      return matrix.any((row) => row.contains(char));
    });
    if (!areAllCharsPresent) {
      continue;
    }

    // Skip the word if the word has already been found.
    if (foundWords.contains(word)) {
      continue;
    }

    // Create a visited grid for the current word.
    final visitedGrid = List.generate(
      matrix.length,
      (index) => List.generate(
        matrix[0].length,
        (index) => false,
      ),
    );

    // Loop through the rows of the grid.
    for (var i = 0; i < matrix.length; i++) {
      // Stop searching if the word has already been found.
      if (foundWords.contains(word)) {
        break;
      }

      // Loop through the columns of the current row.
      for (var j = 0; j < matrix[i].length; j++) {
        // Stop searching if the word has already been found.
        if (foundWords.contains(word)) {
          break;
        }

        final shouldAddWord = _dfsWordSearch(
          grid: matrix,
          visitedGrid: visitedGrid,
          row: i,
          col: j,
          word: word,
          currentWordIndex: 0,
          cellMoves: cellMoves,
        );
        if (!shouldAddWord) {
          continue;
        }
        foundWords.add(word);
      }
    }
  }
  return foundWords;
}

/// Depth-first search algorithm to find a word in a grid.
bool _dfsWordSearch({
  required List<List<String>> grid,
  required int row,
  required int col,
  required String word,
  required int currentWordIndex,
  required List<List<int>> cellMoves,
  required List<List<bool>> visitedGrid,
}) {
  // If we have reached the end of the word, return `true`.
  if (currentWordIndex == word.length - 1) {
    return true;
  }

  // Mark the current cell as visited.
  visitedGrid[row][col] = true;

  // Check all the neighboring cells for the next letter in the word.
  for (final move in cellMoves) {
    final nextRow = row + move[0];
    final nextCol = col + move[1];
    final nextWordIndex = currentWordIndex + 1;

    final shouldSearchNeighbor = _shouldSearchNeighborCell(
      grid: grid,
      visitedGrid: visitedGrid,
      nextRow: nextRow,
      nextCol: nextCol,
      word: word,
      nextWordIndex: nextWordIndex,
    );

    if (!shouldSearchNeighbor) {
      continue;
    }

    final shouldAddWord = _dfsWordSearch(
      grid: grid,
      row: nextRow,
      col: nextCol,
      word: word,
      currentWordIndex: nextWordIndex,
      cellMoves: cellMoves,
      visitedGrid: visitedGrid,
    );

    if (shouldAddWord) {
      return true;
    }
  }

  // Mark the current cell as unvisited.
  visitedGrid[row][col] = false;

  // If we haven't found the word yet, return `false`.
  return false;
}

/// Checks if the next cell is a valid cell
/// to search for the next letter in the word.
bool _shouldSearchNeighborCell({
  required List<List<String>> grid,
  required List<List<bool>> visitedGrid,
  required int nextRow,
  required int nextCol,
  required String word,
  required int nextWordIndex,
}) {
  // Check if the next cell is within the bounds of the grid.
  final isNextRowWithinBounds = nextRow >= 0 && nextRow < grid.length;
  final isNextColWithinBounds = nextCol >= 0 && nextCol < grid[0].length;
  final isCellWithinBounds = isNextRowWithinBounds && isNextColWithinBounds;
  if (!isCellWithinBounds) {
    return false;
  }

  // Check if the next cell has already been visited.
  final hasCellBeenVisited = visitedGrid[nextRow][nextCol];
  if (hasCellBeenVisited) {
    return false;
  }

  // Check if the next cell is part of the word.
  final isCellPartOfWord = grid[nextRow][nextCol] == word[nextWordIndex];
  if (!isCellPartOfWord) {
    return false;
  }

  return true;
}

```

### Comentarios

- Se utiliza una implementación de DFS (depth-first search) para buscar las palabras en la matriz.
- Se utiliza una matriz de visitados para evitar recorrer una misma celda más de una vez por palabra.
- Se utiliza una matriz de movimientos para recorrer las celdas adyacentes a la celda actual.
- Se utiliza una función auxiliar para determinar si se debe buscar la siguiente celda. Esto se hace para limpiar el código de la función principal y hacerlo más legible.
- Se utiliza una función auxiliar para determinar si se debe agregar la palabra a la lista de palabras encontradas. Esto se hace para limpiar el código de la función principal y hacerlo más legible.
- La complejidad temporal de la función `findWords` es `O(N * M * L * 8^L)`, donde `N` es el número de filas en la matriz, `M` es el número de columnas en la matriz, y `L` es la longitud máxima de las palabras en la lista de palabras. Esto se debe a que la función realiza una DFS por cada palabra en la lista de palabras, y por cada celda en la matriz, verifica hasta 8 celdas adyacentes. Hay factores que pueden prevenir que la función tenga que recorrer todas las celdas de la matriz, como por ejemplo, que la primera letra de la palabra no esté presente en la matriz, o que todas las letras de la palabra no esté presente en la matriz. Sin embargo, en el peor de los casos, la función tendrá que recorrer todas las celdas de la matriz para cada palabra en la lista de palabras y verificar hasta 8 celdas adyacentes por cada celda en la matriz.
