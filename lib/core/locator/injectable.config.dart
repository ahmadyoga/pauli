// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pauli/core/locator/register_module.dart' as _i228;
import 'package:pauli/core/network/api_client.dart' as _i983;
import 'package:pauli/core/network/network_module.dart' as _i208;
import 'package:pauli/core/services/local_storage_service.dart' as _i561;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i983.ApiClient>(() => _i983.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i561.LocalStorageService>(
        () => _i561.LocalStorageService(gh<_i558.FlutterSecureStorage>()));
    return this;
  }
}

class _$RegisterModule extends _i228.RegisterModule {}

class _$NetworkModule extends _i208.NetworkModule {}
