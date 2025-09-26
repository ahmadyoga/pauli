import 'package:g_chords/core/utils/result.dart';
import 'package:g_chords/features/todos/domain/entities/todo.dart';
import 'package:g_chords/features/todos/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTodo {
  final TodoRepository _repository;

  UpdateTodo(this._repository);

  Future<Result<Todo>> call(Todo todo) async {
    return await _repository.updateTodo(todo);
  }
}
