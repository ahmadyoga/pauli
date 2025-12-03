part of 'pauli_test_bloc.dart';

@freezed
class PauliTestEvent with _$PauliTestEvent {
  const factory PauliTestEvent.startTest(PauliConfig config) = _StartTest;
  const factory PauliTestEvent.submitAnswer(int answer) = _SubmitAnswer;
  const factory PauliTestEvent.tick() = _Tick;
  const factory PauliTestEvent.finishTest() = _FinishTest;
  const factory PauliTestEvent.reset() = _Reset;
  const factory PauliTestEvent.selectCell(int columnIndex, int rowIndex) =
      _SelectCell;
}
