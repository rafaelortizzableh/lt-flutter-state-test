# Rafael Ortiz's Flutter State Test

## This app
This is excercise 2 of the Flutter State Test. It is a simple counter app that has a text displaying the current count and a button to increment the counter. The excercise consists in fixing the button so that it increments the counter and updating the code to support the latest Flutter version.

### Solutions
There are two proposed solutions:
- The first one uses one stateful widget to keep the shared state and passes to the children widgets the value of the count and a callback to update the state. The only stateful widget is the one that keeps the shared state, as requested in the excercise's instructions. You can find this solution in the `solution-1-set-state` branch.
- The second one uses InheritedModel and ValueNotifier to keep the shared state and notify the children widgets when the state changes. There is a wrapper widget that creates the InheritedModel and disposes the ValueNotifier. The wrapper that disposes the ValueNotifier is the only stateful widget, as requested in the excercise's instructions. You can find this solution in the `solution-2-inherited-model` branch.

Both solutions should pass the widget_test in the `test` folder.

### How to run

- Clone the repository
- Checkout the branch with the solution you want to run
- Run `flutter run` in the root of the project