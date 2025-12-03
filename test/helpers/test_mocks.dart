import 'package:mockito/annotations.dart';
import 'package:pauli/core/services/local_storage_service.dart';
import 'package:pauli/core/network/api_client.dart';

// This file generates all shared mocks used across tests
// Run: fvm dart run build_runner build to generate the mocks

@GenerateMocks([
  // Core services
  LocalStorageService,
  ApiClient,
])
void main() {
  // This is just for mock generation, no actual implementation needed
}
