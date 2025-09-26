import 'package:g_chords/core/utils/resources.dart';

abstract class BaseUseCase<T, P> {
  Future<Resource<T>> call(P params);
}

class NoParams {
  const NoParams();
}
