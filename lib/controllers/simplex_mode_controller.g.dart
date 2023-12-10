// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simplex_mode_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculateSizeHash() => r'cc3b4c462250c55d4219093e11f6d54394ca4be9';

/// See also [calculateSize].
@ProviderFor(calculateSize)
final calculateSizeProvider = AutoDisposeProvider<Point<int>>.internal(
  calculateSize,
  name: r'calculateSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculateSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalculateSizeRef = AutoDisposeProviderRef<Point<int>>;
String _$toTabularFormHash() => r'c9296280be18ab4ca144238373d013544606051e';

/// See also [toTabularForm].
@ProviderFor(toTabularForm)
final toTabularFormProvider = AutoDisposeProvider<List<List<double>>>.internal(
  toTabularForm,
  name: r'toTabularFormProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$toTabularFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ToTabularFormRef = AutoDisposeProviderRef<List<List<double>>>;
String _$findPivotCoordinatesHash() =>
    r'838cb09bab18004aec2c0a3ab01abd240aa40082';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [findPivotCoordinates].
@ProviderFor(findPivotCoordinates)
const findPivotCoordinatesProvider = FindPivotCoordinatesFamily();

/// See also [findPivotCoordinates].
class FindPivotCoordinatesFamily extends Family<Point<int>> {
  /// See also [findPivotCoordinates].
  const FindPivotCoordinatesFamily();

  /// See also [findPivotCoordinates].
  FindPivotCoordinatesProvider call(
    List<List<double>> tableu,
  ) {
    return FindPivotCoordinatesProvider(
      tableu,
    );
  }

  @override
  FindPivotCoordinatesProvider getProviderOverride(
    covariant FindPivotCoordinatesProvider provider,
  ) {
    return call(
      provider.tableu,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findPivotCoordinatesProvider';
}

/// See also [findPivotCoordinates].
class FindPivotCoordinatesProvider extends AutoDisposeProvider<Point<int>> {
  /// See also [findPivotCoordinates].
  FindPivotCoordinatesProvider(
    List<List<double>> tableu,
  ) : this._internal(
          (ref) => findPivotCoordinates(
            ref as FindPivotCoordinatesRef,
            tableu,
          ),
          from: findPivotCoordinatesProvider,
          name: r'findPivotCoordinatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findPivotCoordinatesHash,
          dependencies: FindPivotCoordinatesFamily._dependencies,
          allTransitiveDependencies:
              FindPivotCoordinatesFamily._allTransitiveDependencies,
          tableu: tableu,
        );

  FindPivotCoordinatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableu,
  }) : super.internal();

  final List<List<double>> tableu;

  @override
  Override overrideWith(
    Point<int> Function(FindPivotCoordinatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindPivotCoordinatesProvider._internal(
        (ref) => create(ref as FindPivotCoordinatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableu: tableu,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Point<int>> createElement() {
    return _FindPivotCoordinatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindPivotCoordinatesProvider && other.tableu == tableu;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableu.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindPivotCoordinatesRef on AutoDisposeProviderRef<Point<int>> {
  /// The parameter `tableu` of this provider.
  List<List<double>> get tableu;
}

class _FindPivotCoordinatesProviderElement
    extends AutoDisposeProviderElement<Point<int>>
    with FindPivotCoordinatesRef {
  _FindPivotCoordinatesProviderElement(super.provider);

  @override
  List<List<double>> get tableu =>
      (origin as FindPivotCoordinatesProvider).tableu;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
