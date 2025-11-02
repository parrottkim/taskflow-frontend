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
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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

class AuthInitial implements AuthState {
  const AuthInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class AuthUnauthenticated implements AuthState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthUnauthenticated &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
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

class AuthAuthenticated implements AuthState {
  const AuthAuthenticated({required this.user});

  final User user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith =>
      _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);

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
  String toString() {
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

class AuthRequest implements AuthState {
  const AuthRequest();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.request()';
  }
}

/// @nodoc

class AuthPending implements AuthState {
  const AuthPending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.pending()';
  }
}

/// @nodoc

class AuthForbidden implements AuthState {
  const AuthForbidden();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthForbidden);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.forbidden()';
  }
}

/// @nodoc

class AuthConflict implements AuthState {
  const AuthConflict();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthConflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.conflict()';
  }
}

/// @nodoc

class AuthFailed implements AuthState {
  const AuthFailed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.failed()';
  }
}

/// @nodoc
mixin _$CalendarState {
  List<Schedule> get items;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      _$CalendarStateCopyWithImpl<CalendarState>(
          this as CalendarState, _$identity);

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
  String toString() {
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

class _CalendarState implements CalendarState {
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
  String toString() {
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
mixin _$DateSelectionState {
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
  String toString() {
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

class _DateSelectionState implements DateSelectionState {
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
  String toString() {
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
mixin _$LatestUpdateState {
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
  String toString() {
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

class _LatestUpdateState implements LatestUpdateState {
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
  String toString() {
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
mixin _$ProjectStatsState {
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
  String toString() {
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

class _ProjectStatsState implements ProjectStatsState {
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
  String toString() {
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
mixin _$SummaryState {
  ProjectSummary get summary;

  /// Create a copy of SummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SummaryStateCopyWith<SummaryState> get copyWith =>
      _$SummaryStateCopyWithImpl<SummaryState>(
          this as SummaryState, _$identity);

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
  String toString() {
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

class _SummaryState implements SummaryState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SummaryState &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @override
  String toString() {
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
mixin _$WorldMapState {
  List<ClientCount> get items;

  /// Create a copy of WorldMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorldMapStateCopyWith<WorldMapState> get copyWith =>
      _$WorldMapStateCopyWithImpl<WorldMapState>(
          this as WorldMapState, _$identity);

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
  String toString() {
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

class _WorldMapState implements WorldMapState {
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
  String toString() {
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
mixin _$ErrorState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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

class ErrorInitial implements ErrorState {
  const ErrorInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ErrorState.initial()';
  }
}

/// @nodoc

class ErrorBadRequest implements ErrorState {
  const ErrorBadRequest({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorBadRequestCopyWith<ErrorBadRequest> get copyWith =>
      _$ErrorBadRequestCopyWithImpl<ErrorBadRequest>(this, _$identity);

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
  String toString() {
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

class ErrorUnauthorized implements ErrorState {
  const ErrorUnauthorized({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorUnauthorizedCopyWith<ErrorUnauthorized> get copyWith =>
      _$ErrorUnauthorizedCopyWithImpl<ErrorUnauthorized>(this, _$identity);

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
  String toString() {
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

class ErrorForbidden implements ErrorState {
  const ErrorForbidden({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorForbiddenCopyWith<ErrorForbidden> get copyWith =>
      _$ErrorForbiddenCopyWithImpl<ErrorForbidden>(this, _$identity);

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
  String toString() {
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

class ErrorNotFound implements ErrorState {
  const ErrorNotFound({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorNotFoundCopyWith<ErrorNotFound> get copyWith =>
      _$ErrorNotFoundCopyWithImpl<ErrorNotFound>(this, _$identity);

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
  String toString() {
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

class ErrorConflict implements ErrorState {
  const ErrorConflict({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorConflictCopyWith<ErrorConflict> get copyWith =>
      _$ErrorConflictCopyWithImpl<ErrorConflict>(this, _$identity);

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
  String toString() {
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

class ErrorNotDefined implements ErrorState {
  const ErrorNotDefined({required this.message});

  final String message;

  /// Create a copy of ErrorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorNotDefinedCopyWith<ErrorNotDefined> get copyWith =>
      _$ErrorNotDefinedCopyWithImpl<ErrorNotDefined>(this, _$identity);

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
  String toString() {
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
mixin _$IssueDetailState {
  Issue get issue;

  /// Create a copy of IssueDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueDetailStateCopyWith<IssueDetailState> get copyWith =>
      _$IssueDetailStateCopyWithImpl<IssueDetailState>(
          this as IssueDetailState, _$identity);

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
  String toString() {
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

class _IssueDetailState implements IssueDetailState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueDetailState &&
            (identical(other.issue, issue) || other.issue == issue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issue);

  @override
  String toString() {
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
mixin _$IssueFilterState {
  List<TransactionItemCategory> get transactionCategories;

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueFilterStateCopyWith<IssueFilterState> get copyWith =>
      _$IssueFilterStateCopyWithImpl<IssueFilterState>(
          this as IssueFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueFilterState &&
            const DeepCollectionEquality()
                .equals(other.transactionCategories, transactionCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(transactionCategories));

  @override
  String toString() {
    return 'IssueFilterState(transactionCategories: $transactionCategories)';
  }
}

/// @nodoc
abstract mixin class $IssueFilterStateCopyWith<$Res> {
  factory $IssueFilterStateCopyWith(
          IssueFilterState value, $Res Function(IssueFilterState) _then) =
      _$IssueFilterStateCopyWithImpl;
  @useResult
  $Res call({List<TransactionItemCategory> transactionCategories});
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
  }) {
    return _then(_self.copyWith(
      transactionCategories: null == transactionCategories
          ? _self.transactionCategories
          : transactionCategories // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemCategory>,
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
    TResult Function(List<TransactionItemCategory> transactionCategories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that.transactionCategories);
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
    TResult Function(List<TransactionItemCategory> transactionCategories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState():
        return $default(_that.transactionCategories);
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
    TResult? Function(List<TransactionItemCategory> transactionCategories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueFilterState() when $default != null:
        return $default(_that.transactionCategories);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IssueFilterState implements IssueFilterState {
  _IssueFilterState(
      {final List<TransactionItemCategory> transactionCategories = const []})
      : _transactionCategories = transactionCategories;

  final List<TransactionItemCategory> _transactionCategories;
  @override
  @JsonKey()
  List<TransactionItemCategory> get transactionCategories {
    if (_transactionCategories is EqualUnmodifiableListView)
      return _transactionCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionCategories);
  }

  /// Create a copy of IssueFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueFilterStateCopyWith<_IssueFilterState> get copyWith =>
      __$IssueFilterStateCopyWithImpl<_IssueFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueFilterState &&
            const DeepCollectionEquality()
                .equals(other._transactionCategories, _transactionCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactionCategories));

  @override
  String toString() {
    return 'IssueFilterState(transactionCategories: $transactionCategories)';
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
  $Res call({List<TransactionItemCategory> transactionCategories});
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
  }) {
    return _then(_IssueFilterState(
      transactionCategories: null == transactionCategories
          ? _self._transactionCategories
          : transactionCategories // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemCategory>,
    ));
  }
}

/// @nodoc
mixin _$IssueFormState {
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
  String toString() {
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

class _IssueFormState implements IssueFormState {
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
  String toString() {
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

class IssueFormContract implements IssueFormState {
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
  String toString() {
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

class IssueFormKickoff implements IssueFormState {
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
  String toString() {
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

class IssueFormApproval implements IssueFormState {
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
  String toString() {
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

class IssueFormProcurement implements IssueFormState {
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
  String toString() {
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

class IssueFormTransaction implements IssueFormState {
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
  String toString() {
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

class IssueFormDeclaration implements IssueFormState {
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
  String toString() {
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

class IssueFormPayment implements IssueFormState {
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
  String toString() {
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
mixin _$IssueListState {
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
  String toString() {
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

class _IssueListState implements IssueListState {
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
  String toString() {
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
mixin _$IssueSubmitState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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
      case IssueSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class IssueSubmitIdle implements IssueSubmitState {
  const IssueSubmitIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IssueSubmitState.idle()';
  }
}

/// @nodoc

class IssueSubmitPending implements IssueSubmitState {
  const IssueSubmitPending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IssueSubmitState.pending()';
  }
}

/// @nodoc

class IssueSubmitSuccess implements IssueSubmitState {
  const IssueSubmitSuccess(this.issue);

  final Issue issue;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueSubmitSuccessCopyWith<IssueSubmitSuccess> get copyWith =>
      _$IssueSubmitSuccessCopyWithImpl<IssueSubmitSuccess>(this, _$identity);

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
  String toString() {
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

class IssueSubmitDeleted implements IssueSubmitState {
  const IssueSubmitDeleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IssueSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IssueSubmitState.deleted()';
  }
}

/// @nodoc

class IssueSubmitFailure implements IssueSubmitState {
  const IssueSubmitFailure(this.message);

  final String message;

  /// Create a copy of IssueSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueSubmitFailureCopyWith<IssueSubmitFailure> get copyWith =>
      _$IssueSubmitFailureCopyWithImpl<IssueSubmitFailure>(this, _$identity);

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
  String toString() {
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
mixin _$LocalState {
  bool get persistLogin;
  List<Keyword> get keywords;

  /// Create a copy of LocalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalStateCopyWith<LocalState> get copyWith =>
      _$LocalStateCopyWithImpl<LocalState>(this as LocalState, _$identity);

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
  String toString() {
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

class _LocalState implements LocalState {
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
  String toString() {
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
mixin _$ProjectDetailState {
  Project get item;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectDetailStateCopyWith<ProjectDetailState> get copyWith =>
      _$ProjectDetailStateCopyWithImpl<ProjectDetailState>(
          this as ProjectDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectDetailState &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProjectDetailState(item: $item)';
  }
}

/// @nodoc
abstract mixin class $ProjectDetailStateCopyWith<$Res> {
  factory $ProjectDetailStateCopyWith(
          ProjectDetailState value, $Res Function(ProjectDetailState) _then) =
      _$ProjectDetailStateCopyWithImpl;
  @useResult
  $Res call({Project item});

  $ProjectCopyWith<$Res> get item;
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
    Object? item = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get item {
    return $ProjectCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
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
    TResult Function(Project item)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that.item);
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
    TResult Function(Project item) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState():
        return $default(_that.item);
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
    TResult? Function(Project item)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectDetailState() when $default != null:
        return $default(_that.item);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProjectDetailState implements ProjectDetailState {
  _ProjectDetailState({required this.item});

  @override
  final Project item;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectDetailStateCopyWith<_ProjectDetailState> get copyWith =>
      __$ProjectDetailStateCopyWithImpl<_ProjectDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectDetailState &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProjectDetailState(item: $item)';
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
  $Res call({Project item});

  @override
  $ProjectCopyWith<$Res> get item;
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
    Object? item = null,
  }) {
    return _then(_ProjectDetailState(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get item {
    return $ProjectCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
mixin _$ProjectDetailFilterState {
  String? get view;

  /// Create a copy of ProjectDetailFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectDetailFilterStateCopyWith<ProjectDetailFilterState> get copyWith =>
      _$ProjectDetailFilterStateCopyWithImpl<ProjectDetailFilterState>(
          this as ProjectDetailFilterState, _$identity);

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
  String toString() {
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

class _ProjectDetailFilterState implements ProjectDetailFilterState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectDetailFilterState &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString() {
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
mixin _$ProjectFilterState {
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
  String toString() {
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

class _ProjectFilterState implements ProjectFilterState {
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
  String toString() {
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
mixin _$ProjectFormState {
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
  String toString() {
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

class _ProjectFormState implements ProjectFormState {
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
  String toString() {
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
mixin _$ProjectListState {
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
  String toString() {
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

class _ProjectListState implements ProjectListState {
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
  String toString() {
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
mixin _$ProjectSubmitState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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

class ProjectSubmitIdle implements ProjectSubmitState {
  const ProjectSubmitIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectSubmitState.idle()';
  }
}

/// @nodoc

class ProjectSubmitPending implements ProjectSubmitState {
  const ProjectSubmitPending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectSubmitState.pending()';
  }
}

/// @nodoc

class ProjectSubmitSuccess implements ProjectSubmitState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectSubmitSuccess &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @override
  String toString() {
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

class ProjectSubmitDeleted implements ProjectSubmitState {
  const ProjectSubmitDeleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProjectSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProjectSubmitState.deleted()';
  }
}

/// @nodoc

class ProjectSubmitFailure implements ProjectSubmitState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
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
mixin _$ScheduleFilterState {
  String? get search;
  DateTime? get start;
  DateTime? get end;
  List<ScheduleCategory> get categoryItems;

  /// Create a copy of ScheduleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleFilterStateCopyWith<ScheduleFilterState> get copyWith =>
      _$ScheduleFilterStateCopyWithImpl<ScheduleFilterState>(
          this as ScheduleFilterState, _$identity);

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
  String toString() {
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
      DateTime? start,
      DateTime? end,
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
    Object? start = freezed,
    Object? end = freezed,
    Object? categoryItems = null,
  }) {
    return _then(_self.copyWith(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    TResult Function(String? search, DateTime? start, DateTime? end,
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
    TResult Function(String? search, DateTime? start, DateTime? end,
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
    TResult? Function(String? search, DateTime? start, DateTime? end,
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

class _ScheduleFilterState implements ScheduleFilterState {
  _ScheduleFilterState(
      {this.search,
      this.start,
      this.end,
      final List<ScheduleCategory> categoryItems = const []})
      : _categoryItems = categoryItems;

  @override
  final String? search;
  @override
  final DateTime? start;
  @override
  final DateTime? end;
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
  String toString() {
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
      DateTime? start,
      DateTime? end,
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
    Object? start = freezed,
    Object? end = freezed,
    Object? categoryItems = null,
  }) {
    return _then(_ScheduleFilterState(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryItems: null == categoryItems
          ? _self._categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<ScheduleCategory>,
    ));
  }
}

/// @nodoc
mixin _$ScheduleFormState {
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
  String toString() {
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

class _ScheduleFormState implements ScheduleFormState {
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
  String toString() {
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
mixin _$ScheduleListState {
  List<Schedule> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleListStateCopyWith<ScheduleListState> get copyWith =>
      _$ScheduleListStateCopyWithImpl<ScheduleListState>(
          this as ScheduleListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleListState &&
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
  String toString() {
    return 'ScheduleListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $ScheduleListStateCopyWith<$Res> {
  factory $ScheduleListStateCopyWith(
          ScheduleListState value, $Res Function(ScheduleListState) _then) =
      _$ScheduleListStateCopyWithImpl;
  @useResult
  $Res call({List<Schedule> items, int page, int total, bool hasReachEnd});
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
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
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
    TResult Function(
            List<Schedule> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
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
            List<Schedule> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState():
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
            List<Schedule> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleListState implements ScheduleListState {
  _ScheduleListState(
      {final List<Schedule> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<Schedule> _items;
  @override
  @JsonKey()
  List<Schedule> get items {
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

  /// Create a copy of ScheduleListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleListStateCopyWith<_ScheduleListState> get copyWith =>
      __$ScheduleListStateCopyWithImpl<_ScheduleListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleListState &&
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
  String toString() {
    return 'ScheduleListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
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
  $Res call({List<Schedule> items, int page, int total, bool hasReachEnd});
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
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_ScheduleListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
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
mixin _$ScheduleSubmitState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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

class ScheduleSubmitIdle implements ScheduleSubmitState {
  ScheduleSubmitIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScheduleSubmitState.idle()';
  }
}

/// @nodoc

class ScheduleSubmitPending implements ScheduleSubmitState {
  ScheduleSubmitPending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScheduleSubmitState.pending()';
  }
}

/// @nodoc

class ScheduleSubmitSuccess implements ScheduleSubmitState {
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
  String toString() {
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

class ScheduleSubmitDeleted implements ScheduleSubmitState {
  ScheduleSubmitDeleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScheduleSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScheduleSubmitState.deleted()';
  }
}

/// @nodoc

class ScheduleSubmitFailure implements ScheduleSubmitState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
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
mixin _$SupplierSearchState {
  /// Serializes this SupplierSearchState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SupplierSearchState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
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
class SupplierSearchIdle implements SupplierSearchState {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SupplierSearchIdle);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SupplierSearchState.idle()';
  }
}

/// @nodoc
@JsonSerializable()
class SupplierSearchWaiting implements SupplierSearchState {
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
  String toString() {
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
class SupplierSearchResult implements SupplierSearchState {
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
  String toString() {
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
mixin _$TripFilterState {
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
  String toString() {
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

class _TripFilterState implements TripFilterState {
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
  String toString() {
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
mixin _$TripFormState {
  Schedule? get schedule;
  List<TripActualExpense> get expenses;
  List<TripRegulationRate> get rates;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripFormStateCopyWith<TripFormState> get copyWith =>
      _$TripFormStateCopyWithImpl<TripFormState>(
          this as TripFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripFormState &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other.expenses, expenses) &&
            const DeepCollectionEquality().equals(other.rates, rates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      schedule,
      const DeepCollectionEquality().hash(expenses),
      const DeepCollectionEquality().hash(rates));

  @override
  String toString() {
    return 'TripFormState(schedule: $schedule, expenses: $expenses, rates: $rates)';
  }
}

/// @nodoc
abstract mixin class $TripFormStateCopyWith<$Res> {
  factory $TripFormStateCopyWith(
          TripFormState value, $Res Function(TripFormState) _then) =
      _$TripFormStateCopyWithImpl;
  @useResult
  $Res call(
      {Schedule? schedule,
      List<TripActualExpense> expenses,
      List<TripRegulationRate> rates});

  $ScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$TripFormStateCopyWithImpl<$Res>
    implements $TripFormStateCopyWith<$Res> {
  _$TripFormStateCopyWithImpl(this._self, this._then);

  final TripFormState _self;
  final $Res Function(TripFormState) _then;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = freezed,
    Object? expenses = null,
    Object? rates = null,
  }) {
    return _then(_self.copyWith(
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      expenses: null == expenses
          ? _self.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TripActualExpense>,
      rates: null == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<TripRegulationRate>,
    ));
  }

  /// Create a copy of TripFormState
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

/// Adds pattern-matching-related methods to [TripFormState].
extension TripFormStatePatterns on TripFormState {
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
    TResult Function(TripFormDomestic value)? domestic,
    TResult Function(TripFormOverseas value)? overseas,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic() when domestic != null:
        return domestic(_that);
      case TripFormOverseas() when overseas != null:
        return overseas(_that);
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
    required TResult Function(TripFormDomestic value) domestic,
    required TResult Function(TripFormOverseas value) overseas,
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic():
        return domestic(_that);
      case TripFormOverseas():
        return overseas(_that);
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
    TResult? Function(TripFormDomestic value)? domestic,
    TResult? Function(TripFormOverseas value)? overseas,
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic() when domestic != null:
        return domestic(_that);
      case TripFormOverseas() when overseas != null:
        return overseas(_that);
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
    TResult Function(Schedule? schedule, List<TripActualExpense> expenses,
            List<TripRegulationRate> rates, TripFuelExpense? fuel)?
        domestic,
    TResult Function(Schedule? schedule, List<TripActualExpense> expenses,
            List<TripRegulationRate> rates, bool isDeducted)?
        overseas,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic() when domestic != null:
        return domestic(
            _that.schedule, _that.expenses, _that.rates, _that.fuel);
      case TripFormOverseas() when overseas != null:
        return overseas(
            _that.schedule, _that.expenses, _that.rates, _that.isDeducted);
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
    required TResult Function(
            Schedule? schedule,
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            TripFuelExpense? fuel)
        domestic,
    required TResult Function(
            Schedule? schedule,
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            bool isDeducted)
        overseas,
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic():
        return domestic(
            _that.schedule, _that.expenses, _that.rates, _that.fuel);
      case TripFormOverseas():
        return overseas(
            _that.schedule, _that.expenses, _that.rates, _that.isDeducted);
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
    TResult? Function(Schedule? schedule, List<TripActualExpense> expenses,
            List<TripRegulationRate> rates, TripFuelExpense? fuel)?
        domestic,
    TResult? Function(Schedule? schedule, List<TripActualExpense> expenses,
            List<TripRegulationRate> rates, bool isDeducted)?
        overseas,
  }) {
    final _that = this;
    switch (_that) {
      case TripFormDomestic() when domestic != null:
        return domestic(
            _that.schedule, _that.expenses, _that.rates, _that.fuel);
      case TripFormOverseas() when overseas != null:
        return overseas(
            _that.schedule, _that.expenses, _that.rates, _that.isDeducted);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TripFormDomestic implements TripFormState {
  TripFormDomestic(
      {this.schedule,
      final List<TripActualExpense> expenses = const [],
      final List<TripRegulationRate> rates = const [],
      this.fuel})
      : _expenses = expenses,
        _rates = rates;

  @override
  final Schedule? schedule;
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

  final TripFuelExpense? fuel;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripFormDomesticCopyWith<TripFormDomestic> get copyWith =>
      _$TripFormDomesticCopyWithImpl<TripFormDomestic>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripFormDomestic &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      schedule,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      fuel);

  @override
  String toString() {
    return 'TripFormState.domestic(schedule: $schedule, expenses: $expenses, rates: $rates, fuel: $fuel)';
  }
}

/// @nodoc
abstract mixin class $TripFormDomesticCopyWith<$Res>
    implements $TripFormStateCopyWith<$Res> {
  factory $TripFormDomesticCopyWith(
          TripFormDomestic value, $Res Function(TripFormDomestic) _then) =
      _$TripFormDomesticCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Schedule? schedule,
      List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      TripFuelExpense? fuel});

  @override
  $ScheduleCopyWith<$Res>? get schedule;
  $TripFuelExpenseCopyWith<$Res>? get fuel;
}

/// @nodoc
class _$TripFormDomesticCopyWithImpl<$Res>
    implements $TripFormDomesticCopyWith<$Res> {
  _$TripFormDomesticCopyWithImpl(this._self, this._then);

  final TripFormDomestic _self;
  final $Res Function(TripFormDomestic) _then;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schedule = freezed,
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
  }) {
    return _then(TripFormDomestic(
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
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
    ));
  }

  /// Create a copy of TripFormState
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

  /// Create a copy of TripFormState
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
}

/// @nodoc

class TripFormOverseas implements TripFormState {
  TripFormOverseas(
      {this.schedule,
      final List<TripActualExpense> expenses = const [],
      final List<TripRegulationRate> rates = const [],
      this.isDeducted = false})
      : _expenses = expenses,
        _rates = rates;

  @override
  final Schedule? schedule;
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

  @JsonKey()
  final bool isDeducted;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripFormOverseasCopyWith<TripFormOverseas> get copyWith =>
      _$TripFormOverseasCopyWithImpl<TripFormOverseas>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripFormOverseas &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      schedule,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      isDeducted);

  @override
  String toString() {
    return 'TripFormState.overseas(schedule: $schedule, expenses: $expenses, rates: $rates, isDeducted: $isDeducted)';
  }
}

/// @nodoc
abstract mixin class $TripFormOverseasCopyWith<$Res>
    implements $TripFormStateCopyWith<$Res> {
  factory $TripFormOverseasCopyWith(
          TripFormOverseas value, $Res Function(TripFormOverseas) _then) =
      _$TripFormOverseasCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Schedule? schedule,
      List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      bool isDeducted});

  @override
  $ScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$TripFormOverseasCopyWithImpl<$Res>
    implements $TripFormOverseasCopyWith<$Res> {
  _$TripFormOverseasCopyWithImpl(this._self, this._then);

  final TripFormOverseas _self;
  final $Res Function(TripFormOverseas) _then;

  /// Create a copy of TripFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schedule = freezed,
    Object? expenses = null,
    Object? rates = null,
    Object? isDeducted = null,
  }) {
    return _then(TripFormOverseas(
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      expenses: null == expenses
          ? _self._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<TripActualExpense>,
      rates: null == rates
          ? _self._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<TripRegulationRate>,
      isDeducted: null == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of TripFormState
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
mixin _$TripListState {
  List<Trip> get items;
  int get page;
  int get total;
  bool get hasReachEnd;

  /// Create a copy of TripListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripListStateCopyWith<TripListState> get copyWith =>
      _$TripListStateCopyWithImpl<TripListState>(
          this as TripListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripListState &&
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
  String toString() {
    return 'TripListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class $TripListStateCopyWith<$Res> {
  factory $TripListStateCopyWith(
          TripListState value, $Res Function(TripListState) _then) =
      _$TripListStateCopyWithImpl;
  @useResult
  $Res call({List<Trip> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class _$TripListStateCopyWithImpl<$Res>
    implements $TripListStateCopyWith<$Res> {
  _$TripListStateCopyWithImpl(this._self, this._then);

  final TripListState _self;
  final $Res Function(TripListState) _then;

  /// Create a copy of TripListState
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
              as List<Trip>,
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

/// Adds pattern-matching-related methods to [TripListState].
extension TripListStatePatterns on TripListState {
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
    TResult Function(_TripListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripListState() when $default != null:
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
    TResult Function(_TripListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripListState():
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
    TResult? Function(_TripListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripListState() when $default != null:
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
    TResult Function(List<Trip> items, int page, int total, bool hasReachEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripListState() when $default != null:
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
    TResult Function(List<Trip> items, int page, int total, bool hasReachEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripListState():
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
    TResult? Function(List<Trip> items, int page, int total, bool hasReachEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripListState() when $default != null:
        return $default(
            _that.items, _that.page, _that.total, _that.hasReachEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TripListState implements TripListState {
  _TripListState(
      {final List<Trip> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasReachEnd = false})
      : _items = items;

  final List<Trip> _items;
  @override
  @JsonKey()
  List<Trip> get items {
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

  /// Create a copy of TripListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripListStateCopyWith<_TripListState> get copyWith =>
      __$TripListStateCopyWithImpl<_TripListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripListState &&
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
  String toString() {
    return 'TripListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
  }
}

/// @nodoc
abstract mixin class _$TripListStateCopyWith<$Res>
    implements $TripListStateCopyWith<$Res> {
  factory _$TripListStateCopyWith(
          _TripListState value, $Res Function(_TripListState) _then) =
      __$TripListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Trip> items, int page, int total, bool hasReachEnd});
}

/// @nodoc
class __$TripListStateCopyWithImpl<$Res>
    implements _$TripListStateCopyWith<$Res> {
  __$TripListStateCopyWithImpl(this._self, this._then);

  final _TripListState _self;
  final $Res Function(_TripListState) _then;

  /// Create a copy of TripListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasReachEnd = null,
  }) {
    return _then(_TripListState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Trip>,
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
mixin _$TripStepState {
  int get currentIndex;

  /// Create a copy of TripStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripStepStateCopyWith<TripStepState> get copyWith =>
      _$TripStepStateCopyWithImpl<TripStepState>(
          this as TripStepState, _$identity);

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
  String toString() {
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

class _TripStepState implements TripStepState {
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
  String toString() {
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
mixin _$TripSubmitState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripSubmitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TripSubmitState()';
  }
}

/// @nodoc
class $TripSubmitStateCopyWith<$Res> {
  $TripSubmitStateCopyWith(
      TripSubmitState _, $Res Function(TripSubmitState) __);
}

/// Adds pattern-matching-related methods to [TripSubmitState].
extension TripSubmitStatePatterns on TripSubmitState {
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
    TResult Function(TripSubmitIdle value)? idle,
    TResult Function(TripSubmitPending value)? pending,
    TResult Function(TripSubmitSuccess value)? success,
    TResult Function(TripSubmitDeleted value)? deleted,
    TResult Function(TripSubmitFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle() when idle != null:
        return idle(_that);
      case TripSubmitPending() when pending != null:
        return pending(_that);
      case TripSubmitSuccess() when success != null:
        return success(_that);
      case TripSubmitDeleted() when deleted != null:
        return deleted(_that);
      case TripSubmitFailure() when failure != null:
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
    required TResult Function(TripSubmitIdle value) idle,
    required TResult Function(TripSubmitPending value) pending,
    required TResult Function(TripSubmitSuccess value) success,
    required TResult Function(TripSubmitDeleted value) deleted,
    required TResult Function(TripSubmitFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle():
        return idle(_that);
      case TripSubmitPending():
        return pending(_that);
      case TripSubmitSuccess():
        return success(_that);
      case TripSubmitDeleted():
        return deleted(_that);
      case TripSubmitFailure():
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
    TResult? Function(TripSubmitIdle value)? idle,
    TResult? Function(TripSubmitPending value)? pending,
    TResult? Function(TripSubmitSuccess value)? success,
    TResult? Function(TripSubmitDeleted value)? deleted,
    TResult? Function(TripSubmitFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle() when idle != null:
        return idle(_that);
      case TripSubmitPending() when pending != null:
        return pending(_that);
      case TripSubmitSuccess() when success != null:
        return success(_that);
      case TripSubmitDeleted() when deleted != null:
        return deleted(_that);
      case TripSubmitFailure() when failure != null:
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
    TResult Function(Trip trip)? success,
    TResult Function()? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle() when idle != null:
        return idle();
      case TripSubmitPending() when pending != null:
        return pending();
      case TripSubmitSuccess() when success != null:
        return success(_that.trip);
      case TripSubmitDeleted() when deleted != null:
        return deleted();
      case TripSubmitFailure() when failure != null:
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
    required TResult Function(Trip trip) success,
    required TResult Function() deleted,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle():
        return idle();
      case TripSubmitPending():
        return pending();
      case TripSubmitSuccess():
        return success(_that.trip);
      case TripSubmitDeleted():
        return deleted();
      case TripSubmitFailure():
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
    TResult? Function(Trip trip)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TripSubmitIdle() when idle != null:
        return idle();
      case TripSubmitPending() when pending != null:
        return pending();
      case TripSubmitSuccess() when success != null:
        return success(_that.trip);
      case TripSubmitDeleted() when deleted != null:
        return deleted();
      case TripSubmitFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TripSubmitIdle implements TripSubmitState {
  const TripSubmitIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripSubmitIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TripSubmitState.idle()';
  }
}

/// @nodoc

class TripSubmitPending implements TripSubmitState {
  const TripSubmitPending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripSubmitPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TripSubmitState.pending()';
  }
}

/// @nodoc

class TripSubmitSuccess implements TripSubmitState {
  const TripSubmitSuccess(this.trip);

  final Trip trip;

  /// Create a copy of TripSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripSubmitSuccessCopyWith<TripSubmitSuccess> get copyWith =>
      _$TripSubmitSuccessCopyWithImpl<TripSubmitSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripSubmitSuccess &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trip);

  @override
  String toString() {
    return 'TripSubmitState.success(trip: $trip)';
  }
}

/// @nodoc
abstract mixin class $TripSubmitSuccessCopyWith<$Res>
    implements $TripSubmitStateCopyWith<$Res> {
  factory $TripSubmitSuccessCopyWith(
          TripSubmitSuccess value, $Res Function(TripSubmitSuccess) _then) =
      _$TripSubmitSuccessCopyWithImpl;
  @useResult
  $Res call({Trip trip});

  $TripCopyWith<$Res> get trip;
}

/// @nodoc
class _$TripSubmitSuccessCopyWithImpl<$Res>
    implements $TripSubmitSuccessCopyWith<$Res> {
  _$TripSubmitSuccessCopyWithImpl(this._self, this._then);

  final TripSubmitSuccess _self;
  final $Res Function(TripSubmitSuccess) _then;

  /// Create a copy of TripSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? trip = null,
  }) {
    return _then(TripSubmitSuccess(
      null == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trip,
    ));
  }

  /// Create a copy of TripSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripCopyWith<$Res> get trip {
    return $TripCopyWith<$Res>(_self.trip, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// @nodoc

class TripSubmitDeleted implements TripSubmitState {
  const TripSubmitDeleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TripSubmitDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TripSubmitState.deleted()';
  }
}

/// @nodoc

class TripSubmitFailure implements TripSubmitState {
  const TripSubmitFailure(this.message);

  final String message;

  /// Create a copy of TripSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripSubmitFailureCopyWith<TripSubmitFailure> get copyWith =>
      _$TripSubmitFailureCopyWithImpl<TripSubmitFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripSubmitFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TripSubmitState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TripSubmitFailureCopyWith<$Res>
    implements $TripSubmitStateCopyWith<$Res> {
  factory $TripSubmitFailureCopyWith(
          TripSubmitFailure value, $Res Function(TripSubmitFailure) _then) =
      _$TripSubmitFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TripSubmitFailureCopyWithImpl<$Res>
    implements $TripSubmitFailureCopyWith<$Res> {
  _$TripSubmitFailureCopyWithImpl(this._self, this._then);

  final TripSubmitFailure _self;
  final $Res Function(TripSubmitFailure) _then;

  /// Create a copy of TripSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TripSubmitFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserFilterState {
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
  String toString() {
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

class _UserFilterState implements UserFilterState {
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
  String toString() {
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
mixin _$UserListState {
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
  String toString() {
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

class _UserListState implements UserListState {
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
  String toString() {
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

// dart format on
