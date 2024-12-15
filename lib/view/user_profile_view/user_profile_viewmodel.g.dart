// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileViewmodelHash() =>
    r'4ab559d6a0a895dbdf0e82c371b28ddf334e04a4';

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

abstract class _$UserProfileViewmodel
    extends BuildlessAutoDisposeAsyncNotifier<AppUser> {
  late final String uid;

  FutureOr<AppUser> build(
    String uid,
  );
}

/// See also [UserProfileViewmodel].
@ProviderFor(UserProfileViewmodel)
const userProfileViewmodelProvider = UserProfileViewmodelFamily();

/// See also [UserProfileViewmodel].
class UserProfileViewmodelFamily extends Family<AsyncValue<AppUser>> {
  /// See also [UserProfileViewmodel].
  const UserProfileViewmodelFamily();

  /// See also [UserProfileViewmodel].
  UserProfileViewmodelProvider call(
    String uid,
  ) {
    return UserProfileViewmodelProvider(
      uid,
    );
  }

  @override
  UserProfileViewmodelProvider getProviderOverride(
    covariant UserProfileViewmodelProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userProfileViewmodelProvider';
}

/// See also [UserProfileViewmodel].
class UserProfileViewmodelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserProfileViewmodel, AppUser> {
  /// See also [UserProfileViewmodel].
  UserProfileViewmodelProvider(
    String uid,
  ) : this._internal(
          () => UserProfileViewmodel()..uid = uid,
          from: userProfileViewmodelProvider,
          name: r'userProfileViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileViewmodelHash,
          dependencies: UserProfileViewmodelFamily._dependencies,
          allTransitiveDependencies:
              UserProfileViewmodelFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserProfileViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  FutureOr<AppUser> runNotifierBuild(
    covariant UserProfileViewmodel notifier,
  ) {
    return notifier.build(
      uid,
    );
  }

  @override
  Override overrideWith(UserProfileViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProfileViewmodelProvider._internal(
        () => create()..uid = uid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserProfileViewmodel, AppUser>
      createElement() {
    return _UserProfileViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileViewmodelProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProfileViewmodelRef on AutoDisposeAsyncNotifierProviderRef<AppUser> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserProfileViewmodelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserProfileViewmodel,
        AppUser> with UserProfileViewmodelRef {
  _UserProfileViewmodelProviderElement(super.provider);

  @override
  String get uid => (origin as UserProfileViewmodelProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
