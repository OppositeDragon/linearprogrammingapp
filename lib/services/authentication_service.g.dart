// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'6b93ae48b61f3835b0baec5ef808e47b6cd7ede5';

/// See also [client].
@ProviderFor(client)
final clientProvider = AutoDisposeProvider<Client>.internal(
  client,
  name: r'clientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRef = AutoDisposeProviderRef<Client>;
String _$accountHash() => r'e7a29861bae65dd74fb9c2dfe8b1b989eb84be6a';

/// See also [account].
@ProviderFor(account)
final accountProvider = AutoDisposeProvider<Account>.internal(
  account,
  name: r'accountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRef = AutoDisposeProviderRef<Account>;
String _$authenticationServiceHash() =>
    r'717bbe5dac89061c1aa3ac13bde161243fed16af';

/// See also [AuthenticationService].
@ProviderFor(AuthenticationService)
final authenticationServiceProvider =
    AutoDisposeNotifierProvider<AuthenticationService, void>.internal(
  AuthenticationService.new,
  name: r'authenticationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationService = AutoDisposeNotifier<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
