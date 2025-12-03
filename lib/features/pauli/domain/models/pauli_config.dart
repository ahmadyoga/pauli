import 'package:freezed_annotation/freezed_annotation.dart';

part 'pauli_config.freezed.dart';

enum DisplayFormat {
  singleProblem,
  columnFormat,
  gridFormat,
}

extension DisplayFormatExtension on DisplayFormat {
  String get label {
    switch (this) {
      case DisplayFormat.singleProblem:
        return 'Soal Tunggal';
      case DisplayFormat.columnFormat:
        return 'Format Kolom';
      case DisplayFormat.gridFormat:
        return 'Format Grid';
    }
  }

  String get description {
    switch (this) {
      case DisplayFormat.singleProblem:
        return 'Satu soal per layar, fokus dan sederhana';
      case DisplayFormat.columnFormat:
        return 'Beberapa kolom angka seperti tes klasik';
      case DisplayFormat.gridFormat:
        return 'Grid angka dengan navigasi bebas';
    }
  }
}

@freezed
sealed class PauliConfig with _$PauliConfig {
  const factory PauliConfig({
    @Default(5) int durationMinutes,
    @Default(DisplayFormat.singleProblem) DisplayFormat displayFormat,
    @Default(8) int columnCount,
    @Default(15) int rowsPerColumn,
  }) = _PauliConfig;
}
