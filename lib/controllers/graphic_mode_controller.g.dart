// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphic_mode_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getItersectionsOnAxesHash() =>
    r'470bcac0278b582fb1a2a77273c1db4ac1b3aeb0';

/// See also [getItersectionsOnAxes].
@ProviderFor(getItersectionsOnAxes)
final getItersectionsOnAxesProvider =
    AutoDisposeProvider<List<Point<double>>>.internal(
  getItersectionsOnAxes,
  name: r'getItersectionsOnAxesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getItersectionsOnAxesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetItersectionsOnAxesRef = AutoDisposeProviderRef<List<Point<double>>>;
String _$getIntersectionOnAxisHash() =>
    r'e5ca578cc4a8cbe5c301351684040e2c10d41917';

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

/// See also [getIntersectionOnAxis].
@ProviderFor(getIntersectionOnAxis)
const getIntersectionOnAxisProvider = GetIntersectionOnAxisFamily();

/// See also [getIntersectionOnAxis].
class GetIntersectionOnAxisFamily extends Family<NullablePoints> {
  /// See also [getIntersectionOnAxis].
  const GetIntersectionOnAxisFamily();

  /// See also [getIntersectionOnAxis].
  GetIntersectionOnAxisProvider call(
    double x,
    double y,
    double z,
  ) {
    return GetIntersectionOnAxisProvider(
      x,
      y,
      z,
    );
  }

  @override
  GetIntersectionOnAxisProvider getProviderOverride(
    covariant GetIntersectionOnAxisProvider provider,
  ) {
    return call(
      provider.x,
      provider.y,
      provider.z,
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
  String? get name => r'getIntersectionOnAxisProvider';
}

/// See also [getIntersectionOnAxis].
class GetIntersectionOnAxisProvider
    extends AutoDisposeProvider<NullablePoints> {
  /// See also [getIntersectionOnAxis].
  GetIntersectionOnAxisProvider(
    double x,
    double y,
    double z,
  ) : this._internal(
          (ref) => getIntersectionOnAxis(
            ref as GetIntersectionOnAxisRef,
            x,
            y,
            z,
          ),
          from: getIntersectionOnAxisProvider,
          name: r'getIntersectionOnAxisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getIntersectionOnAxisHash,
          dependencies: GetIntersectionOnAxisFamily._dependencies,
          allTransitiveDependencies:
              GetIntersectionOnAxisFamily._allTransitiveDependencies,
          x: x,
          y: y,
          z: z,
        );

  GetIntersectionOnAxisProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.x,
    required this.y,
    required this.z,
  }) : super.internal();

  final double x;
  final double y;
  final double z;

  @override
  Override overrideWith(
    NullablePoints Function(GetIntersectionOnAxisRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetIntersectionOnAxisProvider._internal(
        (ref) => create(ref as GetIntersectionOnAxisRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        x: x,
        y: y,
        z: z,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<NullablePoints> createElement() {
    return _GetIntersectionOnAxisProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetIntersectionOnAxisProvider &&
        other.x == x &&
        other.y == y &&
        other.z == z;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, x.hashCode);
    hash = _SystemHash.combine(hash, y.hashCode);
    hash = _SystemHash.combine(hash, z.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetIntersectionOnAxisRef on AutoDisposeProviderRef<NullablePoints> {
  /// The parameter `x` of this provider.
  double get x;

  /// The parameter `y` of this provider.
  double get y;

  /// The parameter `z` of this provider.
  double get z;
}

class _GetIntersectionOnAxisProviderElement
    extends AutoDisposeProviderElement<NullablePoints>
    with GetIntersectionOnAxisRef {
  _GetIntersectionOnAxisProviderElement(super.provider);

  @override
  double get x => (origin as GetIntersectionOnAxisProvider).x;
  @override
  double get y => (origin as GetIntersectionOnAxisProvider).y;
  @override
  double get z => (origin as GetIntersectionOnAxisProvider).z;
}

String _$getBiggestIntersectionsOnAxesHash() =>
    r'c3a80029600f9ec6f022b495795d0c7411468b99';

/// See also [getBiggestIntersectionsOnAxes].
@ProviderFor(getBiggestIntersectionsOnAxes)
final getBiggestIntersectionsOnAxesProvider =
    AutoDisposeProvider<Point<double>>.internal(
  getBiggestIntersectionsOnAxes,
  name: r'getBiggestIntersectionsOnAxesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getBiggestIntersectionsOnAxesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetBiggestIntersectionsOnAxesRef
    = AutoDisposeProviderRef<Point<double>>;
String _$getLimitsRoundedOnMagnitudeHash() =>
    r'9f40bacf6a3165b268c2c9aa1a1f2b46af1bbd9c';

/// See also [getLimitsRoundedOnMagnitude].
@ProviderFor(getLimitsRoundedOnMagnitude)
final getLimitsRoundedOnMagnitudeProvider =
    AutoDisposeProvider<({double x, double y})>.internal(
  getLimitsRoundedOnMagnitude,
  name: r'getLimitsRoundedOnMagnitudeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getLimitsRoundedOnMagnitudeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLimitsRoundedOnMagnitudeRef
    = AutoDisposeProviderRef<({double x, double y})>;
String _$getIntersectionsOnConstraintsAndLimitsHash() =>
    r'758d4372d7a1e12776a4cf5a37edc2edb1fc06f1';

/// See also [getIntersectionsOnConstraintsAndLimits].
@ProviderFor(getIntersectionsOnConstraintsAndLimits)
final getIntersectionsOnConstraintsAndLimitsProvider =
    AutoDisposeProvider<List<PointPair>>.internal(
  getIntersectionsOnConstraintsAndLimits,
  name: r'getIntersectionsOnConstraintsAndLimitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getIntersectionsOnConstraintsAndLimitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetIntersectionsOnConstraintsAndLimitsRef
    = AutoDisposeProviderRef<List<PointPair>>;
String _$getIntersectionConstraintLimitHash() =>
    r'b1c87318cfaee1baa551495b51d527f9b950ddc5';

/// See also [getIntersectionConstraintLimit].
@ProviderFor(getIntersectionConstraintLimit)
const getIntersectionConstraintLimitProvider =
    GetIntersectionConstraintLimitFamily();

/// See also [getIntersectionConstraintLimit].
class GetIntersectionConstraintLimitFamily extends Family<PointPair> {
  /// See also [getIntersectionConstraintLimit].
  const GetIntersectionConstraintLimitFamily();

  /// See also [getIntersectionConstraintLimit].
  GetIntersectionConstraintLimitProvider call(
    double x,
    double y,
    double z,
  ) {
    return GetIntersectionConstraintLimitProvider(
      x,
      y,
      z,
    );
  }

  @override
  GetIntersectionConstraintLimitProvider getProviderOverride(
    covariant GetIntersectionConstraintLimitProvider provider,
  ) {
    return call(
      provider.x,
      provider.y,
      provider.z,
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
  String? get name => r'getIntersectionConstraintLimitProvider';
}

/// See also [getIntersectionConstraintLimit].
class GetIntersectionConstraintLimitProvider
    extends AutoDisposeProvider<PointPair> {
  /// See also [getIntersectionConstraintLimit].
  GetIntersectionConstraintLimitProvider(
    double x,
    double y,
    double z,
  ) : this._internal(
          (ref) => getIntersectionConstraintLimit(
            ref as GetIntersectionConstraintLimitRef,
            x,
            y,
            z,
          ),
          from: getIntersectionConstraintLimitProvider,
          name: r'getIntersectionConstraintLimitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getIntersectionConstraintLimitHash,
          dependencies: GetIntersectionConstraintLimitFamily._dependencies,
          allTransitiveDependencies:
              GetIntersectionConstraintLimitFamily._allTransitiveDependencies,
          x: x,
          y: y,
          z: z,
        );

  GetIntersectionConstraintLimitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.x,
    required this.y,
    required this.z,
  }) : super.internal();

  final double x;
  final double y;
  final double z;

  @override
  Override overrideWith(
    PointPair Function(GetIntersectionConstraintLimitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetIntersectionConstraintLimitProvider._internal(
        (ref) => create(ref as GetIntersectionConstraintLimitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        x: x,
        y: y,
        z: z,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<PointPair> createElement() {
    return _GetIntersectionConstraintLimitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetIntersectionConstraintLimitProvider &&
        other.x == x &&
        other.y == y &&
        other.z == z;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, x.hashCode);
    hash = _SystemHash.combine(hash, y.hashCode);
    hash = _SystemHash.combine(hash, z.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetIntersectionConstraintLimitRef on AutoDisposeProviderRef<PointPair> {
  /// The parameter `x` of this provider.
  double get x;

  /// The parameter `y` of this provider.
  double get y;

  /// The parameter `z` of this provider.
  double get z;
}

class _GetIntersectionConstraintLimitProviderElement
    extends AutoDisposeProviderElement<PointPair>
    with GetIntersectionConstraintLimitRef {
  _GetIntersectionConstraintLimitProviderElement(super.provider);

  @override
  double get x => (origin as GetIntersectionConstraintLimitProvider).x;
  @override
  double get y => (origin as GetIntersectionConstraintLimitProvider).y;
  @override
  double get z => (origin as GetIntersectionConstraintLimitProvider).z;
}

String _$getIntersectionsBetweenCostraintsHash() =>
    r'e2cd2a65380752359616a7629b33e9322b025dc9';

/// See also [getIntersectionsBetweenCostraints].
@ProviderFor(getIntersectionsBetweenCostraints)
final getIntersectionsBetweenCostraintsProvider =
    AutoDisposeProvider<List<Point<double>>>.internal(
  getIntersectionsBetweenCostraints,
  name: r'getIntersectionsBetweenCostraintsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getIntersectionsBetweenCostraintsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetIntersectionsBetweenCostraintsRef
    = AutoDisposeProviderRef<List<Point<double>>>;
String _$getIntersectionsOnAxesAndConstraintsHash() =>
    r'350c5b285479073c4df7741daa9ea2f3c65f7a8e';

/// See also [getIntersectionsOnAxesAndConstraints].
@ProviderFor(getIntersectionsOnAxesAndConstraints)
final getIntersectionsOnAxesAndConstraintsProvider =
    AutoDisposeProvider<List<Point<double>>>.internal(
  getIntersectionsOnAxesAndConstraints,
  name: r'getIntersectionsOnAxesAndConstraintsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getIntersectionsOnAxesAndConstraintsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetIntersectionsOnAxesAndConstraintsRef
    = AutoDisposeProviderRef<List<Point<double>>>;
String _$getCompliantIntersectionsHash() =>
    r'202290f3277e1655740b75a83b529a65b4dab83b';

/// See also [getCompliantIntersections].
@ProviderFor(getCompliantIntersections)
final getCompliantIntersectionsProvider =
    AutoDisposeProvider<List<Point<double>>>.internal(
  getCompliantIntersections,
  name: r'getCompliantIntersectionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCompliantIntersectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCompliantIntersectionsRef
    = AutoDisposeProviderRef<List<Point<double>>>;
String _$getFeasibleMatrixPointsHash() =>
    r'99e9cbcc5491b3c76552d29b384655201bba76d8';

/// See also [getFeasibleMatrixPoints].
@ProviderFor(getFeasibleMatrixPoints)
final getFeasibleMatrixPointsProvider =
    AutoDisposeProvider<List<List<Point<double>>>>.internal(
  getFeasibleMatrixPoints,
  name: r'getFeasibleMatrixPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFeasibleMatrixPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFeasibleMatrixPointsRef
    = AutoDisposeProviderRef<List<List<Point<double>>>>;
String _$getOptimalAnswerHash() => r'b12006271d36fcd31859cc0dbac67268ae91c93e';

/// See also [getOptimalAnswer].
@ProviderFor(getOptimalAnswer)
final getOptimalAnswerProvider = AutoDisposeProvider<Point<double>>.internal(
  getOptimalAnswer,
  name: r'getOptimalAnswerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOptimalAnswerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOptimalAnswerRef = AutoDisposeProviderRef<Point<double>>;
String _$graphicControllerHash() => r'67c04f7a152226a9771ba27f7398f50504bcddff';

/// See also [GraphicController].
@ProviderFor(GraphicController)
final graphicControllerProvider =
    AutoDisposeNotifierProvider<GraphicController, GraphicDataModel>.internal(
  GraphicController.new,
  name: r'graphicControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphicControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GraphicController = AutoDisposeNotifier<GraphicDataModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
