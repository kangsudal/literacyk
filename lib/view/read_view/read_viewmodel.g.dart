// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readViewmodelHash() => r'd28e22216cba4320a49f26c7f775d698c024b9cd';

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

abstract class _$ReadViewmodel
    extends BuildlessAutoDisposeAsyncNotifier<Post?> {
  late final String postId;

  FutureOr<Post?> build(
    String postId,
  );
}

/// See also [ReadViewmodel].
@ProviderFor(ReadViewmodel)
const readViewmodelProvider = ReadViewmodelFamily();

/// See also [ReadViewmodel].
class ReadViewmodelFamily extends Family<AsyncValue<Post?>> {
  /// See also [ReadViewmodel].
  const ReadViewmodelFamily();

  /// See also [ReadViewmodel].
  ReadViewmodelProvider call(
    String postId,
  ) {
    return ReadViewmodelProvider(
      postId,
    );
  }

  @override
  ReadViewmodelProvider getProviderOverride(
    covariant ReadViewmodelProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'readViewmodelProvider';
}

/// See also [ReadViewmodel].
class ReadViewmodelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ReadViewmodel, Post?> {
  /// See also [ReadViewmodel].
  ReadViewmodelProvider(
    String postId,
  ) : this._internal(
          () => ReadViewmodel()..postId = postId,
          from: readViewmodelProvider,
          name: r'readViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readViewmodelHash,
          dependencies: ReadViewmodelFamily._dependencies,
          allTransitiveDependencies:
              ReadViewmodelFamily._allTransitiveDependencies,
          postId: postId,
        );

  ReadViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  FutureOr<Post?> runNotifierBuild(
    covariant ReadViewmodel notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(ReadViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReadViewmodelProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ReadViewmodel, Post?>
      createElement() {
    return _ReadViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadViewmodelProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReadViewmodelRef on AutoDisposeAsyncNotifierProviderRef<Post?> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _ReadViewmodelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ReadViewmodel, Post?>
    with ReadViewmodelRef {
  _ReadViewmodelProviderElement(super.provider);

  @override
  String get postId => (origin as ReadViewmodelProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
