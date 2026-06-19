import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_language_app/router/safe_back_scope.dart';

export 'package:learning_language_app/router/safe_back_scope.dart' show canSafelyPop;

extension SafeGoRouterNavigation on BuildContext {
  /// Pops when the stack allows it; otherwise navigates to [fallback].
  void popOrGo(String fallback, {Object? result}) {
    if (canSafelyPop(this)) {
      pop(result);
    } else {
      go(fallback);
    }
  }
}
