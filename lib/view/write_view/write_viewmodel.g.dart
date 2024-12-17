// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$writeViewmodelHash() => r'f3638b6ba5d92d473812fe9337f8c1e86287b9ee';

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

abstract class _$WriteViewmodel
    extends BuildlessAutoDisposeAsyncNotifier<Post?> {
  late final String? postId;

  FutureOr<Post?> build(
    String? postId,
  );
}

/// See also [WriteViewmodel].
@ProviderFor(WriteViewmodel)
const writeViewmodelProvider = WriteViewmodelFamily();

/// See also [WriteViewmodel].
class WriteViewmodelFamily extends Family<AsyncValue<Post?>> {
  /// See also [WriteViewmodel].
  const WriteViewmodelFamily();

  /// See also [WriteViewmodel].
  WriteViewmodelProvider call(
    String? postId,
  ) {
    return WriteViewmodelProvider(
      postId,
    );
  }

  @override
  WriteViewmodelProvider getProviderOverride(
    covariant WriteViewmodelProvider provider,
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
  String? get name => r'writeViewmodelProvider';
}

/// See also [WriteViewmodel].
class WriteViewmodelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WriteViewmodel, Post?> {
  /// See also [WriteViewmodel].
  WriteViewmodelProvider(
    String? postId,
  ) : this._internal(
          () => WriteViewmodel()..postId = postId,
          from: writeViewmodelProvider,
          name: r'writeViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writeViewmodelHash,
          dependencies: WriteViewmodelFamily._dependencies,
          allTransitiveDependencies:
              WriteViewmodelFamily._allTransitiveDependencies,
          postId: postId,
        );

  WriteViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String? postId;

  @override
  FutureOr<Post?> runNotifierBuild(
    covariant WriteViewmodel notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(WriteViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: WriteViewmodelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WriteViewmodel, Post?>
      createElement() {
    return _WriteViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WriteViewmodelProvider && other.postId == postId;
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
mixin WriteViewmodelRef on AutoDisposeAsyncNotifierProviderRef<Post?> {
  /// The parameter `postId` of this provider.
  String? get postId;
}

class _WriteViewmodelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WriteViewmodel, Post?>
    with WriteViewmodelRef {
  _WriteViewmodelProviderElement(super.provider);

  @override
  String? get postId => (origin as WriteViewmodelProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
