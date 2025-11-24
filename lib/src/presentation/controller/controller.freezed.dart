// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthAuthenticated value)? authenticated,
    TResult Function(AuthRequest value)? request,
    TResult Function(AuthPending value)? pending,
    TResult Function(AuthForbidden value)? forbidden,
    TResult Function(AuthConflict value)? conflict,
    TResult Function(AuthFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial() when initial != null:
        return initial(_that);
      case AuthUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case AuthAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthRequest() when request != null:
        return request(_that);
      case AuthPending() when pending != null:
        return pending(_that);
      case AuthForbidden() when forbidden != null:
        return forbidden(_that);
      case AuthConflict() when conflict != null:
        return conflict(_that);
      case AuthFailed() when failed != null:
        return failed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthAuthenticated value) authenticated,
    required TResult Function(AuthRequest value) request,
    required TResult Function(AuthPending value) pending,
    required TResult Function(AuthForbidden value) forbidden,
    required TResult Function(AuthConflict value) conflict,
    required TResult Function(AuthFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial():
        return initial(_that);
      case AuthUnauthenticated():
        return unauthenticated(_that);
      case AuthAuthenticated():
        return authenticated(_that);
      case AuthRequest():
        return request(_that);
      case AuthPending():
        return pending(_that);
      case AuthForbidden():
        return forbidden(_that);
      case AuthConflict():
        return conflict(_that);
      case AuthFailed():
        return failed(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthAuthenticated value)? authenticated,
    TResult? Function(AuthRequest value)? request,
    TResult? Function(AuthPending value)? pending,
    TResult? Function(AuthForbidden value)? forbidden,
    TResult? Function(AuthConflict value)? conflict,
    TResult? Function(AuthFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial() when initial != null:
        return initial(_that);
      case AuthUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case AuthAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthRequest() when request != null:
        return request(_that);
      case AuthPending() when pending != null:
        return pending(_that);
      case AuthForbidden() when forbidden != null:
        return forbidden(_that);
      case AuthConflict() when conflict != null:
        return conflict(_that);
      case AuthFailed() when failed != null:
        return failed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String email)? unauthenticated,
    TResult Function(User user)? authenticated,
    TResult Function()? request,
    TResult Function()? pending,
    TResult Function()? forbidden,
    TResult Function()? conflict,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial() when initial != null:
        return initial();
      case AuthUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that.email);
      case AuthAuthenticated() when authenticated != null:
        return authenticated(_that.user);
      case AuthRequest() when request != null:
        return request();
      case AuthPending() when pending != null:
        return pending();
      case AuthForbidden() when forbidden != null:
        return forbidden();
      case AuthConflict() when conflict != null:
        return conflict();
      case AuthFailed() when failed != null:
        return failed();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String email) unauthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function() request,
    required TResult Function() pending,
    required TResult Function() forbidden,
    required TResult Function() conflict,
    required TResult Function() failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial():
        return initial();
      case AuthUnauthenticated():
        return unauthenticated(_that.email);
      case AuthAuthenticated():
        return authenticated(_that.user);
      case AuthRequest():
        return request();
      case AuthPending():
        return pending();
      case AuthForbidden():
        return forbidden();
      case AuthConflict():
        return conflict();
      case AuthFailed():
        return failed();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String email)? unauthenticated,
    TResult? Function(User user)? authenticated,
    TResult? Function()? request,
    TResult? Function()? pending,
    TResult? Function()? forbidden,
    TResult? Function()? conflict,
    TResult? Function()? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitial() when initial != null:
        return initial();
      case AuthUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that.email);
      case AuthAuthenticated() when authenticated != null:
        return authenticated(_that.user);
      case AuthRequest() when request != null:
        return request();
      case AuthPending() when pending != null:
        return pending();
      case AuthForbidden() when forbidden != null:
        return forbidden();
      case AuthConflict() when conflict != null:
        return conflict();
      case AuthFailed() when failed != null:
        return failed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class AuthInitial with DiagnosticableTreeMixin implements AuthState {
  const AuthInitial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class AuthUnauthenticated with DiagnosticableTreeMixin implements AuthState {
  const AuthUnauthenticated({this.email = ''});

  @JsonKey()
  final String email;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith =>
      _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.unauthenticated'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthUnauthenticated &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.unauthenticated(email: $email)';
  }
}

/// @nodoc
abstract mixin class $AuthUnauthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(
          AuthUnauthenticated value, $Res Function(AuthUnauthenticated) _then) =
      _$AuthUnauthenticatedCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$AuthUnauthenticatedCopyWithImpl<$Res>
    implements $AuthUnauthenticatedCopyWith<$Res> {
  _$AuthUnauthenticatedCopyWithImpl(this._self, this._then);

  final AuthUnauthenticated _self;
  final $Res Function(AuthUnauthenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(AuthUnauthenticated(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AuthAuthenticated with DiagnosticableTreeMixin implements AuthState {
  const AuthAuthenticated({required this.user});

  final User user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith =>
      _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthAuthenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authenticated(user: $user)';
  }
}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(
          AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) =
      _$AuthAuthenticatedCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(AuthAuthenticated(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class AuthRequest with DiagnosticableTreeMixin implements AuthState {
  const AuthRequest();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.request'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.request()';
  }
}

/// @nodoc

class AuthPending with DiagnosticableTreeMixin implements AuthState {
  const AuthPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.pending()';
  }
}

/// @nodoc

class AuthForbidden with DiagnosticableTreeMixin implements AuthState {
  const AuthForbidden();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.forbidden'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthForbidden);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.forbidden()';
  }
}

/// @nodoc

class AuthConflict with DiagnosticableTreeMixin implements AuthState {
  const AuthConflict();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.conflict'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthConflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.conflict()';
  }
}

/// @nodoc

class AuthFailed with DiagnosticableTreeMixin implements AuthState {
  const AuthFailed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.failed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.failed()';
  }
}

/// @nodoc
mixin _$CalendarState implements DiagnosticableTreeMixin {
  List<Schedule> get items;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      _$CalendarStateCopyWithImpl<CalendarState>(
          this as CalendarState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CalendarState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarState &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarState(items: $items)';
  }
}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) _then) =
      _$CalendarStateCopyWithImpl;
  @useResult
  $Res call({List<Schedule> items});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CalendarState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CalendarState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CalendarState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Schedule> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarState() when $default != null:
        return $default(_that.items);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Schedule> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarState():
        return $default(_that.items);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Schedule> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarState() when $default != null:
        return $default(_that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CalendarState with DiagnosticableTreeMixin implements CalendarState {
  _CalendarState({required final List<Schedule> items}) : _items = items;

  final List<Schedule> _items;
  @override
  List<Schedule> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CalendarState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarState &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarState(items: $items)';
  }
}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) _then) =
      __$CalendarStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Schedule> items});
}

/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(_CalendarState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// @nodoc
mixin _$DateSelectionState implements DiagnosticableTreeMixin {
  DateTime get start;
  DateTime get end;

  /// Create a copy of DateSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DateSelectionStateCopyWith<DateSelectionState> get copyWith =>
      _$DateSelectionStateCopyWithImpl<DateSelectionState>(
          this as DateSelectionState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DateSelectionState'))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DateSelectionState &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DateSelectionState(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $DateSelectionStateCopyWith<$Res> {
  factory $DateSelectionStateCopyWith(
          DateSelectionState value, $Res Function(DateSelectionState) _then) =
      _$DateSelectionStateCopyWithImpl;
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class _$DateSelectionStateCopyWithImpl<$Res>
    implements $DateSelectionStateCopyWith<$Res> {
  _$DateSelectionStateCopyWithImpl(this._self, this._then);

  final DateSelectionState _self;
  final $Res Function(DateSelectionState) _then;

  /// Create a copy of DateSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [DateSelectionState].
extension DateSelectionStatePatterns on DateSelectionState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DateSelectionState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DateSelectionState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DateSelectionState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime start, DateTime end)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState() when $default != null:
        return $default(_that.start, _that.end);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime start, DateTime end) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState():
        return $default(_that.start, _that.end);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(DateTime start, DateTime end)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateSelectionState() when $default != null:
        return $default(_that.start, _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DateSelectionState
    with DiagnosticableTreeMixin
    implements DateSelectionState {
  _DateSelectionState({required this.start, required this.end});

  @override
  final DateTime start;
  @override
  final DateTime end;

  /// Create a copy of DateSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DateSelectionStateCopyWith<_DateSelectionState> get copyWith =>
      __$DateSelectionStateCopyWithImpl<_DateSelectionState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DateSelectionState'))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateSelectionState &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DateSelectionState(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$DateSelectionStateCopyWith<$Res>
    implements $DateSelectionStateCopyWith<$Res> {
  factory _$DateSelectionStateCopyWith(
          _DateSelectionState value, $Res Function(_DateSelectionState) _then) =
      __$DateSelectionStateCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$DateSelectionStateCopyWithImpl<$Res>
    implements _$DateSelectionStateCopyWith<$Res> {
  __$DateSelectionStateCopyWithImpl(this._self, this._then);

  final _DateSelectionState _self;
  final $Res Function(_DateSelectionState) _then;

  /// Create a copy of DateSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_DateSelectionState(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$LatestUpdateState implements DiagnosticableTreeMixin {
  String? get orderBy;
  String? get orderDirection;
  List<LatestIssue> get items;

  /// Create a copy of LatestUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LatestUpdateStateCopyWith<LatestUpdateState> get copyWith =>
      _$LatestUpdateStateCopyWithImpl<LatestUpdateState>(
          this as LatestUpdateState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LatestUpdateState'))
      ..add(DiagnosticsProperty('orderBy', orderBy))
      ..add(DiagnosticsProperty('orderDirection', orderDirection))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LatestUpdateState &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.orderDirection, orderDirection) ||
                other.orderDirection == orderDirection) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderBy, orderDirection,
      const DeepCollectionEquality().hash(items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LatestUpdateState(orderBy: $orderBy, orderDirection: $orderDirection, items: $items)';
  }
}

/// @nodoc
abstract mixin class $LatestUpdateStateCopyWith<$Res> {
  factory $LatestUpdateStateCopyWith(
          LatestUpdateState value, $Res Function(LatestUpdateState) _then) =
      _$LatestUpdateStateCopyWithImpl;
  @useResult
  $Res call({String? orderBy, String? orderDirection, List<LatestIssue> items});
}

/// @nodoc
class _$LatestUpdateStateCopyWithImpl<$Res>
    implements $LatestUpdateStateCopyWith<$Res> {
  _$LatestUpdateStateCopyWithImpl(this._self, this._then);

  final LatestUpdateState _self;
  final $Res Function(LatestUpdateState) _then;

  /// Create a copy of LatestUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderBy = freezed,
    Object? orderDirection = freezed,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      orderBy: freezed == orderBy
          ? _self.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String?,
      orderDirection: freezed == orderDirection
          ? _self.orderDirection
          : orderDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LatestIssue>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LatestUpdateState].
extension LatestUpdateStatePatterns on LatestUpdateState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LatestUpdateState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LatestUpdateState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LatestUpdateState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? orderBy, String? orderDirection, List<LatestIssue> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState() when $default != null:
        return $default(_that.orderBy, _that.orderDirection, _that.items);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? orderBy, String? orderDirection, List<LatestIssue> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState():
        return $default(_that.orderBy, _that.orderDirection, _that.items);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? orderBy, String? orderDirection, List<LatestIssue> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestUpdateState() when $default != null:
        return $default(_that.orderBy, _that.orderDirection, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LatestUpdateState
    with DiagnosticableTreeMixin
    implements LatestUpdateState {
  _LatestUpdateState(
      {this.orderBy = 'updatedAt',
      this.orderDirection = 'DESC',
      final List<LatestIssue> items = const []})
      : _items = items;

  @override
  @JsonKey()
  final String? orderBy;
  @override
  @JsonKey()
  final String? orderDirection;
  final List<LatestIssue> _items;
  @override
  @JsonKey()
  List<LatestIssue> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of LatestUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LatestUpdateStateCopyWith<_LatestUpdateState> get copyWith =>
      __$LatestUpdateStateCopyWithImpl<_LatestUpdateState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LatestUpdateState'))
      ..add(DiagnosticsProperty('orderBy', orderBy))
      ..add(DiagnosticsProperty('orderDirection', orderDirection))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LatestUpdateState &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.orderDirection, orderDirection) ||
                other.orderDirection == orderDirection) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderBy, orderDirection,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LatestUpdateState(orderBy: $orderBy, orderDirection: $orderDirection, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$LatestUpdateStateCopyWith<$Res>
    implements $LatestUpdateStateCopyWith<$Res> {
  factory _$LatestUpdateStateCopyWith(
          _LatestUpdateState value, $Res Function(_LatestUpdateState) _then) =
      __$LatestUpdateStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? orderBy, String? orderDirection, List<LatestIssue> items});
}

/// @nodoc
class __$LatestUpdateStateCopyWithImpl<$Res>
    implements _$LatestUpdateStateCopyWith<$Res> {
  __$LatestUpdateStateCopyWithImpl(this._self, this._then);

  final _LatestUpdateState _self;
  final $Res Function(_LatestUpdateState) _then;

  /// Create a copy of LatestUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderBy = freezed,
    Object? orderDirection = freezed,
    Object? items = null,
  }) {
    return _then(_LatestUpdateState(
      orderBy: freezed == orderBy
          ? _self.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as String?,
      orderDirection: freezed == orderDirection
          ? _self.orderDirection
          : orderDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LatestIssue>,
    ));
  }
}

/// @nodoc
mixin _$ProjectStatsState implements DiagnosticableTreeMixin {
  List<ProjectStats> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of ProjectStatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectStatsStateCopyWith<ProjectStatsState> get copyWith =>
      _$ProjectStatsStateCopyWithImpl<ProjectStatsState>(
          this as ProjectStatsState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectStatsState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectStatsState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectStatsState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $ProjectStatsStateCopyWith<$Res> {
  factory $ProjectStatsStateCopyWith(
          ProjectStatsState value, $Res Function(ProjectStatsState) _then) =
      _$ProjectStatsStateCopyWithImpl;
  @useResult
  $Res call({List<ProjectStats> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$ProjectStatsStateCopyWithImpl<$Res>
    implements $ProjectStatsStateCopyWith<$Res> {
  _$ProjectStatsStateCopyWithImpl(this._self, this._then);

  final ProjectStatsState _self;
  final $Res Function(ProjectStatsState) _then;

  /// Create a copy of ProjectStatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectStats>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectStatsState].
extension ProjectStatsStatePatterns on ProjectStatsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectStatsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectStatsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectStatsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ProjectStats> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ProjectStats> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState():
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ProjectStats> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStatsState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectStatsState
    with DiagnosticableTreeMixin
    implements ProjectStatsState {
  _ProjectStatsState(
      {final List<ProjectStats> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<ProjectStats> _items;
  @override
  @JsonKey()
  List<ProjectStats> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool hasReachEnd;

  /// Create a copy of ProjectStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectStatsStateCopyWith<_ProjectStatsState> get copyWith =>
      __$ProjectStatsStateCopyWithImpl<_ProjectStatsState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectStatsState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectStatsState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectStatsState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$ProjectStatsStateCopyWith<$Res>
    implements $ProjectStatsStateCopyWith<$Res> {
  factory _$ProjectStatsStateCopyWith(
          _ProjectStatsState value, $Res Function(_ProjectStatsState) _then) =
      __$ProjectStatsStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ProjectStats> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$ProjectStatsStateCopyWithImpl<$Res>
    implements _$ProjectStatsStateCopyWith<$Res> {
  __$ProjectStatsStateCopyWithImpl(this._self, this._then);

  final _ProjectStatsState _self;
  final $Res Function(_ProjectStatsState) _then;

  /// Create a copy of ProjectStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_ProjectStatsState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectStats>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SummaryState implements DiagnosticableTreeMixin {
  ProjectSummary get summary;

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SummaryStateCopyWith<SummaryState> get copyWith =>
      _$SummaryStateCopyWithImpl<SummaryState>(
          this as SummaryState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SummaryState'))
      ..add(DiagnosticsProperty('summary', summary));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SummaryState &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryState(summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $SummaryStateCopyWith<$Res> {
  factory $SummaryStateCopyWith(
          SummaryState value, $Res Function(SummaryState) _then) =
      _$SummaryStateCopyWithImpl;
  @useResult
  $Res call({ProjectSummary summary});

  $ProjectSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$SummaryStateCopyWithImpl<$Res> implements $SummaryStateCopyWith<$Res> {
  _$SummaryStateCopyWithImpl(this._self, this._then);

  final SummaryState _self;
  final $Res Function(SummaryState) _then;

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ProjectSummary,
    ));
  }

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectSummaryCopyWith<$Res> get summary {
    return $ProjectSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SummaryState].
extension SummaryStatePatterns on SummaryState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SummaryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SummaryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SummaryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ProjectSummary summary)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryState() when $default != null:
        return $default(_that.summary);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ProjectSummary summary) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryState():
        return $default(_that.summary);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ProjectSummary summary)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryState() when $default != null:
        return $default(_that.summary);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SummaryState with DiagnosticableTreeMixin implements SummaryState {
  _SummaryState({required this.summary});

  @override
  final ProjectSummary summary;

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SummaryStateCopyWith<_SummaryState> get copyWith =>
      __$SummaryStateCopyWithImpl<_SummaryState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SummaryState'))
      ..add(DiagnosticsProperty('summary', summary));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SummaryState &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SummaryState(summary: $summary)';
  }
}

/// @nodoc
abstract mixin class _$SummaryStateCopyWith<$Res>
    implements $SummaryStateCopyWith<$Res> {
  factory _$SummaryStateCopyWith(
          _SummaryState value, $Res Function(_SummaryState) _then) =
      __$SummaryStateCopyWithImpl;
  @override
  @useResult
  $Res call({ProjectSummary summary});

  @override
  $ProjectSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$SummaryStateCopyWithImpl<$Res>
    implements _$SummaryStateCopyWith<$Res> {
  __$SummaryStateCopyWithImpl(this._self, this._then);

  final _SummaryState _self;
  final $Res Function(_SummaryState) _then;

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
  }) {
    return _then(_SummaryState(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ProjectSummary,
    ));
  }

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectSummaryCopyWith<$Res> get summary {
    return $ProjectSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// @nodoc
mixin _$WorldMapState implements DiagnosticableTreeMixin {
  List<ClientCount> get items;

  /// Create a copy of WorldMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorldMapStateCopyWith<WorldMapState> get copyWith =>
      _$WorldMapStateCopyWithImpl<WorldMapState>(
          this as WorldMapState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WorldMapState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorldMapState &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorldMapState(items: $items)';
  }
}

/// @nodoc
abstract mixin class $WorldMapStateCopyWith<$Res> {
  factory $WorldMapStateCopyWith(
          WorldMapState value, $Res Function(WorldMapState) _then) =
      _$WorldMapStateCopyWithImpl;
  @useResult
  $Res call({List<ClientCount> items});
}

/// @nodoc
class _$WorldMapStateCopyWithImpl<$Res>
    implements $WorldMapStateCopyWith<$Res> {
  _$WorldMapStateCopyWithImpl(this._self, this._then);

  final WorldMapState _self;
  final $Res Function(WorldMapState) _then;

  /// Create a copy of WorldMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClientCount>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorldMapState].
extension WorldMapStatePatterns on WorldMapState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WorldMapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorldMapState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WorldMapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorldMapState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WorldMapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorldMapState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ClientCount> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorldMapState() when $default != null:
        return $default(_that.items);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ClientCount> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorldMapState():
        return $default(_that.items);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ClientCount> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorldMapState() when $default != null:
        return $default(_that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorldMapState with DiagnosticableTreeMixin implements WorldMapState {
  _WorldMapState({required final List<ClientCount> items}) : _items = items;

  final List<ClientCount> _items;
  @override
  List<ClientCount> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of WorldMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorldMapStateCopyWith<_WorldMapState> get copyWith =>
      __$WorldMapStateCopyWithImpl<_WorldMapState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WorldMapState'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorldMapState &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorldMapState(items: $items)';
  }
}

/// @nodoc
abstract mixin class _$WorldMapStateCopyWith<$Res>
    implements $WorldMapStateCopyWith<$Res> {
  factory _$WorldMapStateCopyWith(
          _WorldMapState value, $Res Function(_WorldMapState) _then) =
      __$WorldMapStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ClientCount> items});
}

/// @nodoc
class __$WorldMapStateCopyWithImpl<$Res>
    implements _$WorldMapStateCopyWith<$Res> {
  __$WorldMapStateCopyWithImpl(this._self, this._then);

  final _WorldMapState _self;
  final $Res Function(_WorldMapState) _then;

  /// Create a copy of WorldMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(_WorldMapState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClientCount>,
    ));
  }
}

/// @nodoc
mixin _$DownloadState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DownloadState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState()';
  }
}

/// @nodoc
class $DownloadStateCopyWith<$Res> {
  $DownloadStateCopyWith(DownloadState _, $Res Function(DownloadState) __);
}

/// Adds pattern-matching-related methods to [DownloadState].
extension DownloadStatePatterns on DownloadState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadPending value)? pending,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle(_that);
      case DownloadPending() when pending != null:
        return pending(_that);
      case DownloadSuccess() when success != null:
        return success(_that);
      case DownloadFailed() when failed != null:
        return failed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle():
        return idle(_that);
      case DownloadPending():
        return pending(_that);
      case DownloadSuccess():
        return success(_that);
      case DownloadFailed():
        return failed(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadPending value)? pending,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle(_that);
      case DownloadPending() when pending != null:
        return pending(_that);
      case DownloadSuccess() when success != null:
        return success(_that);
      case DownloadFailed() when failed != null:
        return failed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function()? success,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle();
      case DownloadPending() when pending != null:
        return pending();
      case DownloadSuccess() when success != null:
        return success();
      case DownloadFailed() when failed != null:
        return failed();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function() success,
    required TResult Function() failed,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle():
        return idle();
      case DownloadPending():
        return pending();
      case DownloadSuccess():
        return success();
      case DownloadFailed():
        return failed();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function()? success,
    TResult? Function()? failed,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle();
      case DownloadPending() when pending != null:
        return pending();
      case DownloadSuccess() when success != null:
        return success();
      case DownloadFailed() when failed != null:
        return failed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DownloadIdle with DiagnosticableTreeMixin implements DownloadState {
  DownloadIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DownloadState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState.idle()';
  }
}

/// @nodoc

class DownloadPending with DiagnosticableTreeMixin implements DownloadState {
  DownloadPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DownloadState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState.pending()';
  }
}

/// @nodoc

class DownloadSuccess with DiagnosticableTreeMixin implements DownloadState {
  DownloadSuccess();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DownloadState.success'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState.success()';
  }
}

/// @nodoc

class DownloadFailed with DiagnosticableTreeMixin implements DownloadState {
  DownloadFailed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'DownloadState.failed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState.failed()';
  }
}

/// @nodoc
mixin _$ErrorState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ErrorState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState()';
  }
}

/// @nodoc
class $ErrorStateCopyWith<$Res> {
  $ErrorStateCopyWith(ErrorState _, $Res Function(ErrorState) __);
}

/// Adds pattern-matching-related methods to [ErrorState].
extension ErrorStatePatterns on ErrorState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorInitial value)? initial,
    TResult Function(ErrorBadRequest value)? badRequest,
    TResult Function(ErrorUnauthorized value)? unauthorized,
    TResult Function(ErrorForbidden value)? forbidden,
    TResult Function(ErrorNotFound value)? notFound,
    TResult Function(ErrorConflict value)? conflict,
    TResult Function(ErrorNotDefined value)? notDefined,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial() when initial != null:
        return initial(_that);
      case ErrorBadRequest() when badRequest != null:
        return badRequest(_that);
      case ErrorUnauthorized() when unauthorized != null:
        return unauthorized(_that);
      case ErrorForbidden() when forbidden != null:
        return forbidden(_that);
      case ErrorNotFound() when notFound != null:
        return notFound(_that);
      case ErrorConflict() when conflict != null:
        return conflict(_that);
      case ErrorNotDefined() when notDefined != null:
        return notDefined(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorInitial value) initial,
    required TResult Function(ErrorBadRequest value) badRequest,
    required TResult Function(ErrorUnauthorized value) unauthorized,
    required TResult Function(ErrorForbidden value) forbidden,
    required TResult Function(ErrorNotFound value) notFound,
    required TResult Function(ErrorConflict value) conflict,
    required TResult Function(ErrorNotDefined value) notDefined,
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial():
        return initial(_that);
      case ErrorBadRequest():
        return badRequest(_that);
      case ErrorUnauthorized():
        return unauthorized(_that);
      case ErrorForbidden():
        return forbidden(_that);
      case ErrorNotFound():
        return notFound(_that);
      case ErrorConflict():
        return conflict(_that);
      case ErrorNotDefined():
        return notDefined(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorInitial value)? initial,
    TResult? Function(ErrorBadRequest value)? badRequest,
    TResult? Function(ErrorUnauthorized value)? unauthorized,
    TResult? Function(ErrorForbidden value)? forbidden,
    TResult? Function(ErrorNotFound value)? notFound,
    TResult? Function(ErrorConflict value)? conflict,
    TResult? Function(ErrorNotDefined value)? notDefined,
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial() when initial != null:
        return initial(_that);
      case ErrorBadRequest() when badRequest != null:
        return badRequest(_that);
      case ErrorUnauthorized() when unauthorized != null:
        return unauthorized(_that);
      case ErrorForbidden() when forbidden != null:
        return forbidden(_that);
      case ErrorNotFound() when notFound != null:
        return notFound(_that);
      case ErrorConflict() when conflict != null:
        return conflict(_that);
      case ErrorNotDefined() when notDefined != null:
        return notDefined(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? forbidden,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? notDefined,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial() when initial != null:
        return initial();
      case ErrorBadRequest() when badRequest != null:
        return badRequest(_that.message);
      case ErrorUnauthorized() when unauthorized != null:
        return unauthorized(_that.message);
      case ErrorForbidden() when forbidden != null:
        return forbidden(_that.message);
      case ErrorNotFound() when notFound != null:
        return notFound(_that.message);
      case ErrorConflict() when conflict != null:
        return conflict(_that.message);
      case ErrorNotDefined() when notDefined != null:
        return notDefined(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) forbidden,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) notDefined,
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial():
        return initial();
      case ErrorBadRequest():
        return badRequest(_that.message);
      case ErrorUnauthorized():
        return unauthorized(_that.message);
      case ErrorForbidden():
        return forbidden(_that.message);
      case ErrorNotFound():
        return notFound(_that.message);
      case ErrorConflict():
        return conflict(_that.message);
      case ErrorNotDefined():
        return notDefined(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? forbidden,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? notDefined,
  }) {
    final _that = this;
    switch (_that) {
      case ErrorInitial() when initial != null:
        return initial();
      case ErrorBadRequest() when badRequest != null:
        return badRequest(_that.message);
      case ErrorUnauthorized() when unauthorized != null:
        return unauthorized(_that.message);
      case ErrorForbidden() when forbidden != null:
        return forbidden(_that.message);
      case ErrorNotFound() when notFound != null:
        return notFound(_that.message);
      case ErrorConflict() when conflict != null:
        return conflict(_that.message);
      case ErrorNotDefined() when notDefined != null:
        return notDefined(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ErrorInitial with DiagnosticableTreeMixin implements ErrorState {
  const ErrorInitial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ErrorState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.initial()';
  }
}

/// @nodoc

class ErrorBadRequest with DiagnosticableTreeMixin implements ErrorState {
  const ErrorBadRequest({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorBadRequestCopyWith<ErrorBadRequest> get copyWith =>
      _$ErrorBadRequestCopyWithImpl<ErrorBadRequest>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.badRequest'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorBadRequest &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.badRequest(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorBadRequestCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorBadRequestCopyWith(
          ErrorBadRequest value, $Res Function(ErrorBadRequest) _then) =
      _$ErrorBadRequestCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorBadRequestCopyWithImpl<$Res>
    implements $ErrorBadRequestCopyWith<$Res> {
  _$ErrorBadRequestCopyWithImpl(this._self, this._then);

  final ErrorBadRequest _self;
  final $Res Function(ErrorBadRequest) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorBadRequest(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorUnauthorized with DiagnosticableTreeMixin implements ErrorState {
  const ErrorUnauthorized({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorUnauthorizedCopyWith<ErrorUnauthorized> get copyWith =>
      _$ErrorUnauthorizedCopyWithImpl<ErrorUnauthorized>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.unauthorized'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorUnauthorized &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.unauthorized(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorUnauthorizedCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorUnauthorizedCopyWith(
          ErrorUnauthorized value, $Res Function(ErrorUnauthorized) _then) =
      _$ErrorUnauthorizedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorUnauthorizedCopyWithImpl<$Res>
    implements $ErrorUnauthorizedCopyWith<$Res> {
  _$ErrorUnauthorizedCopyWithImpl(this._self, this._then);

  final ErrorUnauthorized _self;
  final $Res Function(ErrorUnauthorized) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorUnauthorized(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorForbidden with DiagnosticableTreeMixin implements ErrorState {
  const ErrorForbidden({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorForbiddenCopyWith<ErrorForbidden> get copyWith =>
      _$ErrorForbiddenCopyWithImpl<ErrorForbidden>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.forbidden'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorForbidden &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.forbidden(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorForbiddenCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorForbiddenCopyWith(
          ErrorForbidden value, $Res Function(ErrorForbidden) _then) =
      _$ErrorForbiddenCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorForbiddenCopyWithImpl<$Res>
    implements $ErrorForbiddenCopyWith<$Res> {
  _$ErrorForbiddenCopyWithImpl(this._self, this._then);

  final ErrorForbidden _self;
  final $Res Function(ErrorForbidden) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorForbidden(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorNotFound with DiagnosticableTreeMixin implements ErrorState {
  const ErrorNotFound({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorNotFoundCopyWith<ErrorNotFound> get copyWith =>
      _$ErrorNotFoundCopyWithImpl<ErrorNotFound>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.notFound'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorNotFound &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.notFound(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorNotFoundCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorNotFoundCopyWith(
          ErrorNotFound value, $Res Function(ErrorNotFound) _then) =
      _$ErrorNotFoundCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorNotFoundCopyWithImpl<$Res>
    implements $ErrorNotFoundCopyWith<$Res> {
  _$ErrorNotFoundCopyWithImpl(this._self, this._then);

  final ErrorNotFound _self;
  final $Res Function(ErrorNotFound) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorNotFound(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorConflict with DiagnosticableTreeMixin implements ErrorState {
  const ErrorConflict({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorConflictCopyWith<ErrorConflict> get copyWith =>
      _$ErrorConflictCopyWithImpl<ErrorConflict>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.conflict'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorConflict &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.conflict(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorConflictCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorConflictCopyWith(
          ErrorConflict value, $Res Function(ErrorConflict) _then) =
      _$ErrorConflictCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorConflictCopyWithImpl<$Res>
    implements $ErrorConflictCopyWith<$Res> {
  _$ErrorConflictCopyWithImpl(this._self, this._then);

  final ErrorConflict _self;
  final $Res Function(ErrorConflict) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorConflict(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorNotDefined with DiagnosticableTreeMixin implements ErrorState {
  const ErrorNotDefined({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorNotDefinedCopyWith<ErrorNotDefined> get copyWith =>
      _$ErrorNotDefinedCopyWithImpl<ErrorNotDefined>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState.notDefined'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorNotDefined &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState.notDefined(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorNotDefinedCopyWith<$Res>
    implements $ErrorStateCopyWith<$Res> {
  factory $ErrorNotDefinedCopyWith(
          ErrorNotDefined value, $Res Function(ErrorNotDefined) _then) =
      _$ErrorNotDefinedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorNotDefinedCopyWithImpl<$Res>
    implements $ErrorNotDefinedCopyWith<$Res> {
  _$ErrorNotDefinedCopyWithImpl(this._self, this._then);

  final ErrorNotDefined _self;
  final $Res Function(ErrorNotDefined) _then;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorNotDefined(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$IssueDetailState implements DiagnosticableTreeMixin {
  Issue get issue;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueDetailStateCopyWith<IssueDetailState> get copyWith =>
      _$IssueDetailStateCopyWithImpl<IssueDetailState>(
          this as IssueDetailState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueDetailState'))
      ..add(DiagnosticsProperty('issue', issue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueDetailState &&
            (identical(other.issue, issue) || other.issue == issue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issue);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueDetailState(issue: $issue)';
  }
}

/// @nodoc
abstract mixin class $IssueDetailStateCopyWith<$Res> {
  factory $IssueDetailStateCopyWith(
          IssueDetailState value, $Res Function(IssueDetailState) _then) =
      _$IssueDetailStateCopyWithImpl;
  @useResult
  $Res call({Issue issue});

  $IssueCopyWith<$Res> get issue;
}

/// @nodoc
class _$IssueDetailStateCopyWithImpl<$Res>
    implements $IssueDetailStateCopyWith<$Res> {
  _$IssueDetailStateCopyWithImpl(this._self, this._then);

  final IssueDetailState _self;
  final $Res Function(IssueDetailState) _then;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issue = null,
  }) {
    return _then(_self.copyWith(
      issue: null == issue
          ? _self.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as Issue,
    ));
  }

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCopyWith<$Res> get issue {
    return $IssueCopyWith<$Res>(_self.issue, (value) {
      return _then(_self.copyWith(issue: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IssueDetailState].
extension IssueDetailStatePatterns on IssueDetailState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IssueDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IssueDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IssueDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Issue issue)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState() when $default != null:
        return $default(_that.issue);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Issue issue) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState():
        return $default(_that.issue);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Issue issue)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueDetailState() when $default != null:
        return $default(_that.issue);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IssueDetailState
    with DiagnosticableTreeMixin
    implements IssueDetailState {
  _IssueDetailState({required this.issue});

  @override
  final Issue issue;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueDetailStateCopyWith<_IssueDetailState> get copyWith =>
      __$IssueDetailStateCopyWithImpl<_IssueDetailState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueDetailState'))
      ..add(DiagnosticsProperty('issue', issue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueDetailState &&
            (identical(other.issue, issue) || other.issue == issue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issue);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueDetailState(issue: $issue)';
  }
}

/// @nodoc
abstract mixin class _$IssueDetailStateCopyWith<$Res>
    implements $IssueDetailStateCopyWith<$Res> {
  factory _$IssueDetailStateCopyWith(
          _IssueDetailState value, $Res Function(_IssueDetailState) _then) =
      __$IssueDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({Issue issue});

  @override
  $IssueCopyWith<$Res> get issue;
}

/// @nodoc
class __$IssueDetailStateCopyWithImpl<$Res>
    implements _$IssueDetailStateCopyWith<$Res> {
  __$IssueDetailStateCopyWithImpl(this._self, this._then);

  final _IssueDetailState _self;
  final $Res Function(_IssueDetailState) _then;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? issue = null,
  }) {
    return _then(_IssueDetailState(
      issue: null == issue
          ? _self.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as Issue,
    ));
  }

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCopyWith<$Res> get issue {
    return $IssueCopyWith<$Res>(_self.issue, (value) {
      return _then(_self.copyWith(issue: value));
    });
  }
}

/// @nodoc
mixin _$IssueFilterState implements DiagnosticableTreeMixin {
  List<TransactionItemCategory> get transactionCategories;
  List<Currency> get currencies;

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFilterStateCopyWith<IssueFilterState> get copyWith =>
      _$IssueFilterStateCopyWithImpl<IssueFilterState>(
          this as IssueFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFilterState'))
      ..add(DiagnosticsProperty('transactionCategories', transactionCategories))
      ..add(DiagnosticsProperty('currencies', currencies));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFilterState &&
            const DeepCollectionEquality()
                .equals(other.transactionCategories, transactionCategories) &&
            const DeepCollectionEquality()
                .equals(other.currencies, currencies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionCategories),
      const DeepCollectionEquality().hash(currencies));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFilterState(transactionCategories: $transactionCategories, currencies: $currencies)';
  }
}

/// @nodoc
abstract mixin class $IssueFilterStateCopyWith<$Res> {
  factory $IssueFilterStateCopyWith(
          IssueFilterState value, $Res Function(IssueFilterState) _then) =
      _$IssueFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TransactionItemCategory> transactionCategories,
      List<Currency> currencies});
}

/// @nodoc
class _$IssueFilterStateCopyWithImpl<$Res>
    implements $IssueFilterStateCopyWith<$Res> {
  _$IssueFilterStateCopyWithImpl(this._self, this._then);

  final IssueFilterState _self;
  final $Res Function(IssueFilterState) _then;

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionCategories = null,
    Object? currencies = null,
  }) {
    return _then(_self.copyWith(
      transactionCategories: null == transactionCategories
          ? _self.transactionCategories
          : transactionCategories // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemCategory>,
      currencies: null == currencies
          ? _self.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
    ));
  }
}

/// Adds pattern-matching-related methods to [IssueFilterState].
extension IssueFilterStatePatterns on IssueFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IssueFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IssueFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IssueFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<TransactionItemCategory> transactionCategories,
            List<Currency> currencies)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that.transactionCategories, _that.currencies);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<TransactionItemCategory> transactionCategories,
            List<Currency> currencies)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState():
        return $default(_that.transactionCategories, _that.currencies);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<TransactionItemCategory> transactionCategories,
            List<Currency> currencies)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that.transactionCategories, _that.currencies);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IssueFilterState
    with DiagnosticableTreeMixin
    implements IssueFilterState {
  _IssueFilterState(
      {final List<TransactionItemCategory> transactionCategories = const [],
      final List<Currency> currencies = const []})
      : _transactionCategories = transactionCategories,
        _currencies = currencies;

  final List<TransactionItemCategory> _transactionCategories;
  @override
  @JsonKey()
  List<TransactionItemCategory> get transactionCategories {
    if (_transactionCategories is EqualUnmodifiableListView)
      return _transactionCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionCategories);
  }

  final List<Currency> _currencies;
  @override
  @JsonKey()
  List<Currency> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueFilterStateCopyWith<_IssueFilterState> get copyWith =>
      __$IssueFilterStateCopyWithImpl<_IssueFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFilterState'))
      ..add(DiagnosticsProperty('transactionCategories', transactionCategories))
      ..add(DiagnosticsProperty('currencies', currencies));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueFilterState &&
            const DeepCollectionEquality()
                .equals(other._transactionCategories, _transactionCategories) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionCategories),
      const DeepCollectionEquality().hash(_currencies));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFilterState(transactionCategories: $transactionCategories, currencies: $currencies)';
  }
}

/// @nodoc
abstract mixin class _$IssueFilterStateCopyWith<$Res>
    implements $IssueFilterStateCopyWith<$Res> {
  factory _$IssueFilterStateCopyWith(
          _IssueFilterState value, $Res Function(_IssueFilterState) _then) =
      __$IssueFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TransactionItemCategory> transactionCategories,
      List<Currency> currencies});
}

/// @nodoc
class __$IssueFilterStateCopyWithImpl<$Res>
    implements _$IssueFilterStateCopyWith<$Res> {
  __$IssueFilterStateCopyWithImpl(this._self, this._then);

  final _IssueFilterState _self;
  final $Res Function(_IssueFilterState) _then;

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactionCategories = null,
    Object? currencies = null,
  }) {
    return _then(_IssueFilterState(
      transactionCategories: null == transactionCategories
          ? _self._transactionCategories
          : transactionCategories // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemCategory>,
      currencies: null == currencies
          ? _self._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
    ));
  }
}

/// @nodoc
mixin _$IssueFormState implements DiagnosticableTreeMixin {
  String? get content;
  List<IssueAttachment>? get attachments;
  List<XFile>? get files;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormStateCopyWith<IssueFormState> get copyWith =>
      _$IssueFormStateCopyWithImpl<IssueFormState>(
          this as IssueFormState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormState &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality().equals(other.files, files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState(content: $content, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormStateCopyWith<$Res> {
  factory $IssueFormStateCopyWith(
          IssueFormState value, $Res Function(IssueFormState) _then) =
      _$IssueFormStateCopyWithImpl;
  @useResult
  $Res call(
      {String? content,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormStateCopyWithImpl<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  _$IssueFormStateCopyWithImpl(this._self, this._then);

  final IssueFormState _self;
  final $Res Function(IssueFormState) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(_self.copyWith(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IssueFormState].
extension IssueFormStatePatterns on IssueFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IssueFormState value)? $default, {
    TResult Function(IssueFormContract value)? contract,
    TResult Function(IssueFormKickoff value)? kickoff,
    TResult Function(IssueFormApproval value)? approval,
    TResult Function(IssueFormProcurement value)? procurement,
    TResult Function(IssueFormTransaction value)? transaction,
    TResult Function(IssueFormDeclaration value)? declaration,
    TResult Function(IssueFormPayment value)? payment,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState() when $default != null:
        return $default(_that);
      case IssueFormContract() when contract != null:
        return contract(_that);
      case IssueFormKickoff() when kickoff != null:
        return kickoff(_that);
      case IssueFormApproval() when approval != null:
        return approval(_that);
      case IssueFormProcurement() when procurement != null:
        return procurement(_that);
      case IssueFormTransaction() when transaction != null:
        return transaction(_that);
      case IssueFormDeclaration() when declaration != null:
        return declaration(_that);
      case IssueFormPayment() when payment != null:
        return payment(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IssueFormState value) $default, {
    required TResult Function(IssueFormContract value) contract,
    required TResult Function(IssueFormKickoff value) kickoff,
    required TResult Function(IssueFormApproval value) approval,
    required TResult Function(IssueFormProcurement value) procurement,
    required TResult Function(IssueFormTransaction value) transaction,
    required TResult Function(IssueFormDeclaration value) declaration,
    required TResult Function(IssueFormPayment value) payment,
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState():
        return $default(_that);
      case IssueFormContract():
        return contract(_that);
      case IssueFormKickoff():
        return kickoff(_that);
      case IssueFormApproval():
        return approval(_that);
      case IssueFormProcurement():
        return procurement(_that);
      case IssueFormTransaction():
        return transaction(_that);
      case IssueFormDeclaration():
        return declaration(_that);
      case IssueFormPayment():
        return payment(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IssueFormState value)? $default, {
    TResult? Function(IssueFormContract value)? contract,
    TResult? Function(IssueFormKickoff value)? kickoff,
    TResult? Function(IssueFormApproval value)? approval,
    TResult? Function(IssueFormProcurement value)? procurement,
    TResult? Function(IssueFormTransaction value)? transaction,
    TResult? Function(IssueFormDeclaration value)? declaration,
    TResult? Function(IssueFormPayment value)? payment,
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState() when $default != null:
        return $default(_that);
      case IssueFormContract() when contract != null:
        return contract(_that);
      case IssueFormKickoff() when kickoff != null:
        return kickoff(_that);
      case IssueFormApproval() when approval != null:
        return approval(_that);
      case IssueFormProcurement() when procurement != null:
        return procurement(_that);
      case IssueFormTransaction() when transaction != null:
        return transaction(_that);
      case IssueFormDeclaration() when declaration != null:
        return declaration(_that);
      case IssueFormPayment() when payment != null:
        return payment(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        $default, {
    TResult Function(String? content, List<ContractItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        contract,
    TResult Function(String? content, int? kickoffId, DateTime? kickoffDate,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        kickoff,
    TResult Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        approval,
    TResult Function(String? content, List<ProcurementItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        procurement,
    TResult Function(String? content, List<TransactionItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        transaction,
    TResult Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        declaration,
    TResult Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        payment,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState() when $default != null:
        return $default(_that.content, _that.attachments, _that.files);
      case IssueFormContract() when contract != null:
        return contract(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormKickoff() when kickoff != null:
        return kickoff(_that.content, _that.kickoffId, _that.kickoffDate,
            _that.attachments, _that.files);
      case IssueFormApproval() when approval != null:
        return approval(_that.content, _that.attachments, _that.files);
      case IssueFormProcurement() when procurement != null:
        return procurement(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormTransaction() when transaction != null:
        return transaction(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormDeclaration() when declaration != null:
        return declaration(_that.content, _that.attachments, _that.files);
      case IssueFormPayment() when payment != null:
        return payment(_that.content, _that.attachments, _that.files);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)
        $default, {
    required TResult Function(String? content, List<ContractItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)
        contract,
    required TResult Function(
            String? content,
            int? kickoffId,
            DateTime? kickoffDate,
            List<IssueAttachment>? attachments,
            List<XFile>? files)
        kickoff,
    required TResult Function(String? content,
            List<IssueAttachment>? attachments, List<XFile>? files)
        approval,
    required TResult Function(String? content, List<ProcurementItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)
        procurement,
    required TResult Function(String? content, List<TransactionItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)
        transaction,
    required TResult Function(String? content,
            List<IssueAttachment>? attachments, List<XFile>? files)
        declaration,
    required TResult Function(String? content,
            List<IssueAttachment>? attachments, List<XFile>? files)
        payment,
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState():
        return $default(_that.content, _that.attachments, _that.files);
      case IssueFormContract():
        return contract(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormKickoff():
        return kickoff(_that.content, _that.kickoffId, _that.kickoffDate,
            _that.attachments, _that.files);
      case IssueFormApproval():
        return approval(_that.content, _that.attachments, _that.files);
      case IssueFormProcurement():
        return procurement(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormTransaction():
        return transaction(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormDeclaration():
        return declaration(_that.content, _that.attachments, _that.files);
      case IssueFormPayment():
        return payment(_that.content, _that.attachments, _that.files);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        $default, {
    TResult? Function(String? content, List<ContractItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        contract,
    TResult? Function(String? content, int? kickoffId, DateTime? kickoffDate,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        kickoff,
    TResult? Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        approval,
    TResult? Function(String? content, List<ProcurementItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        procurement,
    TResult? Function(String? content, List<TransactionItem>? items,
            List<IssueAttachment>? attachments, List<XFile>? files)?
        transaction,
    TResult? Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        declaration,
    TResult? Function(String? content, List<IssueAttachment>? attachments,
            List<XFile>? files)?
        payment,
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFormState() when $default != null:
        return $default(_that.content, _that.attachments, _that.files);
      case IssueFormContract() when contract != null:
        return contract(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormKickoff() when kickoff != null:
        return kickoff(_that.content, _that.kickoffId, _that.kickoffDate,
            _that.attachments, _that.files);
      case IssueFormApproval() when approval != null:
        return approval(_that.content, _that.attachments, _that.files);
      case IssueFormProcurement() when procurement != null:
        return procurement(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormTransaction() when transaction != null:
        return transaction(
            _that.content, _that.items, _that.attachments, _that.files);
      case IssueFormDeclaration() when declaration != null:
        return declaration(_that.content, _that.attachments, _that.files);
      case IssueFormPayment() when payment != null:
        return payment(_that.content, _that.attachments, _that.files);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IssueFormState with DiagnosticableTreeMixin implements IssueFormState {
  const _IssueFormState(
      {this.content,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueFormStateCopyWith<_IssueFormState> get copyWith =>
      __$IssueFormStateCopyWithImpl<_IssueFormState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueFormState &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState(content: $content, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class _$IssueFormStateCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory _$IssueFormStateCopyWith(
          _IssueFormState value, $Res Function(_IssueFormState) _then) =
      __$IssueFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class __$IssueFormStateCopyWithImpl<$Res>
    implements _$IssueFormStateCopyWith<$Res> {
  __$IssueFormStateCopyWithImpl(this._self, this._then);

  final _IssueFormState _self;
  final $Res Function(_IssueFormState) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(_IssueFormState(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormContract with DiagnosticableTreeMixin implements IssueFormState {
  IssueFormContract(
      {this.content,
      final List<ContractItem>? items,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _items = items,
        _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<ContractItem>? _items;
  List<ContractItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormContractCopyWith<IssueFormContract> get copyWith =>
      _$IssueFormContractCopyWithImpl<IssueFormContract>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.contract'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormContract &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.contract(content: $content, items: $items, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormContractCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormContractCopyWith(
          IssueFormContract value, $Res Function(IssueFormContract) _then) =
      _$IssueFormContractCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<ContractItem>? items,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormContractCopyWithImpl<$Res>
    implements $IssueFormContractCopyWith<$Res> {
  _$IssueFormContractCopyWithImpl(this._self, this._then);

  final IssueFormContract _self;
  final $Res Function(IssueFormContract) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? items = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormContract(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ContractItem>?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormKickoff with DiagnosticableTreeMixin implements IssueFormState {
  IssueFormKickoff(
      {this.content,
      this.kickoffId,
      this.kickoffDate,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final int? kickoffId;
  final DateTime? kickoffDate;
  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormKickoffCopyWith<IssueFormKickoff> get copyWith =>
      _$IssueFormKickoffCopyWithImpl<IssueFormKickoff>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.kickoff'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('kickoffId', kickoffId))
      ..add(DiagnosticsProperty('kickoffDate', kickoffDate))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormKickoff &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.kickoffId, kickoffId) ||
                other.kickoffId == kickoffId) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      kickoffId,
      kickoffDate,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.kickoff(content: $content, kickoffId: $kickoffId, kickoffDate: $kickoffDate, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormKickoffCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormKickoffCopyWith(
          IssueFormKickoff value, $Res Function(IssueFormKickoff) _then) =
      _$IssueFormKickoffCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      int? kickoffId,
      DateTime? kickoffDate,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormKickoffCopyWithImpl<$Res>
    implements $IssueFormKickoffCopyWith<$Res> {
  _$IssueFormKickoffCopyWithImpl(this._self, this._then);

  final IssueFormKickoff _self;
  final $Res Function(IssueFormKickoff) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? kickoffId = freezed,
    Object? kickoffDate = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormKickoff(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      kickoffId: freezed == kickoffId
          ? _self.kickoffId
          : kickoffId // ignore: cast_nullable_to_non_nullable
              as int?,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormApproval with DiagnosticableTreeMixin implements IssueFormState {
  IssueFormApproval(
      {this.content,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormApprovalCopyWith<IssueFormApproval> get copyWith =>
      _$IssueFormApprovalCopyWithImpl<IssueFormApproval>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.approval'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormApproval &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.approval(content: $content, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormApprovalCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormApprovalCopyWith(
          IssueFormApproval value, $Res Function(IssueFormApproval) _then) =
      _$IssueFormApprovalCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormApprovalCopyWithImpl<$Res>
    implements $IssueFormApprovalCopyWith<$Res> {
  _$IssueFormApprovalCopyWithImpl(this._self, this._then);

  final IssueFormApproval _self;
  final $Res Function(IssueFormApproval) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormApproval(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormProcurement
    with DiagnosticableTreeMixin
    implements IssueFormState {
  IssueFormProcurement(
      {this.content,
      final List<ProcurementItem>? items,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _items = items,
        _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<ProcurementItem>? _items;
  List<ProcurementItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormProcurementCopyWith<IssueFormProcurement> get copyWith =>
      _$IssueFormProcurementCopyWithImpl<IssueFormProcurement>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.procurement'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormProcurement &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.procurement(content: $content, items: $items, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormProcurementCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormProcurementCopyWith(IssueFormProcurement value,
          $Res Function(IssueFormProcurement) _then) =
      _$IssueFormProcurementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<ProcurementItem>? items,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormProcurementCopyWithImpl<$Res>
    implements $IssueFormProcurementCopyWith<$Res> {
  _$IssueFormProcurementCopyWithImpl(this._self, this._then);

  final IssueFormProcurement _self;
  final $Res Function(IssueFormProcurement) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? items = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormProcurement(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProcurementItem>?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormTransaction
    with DiagnosticableTreeMixin
    implements IssueFormState {
  IssueFormTransaction(
      {this.content,
      final List<TransactionItem>? items,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _items = items,
        _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<TransactionItem>? _items;
  List<TransactionItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormTransactionCopyWith<IssueFormTransaction> get copyWith =>
      _$IssueFormTransactionCopyWithImpl<IssueFormTransaction>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.transaction'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormTransaction &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.transaction(content: $content, items: $items, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormTransactionCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormTransactionCopyWith(IssueFormTransaction value,
          $Res Function(IssueFormTransaction) _then) =
      _$IssueFormTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<TransactionItem>? items,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormTransactionCopyWithImpl<$Res>
    implements $IssueFormTransactionCopyWith<$Res> {
  _$IssueFormTransactionCopyWithImpl(this._self, this._then);

  final IssueFormTransaction _self;
  final $Res Function(IssueFormTransaction) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? items = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormTransaction(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormDeclaration
    with DiagnosticableTreeMixin
    implements IssueFormState {
  IssueFormDeclaration(
      {this.content,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormDeclarationCopyWith<IssueFormDeclaration> get copyWith =>
      _$IssueFormDeclarationCopyWithImpl<IssueFormDeclaration>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.declaration'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormDeclaration &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.declaration(content: $content, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormDeclarationCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormDeclarationCopyWith(IssueFormDeclaration value,
          $Res Function(IssueFormDeclaration) _then) =
      _$IssueFormDeclarationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormDeclarationCopyWithImpl<$Res>
    implements $IssueFormDeclarationCopyWith<$Res> {
  _$IssueFormDeclarationCopyWithImpl(this._self, this._then);

  final IssueFormDeclaration _self;
  final $Res Function(IssueFormDeclaration) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormDeclaration(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc

class IssueFormPayment with DiagnosticableTreeMixin implements IssueFormState {
  IssueFormPayment(
      {this.content,
      final List<IssueAttachment>? attachments,
      final List<XFile>? files})
      : _attachments = attachments,
        _files = files;

  @override
  final String? content;
  final List<IssueAttachment>? _attachments;
  @override
  List<IssueAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFormPaymentCopyWith<IssueFormPayment> get copyWith =>
      _$IssueFormPaymentCopyWithImpl<IssueFormPayment>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueFormState.payment'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFormPayment &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueFormState.payment(content: $content, attachments: $attachments, files: $files)';
  }
}

/// @nodoc
abstract mixin class $IssueFormPaymentCopyWith<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  factory $IssueFormPaymentCopyWith(
          IssueFormPayment value, $Res Function(IssueFormPayment) _then) =
      _$IssueFormPaymentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? content,
      List<IssueAttachment>? attachments,
      List<XFile>? files});
}

/// @nodoc
class _$IssueFormPaymentCopyWithImpl<$Res>
    implements $IssueFormPaymentCopyWith<$Res> {
  _$IssueFormPaymentCopyWithImpl(this._self, this._then);

  final IssueFormPayment _self;
  final $Res Function(IssueFormPayment) _then;

  /// Create a copy of IssueFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
  }) {
    return _then(IssueFormPayment(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
    ));
  }
}

/// @nodoc
mixin _$IssueListState implements DiagnosticableTreeMixin {
  List<Issue> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueListStateCopyWith<IssueListState> get copyWith =>
      _$IssueListStateCopyWithImpl<IssueListState>(
          this as IssueListState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueListState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $IssueListStateCopyWith<$Res> {
  factory $IssueListStateCopyWith(
          IssueListState value, $Res Function(IssueListState) _then) =
      _$IssueListStateCopyWithImpl;
  @useResult
  $Res call({List<Issue> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$IssueListStateCopyWithImpl<$Res>
    implements $IssueListStateCopyWith<$Res> {
  _$IssueListStateCopyWithImpl(this._self, this._then);

  final IssueListState _self;
  final $Res Function(IssueListState) _then;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [IssueListState].
extension IssueListStatePatterns on IssueListState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IssueListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueListState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IssueListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueListState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IssueListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueListState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Issue> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Issue> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueListState():
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Issue> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IssueListState with DiagnosticableTreeMixin implements IssueListState {
  _IssueListState(
      {final List<Issue> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<Issue> _items;
  @override
  @JsonKey()
  List<Issue> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool hasReachEnd;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueListStateCopyWith<_IssueListState> get copyWith =>
      __$IssueListStateCopyWithImpl<_IssueListState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$IssueListStateCopyWith<$Res>
    implements $IssueListStateCopyWith<$Res> {
  factory _$IssueListStateCopyWith(
          _IssueListState value, $Res Function(_IssueListState) _then) =
      __$IssueListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Issue> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$IssueListStateCopyWithImpl<$Res>
    implements _$IssueListStateCopyWith<$Res> {
  __$IssueListStateCopyWithImpl(this._self, this._then);

  final _IssueListState _self;
  final $Res Function(_IssueListState) _then;

  /// Create a copy of IssueListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_IssueListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$IssueSubmitState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'IssueSubmitState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState()';
  }
}

/// @nodoc
class $IssueSubmitStateCopyWith<$Res> {
  $IssueSubmitStateCopyWith(
      IssueSubmitState _, $Res Function(IssueSubmitState) __);
}

/// Adds pattern-matching-related methods to [IssueSubmitState].
extension IssueSubmitStatePatterns on IssueSubmitState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IssueSubmitIdle value)? idle,
    TResult Function(IssueSubmitPending value)? pending,
    TResult Function(IssueSubmitSuccess value)? success,
    TResult Function(IssueSubmitDeleted value)? deleted,
    TResult Function(IssueSubmitMailed value)? mailed,
    TResult Function(IssueSubmitFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle() when idle != null:
        return idle(_that);
      case IssueSubmitPending() when pending != null:
        return pending(_that);
      case IssueSubmitSuccess() when success != null:
        return success(_that);
      case IssueSubmitDeleted() when deleted != null:
        return deleted(_that);
      case IssueSubmitMailed() when mailed != null:
        return mailed(_that);
      case IssueSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IssueSubmitIdle value) idle,
    required TResult Function(IssueSubmitPending value) pending,
    required TResult Function(IssueSubmitSuccess value) success,
    required TResult Function(IssueSubmitDeleted value) deleted,
    required TResult Function(IssueSubmitMailed value) mailed,
    required TResult Function(IssueSubmitFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle():
        return idle(_that);
      case IssueSubmitPending():
        return pending(_that);
      case IssueSubmitSuccess():
        return success(_that);
      case IssueSubmitDeleted():
        return deleted(_that);
      case IssueSubmitMailed():
        return mailed(_that);
      case IssueSubmitFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IssueSubmitIdle value)? idle,
    TResult? Function(IssueSubmitPending value)? pending,
    TResult? Function(IssueSubmitSuccess value)? success,
    TResult? Function(IssueSubmitDeleted value)? deleted,
    TResult? Function(IssueSubmitMailed value)? mailed,
    TResult? Function(IssueSubmitFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle() when idle != null:
        return idle(_that);
      case IssueSubmitPending() when pending != null:
        return pending(_that);
      case IssueSubmitSuccess() when success != null:
        return success(_that);
      case IssueSubmitDeleted() when deleted != null:
        return deleted(_that);
      case IssueSubmitMailed() when mailed != null:
        return mailed(_that);
      case IssueSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(Issue issue)? success,
    TResult Function()? deleted,
    TResult Function()? mailed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle() when idle != null:
        return idle();
      case IssueSubmitPending() when pending != null:
        return pending();
      case IssueSubmitSuccess() when success != null:
        return success(_that.issue);
      case IssueSubmitDeleted() when deleted != null:
        return deleted();
      case IssueSubmitMailed() when mailed != null:
        return mailed();
      case IssueSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(Issue issue) success,
    required TResult Function() deleted,
    required TResult Function() mailed,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle():
        return idle();
      case IssueSubmitPending():
        return pending();
      case IssueSubmitSuccess():
        return success(_that.issue);
      case IssueSubmitDeleted():
        return deleted();
      case IssueSubmitMailed():
        return mailed();
      case IssueSubmitFailure():
        return failure(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(Issue issue)? success,
    TResult? Function()? deleted,
    TResult? Function()? mailed,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case IssueSubmitIdle() when idle != null:
        return idle();
      case IssueSubmitPending() when pending != null:
        return pending();
      case IssueSubmitSuccess() when success != null:
        return success(_that.issue);
      case IssueSubmitDeleted() when deleted != null:
        return deleted();
      case IssueSubmitMailed() when mailed != null:
        return mailed();
      case IssueSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class IssueSubmitIdle with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'IssueSubmitState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.idle()';
  }
}

/// @nodoc

class IssueSubmitPending
    with DiagnosticableTreeMixin
    implements IssueSubmitState {
  const IssueSubmitPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'IssueSubmitState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.pending()';
  }
}

/// @nodoc

class IssueSubmitSuccess
    with DiagnosticableTreeMixin
    implements IssueSubmitState {
  const IssueSubmitSuccess(this.issue);

  final Issue issue;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueSubmitSuccessCopyWith<IssueSubmitSuccess> get copyWith =>
      _$IssueSubmitSuccessCopyWithImpl<IssueSubmitSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueSubmitState.success'))
      ..add(DiagnosticsProperty('issue', issue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueSubmitSuccess &&
            (identical(other.issue, issue) || other.issue == issue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issue);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.success(issue: $issue)';
  }
}

/// @nodoc
abstract mixin class $IssueSubmitSuccessCopyWith<$Res>
    implements $IssueSubmitStateCopyWith<$Res> {
  factory $IssueSubmitSuccessCopyWith(
          IssueSubmitSuccess value, $Res Function(IssueSubmitSuccess) _then) =
      _$IssueSubmitSuccessCopyWithImpl;
  @useResult
  $Res call({Issue issue});

  $IssueCopyWith<$Res> get issue;
}

/// @nodoc
class _$IssueSubmitSuccessCopyWithImpl<$Res>
    implements $IssueSubmitSuccessCopyWith<$Res> {
  _$IssueSubmitSuccessCopyWithImpl(this._self, this._then);

  final IssueSubmitSuccess _self;
  final $Res Function(IssueSubmitSuccess) _then;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? issue = null,
  }) {
    return _then(IssueSubmitSuccess(
      null == issue
          ? _self.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as Issue,
    ));
  }

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCopyWith<$Res> get issue {
    return $IssueCopyWith<$Res>(_self.issue, (value) {
      return _then(_self.copyWith(issue: value));
    });
  }
}

/// @nodoc

class IssueSubmitDeleted
    with DiagnosticableTreeMixin
    implements IssueSubmitState {
  const IssueSubmitDeleted();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'IssueSubmitState.deleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.deleted()';
  }
}

/// @nodoc

class IssueSubmitMailed
    with DiagnosticableTreeMixin
    implements IssueSubmitState {
  const IssueSubmitMailed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'IssueSubmitState.mailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitMailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.mailed()';
  }
}

/// @nodoc

class IssueSubmitFailure
    with DiagnosticableTreeMixin
    implements IssueSubmitState {
  const IssueSubmitFailure(this.message);

  final String message;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueSubmitFailureCopyWith<IssueSubmitFailure> get copyWith =>
      _$IssueSubmitFailureCopyWithImpl<IssueSubmitFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'IssueSubmitState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IssueSubmitState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $IssueSubmitFailureCopyWith<$Res>
    implements $IssueSubmitStateCopyWith<$Res> {
  factory $IssueSubmitFailureCopyWith(
          IssueSubmitFailure value, $Res Function(IssueSubmitFailure) _then) =
      _$IssueSubmitFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$IssueSubmitFailureCopyWithImpl<$Res>
    implements $IssueSubmitFailureCopyWith<$Res> {
  _$IssueSubmitFailureCopyWithImpl(this._self, this._then);

  final IssueSubmitFailure _self;
  final $Res Function(IssueSubmitFailure) _then;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(IssueSubmitFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LocalState implements DiagnosticableTreeMixin {
  bool get persistLogin;
  List<Keyword> get keywords;

  /// Create a copy of LocalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalStateCopyWith<LocalState> get copyWith =>
      _$LocalStateCopyWithImpl<LocalState>(this as LocalState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalState'))
      ..add(DiagnosticsProperty('persistLogin', persistLogin))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalState &&
            (identical(other.persistLogin, persistLogin) ||
                other.persistLogin == persistLogin) &&
            const DeepCollectionEquality().equals(other.keywords, keywords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, persistLogin, const DeepCollectionEquality().hash(keywords));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalState(persistLogin: $persistLogin, keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $LocalStateCopyWith<$Res> {
  factory $LocalStateCopyWith(
          LocalState value, $Res Function(LocalState) _then) =
      _$LocalStateCopyWithImpl;
  @useResult
  $Res call({bool persistLogin, List<Keyword> keywords});
}

/// @nodoc
class _$LocalStateCopyWithImpl<$Res> implements $LocalStateCopyWith<$Res> {
  _$LocalStateCopyWithImpl(this._self, this._then);

  final LocalState _self;
  final $Res Function(LocalState) _then;

  /// Create a copy of LocalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persistLogin = null,
    Object? keywords = null,
  }) {
    return _then(_self.copyWith(
      persistLogin: null == persistLogin
          ? _self.persistLogin
          : persistLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<Keyword>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocalState].
extension LocalStatePatterns on LocalState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool persistLogin, List<Keyword> keywords)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalState() when $default != null:
        return $default(_that.persistLogin, _that.keywords);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool persistLogin, List<Keyword> keywords) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalState():
        return $default(_that.persistLogin, _that.keywords);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool persistLogin, List<Keyword> keywords)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalState() when $default != null:
        return $default(_that.persistLogin, _that.keywords);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocalState with DiagnosticableTreeMixin implements LocalState {
  _LocalState(
      {required this.persistLogin, final List<Keyword> keywords = const []})
      : _keywords = keywords;

  @override
  final bool persistLogin;
  final List<Keyword> _keywords;
  @override
  @JsonKey()
  List<Keyword> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of LocalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalStateCopyWith<_LocalState> get copyWith =>
      __$LocalStateCopyWithImpl<_LocalState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LocalState'))
      ..add(DiagnosticsProperty('persistLogin', persistLogin))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalState &&
            (identical(other.persistLogin, persistLogin) ||
                other.persistLogin == persistLogin) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @override
  int get hashCode => Object.hash(runtimeType, persistLogin,
      const DeepCollectionEquality().hash(_keywords));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalState(persistLogin: $persistLogin, keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class _$LocalStateCopyWith<$Res>
    implements $LocalStateCopyWith<$Res> {
  factory _$LocalStateCopyWith(
          _LocalState value, $Res Function(_LocalState) _then) =
      __$LocalStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool persistLogin, List<Keyword> keywords});
}

/// @nodoc
class __$LocalStateCopyWithImpl<$Res> implements _$LocalStateCopyWith<$Res> {
  __$LocalStateCopyWithImpl(this._self, this._then);

  final _LocalState _self;
  final $Res Function(_LocalState) _then;

  /// Create a copy of LocalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? persistLogin = null,
    Object? keywords = null,
  }) {
    return _then(_LocalState(
      persistLogin: null == persistLogin
          ? _self.persistLogin
          : persistLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      keywords: null == keywords
          ? _self._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<Keyword>,
    ));
  }
}

/// @nodoc
mixin _$ProjectDetailState implements DiagnosticableTreeMixin {
  Project get project;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectDetailStateCopyWith<ProjectDetailState> get copyWith =>
      _$ProjectDetailStateCopyWithImpl<ProjectDetailState>(
          this as ProjectDetailState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectDetailState'))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectDetailState &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectDetailState(project: $project)';
  }
}

/// @nodoc
abstract mixin class $ProjectDetailStateCopyWith<$Res> {
  factory $ProjectDetailStateCopyWith(
          ProjectDetailState value, $Res Function(ProjectDetailState) _then) =
      _$ProjectDetailStateCopyWithImpl;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailStateCopyWithImpl<$Res>
    implements $ProjectDetailStateCopyWith<$Res> {
  _$ProjectDetailStateCopyWithImpl(this._self, this._then);

  final ProjectDetailState _self;
  final $Res Function(ProjectDetailState) _then;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_self.copyWith(
      project: null == project
          ? _self.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_self.project, (value) {
      return _then(_self.copyWith(project: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProjectDetailState].
extension ProjectDetailStatePatterns on ProjectDetailState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Project project)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that.project);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Project project) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState():
        return $default(_that.project);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Project project)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that.project);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectDetailState
    with DiagnosticableTreeMixin
    implements ProjectDetailState {
  _ProjectDetailState({required this.project});

  @override
  final Project project;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectDetailStateCopyWith<_ProjectDetailState> get copyWith =>
      __$ProjectDetailStateCopyWithImpl<_ProjectDetailState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectDetailState'))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectDetailState &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectDetailState(project: $project)';
  }
}

/// @nodoc
abstract mixin class _$ProjectDetailStateCopyWith<$Res>
    implements $ProjectDetailStateCopyWith<$Res> {
  factory _$ProjectDetailStateCopyWith(
          _ProjectDetailState value, $Res Function(_ProjectDetailState) _then) =
      __$ProjectDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$ProjectDetailStateCopyWithImpl<$Res>
    implements _$ProjectDetailStateCopyWith<$Res> {
  __$ProjectDetailStateCopyWithImpl(this._self, this._then);

  final _ProjectDetailState _self;
  final $Res Function(_ProjectDetailState) _then;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? project = null,
  }) {
    return _then(_ProjectDetailState(
      project: null == project
          ? _self.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_self.project, (value) {
      return _then(_self.copyWith(project: value));
    });
  }
}

/// @nodoc
mixin _$ProjectDetailFilterState implements DiagnosticableTreeMixin {
  String? get view;

  /// Create a copy of ProjectDetailFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectDetailFilterStateCopyWith<ProjectDetailFilterState> get copyWith =>
      _$ProjectDetailFilterStateCopyWithImpl<ProjectDetailFilterState>(
          this as ProjectDetailFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectDetailFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectDetailFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectDetailFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class $ProjectDetailFilterStateCopyWith<$Res> {
  factory $ProjectDetailFilterStateCopyWith(ProjectDetailFilterState value,
          $Res Function(ProjectDetailFilterState) _then) =
      _$ProjectDetailFilterStateCopyWithImpl;
  @useResult
  $Res call({String? view});
}

/// @nodoc
class _$ProjectDetailFilterStateCopyWithImpl<$Res>
    implements $ProjectDetailFilterStateCopyWith<$Res> {
  _$ProjectDetailFilterStateCopyWithImpl(this._self, this._then);

  final ProjectDetailFilterState _self;
  final $Res Function(ProjectDetailFilterState) _then;

  /// Create a copy of ProjectDetailFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_self.copyWith(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectDetailFilterState].
extension ProjectDetailFilterStatePatterns on ProjectDetailFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectDetailFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectDetailFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectDetailFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? view)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? view) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState():
        return $default(_that.view);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? view)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectDetailFilterState
    with DiagnosticableTreeMixin
    implements ProjectDetailFilterState {
  _ProjectDetailFilterState({this.view});

  @override
  final String? view;

  /// Create a copy of ProjectDetailFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectDetailFilterStateCopyWith<_ProjectDetailFilterState> get copyWith =>
      __$ProjectDetailFilterStateCopyWithImpl<_ProjectDetailFilterState>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectDetailFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectDetailFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectDetailFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class _$ProjectDetailFilterStateCopyWith<$Res>
    implements $ProjectDetailFilterStateCopyWith<$Res> {
  factory _$ProjectDetailFilterStateCopyWith(_ProjectDetailFilterState value,
          $Res Function(_ProjectDetailFilterState) _then) =
      __$ProjectDetailFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? view});
}

/// @nodoc
class __$ProjectDetailFilterStateCopyWithImpl<$Res>
    implements _$ProjectDetailFilterStateCopyWith<$Res> {
  __$ProjectDetailFilterStateCopyWithImpl(this._self, this._then);

  final _ProjectDetailFilterState _self;
  final $Res Function(_ProjectDetailFilterState) _then;

  /// Create a copy of ProjectDetailFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_ProjectDetailFilterState(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProjectFilterState implements DiagnosticableTreeMixin {
  String? get view;
  ProjectSort? get sort;
  Order? get order;
  String? get search;
  bool? get bookmark;
  List<int>? get clients;
  List<int>? get categories;
  List<IssueCategory> get categoryItems;
  List<ClientGroup> get clientItems;
  int get maxClientDepth;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectFilterStateCopyWith<ProjectFilterState> get copyWith =>
      _$ProjectFilterStateCopyWithImpl<ProjectFilterState>(
          this as ProjectFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectFilterState'))
      ..add(DiagnosticsProperty('view', view))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('bookmark', bookmark))
      ..add(DiagnosticsProperty('clients', clients))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('categoryItems', categoryItems))
      ..add(DiagnosticsProperty('clientItems', clientItems))
      ..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectFilterState &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryItems, categoryItems) &&
            const DeepCollectionEquality()
                .equals(other.clientItems, clientItems) &&
            (identical(other.maxClientDepth, maxClientDepth) ||
                other.maxClientDepth == maxClientDepth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      view,
      sort,
      order,
      search,
      bookmark,
      const DeepCollectionEquality().hash(clients),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryItems),
      const DeepCollectionEquality().hash(clientItems),
      maxClientDepth);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectFilterState(view: $view, sort: $sort, order: $order, search: $search, bookmark: $bookmark, clients: $clients, categories: $categories, categoryItems: $categoryItems, clientItems: $clientItems, maxClientDepth: $maxClientDepth)';
  }
}

/// @nodoc
abstract mixin class $ProjectFilterStateCopyWith<$Res> {
  factory $ProjectFilterStateCopyWith(
          ProjectFilterState value, $Res Function(ProjectFilterState) _then) =
      _$ProjectFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String? view,
      ProjectSort? sort,
      Order? order,
      String? search,
      bool? bookmark,
      List<int>? clients,
      List<int>? categories,
      List<IssueCategory> categoryItems,
      List<ClientGroup> clientItems,
      int maxClientDepth});
}

/// @nodoc
class _$ProjectFilterStateCopyWithImpl<$Res>
    implements $ProjectFilterStateCopyWith<$Res> {
  _$ProjectFilterStateCopyWithImpl(this._self, this._then);

  final ProjectFilterState _self;
  final $Res Function(ProjectFilterState) _then;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = freezed,
    Object? sort = freezed,
    Object? order = freezed,
    Object? search = freezed,
    Object? bookmark = freezed,
    Object? clients = freezed,
    Object? categories = freezed,
    Object? categoryItems = null,
    Object? clientItems = null,
    Object? maxClientDepth = null,
  }) {
    return _then(_self.copyWith(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as ProjectSort?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: freezed == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool?,
      clients: freezed == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categoryItems: null == categoryItems
          ? _self.categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<IssueCategory>,
      clientItems: null == clientItems
          ? _self.clientItems
          : clientItems // ignore: cast_nullable_to_non_nullable
              as List<ClientGroup>,
      maxClientDepth: null == maxClientDepth
          ? _self.maxClientDepth
          : maxClientDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectFilterState].
extension ProjectFilterStatePatterns on ProjectFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? view,
            ProjectSort? sort,
            Order? order,
            String? search,
            bool? bookmark,
            List<int>? clients,
            List<int>? categories,
            List<IssueCategory> categoryItems,
            List<ClientGroup> clientItems,
            int maxClientDepth)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState() when $default != null:
        return $default(
            _that.view,
            _that.sort,
            _that.order,
            _that.search,
            _that.bookmark,
            _that.clients,
            _that.categories,
            _that.categoryItems,
            _that.clientItems,
            _that.maxClientDepth);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? view,
            ProjectSort? sort,
            Order? order,
            String? search,
            bool? bookmark,
            List<int>? clients,
            List<int>? categories,
            List<IssueCategory> categoryItems,
            List<ClientGroup> clientItems,
            int maxClientDepth)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState():
        return $default(
            _that.view,
            _that.sort,
            _that.order,
            _that.search,
            _that.bookmark,
            _that.clients,
            _that.categories,
            _that.categoryItems,
            _that.clientItems,
            _that.maxClientDepth);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? view,
            ProjectSort? sort,
            Order? order,
            String? search,
            bool? bookmark,
            List<int>? clients,
            List<int>? categories,
            List<IssueCategory> categoryItems,
            List<ClientGroup> clientItems,
            int maxClientDepth)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFilterState() when $default != null:
        return $default(
            _that.view,
            _that.sort,
            _that.order,
            _that.search,
            _that.bookmark,
            _that.clients,
            _that.categories,
            _that.categoryItems,
            _that.clientItems,
            _that.maxClientDepth);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectFilterState
    with DiagnosticableTreeMixin
    implements ProjectFilterState {
  const _ProjectFilterState(
      {this.view,
      this.sort,
      this.order,
      this.search,
      this.bookmark,
      final List<int>? clients,
      final List<int>? categories,
      final List<IssueCategory> categoryItems = const [],
      final List<ClientGroup> clientItems = const [],
      this.maxClientDepth = 0})
      : _clients = clients,
        _categories = categories,
        _categoryItems = categoryItems,
        _clientItems = clientItems;

  @override
  final String? view;
  @override
  final ProjectSort? sort;
  @override
  final Order? order;
  @override
  final String? search;
  @override
  final bool? bookmark;
  final List<int>? _clients;
  @override
  List<int>? get clients {
    final value = _clients;
    if (value == null) return null;
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _categories;
  @override
  List<int>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IssueCategory> _categoryItems;
  @override
  @JsonKey()
  List<IssueCategory> get categoryItems {
    if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryItems);
  }

  final List<ClientGroup> _clientItems;
  @override
  @JsonKey()
  List<ClientGroup> get clientItems {
    if (_clientItems is EqualUnmodifiableListView) return _clientItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clientItems);
  }

  @override
  @JsonKey()
  final int maxClientDepth;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectFilterStateCopyWith<_ProjectFilterState> get copyWith =>
      __$ProjectFilterStateCopyWithImpl<_ProjectFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectFilterState'))
      ..add(DiagnosticsProperty('view', view))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('bookmark', bookmark))
      ..add(DiagnosticsProperty('clients', clients))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('categoryItems', categoryItems))
      ..add(DiagnosticsProperty('clientItems', clientItems))
      ..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectFilterState &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._categoryItems, _categoryItems) &&
            const DeepCollectionEquality()
                .equals(other._clientItems, _clientItems) &&
            (identical(other.maxClientDepth, maxClientDepth) ||
                other.maxClientDepth == maxClientDepth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      view,
      sort,
      order,
      search,
      bookmark,
      const DeepCollectionEquality().hash(_clients),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_categoryItems),
      const DeepCollectionEquality().hash(_clientItems),
      maxClientDepth);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectFilterState(view: $view, sort: $sort, order: $order, search: $search, bookmark: $bookmark, clients: $clients, categories: $categories, categoryItems: $categoryItems, clientItems: $clientItems, maxClientDepth: $maxClientDepth)';
  }
}

/// @nodoc
abstract mixin class _$ProjectFilterStateCopyWith<$Res>
    implements $ProjectFilterStateCopyWith<$Res> {
  factory _$ProjectFilterStateCopyWith(
          _ProjectFilterState value, $Res Function(_ProjectFilterState) _then) =
      __$ProjectFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? view,
      ProjectSort? sort,
      Order? order,
      String? search,
      bool? bookmark,
      List<int>? clients,
      List<int>? categories,
      List<IssueCategory> categoryItems,
      List<ClientGroup> clientItems,
      int maxClientDepth});
}

/// @nodoc
class __$ProjectFilterStateCopyWithImpl<$Res>
    implements _$ProjectFilterStateCopyWith<$Res> {
  __$ProjectFilterStateCopyWithImpl(this._self, this._then);

  final _ProjectFilterState _self;
  final $Res Function(_ProjectFilterState) _then;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? view = freezed,
    Object? sort = freezed,
    Object? order = freezed,
    Object? search = freezed,
    Object? bookmark = freezed,
    Object? clients = freezed,
    Object? categories = freezed,
    Object? categoryItems = null,
    Object? clientItems = null,
    Object? maxClientDepth = null,
  }) {
    return _then(_ProjectFilterState(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as ProjectSort?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: freezed == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool?,
      clients: freezed == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categoryItems: null == categoryItems
          ? _self._categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<IssueCategory>,
      clientItems: null == clientItems
          ? _self._clientItems
          : clientItems // ignore: cast_nullable_to_non_nullable
              as List<ClientGroup>,
      maxClientDepth: null == maxClientDepth
          ? _self.maxClientDepth
          : maxClientDepth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ProjectFormState implements DiagnosticableTreeMixin {
  List<Client>? get clients;
  String? get code;
  String? get name;
  User? get manager;
  bool get isPreexecuted;
  bool get isContracted;
  bool get isAllClientSelected;
  bool get isDirty;

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectFormStateCopyWith<ProjectFormState> get copyWith =>
      _$ProjectFormStateCopyWithImpl<ProjectFormState>(
          this as ProjectFormState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectFormState'))
      ..add(DiagnosticsProperty('clients', clients))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('manager', manager))
      ..add(DiagnosticsProperty('isPreexecuted', isPreexecuted))
      ..add(DiagnosticsProperty('isContracted', isContracted))
      ..add(DiagnosticsProperty('isAllClientSelected', isAllClientSelected))
      ..add(DiagnosticsProperty('isDirty', isDirty));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectFormState &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isContracted, isContracted) ||
                other.isContracted == isContracted) &&
            (identical(other.isAllClientSelected, isAllClientSelected) ||
                other.isAllClientSelected == isAllClientSelected) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clients),
      code,
      name,
      manager,
      isPreexecuted,
      isContracted,
      isAllClientSelected,
      isDirty);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectFormState(clients: $clients, code: $code, name: $name, manager: $manager, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isAllClientSelected: $isAllClientSelected, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class $ProjectFormStateCopyWith<$Res> {
  factory $ProjectFormStateCopyWith(
          ProjectFormState value, $Res Function(ProjectFormState) _then) =
      _$ProjectFormStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Client>? clients,
      String? code,
      String? name,
      User? manager,
      bool isPreexecuted,
      bool isContracted,
      bool isAllClientSelected,
      bool isDirty});

  $UserCopyWith<$Res>? get manager;
}

/// @nodoc
class _$ProjectFormStateCopyWithImpl<$Res>
    implements $ProjectFormStateCopyWith<$Res> {
  _$ProjectFormStateCopyWithImpl(this._self, this._then);

  final ProjectFormState _self;
  final $Res Function(ProjectFormState) _then;

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? manager = freezed,
    Object? isPreexecuted = null,
    Object? isContracted = null,
    Object? isAllClientSelected = null,
    Object? isDirty = null,
  }) {
    return _then(_self.copyWith(
      clients: freezed == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as User?,
      isPreexecuted: null == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isContracted: null == isContracted
          ? _self.isContracted
          : isContracted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllClientSelected: null == isAllClientSelected
          ? _self.isAllClientSelected
          : isAllClientSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get manager {
    if (_self.manager == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.manager!, (value) {
      return _then(_self.copyWith(manager: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProjectFormState].
extension ProjectFormStatePatterns on ProjectFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Client>? clients,
            String? code,
            String? name,
            User? manager,
            bool isPreexecuted,
            bool isContracted,
            bool isAllClientSelected,
            bool isDirty)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState() when $default != null:
        return $default(
            _that.clients,
            _that.code,
            _that.name,
            _that.manager,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isAllClientSelected,
            _that.isDirty);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Client>? clients,
            String? code,
            String? name,
            User? manager,
            bool isPreexecuted,
            bool isContracted,
            bool isAllClientSelected,
            bool isDirty)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState():
        return $default(
            _that.clients,
            _that.code,
            _that.name,
            _that.manager,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isAllClientSelected,
            _that.isDirty);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Client>? clients,
            String? code,
            String? name,
            User? manager,
            bool isPreexecuted,
            bool isContracted,
            bool isAllClientSelected,
            bool isDirty)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectFormState() when $default != null:
        return $default(
            _that.clients,
            _that.code,
            _that.name,
            _that.manager,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isAllClientSelected,
            _that.isDirty);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectFormState
    with DiagnosticableTreeMixin
    implements ProjectFormState {
  _ProjectFormState(
      {final List<Client>? clients,
      this.code,
      this.name,
      this.manager,
      this.isPreexecuted = false,
      this.isContracted = false,
      this.isAllClientSelected = false,
      this.isDirty = false})
      : _clients = clients;

  final List<Client>? _clients;
  @override
  List<Client>? get clients {
    final value = _clients;
    if (value == null) return null;
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;
  @override
  final String? name;
  @override
  final User? manager;
  @override
  @JsonKey()
  final bool isPreexecuted;
  @override
  @JsonKey()
  final bool isContracted;
  @override
  @JsonKey()
  final bool isAllClientSelected;
  @override
  @JsonKey()
  final bool isDirty;

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectFormStateCopyWith<_ProjectFormState> get copyWith =>
      __$ProjectFormStateCopyWithImpl<_ProjectFormState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectFormState'))
      ..add(DiagnosticsProperty('clients', clients))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('manager', manager))
      ..add(DiagnosticsProperty('isPreexecuted', isPreexecuted))
      ..add(DiagnosticsProperty('isContracted', isContracted))
      ..add(DiagnosticsProperty('isAllClientSelected', isAllClientSelected))
      ..add(DiagnosticsProperty('isDirty', isDirty));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectFormState &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isContracted, isContracted) ||
                other.isContracted == isContracted) &&
            (identical(other.isAllClientSelected, isAllClientSelected) ||
                other.isAllClientSelected == isAllClientSelected) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clients),
      code,
      name,
      manager,
      isPreexecuted,
      isContracted,
      isAllClientSelected,
      isDirty);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectFormState(clients: $clients, code: $code, name: $name, manager: $manager, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isAllClientSelected: $isAllClientSelected, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class _$ProjectFormStateCopyWith<$Res>
    implements $ProjectFormStateCopyWith<$Res> {
  factory _$ProjectFormStateCopyWith(
          _ProjectFormState value, $Res Function(_ProjectFormState) _then) =
      __$ProjectFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Client>? clients,
      String? code,
      String? name,
      User? manager,
      bool isPreexecuted,
      bool isContracted,
      bool isAllClientSelected,
      bool isDirty});

  @override
  $UserCopyWith<$Res>? get manager;
}

/// @nodoc
class __$ProjectFormStateCopyWithImpl<$Res>
    implements _$ProjectFormStateCopyWith<$Res> {
  __$ProjectFormStateCopyWithImpl(this._self, this._then);

  final _ProjectFormState _self;
  final $Res Function(_ProjectFormState) _then;

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clients = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? manager = freezed,
    Object? isPreexecuted = null,
    Object? isContracted = null,
    Object? isAllClientSelected = null,
    Object? isDirty = null,
  }) {
    return _then(_ProjectFormState(
      clients: freezed == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as User?,
      isPreexecuted: null == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isContracted: null == isContracted
          ? _self.isContracted
          : isContracted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllClientSelected: null == isAllClientSelected
          ? _self.isAllClientSelected
          : isAllClientSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ProjectFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get manager {
    if (_self.manager == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.manager!, (value) {
      return _then(_self.copyWith(manager: value));
    });
  }
}

/// @nodoc
mixin _$ProjectListState implements DiagnosticableTreeMixin {
  List<Project> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of ProjectListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectListStateCopyWith<ProjectListState> get copyWith =>
      _$ProjectListStateCopyWithImpl<ProjectListState>(
          this as ProjectListState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectListState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $ProjectListStateCopyWith<$Res> {
  factory $ProjectListStateCopyWith(
          ProjectListState value, $Res Function(ProjectListState) _then) =
      _$ProjectListStateCopyWithImpl;
  @useResult
  $Res call({List<Project> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$ProjectListStateCopyWithImpl<$Res>
    implements $ProjectListStateCopyWith<$Res> {
  _$ProjectListStateCopyWithImpl(this._self, this._then);

  final ProjectListState _self;
  final $Res Function(ProjectListState) _then;

  /// Create a copy of ProjectListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectListState].
extension ProjectListStatePatterns on ProjectListState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProjectListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectListState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProjectListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectListState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProjectListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectListState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Project> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Project> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectListState():
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Project> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectListState
    with DiagnosticableTreeMixin
    implements ProjectListState {
  _ProjectListState(
      {final List<Project> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<Project> _items;
  @override
  @JsonKey()
  List<Project> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool hasReachEnd;

  /// Create a copy of ProjectListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectListStateCopyWith<_ProjectListState> get copyWith =>
      __$ProjectListStateCopyWithImpl<_ProjectListState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$ProjectListStateCopyWith<$Res>
    implements $ProjectListStateCopyWith<$Res> {
  factory _$ProjectListStateCopyWith(
          _ProjectListState value, $Res Function(_ProjectListState) _then) =
      __$ProjectListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Project> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$ProjectListStateCopyWithImpl<$Res>
    implements _$ProjectListStateCopyWith<$Res> {
  __$ProjectListStateCopyWithImpl(this._self, this._then);

  final _ProjectListState _self;
  final $Res Function(_ProjectListState) _then;

  /// Create a copy of ProjectListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_ProjectListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ProjectSubmitState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ProjectSubmitState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState()';
  }
}

/// @nodoc
class $ProjectSubmitStateCopyWith<$Res> {
  $ProjectSubmitStateCopyWith(
      ProjectSubmitState _, $Res Function(ProjectSubmitState) __);
}

/// Adds pattern-matching-related methods to [ProjectSubmitState].
extension ProjectSubmitStatePatterns on ProjectSubmitState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectSubmitIdle value)? idle,
    TResult Function(ProjectSubmitPending value)? pending,
    TResult Function(ProjectSubmitSuccess value)? success,
    TResult Function(ProjectSubmitDeleted value)? deleted,
    TResult Function(ProjectSubmitFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle() when idle != null:
        return idle(_that);
      case ProjectSubmitPending() when pending != null:
        return pending(_that);
      case ProjectSubmitSuccess() when success != null:
        return success(_that);
      case ProjectSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ProjectSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectSubmitIdle value) idle,
    required TResult Function(ProjectSubmitPending value) pending,
    required TResult Function(ProjectSubmitSuccess value) success,
    required TResult Function(ProjectSubmitDeleted value) deleted,
    required TResult Function(ProjectSubmitFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle():
        return idle(_that);
      case ProjectSubmitPending():
        return pending(_that);
      case ProjectSubmitSuccess():
        return success(_that);
      case ProjectSubmitDeleted():
        return deleted(_that);
      case ProjectSubmitFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectSubmitIdle value)? idle,
    TResult? Function(ProjectSubmitPending value)? pending,
    TResult? Function(ProjectSubmitSuccess value)? success,
    TResult? Function(ProjectSubmitDeleted value)? deleted,
    TResult? Function(ProjectSubmitFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle() when idle != null:
        return idle(_that);
      case ProjectSubmitPending() when pending != null:
        return pending(_that);
      case ProjectSubmitSuccess() when success != null:
        return success(_that);
      case ProjectSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ProjectSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(Project project)? success,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle() when idle != null:
        return idle();
      case ProjectSubmitPending() when pending != null:
        return pending();
      case ProjectSubmitSuccess() when success != null:
        return success(_that.project);
      case ProjectSubmitDeleted() when deleted != null:
        return deleted();
      case ProjectSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(Project project) success,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle():
        return idle();
      case ProjectSubmitPending():
        return pending();
      case ProjectSubmitSuccess():
        return success(_that.project);
      case ProjectSubmitDeleted():
        return deleted();
      case ProjectSubmitFailure():
        return failure(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(Project project)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ProjectSubmitIdle() when idle != null:
        return idle();
      case ProjectSubmitPending() when pending != null:
        return pending();
      case ProjectSubmitSuccess() when success != null:
        return success(_that.project);
      case ProjectSubmitDeleted() when deleted != null:
        return deleted();
      case ProjectSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProjectSubmitIdle
    with DiagnosticableTreeMixin
    implements ProjectSubmitState {
  const ProjectSubmitIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ProjectSubmitState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState.idle()';
  }
}

/// @nodoc

class ProjectSubmitPending
    with DiagnosticableTreeMixin
    implements ProjectSubmitState {
  const ProjectSubmitPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ProjectSubmitState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState.pending()';
  }
}

/// @nodoc

class ProjectSubmitSuccess
    with DiagnosticableTreeMixin
    implements ProjectSubmitState {
  const ProjectSubmitSuccess(this.project);

  final Project project;

  /// Create a copy of ProjectSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectSubmitSuccessCopyWith<ProjectSubmitSuccess> get copyWith =>
      _$ProjectSubmitSuccessCopyWithImpl<ProjectSubmitSuccess>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectSubmitState.success'))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectSubmitSuccess &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState.success(project: $project)';
  }
}

/// @nodoc
abstract mixin class $ProjectSubmitSuccessCopyWith<$Res>
    implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitSuccessCopyWith(ProjectSubmitSuccess value,
          $Res Function(ProjectSubmitSuccess) _then) =
      _$ProjectSubmitSuccessCopyWithImpl;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectSubmitSuccessCopyWithImpl<$Res>
    implements $ProjectSubmitSuccessCopyWith<$Res> {
  _$ProjectSubmitSuccessCopyWithImpl(this._self, this._then);

  final ProjectSubmitSuccess _self;
  final $Res Function(ProjectSubmitSuccess) _then;

  /// Create a copy of ProjectSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? project = null,
  }) {
    return _then(ProjectSubmitSuccess(
      null == project
          ? _self.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_self.project, (value) {
      return _then(_self.copyWith(project: value));
    });
  }
}

/// @nodoc

class ProjectSubmitDeleted
    with DiagnosticableTreeMixin
    implements ProjectSubmitState {
  const ProjectSubmitDeleted();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ProjectSubmitState.deleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState.deleted()';
  }
}

/// @nodoc

class ProjectSubmitFailure
    with DiagnosticableTreeMixin
    implements ProjectSubmitState {
  const ProjectSubmitFailure(this.message);

  final String message;

  /// Create a copy of ProjectSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectSubmitFailureCopyWith<ProjectSubmitFailure> get copyWith =>
      _$ProjectSubmitFailureCopyWithImpl<ProjectSubmitFailure>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProjectSubmitState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectSubmitState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProjectSubmitFailureCopyWith<$Res>
    implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitFailureCopyWith(ProjectSubmitFailure value,
          $Res Function(ProjectSubmitFailure) _then) =
      _$ProjectSubmitFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProjectSubmitFailureCopyWithImpl<$Res>
    implements $ProjectSubmitFailureCopyWith<$Res> {
  _$ProjectSubmitFailureCopyWithImpl(this._self, this._then);

  final ProjectSubmitFailure _self;
  final $Res Function(ProjectSubmitFailure) _then;

  /// Create a copy of ProjectSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProjectSubmitFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ScheduleFilterState implements DiagnosticableTreeMixin {
  String? get search;
  DateTime get start;
  DateTime get end;
  List<ScheduleCategory> get categoryItems;

  /// Create a copy of ScheduleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleFilterStateCopyWith<ScheduleFilterState> get copyWith =>
      _$ScheduleFilterStateCopyWithImpl<ScheduleFilterState>(
          this as ScheduleFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleFilterState'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('categoryItems', categoryItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other.categoryItems, categoryItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, start, end,
      const DeepCollectionEquality().hash(categoryItems));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleFilterState(search: $search, start: $start, end: $end, categoryItems: $categoryItems)';
  }
}

/// @nodoc
abstract mixin class $ScheduleFilterStateCopyWith<$Res> {
  factory $ScheduleFilterStateCopyWith(
          ScheduleFilterState value, $Res Function(ScheduleFilterState) _then) =
      _$ScheduleFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String? search,
      DateTime start,
      DateTime end,
      List<ScheduleCategory> categoryItems});
}

/// @nodoc
class _$ScheduleFilterStateCopyWithImpl<$Res>
    implements $ScheduleFilterStateCopyWith<$Res> {
  _$ScheduleFilterStateCopyWithImpl(this._self, this._then);

  final ScheduleFilterState _self;
  final $Res Function(ScheduleFilterState) _then;

  /// Create a copy of ScheduleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? start = null,
    Object? end = null,
    Object? categoryItems = null,
  }) {
    return _then(_self.copyWith(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryItems: null == categoryItems
          ? _self.categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<ScheduleCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleFilterState].
extension ScheduleFilterStatePatterns on ScheduleFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ScheduleFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ScheduleFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ScheduleFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? search, DateTime start, DateTime end,
            List<ScheduleCategory> categoryItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState() when $default != null:
        return $default(
            _that.search, _that.start, _that.end, _that.categoryItems);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? search, DateTime start, DateTime end,
            List<ScheduleCategory> categoryItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState():
        return $default(
            _that.search, _that.start, _that.end, _that.categoryItems);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? search, DateTime start, DateTime end,
            List<ScheduleCategory> categoryItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFilterState() when $default != null:
        return $default(
            _that.search, _that.start, _that.end, _that.categoryItems);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleFilterState
    with DiagnosticableTreeMixin
    implements ScheduleFilterState {
  _ScheduleFilterState(
      {this.search,
      required this.start,
      required this.end,
      final List<ScheduleCategory> categoryItems = const []})
      : _categoryItems = categoryItems;

  @override
  final String? search;
  @override
  final DateTime start;
  @override
  final DateTime end;
  final List<ScheduleCategory> _categoryItems;
  @override
  @JsonKey()
  List<ScheduleCategory> get categoryItems {
    if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryItems);
  }

  /// Create a copy of ScheduleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleFilterStateCopyWith<_ScheduleFilterState> get copyWith =>
      __$ScheduleFilterStateCopyWithImpl<_ScheduleFilterState>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleFilterState'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('categoryItems', categoryItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other._categoryItems, _categoryItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, start, end,
      const DeepCollectionEquality().hash(_categoryItems));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleFilterState(search: $search, start: $start, end: $end, categoryItems: $categoryItems)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleFilterStateCopyWith<$Res>
    implements $ScheduleFilterStateCopyWith<$Res> {
  factory _$ScheduleFilterStateCopyWith(_ScheduleFilterState value,
          $Res Function(_ScheduleFilterState) _then) =
      __$ScheduleFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? search,
      DateTime start,
      DateTime end,
      List<ScheduleCategory> categoryItems});
}

/// @nodoc
class __$ScheduleFilterStateCopyWithImpl<$Res>
    implements _$ScheduleFilterStateCopyWith<$Res> {
  __$ScheduleFilterStateCopyWithImpl(this._self, this._then);

  final _ScheduleFilterState _self;
  final $Res Function(_ScheduleFilterState) _then;

  /// Create a copy of ScheduleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = freezed,
    Object? start = null,
    Object? end = null,
    Object? categoryItems = null,
  }) {
    return _then(_ScheduleFilterState(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryItems: null == categoryItems
          ? _self._categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<ScheduleCategory>,
    ));
  }
}

/// @nodoc
mixin _$ScheduleFormState implements DiagnosticableTreeMixin {
  int? get projectId;
  String? get projectName;
  int? get projectClientId;
  String? get projectClientName;
  String? get summary;
  String? get description;
  DateTime? get start;
  DateTime? get end;

  /// Create a copy of ScheduleFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleFormStateCopyWith<ScheduleFormState> get copyWith =>
      _$ScheduleFormStateCopyWithImpl<ScheduleFormState>(
          this as ScheduleFormState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleFormState'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('projectName', projectName))
      ..add(DiagnosticsProperty('projectClientId', projectClientId))
      ..add(DiagnosticsProperty('projectClientName', projectClientName))
      ..add(DiagnosticsProperty('summary', summary))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleFormState &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectClientId, projectClientId) ||
                other.projectClientId == projectClientId) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, projectName,
      projectClientId, projectClientName, summary, description, start, end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleFormState(projectId: $projectId, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, summary: $summary, description: $description, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $ScheduleFormStateCopyWith<$Res> {
  factory $ScheduleFormStateCopyWith(
          ScheduleFormState value, $Res Function(ScheduleFormState) _then) =
      _$ScheduleFormStateCopyWithImpl;
  @useResult
  $Res call(
      {int? projectId,
      String? projectName,
      int? projectClientId,
      String? projectClientName,
      String? summary,
      String? description,
      DateTime? start,
      DateTime? end});
}

/// @nodoc
class _$ScheduleFormStateCopyWithImpl<$Res>
    implements $ScheduleFormStateCopyWith<$Res> {
  _$ScheduleFormStateCopyWithImpl(this._self, this._then);

  final ScheduleFormState _self;
  final $Res Function(ScheduleFormState) _then;

  /// Create a copy of ScheduleFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? projectClientId = freezed,
    Object? projectClientName = freezed,
    Object? summary = freezed,
    Object? description = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_self.copyWith(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectClientId: freezed == projectClientId
          ? _self.projectClientId
          : projectClientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectClientName: freezed == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleFormState].
extension ScheduleFormStatePatterns on ScheduleFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ScheduleFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ScheduleFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ScheduleFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? projectId,
            String? projectName,
            int? projectClientId,
            String? projectClientName,
            String? summary,
            String? description,
            DateTime? start,
            DateTime? end)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState() when $default != null:
        return $default(
            _that.projectId,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.summary,
            _that.description,
            _that.start,
            _that.end);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? projectId,
            String? projectName,
            int? projectClientId,
            String? projectClientName,
            String? summary,
            String? description,
            DateTime? start,
            DateTime? end)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState():
        return $default(
            _that.projectId,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.summary,
            _that.description,
            _that.start,
            _that.end);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? projectId,
            String? projectName,
            int? projectClientId,
            String? projectClientName,
            String? summary,
            String? description,
            DateTime? start,
            DateTime? end)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleFormState() when $default != null:
        return $default(
            _that.projectId,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.summary,
            _that.description,
            _that.start,
            _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleFormState
    with DiagnosticableTreeMixin
    implements ScheduleFormState {
  _ScheduleFormState(
      {this.projectId,
      this.projectName,
      this.projectClientId,
      this.projectClientName,
      this.summary,
      this.description,
      this.start,
      this.end});

  @override
  final int? projectId;
  @override
  final String? projectName;
  @override
  final int? projectClientId;
  @override
  final String? projectClientName;
  @override
  final String? summary;
  @override
  final String? description;
  @override
  final DateTime? start;
  @override
  final DateTime? end;

  /// Create a copy of ScheduleFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleFormStateCopyWith<_ScheduleFormState> get copyWith =>
      __$ScheduleFormStateCopyWithImpl<_ScheduleFormState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleFormState'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('projectName', projectName))
      ..add(DiagnosticsProperty('projectClientId', projectClientId))
      ..add(DiagnosticsProperty('projectClientName', projectClientName))
      ..add(DiagnosticsProperty('summary', summary))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleFormState &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectClientId, projectClientId) ||
                other.projectClientId == projectClientId) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, projectName,
      projectClientId, projectClientName, summary, description, start, end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleFormState(projectId: $projectId, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, summary: $summary, description: $description, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleFormStateCopyWith<$Res>
    implements $ScheduleFormStateCopyWith<$Res> {
  factory _$ScheduleFormStateCopyWith(
          _ScheduleFormState value, $Res Function(_ScheduleFormState) _then) =
      __$ScheduleFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? projectId,
      String? projectName,
      int? projectClientId,
      String? projectClientName,
      String? summary,
      String? description,
      DateTime? start,
      DateTime? end});
}

/// @nodoc
class __$ScheduleFormStateCopyWithImpl<$Res>
    implements _$ScheduleFormStateCopyWith<$Res> {
  __$ScheduleFormStateCopyWithImpl(this._self, this._then);

  final _ScheduleFormState _self;
  final $Res Function(_ScheduleFormState) _then;

  /// Create a copy of ScheduleFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? projectClientId = freezed,
    Object? projectClientName = freezed,
    Object? summary = freezed,
    Object? description = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_ScheduleFormState(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectClientId: freezed == projectClientId
          ? _self.projectClientId
          : projectClientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectClientName: freezed == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ScheduleListState implements DiagnosticableTreeMixin {
  List<ScheduleGroup> get items;
  bool get hasNext;
  bool get hasPrevious;
  DateTime get start;
  DateTime get end;

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleListStateCopyWith<ScheduleListState> get copyWith =>
      _$ScheduleListStateCopyWithImpl<ScheduleListState>(
          this as ScheduleListState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('hasPrevious', hasPrevious))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleListState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      hasNext,
      hasPrevious,
      start,
      end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleListState(items: $items, hasNext: $hasNext, hasPrevious: $hasPrevious, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $ScheduleListStateCopyWith<$Res> {
  factory $ScheduleListStateCopyWith(
          ScheduleListState value, $Res Function(ScheduleListState) _then) =
      _$ScheduleListStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ScheduleGroup> items,
      bool hasNext,
      bool hasPrevious,
      DateTime start,
      DateTime end});
}

/// @nodoc
class _$ScheduleListStateCopyWithImpl<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  _$ScheduleListStateCopyWithImpl(this._self, this._then);

  final ScheduleListState _self;
  final $Res Function(ScheduleListState) _then;

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleGroup>,
      hasNext: null == hasNext
          ? _self.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _self.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleListState].
extension ScheduleListStatePatterns on ScheduleListState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ScheduleListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ScheduleListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ScheduleListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ScheduleGroup> items, bool hasNext, bool hasPrevious,
            DateTime start, DateTime end)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
        return $default(_that.items, _that.hasNext, _that.hasPrevious,
            _that.start, _that.end);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ScheduleGroup> items, bool hasNext, bool hasPrevious,
            DateTime start, DateTime end)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState():
        return $default(_that.items, _that.hasNext, _that.hasPrevious,
            _that.start, _that.end);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ScheduleGroup> items, bool hasNext, bool hasPrevious,
            DateTime start, DateTime end)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
        return $default(_that.items, _that.hasNext, _that.hasPrevious,
            _that.start, _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleListState
    with DiagnosticableTreeMixin
    implements ScheduleListState {
  _ScheduleListState(
      {final List<ScheduleGroup> items = const [],
      this.hasNext = false,
      this.hasPrevious = false,
      required this.start,
      required this.end})
      : _items = items;

  final List<ScheduleGroup> _items;
  @override
  @JsonKey()
  List<ScheduleGroup> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final bool hasPrevious;
  @override
  final DateTime start;
  @override
  final DateTime end;

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleListStateCopyWith<_ScheduleListState> get copyWith =>
      __$ScheduleListStateCopyWithImpl<_ScheduleListState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('hasPrevious', hasPrevious))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      hasNext,
      hasPrevious,
      start,
      end);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleListState(items: $items, hasNext: $hasNext, hasPrevious: $hasPrevious, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleListStateCopyWith<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  factory _$ScheduleListStateCopyWith(
          _ScheduleListState value, $Res Function(_ScheduleListState) _then) =
      __$ScheduleListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ScheduleGroup> items,
      bool hasNext,
      bool hasPrevious,
      DateTime start,
      DateTime end});
}

/// @nodoc
class __$ScheduleListStateCopyWithImpl<$Res>
    implements _$ScheduleListStateCopyWith<$Res> {
  __$ScheduleListStateCopyWithImpl(this._self, this._then);

  final _ScheduleListState _self;
  final $Res Function(_ScheduleListState) _then;

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_ScheduleListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleGroup>,
      hasNext: null == hasNext
          ? _self.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _self.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ScheduleSubmitState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ScheduleSubmitState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState()';
  }
}

/// @nodoc
class $ScheduleSubmitStateCopyWith<$Res> {
  $ScheduleSubmitStateCopyWith(
      ScheduleSubmitState _, $Res Function(ScheduleSubmitState) __);
}

/// Adds pattern-matching-related methods to [ScheduleSubmitState].
extension ScheduleSubmitStatePatterns on ScheduleSubmitState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleSubmitIdle value)? idle,
    TResult Function(ScheduleSubmitPending value)? pending,
    TResult Function(ScheduleSubmitSuccess value)? success,
    TResult Function(ScheduleSubmitDeleted value)? deleted,
    TResult Function(ScheduleSubmitFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle() when idle != null:
        return idle(_that);
      case ScheduleSubmitPending() when pending != null:
        return pending(_that);
      case ScheduleSubmitSuccess() when success != null:
        return success(_that);
      case ScheduleSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ScheduleSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleSubmitIdle value) idle,
    required TResult Function(ScheduleSubmitPending value) pending,
    required TResult Function(ScheduleSubmitSuccess value) success,
    required TResult Function(ScheduleSubmitDeleted value) deleted,
    required TResult Function(ScheduleSubmitFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle():
        return idle(_that);
      case ScheduleSubmitPending():
        return pending(_that);
      case ScheduleSubmitSuccess():
        return success(_that);
      case ScheduleSubmitDeleted():
        return deleted(_that);
      case ScheduleSubmitFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleSubmitIdle value)? idle,
    TResult? Function(ScheduleSubmitPending value)? pending,
    TResult? Function(ScheduleSubmitSuccess value)? success,
    TResult? Function(ScheduleSubmitDeleted value)? deleted,
    TResult? Function(ScheduleSubmitFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle() when idle != null:
        return idle(_that);
      case ScheduleSubmitPending() when pending != null:
        return pending(_that);
      case ScheduleSubmitSuccess() when success != null:
        return success(_that);
      case ScheduleSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ScheduleSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(Schedule schedule)? success,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle() when idle != null:
        return idle();
      case ScheduleSubmitPending() when pending != null:
        return pending();
      case ScheduleSubmitSuccess() when success != null:
        return success(_that.schedule);
      case ScheduleSubmitDeleted() when deleted != null:
        return deleted();
      case ScheduleSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(Schedule schedule) success,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle():
        return idle();
      case ScheduleSubmitPending():
        return pending();
      case ScheduleSubmitSuccess():
        return success(_that.schedule);
      case ScheduleSubmitDeleted():
        return deleted();
      case ScheduleSubmitFailure():
        return failure(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(Schedule schedule)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleSubmitIdle() when idle != null:
        return idle();
      case ScheduleSubmitPending() when pending != null:
        return pending();
      case ScheduleSubmitSuccess() when success != null:
        return success(_that.schedule);
      case ScheduleSubmitDeleted() when deleted != null:
        return deleted();
      case ScheduleSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ScheduleSubmitIdle
    with DiagnosticableTreeMixin
    implements ScheduleSubmitState {
  ScheduleSubmitIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ScheduleSubmitState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState.idle()';
  }
}

/// @nodoc

class ScheduleSubmitPending
    with DiagnosticableTreeMixin
    implements ScheduleSubmitState {
  ScheduleSubmitPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ScheduleSubmitState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState.pending()';
  }
}

/// @nodoc

class ScheduleSubmitSuccess
    with DiagnosticableTreeMixin
    implements ScheduleSubmitState {
  ScheduleSubmitSuccess(this.schedule);

  final Schedule schedule;

  /// Create a copy of ScheduleSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleSubmitSuccessCopyWith<ScheduleSubmitSuccess> get copyWith =>
      _$ScheduleSubmitSuccessCopyWithImpl<ScheduleSubmitSuccess>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.success'))
      ..add(DiagnosticsProperty('schedule', schedule));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleSubmitSuccess &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState.success(schedule: $schedule)';
  }
}

/// @nodoc
abstract mixin class $ScheduleSubmitSuccessCopyWith<$Res>
    implements $ScheduleSubmitStateCopyWith<$Res> {
  factory $ScheduleSubmitSuccessCopyWith(ScheduleSubmitSuccess value,
          $Res Function(ScheduleSubmitSuccess) _then) =
      _$ScheduleSubmitSuccessCopyWithImpl;
  @useResult
  $Res call({Schedule schedule});

  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class _$ScheduleSubmitSuccessCopyWithImpl<$Res>
    implements $ScheduleSubmitSuccessCopyWith<$Res> {
  _$ScheduleSubmitSuccessCopyWithImpl(this._self, this._then);

  final ScheduleSubmitSuccess _self;
  final $Res Function(ScheduleSubmitSuccess) _then;

  /// Create a copy of ScheduleSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schedule = null,
  }) {
    return _then(ScheduleSubmitSuccess(
      null == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
    ));
  }

  /// Create a copy of ScheduleSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_self.schedule, (value) {
      return _then(_self.copyWith(schedule: value));
    });
  }
}

/// @nodoc

class ScheduleSubmitDeleted
    with DiagnosticableTreeMixin
    implements ScheduleSubmitState {
  ScheduleSubmitDeleted();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ScheduleSubmitState.deleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState.deleted()';
  }
}

/// @nodoc

class ScheduleSubmitFailure
    with DiagnosticableTreeMixin
    implements ScheduleSubmitState {
  ScheduleSubmitFailure(this.message);

  final String message;

  /// Create a copy of ScheduleSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleSubmitFailureCopyWith<ScheduleSubmitFailure> get copyWith =>
      _$ScheduleSubmitFailureCopyWithImpl<ScheduleSubmitFailure>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleSubmitState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ScheduleSubmitFailureCopyWith<$Res>
    implements $ScheduleSubmitStateCopyWith<$Res> {
  factory $ScheduleSubmitFailureCopyWith(ScheduleSubmitFailure value,
          $Res Function(ScheduleSubmitFailure) _then) =
      _$ScheduleSubmitFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ScheduleSubmitFailureCopyWithImpl<$Res>
    implements $ScheduleSubmitFailureCopyWith<$Res> {
  _$ScheduleSubmitFailureCopyWithImpl(this._self, this._then);

  final ScheduleSubmitFailure _self;
  final $Res Function(ScheduleSubmitFailure) _then;

  /// Create a copy of ScheduleSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ScheduleSubmitFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SettingFilterState implements DiagnosticableTreeMixin {
  String? get view;

  /// Create a copy of SettingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingFilterStateCopyWith<SettingFilterState> get copyWith =>
      _$SettingFilterStateCopyWithImpl<SettingFilterState>(
          this as SettingFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SettingFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class $SettingFilterStateCopyWith<$Res> {
  factory $SettingFilterStateCopyWith(
          SettingFilterState value, $Res Function(SettingFilterState) _then) =
      _$SettingFilterStateCopyWithImpl;
  @useResult
  $Res call({String? view});
}

/// @nodoc
class _$SettingFilterStateCopyWithImpl<$Res>
    implements $SettingFilterStateCopyWith<$Res> {
  _$SettingFilterStateCopyWithImpl(this._self, this._then);

  final SettingFilterState _self;
  final $Res Function(SettingFilterState) _then;

  /// Create a copy of SettingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_self.copyWith(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SettingFilterState].
extension SettingFilterStatePatterns on SettingFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SettingFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? view)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? view) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState():
        return $default(_that.view);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? view)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SettingFilterState
    with DiagnosticableTreeMixin
    implements SettingFilterState {
  _SettingFilterState({this.view});

  @override
  final String? view;

  /// Create a copy of SettingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingFilterStateCopyWith<_SettingFilterState> get copyWith =>
      __$SettingFilterStateCopyWithImpl<_SettingFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SettingFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class _$SettingFilterStateCopyWith<$Res>
    implements $SettingFilterStateCopyWith<$Res> {
  factory _$SettingFilterStateCopyWith(
          _SettingFilterState value, $Res Function(_SettingFilterState) _then) =
      __$SettingFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? view});
}

/// @nodoc
class __$SettingFilterStateCopyWithImpl<$Res>
    implements _$SettingFilterStateCopyWith<$Res> {
  __$SettingFilterStateCopyWithImpl(this._self, this._then);

  final _SettingFilterState _self;
  final $Res Function(_SettingFilterState) _then;

  /// Create a copy of SettingFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_SettingFilterState(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

SupplierSearchState _$SupplierSearchStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'idle':
      return SupplierSearchIdle.fromJson(json);
    case 'waiting':
      return SupplierSearchWaiting.fromJson(json);
    case 'result':
      return SupplierSearchResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SupplierSearchState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SupplierSearchState implements DiagnosticableTreeMixin {
  /// Serializes this SupplierSearchState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'SupplierSearchState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SupplierSearchState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupplierSearchState()';
  }
}

/// @nodoc
class $SupplierSearchStateCopyWith<$Res> {
  $SupplierSearchStateCopyWith(
      SupplierSearchState _, $Res Function(SupplierSearchState) __);
}

/// Adds pattern-matching-related methods to [SupplierSearchState].
extension SupplierSearchStatePatterns on SupplierSearchState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SupplierSearchIdle value)? idle,
    TResult Function(SupplierSearchWaiting value)? waiting,
    TResult Function(SupplierSearchResult value)? result,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle() when idle != null:
        return idle(_that);
      case SupplierSearchWaiting() when waiting != null:
        return waiting(_that);
      case SupplierSearchResult() when result != null:
        return result(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SupplierSearchIdle value) idle,
    required TResult Function(SupplierSearchWaiting value) waiting,
    required TResult Function(SupplierSearchResult value) result,
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle():
        return idle(_that);
      case SupplierSearchWaiting():
        return waiting(_that);
      case SupplierSearchResult():
        return result(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SupplierSearchIdle value)? idle,
    TResult? Function(SupplierSearchWaiting value)? waiting,
    TResult? Function(SupplierSearchResult value)? result,
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle() when idle != null:
        return idle(_that);
      case SupplierSearchWaiting() when waiting != null:
        return waiting(_that);
      case SupplierSearchResult() when result != null:
        return result(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String search)? waiting,
    TResult Function(String search, List<Supplier> items, int page, int total,
            bool hasReachEnd)?
        result,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle() when idle != null:
        return idle();
      case SupplierSearchWaiting() when waiting != null:
        return waiting(_that.search);
      case SupplierSearchResult() when result != null:
        return result(_that.search, _that.items, _that.page, _that.total,
            _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String search) waiting,
    required TResult Function(String search, List<Supplier> items, int page,
            int total, bool hasReachEnd)
        result,
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle():
        return idle();
      case SupplierSearchWaiting():
        return waiting(_that.search);
      case SupplierSearchResult():
        return result(_that.search, _that.items, _that.page, _that.total,
            _that.hasReachEnd);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String search)? waiting,
    TResult? Function(String search, List<Supplier> items, int page, int total,
            bool hasReachEnd)?
        result,
  }) {
    final _that = this;
    switch (_that) {
      case SupplierSearchIdle() when idle != null:
        return idle();
      case SupplierSearchWaiting() when waiting != null:
        return waiting(_that.search);
      case SupplierSearchResult() when result != null:
        return result(_that.search, _that.items, _that.page, _that.total,
            _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class SupplierSearchIdle
    with DiagnosticableTreeMixin
    implements SupplierSearchState {
  SupplierSearchIdle({final String? $type}) : $type = $type ?? 'idle';
  factory SupplierSearchIdle.fromJson(Map<String, dynamic> json) =>
      _$SupplierSearchIdleFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierSearchIdleToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'SupplierSearchState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SupplierSearchIdle);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupplierSearchState.idle()';
  }
}

/// @nodoc
@JsonSerializable()
class SupplierSearchWaiting
    with DiagnosticableTreeMixin
    implements SupplierSearchState {
  SupplierSearchWaiting({this.search = '', final String? $type})
      : $type = $type ?? 'waiting';
  factory SupplierSearchWaiting.fromJson(Map<String, dynamic> json) =>
      _$SupplierSearchWaitingFromJson(json);

  @JsonKey()
  final String search;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SupplierSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierSearchWaitingCopyWith<SupplierSearchWaiting> get copyWith =>
      _$SupplierSearchWaitingCopyWithImpl<SupplierSearchWaiting>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierSearchWaitingToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SupplierSearchState.waiting'))
      ..add(DiagnosticsProperty('search', search));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierSearchWaiting &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, search);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupplierSearchState.waiting(search: $search)';
  }
}

/// @nodoc
abstract mixin class $SupplierSearchWaitingCopyWith<$Res>
    implements $SupplierSearchStateCopyWith<$Res> {
  factory $SupplierSearchWaitingCopyWith(SupplierSearchWaiting value,
          $Res Function(SupplierSearchWaiting) _then) =
      _$SupplierSearchWaitingCopyWithImpl;
  @useResult
  $Res call({String search});
}

/// @nodoc
class _$SupplierSearchWaitingCopyWithImpl<$Res>
    implements $SupplierSearchWaitingCopyWith<$Res> {
  _$SupplierSearchWaitingCopyWithImpl(this._self, this._then);

  final SupplierSearchWaiting _self;
  final $Res Function(SupplierSearchWaiting) _then;

  /// Create a copy of SupplierSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
  }) {
    return _then(SupplierSearchWaiting(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SupplierSearchResult
    with DiagnosticableTreeMixin
    implements SupplierSearchState {
  SupplierSearchResult(
      {this.search = '',
      final List<Supplier> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false,
      final String? $type})
      : _items = items,
        $type = $type ?? 'result';
  factory SupplierSearchResult.fromJson(Map<String, dynamic> json) =>
      _$SupplierSearchResultFromJson(json);

  @JsonKey()
  final String search;
  final List<Supplier> _items;
  @JsonKey()
  List<Supplier> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey()
  final int page;
  @JsonKey()
  final int total;
  @JsonKey()
  final bool hasReachEnd;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SupplierSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierSearchResultCopyWith<SupplierSearchResult> get copyWith =>
      _$SupplierSearchResultCopyWithImpl<SupplierSearchResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierSearchResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SupplierSearchState.result'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierSearchResult &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, search,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupplierSearchState.result(search: $search, items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $SupplierSearchResultCopyWith<$Res>
    implements $SupplierSearchStateCopyWith<$Res> {
  factory $SupplierSearchResultCopyWith(SupplierSearchResult value,
          $Res Function(SupplierSearchResult) _then) =
      _$SupplierSearchResultCopyWithImpl;
  @useResult
  $Res call(
      {String search,
      List<Supplier> items,
      int page,
      int total,
      bool hasReachEnd});
}

/// @nodoc
class _$SupplierSearchResultCopyWithImpl<$Res>
    implements $SupplierSearchResultCopyWith<$Res> {
  _$SupplierSearchResultCopyWithImpl(this._self, this._then);

  final SupplierSearchResult _self;
  final $Res Function(SupplierSearchResult) _then;

  /// Create a copy of SupplierSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(SupplierSearchResult(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ReportFormState implements DiagnosticableTreeMixin {
  List<TripActualExpense> get expenses;
  List<TripRegulationRate> get rates;
  TripFuelExpense? get fuel;
  bool? get isDeducted;
  String? get content;
  List<ReportAttachment>? get attachments;
  List<XFile>? get files;
  Schedule? get schedule;
  List<String> get steps;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportFormStateCopyWith<ReportFormState> get copyWith =>
      _$ReportFormStateCopyWithImpl<ReportFormState>(
          this as ReportFormState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportFormState'))
      ..add(DiagnosticsProperty('expenses', expenses))
      ..add(DiagnosticsProperty('rates', rates))
      ..add(DiagnosticsProperty('fuel', fuel))
      ..add(DiagnosticsProperty('isDeducted', isDeducted))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('schedule', schedule))
      ..add(DiagnosticsProperty('steps', steps));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportFormState &&
            const DeepCollectionEquality().equals(other.expenses, expenses) &&
            const DeepCollectionEquality().equals(other.rates, rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expenses),
      const DeepCollectionEquality().hash(rates),
      fuel,
      isDeducted,
      content,
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(files),
      schedule,
      const DeepCollectionEquality().hash(steps));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportFormState(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, content: $content, attachments: $attachments, files: $files, schedule: $schedule, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class $ReportFormStateCopyWith<$Res> {
  factory $ReportFormStateCopyWith(
          ReportFormState value, $Res Function(ReportFormState) _then) =
      _$ReportFormStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      TripFuelExpense? fuel,
      bool? isDeducted,
      String? content,
      List<ReportAttachment>? attachments,
      List<XFile>? files,
      Schedule? schedule,
      List<String> steps});

  $TripFuelExpenseCopyWith<$Res>? get fuel;
  $ScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$ReportFormStateCopyWithImpl<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  _$ReportFormStateCopyWithImpl(this._self, this._then);

  final ReportFormState _self;
  final $Res Function(ReportFormState) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
    Object? schedule = freezed,
    Object? steps = null,
  }) {
    return _then(_self.copyWith(
      expenses: null == expenses
          ? _self.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TripActualExpense>,
      rates: null == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<TripRegulationRate>,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as TripFuelExpense?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>?,
      files: freezed == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      steps: null == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripFuelExpenseCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $TripFuelExpenseCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res>? get schedule {
    if (_self.schedule == null) {
      return null;
    }

    return $ScheduleCopyWith<$Res>(_self.schedule!, (value) {
      return _then(_self.copyWith(schedule: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportFormState].
extension ReportFormStatePatterns on ReportFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReportFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReportFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReportFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            TripFuelExpense? fuel,
            bool? isDeducted,
            String? content,
            List<ReportAttachment>? attachments,
            List<XFile>? files,
            Schedule? schedule,
            List<String> steps)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(
            _that.expenses,
            _that.rates,
            _that.fuel,
            _that.isDeducted,
            _that.content,
            _that.attachments,
            _that.files,
            _that.schedule,
            _that.steps);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            TripFuelExpense? fuel,
            bool? isDeducted,
            String? content,
            List<ReportAttachment>? attachments,
            List<XFile>? files,
            Schedule? schedule,
            List<String> steps)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState():
        return $default(
            _that.expenses,
            _that.rates,
            _that.fuel,
            _that.isDeducted,
            _that.content,
            _that.attachments,
            _that.files,
            _that.schedule,
            _that.steps);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            TripFuelExpense? fuel,
            bool? isDeducted,
            String? content,
            List<ReportAttachment>? attachments,
            List<XFile>? files,
            Schedule? schedule,
            List<String> steps)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(
            _that.expenses,
            _that.rates,
            _that.fuel,
            _that.isDeducted,
            _that.content,
            _that.attachments,
            _that.files,
            _that.schedule,
            _that.steps);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportFormState with DiagnosticableTreeMixin implements ReportFormState {
  _ReportFormState(
      {final List<TripActualExpense> expenses = const [],
      final List<TripRegulationRate> rates = const [],
      this.fuel,
      this.isDeducted,
      this.content,
      final List<ReportAttachment>? attachments,
      final List<XFile>? files,
      this.schedule,
      final List<String> steps = const []})
      : _expenses = expenses,
        _rates = rates,
        _attachments = attachments,
        _files = files,
        _steps = steps;

  final List<TripActualExpense> _expenses;
  @override
  @JsonKey()
  List<TripActualExpense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<TripRegulationRate> _rates;
  @override
  @JsonKey()
  List<TripRegulationRate> get rates {
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rates);
  }

  @override
  final TripFuelExpense? fuel;
  @override
  final bool? isDeducted;
  @override
  final String? content;
  final List<ReportAttachment>? _attachments;
  @override
  List<ReportAttachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<XFile>? _files;
  @override
  List<XFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Schedule? schedule;
  final List<String> _steps;
  @override
  @JsonKey()
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportFormStateCopyWith<_ReportFormState> get copyWith =>
      __$ReportFormStateCopyWithImpl<_ReportFormState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportFormState'))
      ..add(DiagnosticsProperty('expenses', expenses))
      ..add(DiagnosticsProperty('rates', rates))
      ..add(DiagnosticsProperty('fuel', fuel))
      ..add(DiagnosticsProperty('isDeducted', isDeducted))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('schedule', schedule))
      ..add(DiagnosticsProperty('steps', steps));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportFormState &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      fuel,
      isDeducted,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_files),
      schedule,
      const DeepCollectionEquality().hash(_steps));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportFormState(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, content: $content, attachments: $attachments, files: $files, schedule: $schedule, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class _$ReportFormStateCopyWith<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  factory _$ReportFormStateCopyWith(
          _ReportFormState value, $Res Function(_ReportFormState) _then) =
      __$ReportFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      TripFuelExpense? fuel,
      bool? isDeducted,
      String? content,
      List<ReportAttachment>? attachments,
      List<XFile>? files,
      Schedule? schedule,
      List<String> steps});

  @override
  $TripFuelExpenseCopyWith<$Res>? get fuel;
  @override
  $ScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$ReportFormStateCopyWithImpl<$Res>
    implements _$ReportFormStateCopyWith<$Res> {
  __$ReportFormStateCopyWithImpl(this._self, this._then);

  final _ReportFormState _self;
  final $Res Function(_ReportFormState) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
    Object? content = freezed,
    Object? attachments = freezed,
    Object? files = freezed,
    Object? schedule = freezed,
    Object? steps = null,
  }) {
    return _then(_ReportFormState(
      expenses: null == expenses
          ? _self._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TripActualExpense>,
      rates: null == rates
          ? _self._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<TripRegulationRate>,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as TripFuelExpense?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>?,
      files: freezed == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<XFile>?,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      steps: null == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripFuelExpenseCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $TripFuelExpenseCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res>? get schedule {
    if (_self.schedule == null) {
      return null;
    }

    return $ScheduleCopyWith<$Res>(_self.schedule!, (value) {
      return _then(_self.copyWith(schedule: value));
    });
  }
}

/// @nodoc
mixin _$ReportListState implements DiagnosticableTreeMixin {
  List<Report> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of ReportListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportListStateCopyWith<ReportListState> get copyWith =>
      _$ReportListStateCopyWithImpl<ReportListState>(
          this as ReportListState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportListState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $ReportListStateCopyWith<$Res> {
  factory $ReportListStateCopyWith(
          ReportListState value, $Res Function(ReportListState) _then) =
      _$ReportListStateCopyWithImpl;
  @useResult
  $Res call({List<Report> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$ReportListStateCopyWithImpl<$Res>
    implements $ReportListStateCopyWith<$Res> {
  _$ReportListStateCopyWithImpl(this._self, this._then);

  final ReportListState _self;
  final $Res Function(ReportListState) _then;

  /// Create a copy of ReportListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Report>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportListState].
extension ReportListStatePatterns on ReportListState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReportListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportListState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReportListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportListState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReportListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportListState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Report> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Report> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportListState():
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Report> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportListState with DiagnosticableTreeMixin implements ReportListState {
  _ReportListState(
      {final List<Report> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<Report> _items;
  @override
  @JsonKey()
  List<Report> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool hasReachEnd;

  /// Create a copy of ReportListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportListStateCopyWith<_ReportListState> get copyWith =>
      __$ReportListStateCopyWithImpl<_ReportListState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$ReportListStateCopyWith<$Res>
    implements $ReportListStateCopyWith<$Res> {
  factory _$ReportListStateCopyWith(
          _ReportListState value, $Res Function(_ReportListState) _then) =
      __$ReportListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Report> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$ReportListStateCopyWithImpl<$Res>
    implements _$ReportListStateCopyWith<$Res> {
  __$ReportListStateCopyWithImpl(this._self, this._then);

  final _ReportListState _self;
  final $Res Function(_ReportListState) _then;

  /// Create a copy of ReportListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_ReportListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Report>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ReportSubmitState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ReportSubmitState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState()';
  }
}

/// @nodoc
class $ReportSubmitStateCopyWith<$Res> {
  $ReportSubmitStateCopyWith(
      ReportSubmitState _, $Res Function(ReportSubmitState) __);
}

/// Adds pattern-matching-related methods to [ReportSubmitState].
extension ReportSubmitStatePatterns on ReportSubmitState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportSubmitIdle value)? idle,
    TResult Function(ReportSubmitPending value)? pending,
    TResult Function(ReportSubmitSuccess value)? success,
    TResult Function(ReportSubmitDeleted value)? deleted,
    TResult Function(ReportSubmitMailed value)? mailed,
    TResult Function(ReportSubmitFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle() when idle != null:
        return idle(_that);
      case ReportSubmitPending() when pending != null:
        return pending(_that);
      case ReportSubmitSuccess() when success != null:
        return success(_that);
      case ReportSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ReportSubmitMailed() when mailed != null:
        return mailed(_that);
      case ReportSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportSubmitIdle value) idle,
    required TResult Function(ReportSubmitPending value) pending,
    required TResult Function(ReportSubmitSuccess value) success,
    required TResult Function(ReportSubmitDeleted value) deleted,
    required TResult Function(ReportSubmitMailed value) mailed,
    required TResult Function(ReportSubmitFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle():
        return idle(_that);
      case ReportSubmitPending():
        return pending(_that);
      case ReportSubmitSuccess():
        return success(_that);
      case ReportSubmitDeleted():
        return deleted(_that);
      case ReportSubmitMailed():
        return mailed(_that);
      case ReportSubmitFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportSubmitIdle value)? idle,
    TResult? Function(ReportSubmitPending value)? pending,
    TResult? Function(ReportSubmitSuccess value)? success,
    TResult? Function(ReportSubmitDeleted value)? deleted,
    TResult? Function(ReportSubmitMailed value)? mailed,
    TResult? Function(ReportSubmitFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle() when idle != null:
        return idle(_that);
      case ReportSubmitPending() when pending != null:
        return pending(_that);
      case ReportSubmitSuccess() when success != null:
        return success(_that);
      case ReportSubmitDeleted() when deleted != null:
        return deleted(_that);
      case ReportSubmitMailed() when mailed != null:
        return mailed(_that);
      case ReportSubmitFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(Report report)? success,
    TResult Function()? deleted,
    TResult Function()? mailed,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle() when idle != null:
        return idle();
      case ReportSubmitPending() when pending != null:
        return pending();
      case ReportSubmitSuccess() when success != null:
        return success(_that.report);
      case ReportSubmitDeleted() when deleted != null:
        return deleted();
      case ReportSubmitMailed() when mailed != null:
        return mailed();
      case ReportSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(Report report) success,
    required TResult Function() deleted,
    required TResult Function() mailed,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle():
        return idle();
      case ReportSubmitPending():
        return pending();
      case ReportSubmitSuccess():
        return success(_that.report);
      case ReportSubmitDeleted():
        return deleted();
      case ReportSubmitMailed():
        return mailed();
      case ReportSubmitFailure():
        return failure(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(Report report)? success,
    TResult? Function()? deleted,
    TResult? Function()? mailed,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSubmitIdle() when idle != null:
        return idle();
      case ReportSubmitPending() when pending != null:
        return pending();
      case ReportSubmitSuccess() when success != null:
        return success(_that.report);
      case ReportSubmitDeleted() when deleted != null:
        return deleted();
      case ReportSubmitMailed() when mailed != null:
        return mailed();
      case ReportSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ReportSubmitIdle
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ReportSubmitState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.idle()';
  }
}

/// @nodoc

class ReportSubmitPending
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitPending();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ReportSubmitState.pending'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.pending()';
  }
}

/// @nodoc

class ReportSubmitSuccess
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitSuccess(this.report);

  final Report report;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSubmitSuccessCopyWith<ReportSubmitSuccess> get copyWith =>
      _$ReportSubmitSuccessCopyWithImpl<ReportSubmitSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportSubmitState.success'))
      ..add(DiagnosticsProperty('report', report));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSubmitSuccess &&
            (identical(other.report, report) || other.report == report));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.success(report: $report)';
  }
}

/// @nodoc
abstract mixin class $ReportSubmitSuccessCopyWith<$Res>
    implements $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitSuccessCopyWith(
          ReportSubmitSuccess value, $Res Function(ReportSubmitSuccess) _then) =
      _$ReportSubmitSuccessCopyWithImpl;
  @useResult
  $Res call({Report report});

  $ReportCopyWith<$Res> get report;
}

/// @nodoc
class _$ReportSubmitSuccessCopyWithImpl<$Res>
    implements $ReportSubmitSuccessCopyWith<$Res> {
  _$ReportSubmitSuccessCopyWithImpl(this._self, this._then);

  final ReportSubmitSuccess _self;
  final $Res Function(ReportSubmitSuccess) _then;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? report = null,
  }) {
    return _then(ReportSubmitSuccess(
      null == report
          ? _self.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report,
    ));
  }

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportCopyWith<$Res> get report {
    return $ReportCopyWith<$Res>(_self.report, (value) {
      return _then(_self.copyWith(report: value));
    });
  }
}

/// @nodoc

class ReportSubmitDeleted
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitDeleted();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ReportSubmitState.deleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.deleted()';
  }
}

/// @nodoc

class ReportSubmitMailed
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitMailed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'ReportSubmitState.mailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportSubmitMailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.mailed()';
  }
}

/// @nodoc

class ReportSubmitFailure
    with DiagnosticableTreeMixin
    implements ReportSubmitState {
  const ReportSubmitFailure(this.message);

  final String message;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSubmitFailureCopyWith<ReportSubmitFailure> get copyWith =>
      _$ReportSubmitFailureCopyWithImpl<ReportSubmitFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportSubmitState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportSubmitState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ReportSubmitFailureCopyWith<$Res>
    implements $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitFailureCopyWith(
          ReportSubmitFailure value, $Res Function(ReportSubmitFailure) _then) =
      _$ReportSubmitFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ReportSubmitFailureCopyWithImpl<$Res>
    implements $ReportSubmitFailureCopyWith<$Res> {
  _$ReportSubmitFailureCopyWithImpl(this._self, this._then);

  final ReportSubmitFailure _self;
  final $Res Function(ReportSubmitFailure) _then;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ReportSubmitFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ReportValidationState implements DiagnosticableTreeMixin {
  Map<int, bool> get stepValidations;
  bool get fuelInvalid;
  bool get contentInvalid;

  /// Create a copy of ReportValidationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportValidationStateCopyWith<ReportValidationState> get copyWith =>
      _$ReportValidationStateCopyWithImpl<ReportValidationState>(
          this as ReportValidationState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportValidationState'))
      ..add(DiagnosticsProperty('stepValidations', stepValidations))
      ..add(DiagnosticsProperty('fuelInvalid', fuelInvalid))
      ..add(DiagnosticsProperty('contentInvalid', contentInvalid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportValidationState &&
            const DeepCollectionEquality()
                .equals(other.stepValidations, stepValidations) &&
            (identical(other.fuelInvalid, fuelInvalid) ||
                other.fuelInvalid == fuelInvalid) &&
            (identical(other.contentInvalid, contentInvalid) ||
                other.contentInvalid == contentInvalid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stepValidations),
      fuelInvalid,
      contentInvalid);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportValidationState(stepValidations: $stepValidations, fuelInvalid: $fuelInvalid, contentInvalid: $contentInvalid)';
  }
}

/// @nodoc
abstract mixin class $ReportValidationStateCopyWith<$Res> {
  factory $ReportValidationStateCopyWith(ReportValidationState value,
          $Res Function(ReportValidationState) _then) =
      _$ReportValidationStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<int, bool> stepValidations, bool fuelInvalid, bool contentInvalid});
}

/// @nodoc
class _$ReportValidationStateCopyWithImpl<$Res>
    implements $ReportValidationStateCopyWith<$Res> {
  _$ReportValidationStateCopyWithImpl(this._self, this._then);

  final ReportValidationState _self;
  final $Res Function(ReportValidationState) _then;

  /// Create a copy of ReportValidationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepValidations = null,
    Object? fuelInvalid = null,
    Object? contentInvalid = null,
  }) {
    return _then(_self.copyWith(
      stepValidations: null == stepValidations
          ? _self.stepValidations
          : stepValidations // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      fuelInvalid: null == fuelInvalid
          ? _self.fuelInvalid
          : fuelInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      contentInvalid: null == contentInvalid
          ? _self.contentInvalid
          : contentInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportValidationState].
extension ReportValidationStatePatterns on ReportValidationState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReportValidationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReportValidationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReportValidationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<int, bool> stepValidations, bool fuelInvalid,
            bool contentInvalid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState() when $default != null:
        return $default(
            _that.stepValidations, _that.fuelInvalid, _that.contentInvalid);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<int, bool> stepValidations, bool fuelInvalid,
            bool contentInvalid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState():
        return $default(
            _that.stepValidations, _that.fuelInvalid, _that.contentInvalid);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<int, bool> stepValidations, bool fuelInvalid,
            bool contentInvalid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportValidationState() when $default != null:
        return $default(
            _that.stepValidations, _that.fuelInvalid, _that.contentInvalid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportValidationState
    with DiagnosticableTreeMixin
    implements ReportValidationState {
  _ReportValidationState(
      {final Map<int, bool> stepValidations = const {},
      this.fuelInvalid = false,
      this.contentInvalid = false})
      : _stepValidations = stepValidations;

  final Map<int, bool> _stepValidations;
  @override
  @JsonKey()
  Map<int, bool> get stepValidations {
    if (_stepValidations is EqualUnmodifiableMapView) return _stepValidations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stepValidations);
  }

  @override
  @JsonKey()
  final bool fuelInvalid;
  @override
  @JsonKey()
  final bool contentInvalid;

  /// Create a copy of ReportValidationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportValidationStateCopyWith<_ReportValidationState> get copyWith =>
      __$ReportValidationStateCopyWithImpl<_ReportValidationState>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReportValidationState'))
      ..add(DiagnosticsProperty('stepValidations', stepValidations))
      ..add(DiagnosticsProperty('fuelInvalid', fuelInvalid))
      ..add(DiagnosticsProperty('contentInvalid', contentInvalid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportValidationState &&
            const DeepCollectionEquality()
                .equals(other._stepValidations, _stepValidations) &&
            (identical(other.fuelInvalid, fuelInvalid) ||
                other.fuelInvalid == fuelInvalid) &&
            (identical(other.contentInvalid, contentInvalid) ||
                other.contentInvalid == contentInvalid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stepValidations),
      fuelInvalid,
      contentInvalid);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportValidationState(stepValidations: $stepValidations, fuelInvalid: $fuelInvalid, contentInvalid: $contentInvalid)';
  }
}

/// @nodoc
abstract mixin class _$ReportValidationStateCopyWith<$Res>
    implements $ReportValidationStateCopyWith<$Res> {
  factory _$ReportValidationStateCopyWith(_ReportValidationState value,
          $Res Function(_ReportValidationState) _then) =
      __$ReportValidationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<int, bool> stepValidations, bool fuelInvalid, bool contentInvalid});
}

/// @nodoc
class __$ReportValidationStateCopyWithImpl<$Res>
    implements _$ReportValidationStateCopyWith<$Res> {
  __$ReportValidationStateCopyWithImpl(this._self, this._then);

  final _ReportValidationState _self;
  final $Res Function(_ReportValidationState) _then;

  /// Create a copy of ReportValidationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stepValidations = null,
    Object? fuelInvalid = null,
    Object? contentInvalid = null,
  }) {
    return _then(_ReportValidationState(
      stepValidations: null == stepValidations
          ? _self._stepValidations
          : stepValidations // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      fuelInvalid: null == fuelInvalid
          ? _self.fuelInvalid
          : fuelInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      contentInvalid: null == contentInvalid
          ? _self.contentInvalid
          : contentInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$TripFilterState implements DiagnosticableTreeMixin {
  List<TripCategory> get categories;
  List<TripStep> get steps;
  List<TripRegulation> get regulations;

  /// Create a copy of TripFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripFilterStateCopyWith<TripFilterState> get copyWith =>
      _$TripFilterStateCopyWithImpl<TripFilterState>(
          this as TripFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TripFilterState'))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('regulations', regulations));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripFilterState &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            const DeepCollectionEquality()
                .equals(other.regulations, regulations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(steps),
      const DeepCollectionEquality().hash(regulations));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripFilterState(categories: $categories, steps: $steps, regulations: $regulations)';
  }
}

/// @nodoc
abstract mixin class $TripFilterStateCopyWith<$Res> {
  factory $TripFilterStateCopyWith(
          TripFilterState value, $Res Function(TripFilterState) _then) =
      _$TripFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TripCategory> categories,
      List<TripStep> steps,
      List<TripRegulation> regulations});
}

/// @nodoc
class _$TripFilterStateCopyWithImpl<$Res>
    implements $TripFilterStateCopyWith<$Res> {
  _$TripFilterStateCopyWithImpl(this._self, this._then);

  final TripFilterState _self;
  final $Res Function(TripFilterState) _then;

  /// Create a copy of TripFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? steps = null,
    Object? regulations = null,
  }) {
    return _then(_self.copyWith(
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TripCategory>,
      steps: null == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TripStep>,
      regulations: null == regulations
          ? _self.regulations
          : regulations // ignore: cast_nullable_to_non_nullable
              as List<TripRegulation>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripFilterState].
extension TripFilterStatePatterns on TripFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TripFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TripFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TripFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<TripCategory> categories, List<TripStep> steps,
            List<TripRegulation> regulations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripFilterState() when $default != null:
        return $default(_that.categories, _that.steps, _that.regulations);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<TripCategory> categories, List<TripStep> steps,
            List<TripRegulation> regulations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFilterState():
        return $default(_that.categories, _that.steps, _that.regulations);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<TripCategory> categories, List<TripStep> steps,
            List<TripRegulation> regulations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFilterState() when $default != null:
        return $default(_that.categories, _that.steps, _that.regulations);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TripFilterState with DiagnosticableTreeMixin implements TripFilterState {
  _TripFilterState(
      {final List<TripCategory> categories = const [],
      final List<TripStep> steps = const [],
      final List<TripRegulation> regulations = const []})
      : _categories = categories,
        _steps = steps,
        _regulations = regulations;

  final List<TripCategory> _categories;
  @override
  @JsonKey()
  List<TripCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<TripStep> _steps;
  @override
  @JsonKey()
  List<TripStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  final List<TripRegulation> _regulations;
  @override
  @JsonKey()
  List<TripRegulation> get regulations {
    if (_regulations is EqualUnmodifiableListView) return _regulations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regulations);
  }

  /// Create a copy of TripFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripFilterStateCopyWith<_TripFilterState> get copyWith =>
      __$TripFilterStateCopyWithImpl<_TripFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TripFilterState'))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('regulations', regulations));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripFilterState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other._regulations, _regulations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_regulations));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripFilterState(categories: $categories, steps: $steps, regulations: $regulations)';
  }
}

/// @nodoc
abstract mixin class _$TripFilterStateCopyWith<$Res>
    implements $TripFilterStateCopyWith<$Res> {
  factory _$TripFilterStateCopyWith(
          _TripFilterState value, $Res Function(_TripFilterState) _then) =
      __$TripFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TripCategory> categories,
      List<TripStep> steps,
      List<TripRegulation> regulations});
}

/// @nodoc
class __$TripFilterStateCopyWithImpl<$Res>
    implements _$TripFilterStateCopyWith<$Res> {
  __$TripFilterStateCopyWithImpl(this._self, this._then);

  final _TripFilterState _self;
  final $Res Function(_TripFilterState) _then;

  /// Create a copy of TripFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
    Object? steps = null,
    Object? regulations = null,
  }) {
    return _then(_TripFilterState(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TripCategory>,
      steps: null == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TripStep>,
      regulations: null == regulations
          ? _self._regulations
          : regulations // ignore: cast_nullable_to_non_nullable
              as List<TripRegulation>,
    ));
  }
}

/// @nodoc
mixin _$TripPreviewState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState()';
  }
}

/// @nodoc
class $TripPreviewStateCopyWith<$Res> {
  $TripPreviewStateCopyWith(
      TripPreviewState _, $Res Function(TripPreviewState) __);
}

/// Adds pattern-matching-related methods to [TripPreviewState].
extension TripPreviewStatePatterns on TripPreviewState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TripPreviewIdle value)? idle,
    TResult Function(TripPreviewLoading value)? loading,
    TResult Function(TripPreviewRendering value)? rendering,
    TResult Function(TripPreviewSuccess value)? success,
    TResult Function(TripPreviewFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle() when idle != null:
        return idle(_that);
      case TripPreviewLoading() when loading != null:
        return loading(_that);
      case TripPreviewRendering() when rendering != null:
        return rendering(_that);
      case TripPreviewSuccess() when success != null:
        return success(_that);
      case TripPreviewFailed() when failed != null:
        return failed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TripPreviewIdle value) idle,
    required TResult Function(TripPreviewLoading value) loading,
    required TResult Function(TripPreviewRendering value) rendering,
    required TResult Function(TripPreviewSuccess value) success,
    required TResult Function(TripPreviewFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle():
        return idle(_that);
      case TripPreviewLoading():
        return loading(_that);
      case TripPreviewRendering():
        return rendering(_that);
      case TripPreviewSuccess():
        return success(_that);
      case TripPreviewFailed():
        return failed(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TripPreviewIdle value)? idle,
    TResult? Function(TripPreviewLoading value)? loading,
    TResult? Function(TripPreviewRendering value)? rendering,
    TResult? Function(TripPreviewSuccess value)? success,
    TResult? Function(TripPreviewFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle() when idle != null:
        return idle(_that);
      case TripPreviewLoading() when loading != null:
        return loading(_that);
      case TripPreviewRendering() when rendering != null:
        return rendering(_that);
      case TripPreviewSuccess() when success != null:
        return success(_that);
      case TripPreviewFailed() when failed != null:
        return failed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? rendering,
    TResult Function()? success,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle() when idle != null:
        return idle();
      case TripPreviewLoading() when loading != null:
        return loading();
      case TripPreviewRendering() when rendering != null:
        return rendering();
      case TripPreviewSuccess() when success != null:
        return success();
      case TripPreviewFailed() when failed != null:
        return failed();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() rendering,
    required TResult Function() success,
    required TResult Function() failed,
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle():
        return idle();
      case TripPreviewLoading():
        return loading();
      case TripPreviewRendering():
        return rendering();
      case TripPreviewSuccess():
        return success();
      case TripPreviewFailed():
        return failed();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? rendering,
    TResult? Function()? success,
    TResult? Function()? failed,
  }) {
    final _that = this;
    switch (_that) {
      case TripPreviewIdle() when idle != null:
        return idle();
      case TripPreviewLoading() when loading != null:
        return loading();
      case TripPreviewRendering() when rendering != null:
        return rendering();
      case TripPreviewSuccess() when success != null:
        return success();
      case TripPreviewFailed() when failed != null:
        return failed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class TripPreviewIdle with DiagnosticableTreeMixin implements TripPreviewState {
  TripPreviewIdle();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState.idle()';
  }
}

/// @nodoc

class TripPreviewLoading
    with DiagnosticableTreeMixin
    implements TripPreviewState {
  TripPreviewLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState.loading()';
  }
}

/// @nodoc

class TripPreviewRendering
    with DiagnosticableTreeMixin
    implements TripPreviewState {
  TripPreviewRendering();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState.rendering'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewRendering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState.rendering()';
  }
}

/// @nodoc

class TripPreviewSuccess
    with DiagnosticableTreeMixin
    implements TripPreviewState {
  TripPreviewSuccess();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState.success'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState.success()';
  }
}

/// @nodoc

class TripPreviewFailed
    with DiagnosticableTreeMixin
    implements TripPreviewState {
  TripPreviewFailed();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TripPreviewState.failed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripPreviewFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripPreviewState.failed()';
  }
}

/// @nodoc
mixin _$TripStepState implements DiagnosticableTreeMixin {
  int get currentIndex;

  /// Create a copy of TripStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripStepStateCopyWith<TripStepState> get copyWith =>
      _$TripStepStateCopyWithImpl<TripStepState>(
          this as TripStepState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TripStepState'))
      ..add(DiagnosticsProperty('currentIndex', currentIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripStepState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripStepState(currentIndex: $currentIndex)';
  }
}

/// @nodoc
abstract mixin class $TripStepStateCopyWith<$Res> {
  factory $TripStepStateCopyWith(
          TripStepState value, $Res Function(TripStepState) _then) =
      _$TripStepStateCopyWithImpl;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$TripStepStateCopyWithImpl<$Res>
    implements $TripStepStateCopyWith<$Res> {
  _$TripStepStateCopyWithImpl(this._self, this._then);

  final TripStepState _self;
  final $Res Function(TripStepState) _then;

  /// Create a copy of TripStepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_self.copyWith(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripStepState].
extension TripStepStatePatterns on TripStepState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TripStepState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripStepState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TripStepState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStepState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TripStepState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStepState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int currentIndex)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripStepState() when $default != null:
        return $default(_that.currentIndex);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int currentIndex) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStepState():
        return $default(_that.currentIndex);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int currentIndex)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStepState() when $default != null:
        return $default(_that.currentIndex);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TripStepState with DiagnosticableTreeMixin implements TripStepState {
  _TripStepState({this.currentIndex = 0});

  @override
  @JsonKey()
  final int currentIndex;

  /// Create a copy of TripStepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripStepStateCopyWith<_TripStepState> get copyWith =>
      __$TripStepStateCopyWithImpl<_TripStepState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TripStepState'))
      ..add(DiagnosticsProperty('currentIndex', currentIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripStepState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripStepState(currentIndex: $currentIndex)';
  }
}

/// @nodoc
abstract mixin class _$TripStepStateCopyWith<$Res>
    implements $TripStepStateCopyWith<$Res> {
  factory _$TripStepStateCopyWith(
          _TripStepState value, $Res Function(_TripStepState) _then) =
      __$TripStepStateCopyWithImpl;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$TripStepStateCopyWithImpl<$Res>
    implements _$TripStepStateCopyWith<$Res> {
  __$TripStepStateCopyWithImpl(this._self, this._then);

  final _TripStepState _self;
  final $Res Function(_TripStepState) _then;

  /// Create a copy of TripStepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_TripStepState(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UserFilterState implements DiagnosticableTreeMixin {
  String? get search;
  UserDepartment? get department;
  UserPosition? get position;
  List<UserDepartment> get departmentItems;
  List<UserPosition> get positionItems;

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserFilterStateCopyWith<UserFilterState> get copyWith =>
      _$UserFilterStateCopyWithImpl<UserFilterState>(
          this as UserFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UserFilterState'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('department', department))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('departmentItems', departmentItems))
      ..add(DiagnosticsProperty('positionItems', positionItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality()
                .equals(other.departmentItems, departmentItems) &&
            const DeepCollectionEquality()
                .equals(other.positionItems, positionItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      search,
      department,
      position,
      const DeepCollectionEquality().hash(departmentItems),
      const DeepCollectionEquality().hash(positionItems));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserFilterState(search: $search, department: $department, position: $position, departmentItems: $departmentItems, positionItems: $positionItems)';
  }
}

/// @nodoc
abstract mixin class $UserFilterStateCopyWith<$Res> {
  factory $UserFilterStateCopyWith(
          UserFilterState value, $Res Function(UserFilterState) _then) =
      _$UserFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String? search,
      UserDepartment? department,
      UserPosition? position,
      List<UserDepartment> departmentItems,
      List<UserPosition> positionItems});

  $UserDepartmentCopyWith<$Res>? get department;
  $UserPositionCopyWith<$Res>? get position;
}

/// @nodoc
class _$UserFilterStateCopyWithImpl<$Res>
    implements $UserFilterStateCopyWith<$Res> {
  _$UserFilterStateCopyWithImpl(this._self, this._then);

  final UserFilterState _self;
  final $Res Function(UserFilterState) _then;

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? department = freezed,
    Object? position = freezed,
    Object? departmentItems = null,
    Object? positionItems = null,
  }) {
    return _then(_self.copyWith(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as UserDepartment?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as UserPosition?,
      departmentItems: null == departmentItems
          ? _self.departmentItems
          : departmentItems // ignore: cast_nullable_to_non_nullable
              as List<UserDepartment>,
      positionItems: null == positionItems
          ? _self.positionItems
          : positionItems // ignore: cast_nullable_to_non_nullable
              as List<UserPosition>,
    ));
  }

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
      return null;
    }

    return $UserDepartmentCopyWith<$Res>(_self.department!, (value) {
      return _then(_self.copyWith(department: value));
    });
  }

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPositionCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $UserPositionCopyWith<$Res>(_self.position!, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserFilterState].
extension UserFilterStatePatterns on UserFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? search,
            UserDepartment? department,
            UserPosition? position,
            List<UserDepartment> departmentItems,
            List<UserPosition> positionItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFilterState() when $default != null:
        return $default(_that.search, _that.department, _that.position,
            _that.departmentItems, _that.positionItems);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? search,
            UserDepartment? department,
            UserPosition? position,
            List<UserDepartment> departmentItems,
            List<UserPosition> positionItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFilterState():
        return $default(_that.search, _that.department, _that.position,
            _that.departmentItems, _that.positionItems);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? search,
            UserDepartment? department,
            UserPosition? position,
            List<UserDepartment> departmentItems,
            List<UserPosition> positionItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFilterState() when $default != null:
        return $default(_that.search, _that.department, _that.position,
            _that.departmentItems, _that.positionItems);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserFilterState with DiagnosticableTreeMixin implements UserFilterState {
  _UserFilterState(
      {this.search,
      this.department,
      this.position,
      final List<UserDepartment> departmentItems = const [],
      final List<UserPosition> positionItems = const []})
      : _departmentItems = departmentItems,
        _positionItems = positionItems;

  @override
  final String? search;
  @override
  final UserDepartment? department;
  @override
  final UserPosition? position;
  final List<UserDepartment> _departmentItems;
  @override
  @JsonKey()
  List<UserDepartment> get departmentItems {
    if (_departmentItems is EqualUnmodifiableListView) return _departmentItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departmentItems);
  }

  final List<UserPosition> _positionItems;
  @override
  @JsonKey()
  List<UserPosition> get positionItems {
    if (_positionItems is EqualUnmodifiableListView) return _positionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positionItems);
  }

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserFilterStateCopyWith<_UserFilterState> get copyWith =>
      __$UserFilterStateCopyWithImpl<_UserFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UserFilterState'))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('department', department))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('departmentItems', departmentItems))
      ..add(DiagnosticsProperty('positionItems', positionItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality()
                .equals(other._departmentItems, _departmentItems) &&
            const DeepCollectionEquality()
                .equals(other._positionItems, _positionItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      search,
      department,
      position,
      const DeepCollectionEquality().hash(_departmentItems),
      const DeepCollectionEquality().hash(_positionItems));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserFilterState(search: $search, department: $department, position: $position, departmentItems: $departmentItems, positionItems: $positionItems)';
  }
}

/// @nodoc
abstract mixin class _$UserFilterStateCopyWith<$Res>
    implements $UserFilterStateCopyWith<$Res> {
  factory _$UserFilterStateCopyWith(
          _UserFilterState value, $Res Function(_UserFilterState) _then) =
      __$UserFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? search,
      UserDepartment? department,
      UserPosition? position,
      List<UserDepartment> departmentItems,
      List<UserPosition> positionItems});

  @override
  $UserDepartmentCopyWith<$Res>? get department;
  @override
  $UserPositionCopyWith<$Res>? get position;
}

/// @nodoc
class __$UserFilterStateCopyWithImpl<$Res>
    implements _$UserFilterStateCopyWith<$Res> {
  __$UserFilterStateCopyWithImpl(this._self, this._then);

  final _UserFilterState _self;
  final $Res Function(_UserFilterState) _then;

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = freezed,
    Object? department = freezed,
    Object? position = freezed,
    Object? departmentItems = null,
    Object? positionItems = null,
  }) {
    return _then(_UserFilterState(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as UserDepartment?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as UserPosition?,
      departmentItems: null == departmentItems
          ? _self._departmentItems
          : departmentItems // ignore: cast_nullable_to_non_nullable
              as List<UserDepartment>,
      positionItems: null == positionItems
          ? _self._positionItems
          : positionItems // ignore: cast_nullable_to_non_nullable
              as List<UserPosition>,
    ));
  }

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
      return null;
    }

    return $UserDepartmentCopyWith<$Res>(_self.department!, (value) {
      return _then(_self.copyWith(department: value));
    });
  }

  /// Create a copy of UserFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPositionCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $UserPositionCopyWith<$Res>(_self.position!, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

/// @nodoc
mixin _$UserListState implements DiagnosticableTreeMixin {
  List<User> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserListStateCopyWith<UserListState> get copyWith =>
      _$UserListStateCopyWithImpl<UserListState>(
          this as UserListState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UserListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserListState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $UserListStateCopyWith<$Res> {
  factory $UserListStateCopyWith(
          UserListState value, $Res Function(UserListState) _then) =
      _$UserListStateCopyWithImpl;
  @useResult
  $Res call({List<User> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$UserListStateCopyWithImpl<$Res>
    implements $UserListStateCopyWith<$Res> {
  _$UserListStateCopyWithImpl(this._self, this._then);

  final UserListState _self;
  final $Res Function(UserListState) _then;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserListState].
extension UserListStatePatterns on UserListState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserListState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserListState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserListState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<User> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<User> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserListState():
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<User> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserListState with DiagnosticableTreeMixin implements UserListState {
  _UserListState(
      {final List<User> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<User> _items;
  @override
  @JsonKey()
  List<User> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool hasReachEnd;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserListStateCopyWith<_UserListState> get copyWith =>
      __$UserListStateCopyWithImpl<_UserListState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UserListState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasReachEnd, hasReachEnd) ||
                other.hasReachEnd == hasReachEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, hasReachEnd);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$UserListStateCopyWith<$Res>
    implements $UserListStateCopyWith<$Res> {
  factory _$UserListStateCopyWith(
          _UserListState value, $Res Function(_UserListState) _then) =
      __$UserListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<User> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$UserListStateCopyWithImpl<$Res>
    implements _$UserListStateCopyWith<$Res> {
  __$UserListStateCopyWithImpl(this._self, this._then);

  final _UserListState _self;
  final $Res Function(_UserListState) _then;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_UserListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachEnd: null == hasReachEnd
          ? _self.hasReachEnd
          : hasReachEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$WorkFilterState implements DiagnosticableTreeMixin {
  String? get view;

  /// Create a copy of WorkFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkFilterStateCopyWith<WorkFilterState> get copyWith =>
      _$WorkFilterStateCopyWithImpl<WorkFilterState>(
          this as WorkFilterState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WorkFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class $WorkFilterStateCopyWith<$Res> {
  factory $WorkFilterStateCopyWith(
          WorkFilterState value, $Res Function(WorkFilterState) _then) =
      _$WorkFilterStateCopyWithImpl;
  @useResult
  $Res call({String? view});
}

/// @nodoc
class _$WorkFilterStateCopyWithImpl<$Res>
    implements $WorkFilterStateCopyWith<$Res> {
  _$WorkFilterStateCopyWithImpl(this._self, this._then);

  final WorkFilterState _self;
  final $Res Function(WorkFilterState) _then;

  /// Create a copy of WorkFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_self.copyWith(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkFilterState].
extension WorkFilterStatePatterns on WorkFilterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WorkFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WorkFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WorkFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? view)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? view) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState():
        return $default(_that.view);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? view)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkFilterState() when $default != null:
        return $default(_that.view);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkFilterState with DiagnosticableTreeMixin implements WorkFilterState {
  _WorkFilterState({this.view});

  @override
  final String? view;

  /// Create a copy of WorkFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkFilterStateCopyWith<_WorkFilterState> get copyWith =>
      __$WorkFilterStateCopyWithImpl<_WorkFilterState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WorkFilterState'))
      ..add(DiagnosticsProperty('view', view));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkFilterState(view: $view)';
  }
}

/// @nodoc
abstract mixin class _$WorkFilterStateCopyWith<$Res>
    implements $WorkFilterStateCopyWith<$Res> {
  factory _$WorkFilterStateCopyWith(
          _WorkFilterState value, $Res Function(_WorkFilterState) _then) =
      __$WorkFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? view});
}

/// @nodoc
class __$WorkFilterStateCopyWithImpl<$Res>
    implements _$WorkFilterStateCopyWith<$Res> {
  __$WorkFilterStateCopyWithImpl(this._self, this._then);

  final _WorkFilterState _self;
  final $Res Function(_WorkFilterState) _then;

  /// Create a copy of WorkFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_WorkFilterState(
      view: freezed == view
          ? _self.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
