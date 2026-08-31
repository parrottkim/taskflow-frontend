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
mixin _$AccountFilterState implements DiagnosticableTreeMixin {

 String? get view;
/// Create a copy of AccountFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountFilterStateCopyWith<AccountFilterState> get copyWith => _$AccountFilterStateCopyWithImpl<AccountFilterState>(this as AccountFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AccountFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AccountFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class $AccountFilterStateCopyWith<$Res>  {
  factory $AccountFilterStateCopyWith(AccountFilterState value, $Res Function(AccountFilterState) _then) = _$AccountFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view
});




}
/// @nodoc
class _$AccountFilterStateCopyWithImpl<$Res>
    implements $AccountFilterStateCopyWith<$Res> {
  _$AccountFilterStateCopyWithImpl(this._self, this._then);

  final AccountFilterState _self;
  final $Res Function(AccountFilterState) _then;

/// Create a copy of AccountFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountFilterState].
extension AccountFilterStatePatterns on AccountFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountFilterState value)  $default,){
final _that = this;
switch (_that) {
case _AccountFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountFilterState() when $default != null:
return $default(_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view)  $default,) {final _that = this;
switch (_that) {
case _AccountFilterState():
return $default(_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view)?  $default,) {final _that = this;
switch (_that) {
case _AccountFilterState() when $default != null:
return $default(_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _AccountFilterState with DiagnosticableTreeMixin implements AccountFilterState {
   _AccountFilterState({this.view});
  

@override final  String? view;

/// Create a copy of AccountFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountFilterStateCopyWith<_AccountFilterState> get copyWith => __$AccountFilterStateCopyWithImpl<_AccountFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AccountFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AccountFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class _$AccountFilterStateCopyWith<$Res> implements $AccountFilterStateCopyWith<$Res> {
  factory _$AccountFilterStateCopyWith(_AccountFilterState value, $Res Function(_AccountFilterState) _then) = __$AccountFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view
});




}
/// @nodoc
class __$AccountFilterStateCopyWithImpl<$Res>
    implements _$AccountFilterStateCopyWith<$Res> {
  __$AccountFilterStateCopyWithImpl(this._self, this._then);

  final _AccountFilterState _self;
  final $Res Function(_AccountFilterState) _then;

/// Create a copy of AccountFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,}) {
  return _then(_AccountFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$AddressState implements DiagnosticableTreeMixin {

 String get search; int get page; int get total; List<Address> get items; bool get isLoading; bool get hasReachEnd;
/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressStateCopyWith<AddressState> get copyWith => _$AddressStateCopyWithImpl<AddressState>(this as AddressState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddressState'))
    ..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressState&&(identical(other.search, search) || other.search == search)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,search,page,total,const DeepCollectionEquality().hash(items),isLoading,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddressState(search: $search, page: $page, total: $total, items: $items, isLoading: $isLoading, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $AddressStateCopyWith<$Res>  {
  factory $AddressStateCopyWith(AddressState value, $Res Function(AddressState) _then) = _$AddressStateCopyWithImpl;
@useResult
$Res call({
 String search, int page, int total, List<Address> items, bool isLoading, bool hasReachEnd
});




}
/// @nodoc
class _$AddressStateCopyWithImpl<$Res>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._self, this._then);

  final AddressState _self;
  final $Res Function(AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,Object? page = null,Object? total = null,Object? items = null,Object? isLoading = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Address>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressState].
extension AddressStatePatterns on AddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressState value)  $default,){
final _that = this;
switch (_that) {
case _AddressState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressState value)?  $default,){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String search,  int page,  int total,  List<Address> items,  bool isLoading,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.search,_that.page,_that.total,_that.items,_that.isLoading,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String search,  int page,  int total,  List<Address> items,  bool isLoading,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _AddressState():
return $default(_that.search,_that.page,_that.total,_that.items,_that.isLoading,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String search,  int page,  int total,  List<Address> items,  bool isLoading,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.search,_that.page,_that.total,_that.items,_that.isLoading,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _AddressState with DiagnosticableTreeMixin implements AddressState {
   _AddressState({this.search = '', this.page = 1, this.total = 0, final  List<Address> items = const [], this.isLoading = false, this.hasReachEnd = false}): _items = items;
  

@override@JsonKey() final  String search;
@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
 final  List<Address> _items;
@override@JsonKey() List<Address> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressStateCopyWith<_AddressState> get copyWith => __$AddressStateCopyWithImpl<_AddressState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddressState'))
    ..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressState&&(identical(other.search, search) || other.search == search)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,search,page,total,const DeepCollectionEquality().hash(_items),isLoading,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddressState(search: $search, page: $page, total: $total, items: $items, isLoading: $isLoading, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$AddressStateCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory _$AddressStateCopyWith(_AddressState value, $Res Function(_AddressState) _then) = __$AddressStateCopyWithImpl;
@override @useResult
$Res call({
 String search, int page, int total, List<Address> items, bool isLoading, bool hasReachEnd
});




}
/// @nodoc
class __$AddressStateCopyWithImpl<$Res>
    implements _$AddressStateCopyWith<$Res> {
  __$AddressStateCopyWithImpl(this._self, this._then);

  final _AddressState _self;
  final $Res Function(_AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? page = null,Object? total = null,Object? items = null,Object? isLoading = null,Object? hasReachEnd = null,}) {
  return _then(_AddressState(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Address>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthUnauthenticated value)?  unauthenticated,TResult Function( AuthAuthenticated value)?  authenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthUnauthenticated value)  unauthenticated,required TResult Function( AuthAuthenticated value)  authenticated,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthUnauthenticated():
return unauthenticated(_that);case AuthAuthenticated():
return authenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthUnauthenticated value)?  unauthenticated,TResult? Function( AuthAuthenticated value)?  authenticated,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String email)?  unauthenticated,TResult Function( User user)?  authenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.email);case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String email)  unauthenticated,required TResult Function( User user)  authenticated,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthUnauthenticated():
return unauthenticated(_that.email);case AuthAuthenticated():
return authenticated(_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String email)?  unauthenticated,TResult? Function( User user)?  authenticated,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.email);case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial with DiagnosticableTreeMixin implements AuthState {
  const AuthInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthUnauthenticated with DiagnosticableTreeMixin implements AuthState {
  const AuthUnauthenticated({this.email = ''});
  

@JsonKey() final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith => _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.unauthenticated'))
    ..add(DiagnosticsProperty('email', email));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.unauthenticated(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthUnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(AuthUnauthenticated value, $Res Function(AuthUnauthenticated) _then) = _$AuthUnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthUnauthenticatedCopyWithImpl<$Res>
    implements $AuthUnauthenticatedCopyWith<$Res> {
  _$AuthUnauthenticatedCopyWithImpl(this._self, this._then);

  final AuthUnauthenticated _self;
  final $Res Function(AuthUnauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthUnauthenticated(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthAuthenticated with DiagnosticableTreeMixin implements AuthState {
  const AuthAuthenticated({required this.user});
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


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
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
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
mixin _$LoginState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginIdle value)?  idle,TResult Function( LoginPending value)?  pending,TResult Function( LoginForbidden value)?  forbidden,TResult Function( LoginFailed value)?  failed,TResult Function( LoginNetworkError value)?  networkError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginIdle() when idle != null:
return idle(_that);case LoginPending() when pending != null:
return pending(_that);case LoginForbidden() when forbidden != null:
return forbidden(_that);case LoginFailed() when failed != null:
return failed(_that);case LoginNetworkError() when networkError != null:
return networkError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginIdle value)  idle,required TResult Function( LoginPending value)  pending,required TResult Function( LoginForbidden value)  forbidden,required TResult Function( LoginFailed value)  failed,required TResult Function( LoginNetworkError value)  networkError,}){
final _that = this;
switch (_that) {
case LoginIdle():
return idle(_that);case LoginPending():
return pending(_that);case LoginForbidden():
return forbidden(_that);case LoginFailed():
return failed(_that);case LoginNetworkError():
return networkError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginIdle value)?  idle,TResult? Function( LoginPending value)?  pending,TResult? Function( LoginForbidden value)?  forbidden,TResult? Function( LoginFailed value)?  failed,TResult? Function( LoginNetworkError value)?  networkError,}){
final _that = this;
switch (_that) {
case LoginIdle() when idle != null:
return idle(_that);case LoginPending() when pending != null:
return pending(_that);case LoginForbidden() when forbidden != null:
return forbidden(_that);case LoginFailed() when failed != null:
return failed(_that);case LoginNetworkError() when networkError != null:
return networkError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function()?  forbidden,TResult Function()?  failed,TResult Function()?  networkError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginIdle() when idle != null:
return idle();case LoginPending() when pending != null:
return pending();case LoginForbidden() when forbidden != null:
return forbidden();case LoginFailed() when failed != null:
return failed();case LoginNetworkError() when networkError != null:
return networkError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function()  forbidden,required TResult Function()  failed,required TResult Function()  networkError,}) {final _that = this;
switch (_that) {
case LoginIdle():
return idle();case LoginPending():
return pending();case LoginForbidden():
return forbidden();case LoginFailed():
return failed();case LoginNetworkError():
return networkError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function()?  forbidden,TResult? Function()?  failed,TResult? Function()?  networkError,}) {final _that = this;
switch (_that) {
case LoginIdle() when idle != null:
return idle();case LoginPending() when pending != null:
return pending();case LoginForbidden() when forbidden != null:
return forbidden();case LoginFailed() when failed != null:
return failed();case LoginNetworkError() when networkError != null:
return networkError();case _:
  return null;

}
}

}

/// @nodoc


class LoginIdle with DiagnosticableTreeMixin implements LoginState {
  const LoginIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.idle()';
}


}




/// @nodoc


class LoginPending with DiagnosticableTreeMixin implements LoginState {
  const LoginPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.pending()';
}


}




/// @nodoc


class LoginForbidden with DiagnosticableTreeMixin implements LoginState {
  const LoginForbidden();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.forbidden'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginForbidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.forbidden()';
}


}




/// @nodoc


class LoginFailed with DiagnosticableTreeMixin implements LoginState {
  const LoginFailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.failed()';
}


}




/// @nodoc


class LoginNetworkError with DiagnosticableTreeMixin implements LoginState {
  const LoginNetworkError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.networkError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginNetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.networkError()';
}


}




/// @nodoc
mixin _$TokenState implements DiagnosticableTreeMixin {

 String? get token;
/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenStateCopyWith<TokenState> get copyWith => _$TokenStateCopyWithImpl<TokenState>(this as TokenState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TokenState'))
    ..add(DiagnosticsProperty('token', token));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenState&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TokenState(token: $token)';
}


}

/// @nodoc
abstract mixin class $TokenStateCopyWith<$Res>  {
  factory $TokenStateCopyWith(TokenState value, $Res Function(TokenState) _then) = _$TokenStateCopyWithImpl;
@useResult
$Res call({
 String? token
});




}
/// @nodoc
class _$TokenStateCopyWithImpl<$Res>
    implements $TokenStateCopyWith<$Res> {
  _$TokenStateCopyWithImpl(this._self, this._then);

  final TokenState _self;
  final $Res Function(TokenState) _then;

/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenState].
extension TokenStatePatterns on TokenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenState value)  $default,){
final _that = this;
switch (_that) {
case _TokenState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenState value)?  $default,){
final _that = this;
switch (_that) {
case _TokenState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenState() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token)  $default,) {final _that = this;
switch (_that) {
case _TokenState():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token)?  $default,) {final _that = this;
switch (_that) {
case _TokenState() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc


class _TokenState with DiagnosticableTreeMixin implements TokenState {
   _TokenState({this.token});
  

@override final  String? token;

/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenStateCopyWith<_TokenState> get copyWith => __$TokenStateCopyWithImpl<_TokenState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TokenState'))
    ..add(DiagnosticsProperty('token', token));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenState&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TokenState(token: $token)';
}


}

/// @nodoc
abstract mixin class _$TokenStateCopyWith<$Res> implements $TokenStateCopyWith<$Res> {
  factory _$TokenStateCopyWith(_TokenState value, $Res Function(_TokenState) _then) = __$TokenStateCopyWithImpl;
@override @useResult
$Res call({
 String? token
});




}
/// @nodoc
class __$TokenStateCopyWithImpl<$Res>
    implements _$TokenStateCopyWith<$Res> {
  __$TokenStateCopyWithImpl(this._self, this._then);

  final _TokenState _self;
  final $Res Function(_TokenState) _then;

/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,}) {
  return _then(_TokenState(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DateSelectionState implements DiagnosticableTreeMixin {

 DateTime get start; DateTime get end;
/// Create a copy of DateSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateSelectionStateCopyWith<DateSelectionState> get copyWith => _$DateSelectionStateCopyWithImpl<DateSelectionState>(this as DateSelectionState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DateSelectionState'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateSelectionState&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DateSelectionState(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $DateSelectionStateCopyWith<$Res>  {
  factory $DateSelectionStateCopyWith(DateSelectionState value, $Res Function(DateSelectionState) _then) = _$DateSelectionStateCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$DateSelectionStateCopyWithImpl<$Res>
    implements $DateSelectionStateCopyWith<$Res> {
  _$DateSelectionStateCopyWithImpl(this._self, this._then);

  final DateSelectionState _self;
  final $Res Function(DateSelectionState) _then;

/// Create a copy of DateSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DateSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DateSelectionState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DateSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _DateSelectionState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DateSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _DateSelectionState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DateSelectionState() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _DateSelectionState():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _DateSelectionState() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _DateSelectionState with DiagnosticableTreeMixin implements DateSelectionState {
   _DateSelectionState({required this.start, required this.end});
  

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of DateSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateSelectionStateCopyWith<_DateSelectionState> get copyWith => __$DateSelectionStateCopyWithImpl<_DateSelectionState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DateSelectionState'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateSelectionState&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DateSelectionState(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$DateSelectionStateCopyWith<$Res> implements $DateSelectionStateCopyWith<$Res> {
  factory _$DateSelectionStateCopyWith(_DateSelectionState value, $Res Function(_DateSelectionState) _then) = __$DateSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$DateSelectionStateCopyWithImpl<$Res>
    implements _$DateSelectionStateCopyWith<$Res> {
  __$DateSelectionStateCopyWithImpl(this._self, this._then);

  final _DateSelectionState _self;
  final $Res Function(_DateSelectionState) _then;

/// Create a copy of DateSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_DateSelectionState(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$DataFilterState implements DiagnosticableTreeMixin {

 String? get view;
/// Create a copy of DataFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataFilterStateCopyWith<DataFilterState> get copyWith => _$DataFilterStateCopyWithImpl<DataFilterState>(this as DataFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DataFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DataFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class $DataFilterStateCopyWith<$Res>  {
  factory $DataFilterStateCopyWith(DataFilterState value, $Res Function(DataFilterState) _then) = _$DataFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view
});




}
/// @nodoc
class _$DataFilterStateCopyWithImpl<$Res>
    implements $DataFilterStateCopyWith<$Res> {
  _$DataFilterStateCopyWithImpl(this._self, this._then);

  final DataFilterState _self;
  final $Res Function(DataFilterState) _then;

/// Create a copy of DataFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DataFilterState].
extension DataFilterStatePatterns on DataFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataFilterState value)  $default,){
final _that = this;
switch (_that) {
case _DataFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _DataFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataFilterState() when $default != null:
return $default(_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view)  $default,) {final _that = this;
switch (_that) {
case _DataFilterState():
return $default(_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view)?  $default,) {final _that = this;
switch (_that) {
case _DataFilterState() when $default != null:
return $default(_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _DataFilterState with DiagnosticableTreeMixin implements DataFilterState {
   _DataFilterState({this.view});
  

@override final  String? view;

/// Create a copy of DataFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataFilterStateCopyWith<_DataFilterState> get copyWith => __$DataFilterStateCopyWithImpl<_DataFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DataFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DataFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class _$DataFilterStateCopyWith<$Res> implements $DataFilterStateCopyWith<$Res> {
  factory _$DataFilterStateCopyWith(_DataFilterState value, $Res Function(_DataFilterState) _then) = __$DataFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view
});




}
/// @nodoc
class __$DataFilterStateCopyWithImpl<$Res>
    implements _$DataFilterStateCopyWith<$Res> {
  __$DataFilterStateCopyWithImpl(this._self, this._then);

  final _DataFilterState _self;
  final $Res Function(_DataFilterState) _then;

/// Create a copy of DataFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,}) {
  return _then(_DataFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DocumentFilterState implements DiagnosticableTreeMixin {

 List<int> get folders; DocumentSortOption get sort; SortDirection get order; String? get search;
/// Create a copy of DocumentFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentFilterStateCopyWith<DocumentFilterState> get copyWith => _$DocumentFilterStateCopyWithImpl<DocumentFilterState>(this as DocumentFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFilterState'))
    ..add(DiagnosticsProperty('folders', folders))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentFilterState&&const DeepCollectionEquality().equals(other.folders, folders)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(folders),sort,order,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFilterState(folders: $folders, sort: $sort, order: $order, search: $search)';
}


}

/// @nodoc
abstract mixin class $DocumentFilterStateCopyWith<$Res>  {
  factory $DocumentFilterStateCopyWith(DocumentFilterState value, $Res Function(DocumentFilterState) _then) = _$DocumentFilterStateCopyWithImpl;
@useResult
$Res call({
 List<int> folders, DocumentSortOption sort, SortDirection order, String? search
});




}
/// @nodoc
class _$DocumentFilterStateCopyWithImpl<$Res>
    implements $DocumentFilterStateCopyWith<$Res> {
  _$DocumentFilterStateCopyWithImpl(this._self, this._then);

  final DocumentFilterState _self;
  final $Res Function(DocumentFilterState) _then;

/// Create a copy of DocumentFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folders = null,Object? sort = null,Object? order = null,Object? search = freezed,}) {
  return _then(_self.copyWith(
folders: null == folders ? _self.folders : folders // ignore: cast_nullable_to_non_nullable
as List<int>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as DocumentSortOption,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentFilterState].
extension DocumentFilterStatePatterns on DocumentFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentFilterState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> folders,  DocumentSortOption sort,  SortDirection order,  String? search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentFilterState() when $default != null:
return $default(_that.folders,_that.sort,_that.order,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> folders,  DocumentSortOption sort,  SortDirection order,  String? search)  $default,) {final _that = this;
switch (_that) {
case _DocumentFilterState():
return $default(_that.folders,_that.sort,_that.order,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> folders,  DocumentSortOption sort,  SortDirection order,  String? search)?  $default,) {final _that = this;
switch (_that) {
case _DocumentFilterState() when $default != null:
return $default(_that.folders,_that.sort,_that.order,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentFilterState with DiagnosticableTreeMixin implements DocumentFilterState {
   _DocumentFilterState({final  List<int> folders = const [1], this.sort = DocumentSortOption.recent, this.order = SortDirection.desc, this.search}): _folders = folders;
  

 final  List<int> _folders;
@override@JsonKey() List<int> get folders {
  if (_folders is EqualUnmodifiableListView) return _folders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folders);
}

@override@JsonKey() final  DocumentSortOption sort;
@override@JsonKey() final  SortDirection order;
@override final  String? search;

/// Create a copy of DocumentFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentFilterStateCopyWith<_DocumentFilterState> get copyWith => __$DocumentFilterStateCopyWithImpl<_DocumentFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFilterState'))
    ..add(DiagnosticsProperty('folders', folders))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentFilterState&&const DeepCollectionEquality().equals(other._folders, _folders)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_folders),sort,order,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFilterState(folders: $folders, sort: $sort, order: $order, search: $search)';
}


}

/// @nodoc
abstract mixin class _$DocumentFilterStateCopyWith<$Res> implements $DocumentFilterStateCopyWith<$Res> {
  factory _$DocumentFilterStateCopyWith(_DocumentFilterState value, $Res Function(_DocumentFilterState) _then) = __$DocumentFilterStateCopyWithImpl;
@override @useResult
$Res call({
 List<int> folders, DocumentSortOption sort, SortDirection order, String? search
});




}
/// @nodoc
class __$DocumentFilterStateCopyWithImpl<$Res>
    implements _$DocumentFilterStateCopyWith<$Res> {
  __$DocumentFilterStateCopyWithImpl(this._self, this._then);

  final _DocumentFilterState _self;
  final $Res Function(_DocumentFilterState) _then;

/// Create a copy of DocumentFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folders = null,Object? sort = null,Object? order = null,Object? search = freezed,}) {
  return _then(_DocumentFilterState(
folders: null == folders ? _self._folders : folders // ignore: cast_nullable_to_non_nullable
as List<int>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as DocumentSortOption,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DocumentFormState implements DiagnosticableTreeMixin {

 String? get title; String? get content; int? get folderId; bool get fixed; List<DocumentAttachment> get attachments; List<XFile> get files;
/// Create a copy of DocumentFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentFormStateCopyWith<DocumentFormState> get copyWith => _$DocumentFormStateCopyWithImpl<DocumentFormState>(this as DocumentFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFormState'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('folderId', folderId))..add(DiagnosticsProperty('fixed', fixed))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentFormState&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.fixed, fixed) || other.fixed == fixed)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.files, files));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,folderId,fixed,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(files));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFormState(title: $title, content: $content, folderId: $folderId, fixed: $fixed, attachments: $attachments, files: $files)';
}


}

/// @nodoc
abstract mixin class $DocumentFormStateCopyWith<$Res>  {
  factory $DocumentFormStateCopyWith(DocumentFormState value, $Res Function(DocumentFormState) _then) = _$DocumentFormStateCopyWithImpl;
@useResult
$Res call({
 String? title, String? content, int? folderId, bool fixed, List<DocumentAttachment> attachments, List<XFile> files
});




}
/// @nodoc
class _$DocumentFormStateCopyWithImpl<$Res>
    implements $DocumentFormStateCopyWith<$Res> {
  _$DocumentFormStateCopyWithImpl(this._self, this._then);

  final DocumentFormState _self;
  final $Res Function(DocumentFormState) _then;

/// Create a copy of DocumentFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? content = freezed,Object? folderId = freezed,Object? fixed = null,Object? attachments = null,Object? files = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as int?,fixed: null == fixed ? _self.fixed : fixed // ignore: cast_nullable_to_non_nullable
as bool,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<DocumentAttachment>,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentFormState].
extension DocumentFormStatePatterns on DocumentFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentFormState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentFormState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? content,  int? folderId,  bool fixed,  List<DocumentAttachment> attachments,  List<XFile> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentFormState() when $default != null:
return $default(_that.title,_that.content,_that.folderId,_that.fixed,_that.attachments,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? content,  int? folderId,  bool fixed,  List<DocumentAttachment> attachments,  List<XFile> files)  $default,) {final _that = this;
switch (_that) {
case _DocumentFormState():
return $default(_that.title,_that.content,_that.folderId,_that.fixed,_that.attachments,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? content,  int? folderId,  bool fixed,  List<DocumentAttachment> attachments,  List<XFile> files)?  $default,) {final _that = this;
switch (_that) {
case _DocumentFormState() when $default != null:
return $default(_that.title,_that.content,_that.folderId,_that.fixed,_that.attachments,_that.files);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentFormState with DiagnosticableTreeMixin implements DocumentFormState {
   _DocumentFormState({this.title, this.content, this.folderId, this.fixed = false, final  List<DocumentAttachment> attachments = const <DocumentAttachment>[], final  List<XFile> files = const <XFile>[]}): _attachments = attachments,_files = files;
  

@override final  String? title;
@override final  String? content;
@override final  int? folderId;
@override@JsonKey() final  bool fixed;
 final  List<DocumentAttachment> _attachments;
@override@JsonKey() List<DocumentAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  List<XFile> _files;
@override@JsonKey() List<XFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of DocumentFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentFormStateCopyWith<_DocumentFormState> get copyWith => __$DocumentFormStateCopyWithImpl<_DocumentFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFormState'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('folderId', folderId))..add(DiagnosticsProperty('fixed', fixed))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentFormState&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.fixed, fixed) || other.fixed == fixed)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,folderId,fixed,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_files));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFormState(title: $title, content: $content, folderId: $folderId, fixed: $fixed, attachments: $attachments, files: $files)';
}


}

/// @nodoc
abstract mixin class _$DocumentFormStateCopyWith<$Res> implements $DocumentFormStateCopyWith<$Res> {
  factory _$DocumentFormStateCopyWith(_DocumentFormState value, $Res Function(_DocumentFormState) _then) = __$DocumentFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? content, int? folderId, bool fixed, List<DocumentAttachment> attachments, List<XFile> files
});




}
/// @nodoc
class __$DocumentFormStateCopyWithImpl<$Res>
    implements _$DocumentFormStateCopyWith<$Res> {
  __$DocumentFormStateCopyWithImpl(this._self, this._then);

  final _DocumentFormState _self;
  final $Res Function(_DocumentFormState) _then;

/// Create a copy of DocumentFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? content = freezed,Object? folderId = freezed,Object? fixed = null,Object? attachments = null,Object? files = null,}) {
  return _then(_DocumentFormState(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as int?,fixed: null == fixed ? _self.fixed : fixed // ignore: cast_nullable_to_non_nullable
as bool,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<DocumentAttachment>,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,
  ));
}


}

/// @nodoc
mixin _$DocumentListState implements DiagnosticableTreeMixin {

 List<DocumentListItem> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentListStateCopyWith<DocumentListState> get copyWith => _$DocumentListStateCopyWithImpl<DocumentListState>(this as DocumentListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $DocumentListStateCopyWith<$Res>  {
  factory $DocumentListStateCopyWith(DocumentListState value, $Res Function(DocumentListState) _then) = _$DocumentListStateCopyWithImpl;
@useResult
$Res call({
 List<DocumentListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$DocumentListStateCopyWithImpl<$Res>
    implements $DocumentListStateCopyWith<$Res> {
  _$DocumentListStateCopyWithImpl(this._self, this._then);

  final DocumentListState _self;
  final $Res Function(DocumentListState) _then;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DocumentListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentListState].
extension DocumentListStatePatterns on DocumentListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentListState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentListState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DocumentListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DocumentListItem> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _DocumentListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DocumentListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _DocumentListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentListState with DiagnosticableTreeMixin implements DocumentListState {
   _DocumentListState({final  List<DocumentListItem> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<DocumentListItem> _items;
@override@JsonKey() List<DocumentListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentListStateCopyWith<_DocumentListState> get copyWith => __$DocumentListStateCopyWithImpl<_DocumentListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$DocumentListStateCopyWith<$Res> implements $DocumentListStateCopyWith<$Res> {
  factory _$DocumentListStateCopyWith(_DocumentListState value, $Res Function(_DocumentListState) _then) = __$DocumentListStateCopyWithImpl;
@override @useResult
$Res call({
 List<DocumentListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$DocumentListStateCopyWithImpl<$Res>
    implements _$DocumentListStateCopyWith<$Res> {
  __$DocumentListStateCopyWithImpl(this._self, this._then);

  final _DocumentListState _self;
  final $Res Function(_DocumentListState) _then;

/// Create a copy of DocumentListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_DocumentListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DocumentListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$DocumentOptionsState implements DiagnosticableTreeMixin {

 List<DocumentFolder> get folderItems;
/// Create a copy of DocumentOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentOptionsStateCopyWith<DocumentOptionsState> get copyWith => _$DocumentOptionsStateCopyWithImpl<DocumentOptionsState>(this as DocumentOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentOptionsState'))
    ..add(DiagnosticsProperty('folderItems', folderItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentOptionsState&&const DeepCollectionEquality().equals(other.folderItems, folderItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(folderItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentOptionsState(folderItems: $folderItems)';
}


}

/// @nodoc
abstract mixin class $DocumentOptionsStateCopyWith<$Res>  {
  factory $DocumentOptionsStateCopyWith(DocumentOptionsState value, $Res Function(DocumentOptionsState) _then) = _$DocumentOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<DocumentFolder> folderItems
});




}
/// @nodoc
class _$DocumentOptionsStateCopyWithImpl<$Res>
    implements $DocumentOptionsStateCopyWith<$Res> {
  _$DocumentOptionsStateCopyWithImpl(this._self, this._then);

  final DocumentOptionsState _self;
  final $Res Function(DocumentOptionsState) _then;

/// Create a copy of DocumentOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folderItems = null,}) {
  return _then(_self.copyWith(
folderItems: null == folderItems ? _self.folderItems : folderItems // ignore: cast_nullable_to_non_nullable
as List<DocumentFolder>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentOptionsState].
extension DocumentOptionsStatePatterns on DocumentOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DocumentFolder> folderItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentOptionsState() when $default != null:
return $default(_that.folderItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DocumentFolder> folderItems)  $default,) {final _that = this;
switch (_that) {
case _DocumentOptionsState():
return $default(_that.folderItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DocumentFolder> folderItems)?  $default,) {final _that = this;
switch (_that) {
case _DocumentOptionsState() when $default != null:
return $default(_that.folderItems);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentOptionsState with DiagnosticableTreeMixin implements DocumentOptionsState {
   _DocumentOptionsState({final  List<DocumentFolder> folderItems = const []}): _folderItems = folderItems;
  

 final  List<DocumentFolder> _folderItems;
@override@JsonKey() List<DocumentFolder> get folderItems {
  if (_folderItems is EqualUnmodifiableListView) return _folderItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folderItems);
}


/// Create a copy of DocumentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentOptionsStateCopyWith<_DocumentOptionsState> get copyWith => __$DocumentOptionsStateCopyWithImpl<_DocumentOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentOptionsState'))
    ..add(DiagnosticsProperty('folderItems', folderItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentOptionsState&&const DeepCollectionEquality().equals(other._folderItems, _folderItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_folderItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentOptionsState(folderItems: $folderItems)';
}


}

/// @nodoc
abstract mixin class _$DocumentOptionsStateCopyWith<$Res> implements $DocumentOptionsStateCopyWith<$Res> {
  factory _$DocumentOptionsStateCopyWith(_DocumentOptionsState value, $Res Function(_DocumentOptionsState) _then) = __$DocumentOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<DocumentFolder> folderItems
});




}
/// @nodoc
class __$DocumentOptionsStateCopyWithImpl<$Res>
    implements _$DocumentOptionsStateCopyWith<$Res> {
  __$DocumentOptionsStateCopyWithImpl(this._self, this._then);

  final _DocumentOptionsState _self;
  final $Res Function(_DocumentOptionsState) _then;

/// Create a copy of DocumentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folderItems = null,}) {
  return _then(_DocumentOptionsState(
folderItems: null == folderItems ? _self._folderItems : folderItems // ignore: cast_nullable_to_non_nullable
as List<DocumentFolder>,
  ));
}


}

/// @nodoc
mixin _$DocumentSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState()';
}


}

/// @nodoc
class $DocumentSubmitStateCopyWith<$Res>  {
$DocumentSubmitStateCopyWith(DocumentSubmitState _, $Res Function(DocumentSubmitState) __);
}


/// Adds pattern-matching-related methods to [DocumentSubmitState].
extension DocumentSubmitStatePatterns on DocumentSubmitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DocumentSubmitIdle value)?  idle,TResult Function( DocumentSubmitPending value)?  pending,TResult Function( DocumentSubmitDocumentCreated value)?  documentCreated,TResult Function( DocumentSubmitDocumentUpdated value)?  documentUpdated,TResult Function( DocumentSubmitDocumentDeleted value)?  documentDeleted,TResult Function( DocumentSubmitFolderSuccess value)?  folderSuccess,TResult Function( DocumentSubmitMailed value)?  mailed,TResult Function( DocumentSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DocumentSubmitIdle() when idle != null:
return idle(_that);case DocumentSubmitPending() when pending != null:
return pending(_that);case DocumentSubmitDocumentCreated() when documentCreated != null:
return documentCreated(_that);case DocumentSubmitDocumentUpdated() when documentUpdated != null:
return documentUpdated(_that);case DocumentSubmitDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that);case DocumentSubmitFolderSuccess() when folderSuccess != null:
return folderSuccess(_that);case DocumentSubmitMailed() when mailed != null:
return mailed(_that);case DocumentSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DocumentSubmitIdle value)  idle,required TResult Function( DocumentSubmitPending value)  pending,required TResult Function( DocumentSubmitDocumentCreated value)  documentCreated,required TResult Function( DocumentSubmitDocumentUpdated value)  documentUpdated,required TResult Function( DocumentSubmitDocumentDeleted value)  documentDeleted,required TResult Function( DocumentSubmitFolderSuccess value)  folderSuccess,required TResult Function( DocumentSubmitMailed value)  mailed,required TResult Function( DocumentSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case DocumentSubmitIdle():
return idle(_that);case DocumentSubmitPending():
return pending(_that);case DocumentSubmitDocumentCreated():
return documentCreated(_that);case DocumentSubmitDocumentUpdated():
return documentUpdated(_that);case DocumentSubmitDocumentDeleted():
return documentDeleted(_that);case DocumentSubmitFolderSuccess():
return folderSuccess(_that);case DocumentSubmitMailed():
return mailed(_that);case DocumentSubmitFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DocumentSubmitIdle value)?  idle,TResult? Function( DocumentSubmitPending value)?  pending,TResult? Function( DocumentSubmitDocumentCreated value)?  documentCreated,TResult? Function( DocumentSubmitDocumentUpdated value)?  documentUpdated,TResult? Function( DocumentSubmitDocumentDeleted value)?  documentDeleted,TResult? Function( DocumentSubmitFolderSuccess value)?  folderSuccess,TResult? Function( DocumentSubmitMailed value)?  mailed,TResult? Function( DocumentSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DocumentSubmitIdle() when idle != null:
return idle(_that);case DocumentSubmitPending() when pending != null:
return pending(_that);case DocumentSubmitDocumentCreated() when documentCreated != null:
return documentCreated(_that);case DocumentSubmitDocumentUpdated() when documentUpdated != null:
return documentUpdated(_that);case DocumentSubmitDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that);case DocumentSubmitFolderSuccess() when folderSuccess != null:
return folderSuccess(_that);case DocumentSubmitMailed() when mailed != null:
return mailed(_that);case DocumentSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function()?  documentCreated,TResult Function()?  documentUpdated,TResult Function()?  documentDeleted,TResult Function()?  folderSuccess,TResult Function()?  mailed,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DocumentSubmitIdle() when idle != null:
return idle();case DocumentSubmitPending() when pending != null:
return pending();case DocumentSubmitDocumentCreated() when documentCreated != null:
return documentCreated();case DocumentSubmitDocumentUpdated() when documentUpdated != null:
return documentUpdated();case DocumentSubmitDocumentDeleted() when documentDeleted != null:
return documentDeleted();case DocumentSubmitFolderSuccess() when folderSuccess != null:
return folderSuccess();case DocumentSubmitMailed() when mailed != null:
return mailed();case DocumentSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function()  documentCreated,required TResult Function()  documentUpdated,required TResult Function()  documentDeleted,required TResult Function()  folderSuccess,required TResult Function()  mailed,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case DocumentSubmitIdle():
return idle();case DocumentSubmitPending():
return pending();case DocumentSubmitDocumentCreated():
return documentCreated();case DocumentSubmitDocumentUpdated():
return documentUpdated();case DocumentSubmitDocumentDeleted():
return documentDeleted();case DocumentSubmitFolderSuccess():
return folderSuccess();case DocumentSubmitMailed():
return mailed();case DocumentSubmitFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function()?  documentCreated,TResult? Function()?  documentUpdated,TResult? Function()?  documentDeleted,TResult? Function()?  folderSuccess,TResult? Function()?  mailed,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case DocumentSubmitIdle() when idle != null:
return idle();case DocumentSubmitPending() when pending != null:
return pending();case DocumentSubmitDocumentCreated() when documentCreated != null:
return documentCreated();case DocumentSubmitDocumentUpdated() when documentUpdated != null:
return documentUpdated();case DocumentSubmitDocumentDeleted() when documentDeleted != null:
return documentDeleted();case DocumentSubmitFolderSuccess() when folderSuccess != null:
return folderSuccess();case DocumentSubmitMailed() when mailed != null:
return mailed();case DocumentSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DocumentSubmitIdle with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.idle()';
}


}




/// @nodoc


class DocumentSubmitPending with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.pending()';
}


}




/// @nodoc


class DocumentSubmitDocumentCreated with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitDocumentCreated();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.documentCreated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitDocumentCreated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.documentCreated()';
}


}




/// @nodoc


class DocumentSubmitDocumentUpdated with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitDocumentUpdated();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.documentUpdated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitDocumentUpdated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.documentUpdated()';
}


}




/// @nodoc


class DocumentSubmitDocumentDeleted with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitDocumentDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.documentDeleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitDocumentDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.documentDeleted()';
}


}




/// @nodoc


class DocumentSubmitFolderSuccess with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitFolderSuccess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.folderSuccess'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitFolderSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.folderSuccess()';
}


}




/// @nodoc


class DocumentSubmitMailed with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitMailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.mailed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitMailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.mailed()';
}


}




/// @nodoc


class DocumentSubmitFailure with DiagnosticableTreeMixin implements DocumentSubmitState {
  const DocumentSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of DocumentSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentSubmitFailureCopyWith<DocumentSubmitFailure> get copyWith => _$DocumentSubmitFailureCopyWithImpl<DocumentSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $DocumentSubmitFailureCopyWith<$Res> implements $DocumentSubmitStateCopyWith<$Res> {
  factory $DocumentSubmitFailureCopyWith(DocumentSubmitFailure value, $Res Function(DocumentSubmitFailure) _then) = _$DocumentSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DocumentSubmitFailureCopyWithImpl<$Res>
    implements $DocumentSubmitFailureCopyWith<$Res> {
  _$DocumentSubmitFailureCopyWithImpl(this._self, this._then);

  final DocumentSubmitFailure _self;
  final $Res Function(DocumentSubmitFailure) _then;

/// Create a copy of DocumentSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DocumentSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DownloadState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DownloadState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DownloadState()';
}


}

/// @nodoc
class $DownloadStateCopyWith<$Res>  {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DownloadIdle value)?  idle,TResult Function( DownloadPending value)?  pending,TResult Function( DownloadSuccess value)?  success,TResult Function( DownloadFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DownloadIdle() when idle != null:
return idle(_that);case DownloadPending() when pending != null:
return pending(_that);case DownloadSuccess() when success != null:
return success(_that);case DownloadFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DownloadIdle value)  idle,required TResult Function( DownloadPending value)  pending,required TResult Function( DownloadSuccess value)  success,required TResult Function( DownloadFailed value)  failed,}){
final _that = this;
switch (_that) {
case DownloadIdle():
return idle(_that);case DownloadPending():
return pending(_that);case DownloadSuccess():
return success(_that);case DownloadFailed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DownloadIdle value)?  idle,TResult? Function( DownloadPending value)?  pending,TResult? Function( DownloadSuccess value)?  success,TResult? Function( DownloadFailed value)?  failed,}){
final _that = this;
switch (_that) {
case DownloadIdle() when idle != null:
return idle(_that);case DownloadPending() when pending != null:
return pending(_that);case DownloadSuccess() when success != null:
return success(_that);case DownloadFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function()?  success,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DownloadIdle() when idle != null:
return idle();case DownloadPending() when pending != null:
return pending();case DownloadSuccess() when success != null:
return success();case DownloadFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function()  success,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case DownloadIdle():
return idle();case DownloadPending():
return pending();case DownloadSuccess():
return success();case DownloadFailed():
return failed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function()?  success,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case DownloadIdle() when idle != null:
return idle();case DownloadPending() when pending != null:
return pending();case DownloadSuccess() when success != null:
return success();case DownloadFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class DownloadIdle with DiagnosticableTreeMixin implements DownloadState {
   DownloadIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DownloadState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DownloadState.idle()';
}


}




/// @nodoc


class DownloadPending with DiagnosticableTreeMixin implements DownloadState {
   DownloadPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DownloadState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DownloadState.pending()';
}


}




/// @nodoc


class DownloadSuccess with DiagnosticableTreeMixin implements DownloadState {
   DownloadSuccess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DownloadState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DownloadState.success()';
}


}




/// @nodoc


class DownloadFailed with DiagnosticableTreeMixin implements DownloadState {
   DownloadFailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DownloadState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DownloadState.failed()';
}


}




/// @nodoc
mixin _$DraftAutosaveState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftAutosaveState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftAutosaveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftAutosaveState()';
}


}

/// @nodoc
class $DraftAutosaveStateCopyWith<$Res>  {
$DraftAutosaveStateCopyWith(DraftAutosaveState _, $Res Function(DraftAutosaveState) __);
}


/// Adds pattern-matching-related methods to [DraftAutosaveState].
extension DraftAutosaveStatePatterns on DraftAutosaveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReportDraftAutosaveIdle value)?  idle,TResult Function( ReportDraftAutosaveSaving value)?  saving,TResult Function( ReportDraftAutosaveSaved value)?  saved,TResult Function( ReportDraftAutosaveFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle() when idle != null:
return idle(_that);case ReportDraftAutosaveSaving() when saving != null:
return saving(_that);case ReportDraftAutosaveSaved() when saved != null:
return saved(_that);case ReportDraftAutosaveFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReportDraftAutosaveIdle value)  idle,required TResult Function( ReportDraftAutosaveSaving value)  saving,required TResult Function( ReportDraftAutosaveSaved value)  saved,required TResult Function( ReportDraftAutosaveFailed value)  failed,}){
final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle():
return idle(_that);case ReportDraftAutosaveSaving():
return saving(_that);case ReportDraftAutosaveSaved():
return saved(_that);case ReportDraftAutosaveFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReportDraftAutosaveIdle value)?  idle,TResult? Function( ReportDraftAutosaveSaving value)?  saving,TResult? Function( ReportDraftAutosaveSaved value)?  saved,TResult? Function( ReportDraftAutosaveFailed value)?  failed,}){
final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle() when idle != null:
return idle(_that);case ReportDraftAutosaveSaving() when saving != null:
return saving(_that);case ReportDraftAutosaveSaved() when saved != null:
return saved(_that);case ReportDraftAutosaveFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  saving,TResult Function()?  saved,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle() when idle != null:
return idle();case ReportDraftAutosaveSaving() when saving != null:
return saving();case ReportDraftAutosaveSaved() when saved != null:
return saved();case ReportDraftAutosaveFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  saving,required TResult Function()  saved,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle():
return idle();case ReportDraftAutosaveSaving():
return saving();case ReportDraftAutosaveSaved():
return saved();case ReportDraftAutosaveFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  saving,TResult? Function()?  saved,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case ReportDraftAutosaveIdle() when idle != null:
return idle();case ReportDraftAutosaveSaving() when saving != null:
return saving();case ReportDraftAutosaveSaved() when saved != null:
return saved();case ReportDraftAutosaveFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class ReportDraftAutosaveIdle with DiagnosticableTreeMixin implements DraftAutosaveState {
  const ReportDraftAutosaveIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftAutosaveState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftAutosaveIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftAutosaveState.idle()';
}


}




/// @nodoc


class ReportDraftAutosaveSaving with DiagnosticableTreeMixin implements DraftAutosaveState {
  const ReportDraftAutosaveSaving();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftAutosaveState.saving'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftAutosaveSaving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftAutosaveState.saving()';
}


}




/// @nodoc


class ReportDraftAutosaveSaved with DiagnosticableTreeMixin implements DraftAutosaveState {
  const ReportDraftAutosaveSaved();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftAutosaveState.saved'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftAutosaveSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftAutosaveState.saved()';
}


}




/// @nodoc


class ReportDraftAutosaveFailed with DiagnosticableTreeMixin implements DraftAutosaveState {
  const ReportDraftAutosaveFailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftAutosaveState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftAutosaveFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftAutosaveState.failed()';
}


}




/// @nodoc
mixin _$DraftRestoreState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestoreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState()';
}


}

/// @nodoc
class $DraftRestoreStateCopyWith<$Res>  {
$DraftRestoreStateCopyWith(DraftRestoreState _, $Res Function(DraftRestoreState) __);
}


/// Adds pattern-matching-related methods to [DraftRestoreState].
extension DraftRestoreStatePatterns on DraftRestoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DraftRestoreIdle value)?  idle,TResult Function( DraftRestoring value)?  restoring,TResult Function( DraftRestored value)?  restored,TResult Function( DraftRestoreInvalid value)?  invalid,TResult Function( DraftRestoreFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DraftRestoreIdle() when idle != null:
return idle(_that);case DraftRestoring() when restoring != null:
return restoring(_that);case DraftRestored() when restored != null:
return restored(_that);case DraftRestoreInvalid() when invalid != null:
return invalid(_that);case DraftRestoreFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DraftRestoreIdle value)  idle,required TResult Function( DraftRestoring value)  restoring,required TResult Function( DraftRestored value)  restored,required TResult Function( DraftRestoreInvalid value)  invalid,required TResult Function( DraftRestoreFailure value)  failure,}){
final _that = this;
switch (_that) {
case DraftRestoreIdle():
return idle(_that);case DraftRestoring():
return restoring(_that);case DraftRestored():
return restored(_that);case DraftRestoreInvalid():
return invalid(_that);case DraftRestoreFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DraftRestoreIdle value)?  idle,TResult? Function( DraftRestoring value)?  restoring,TResult? Function( DraftRestored value)?  restored,TResult? Function( DraftRestoreInvalid value)?  invalid,TResult? Function( DraftRestoreFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DraftRestoreIdle() when idle != null:
return idle(_that);case DraftRestoring() when restoring != null:
return restoring(_that);case DraftRestored() when restored != null:
return restored(_that);case DraftRestoreInvalid() when invalid != null:
return invalid(_that);case DraftRestoreFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  restoring,TResult Function()?  restored,TResult Function()?  invalid,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DraftRestoreIdle() when idle != null:
return idle();case DraftRestoring() when restoring != null:
return restoring();case DraftRestored() when restored != null:
return restored();case DraftRestoreInvalid() when invalid != null:
return invalid();case DraftRestoreFailure() when failure != null:
return failure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  restoring,required TResult Function()  restored,required TResult Function()  invalid,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case DraftRestoreIdle():
return idle();case DraftRestoring():
return restoring();case DraftRestored():
return restored();case DraftRestoreInvalid():
return invalid();case DraftRestoreFailure():
return failure();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  restoring,TResult? Function()?  restored,TResult? Function()?  invalid,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case DraftRestoreIdle() when idle != null:
return idle();case DraftRestoring() when restoring != null:
return restoring();case DraftRestored() when restored != null:
return restored();case DraftRestoreInvalid() when invalid != null:
return invalid();case DraftRestoreFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class DraftRestoreIdle with DiagnosticableTreeMixin implements DraftRestoreState {
  const DraftRestoreIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestoreIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState.idle()';
}


}




/// @nodoc


class DraftRestoring with DiagnosticableTreeMixin implements DraftRestoreState {
  const DraftRestoring();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState.restoring'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestoring);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState.restoring()';
}


}




/// @nodoc


class DraftRestored with DiagnosticableTreeMixin implements DraftRestoreState {
  const DraftRestored();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState.restored'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState.restored()';
}


}




/// @nodoc


class DraftRestoreInvalid with DiagnosticableTreeMixin implements DraftRestoreState {
  const DraftRestoreInvalid();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState.invalid'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestoreInvalid);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState.invalid()';
}


}




/// @nodoc


class DraftRestoreFailure with DiagnosticableTreeMixin implements DraftRestoreState {
  const DraftRestoreFailure();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftRestoreState.failure'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftRestoreFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftRestoreState.failure()';
}


}




/// @nodoc
mixin _$DraftState implements DiagnosticableTreeMixin {

 List<Draft> get drafts; String? get currentDraftId;
/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStateCopyWith<DraftState> get copyWith => _$DraftStateCopyWithImpl<DraftState>(this as DraftState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftState'))
    ..add(DiagnosticsProperty('drafts', drafts))..add(DiagnosticsProperty('currentDraftId', currentDraftId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftState&&const DeepCollectionEquality().equals(other.drafts, drafts)&&(identical(other.currentDraftId, currentDraftId) || other.currentDraftId == currentDraftId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(drafts),currentDraftId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftState(drafts: $drafts, currentDraftId: $currentDraftId)';
}


}

/// @nodoc
abstract mixin class $DraftStateCopyWith<$Res>  {
  factory $DraftStateCopyWith(DraftState value, $Res Function(DraftState) _then) = _$DraftStateCopyWithImpl;
@useResult
$Res call({
 List<Draft> drafts, String? currentDraftId
});




}
/// @nodoc
class _$DraftStateCopyWithImpl<$Res>
    implements $DraftStateCopyWith<$Res> {
  _$DraftStateCopyWithImpl(this._self, this._then);

  final DraftState _self;
  final $Res Function(DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drafts = null,Object? currentDraftId = freezed,}) {
  return _then(_self.copyWith(
drafts: null == drafts ? _self.drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<Draft>,currentDraftId: freezed == currentDraftId ? _self.currentDraftId : currentDraftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftState].
extension DraftStatePatterns on DraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftState value)  $default,){
final _that = this;
switch (_that) {
case _DraftState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftState value)?  $default,){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Draft> drafts,  String? currentDraftId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.drafts,_that.currentDraftId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Draft> drafts,  String? currentDraftId)  $default,) {final _that = this;
switch (_that) {
case _DraftState():
return $default(_that.drafts,_that.currentDraftId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Draft> drafts,  String? currentDraftId)?  $default,) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.drafts,_that.currentDraftId);case _:
  return null;

}
}

}

/// @nodoc


class _DraftState with DiagnosticableTreeMixin implements DraftState {
  const _DraftState({final  List<Draft> drafts = const [], this.currentDraftId}): _drafts = drafts;
  

 final  List<Draft> _drafts;
@override@JsonKey() List<Draft> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}

@override final  String? currentDraftId;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftStateCopyWith<_DraftState> get copyWith => __$DraftStateCopyWithImpl<_DraftState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DraftState'))
    ..add(DiagnosticsProperty('drafts', drafts))..add(DiagnosticsProperty('currentDraftId', currentDraftId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftState&&const DeepCollectionEquality().equals(other._drafts, _drafts)&&(identical(other.currentDraftId, currentDraftId) || other.currentDraftId == currentDraftId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts),currentDraftId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DraftState(drafts: $drafts, currentDraftId: $currentDraftId)';
}


}

/// @nodoc
abstract mixin class _$DraftStateCopyWith<$Res> implements $DraftStateCopyWith<$Res> {
  factory _$DraftStateCopyWith(_DraftState value, $Res Function(_DraftState) _then) = __$DraftStateCopyWithImpl;
@override @useResult
$Res call({
 List<Draft> drafts, String? currentDraftId
});




}
/// @nodoc
class __$DraftStateCopyWithImpl<$Res>
    implements _$DraftStateCopyWith<$Res> {
  __$DraftStateCopyWithImpl(this._self, this._then);

  final _DraftState _self;
  final $Res Function(_DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drafts = null,Object? currentDraftId = freezed,}) {
  return _then(_DraftState(
drafts: null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<Draft>,currentDraftId: freezed == currentDraftId ? _self.currentDraftId : currentDraftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ErrorState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState()';
}


}

/// @nodoc
class $ErrorStateCopyWith<$Res>  {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ErrorInitial value)?  initial,TResult Function( ErrorBadRequest value)?  badRequest,TResult Function( ErrorUnauthorized value)?  unauthorized,TResult Function( ErrorTokenExpired value)?  tokenExpired,TResult Function( ErrorForbidden value)?  forbidden,TResult Function( ErrorNotFound value)?  notFound,TResult Function( ErrorConflict value)?  conflict,TResult Function( ErrorTooManyRequests value)?  tooManyRequests,TResult Function( ErrorConnectionError value)?  connectionError,TResult Function( ErrorConnectionTimeout value)?  connectionTimeout,TResult Function( ErrorNotDefined value)?  notDefined,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ErrorInitial() when initial != null:
return initial(_that);case ErrorBadRequest() when badRequest != null:
return badRequest(_that);case ErrorUnauthorized() when unauthorized != null:
return unauthorized(_that);case ErrorTokenExpired() when tokenExpired != null:
return tokenExpired(_that);case ErrorForbidden() when forbidden != null:
return forbidden(_that);case ErrorNotFound() when notFound != null:
return notFound(_that);case ErrorConflict() when conflict != null:
return conflict(_that);case ErrorTooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case ErrorConnectionError() when connectionError != null:
return connectionError(_that);case ErrorConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case ErrorNotDefined() when notDefined != null:
return notDefined(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ErrorInitial value)  initial,required TResult Function( ErrorBadRequest value)  badRequest,required TResult Function( ErrorUnauthorized value)  unauthorized,required TResult Function( ErrorTokenExpired value)  tokenExpired,required TResult Function( ErrorForbidden value)  forbidden,required TResult Function( ErrorNotFound value)  notFound,required TResult Function( ErrorConflict value)  conflict,required TResult Function( ErrorTooManyRequests value)  tooManyRequests,required TResult Function( ErrorConnectionError value)  connectionError,required TResult Function( ErrorConnectionTimeout value)  connectionTimeout,required TResult Function( ErrorNotDefined value)  notDefined,}){
final _that = this;
switch (_that) {
case ErrorInitial():
return initial(_that);case ErrorBadRequest():
return badRequest(_that);case ErrorUnauthorized():
return unauthorized(_that);case ErrorTokenExpired():
return tokenExpired(_that);case ErrorForbidden():
return forbidden(_that);case ErrorNotFound():
return notFound(_that);case ErrorConflict():
return conflict(_that);case ErrorTooManyRequests():
return tooManyRequests(_that);case ErrorConnectionError():
return connectionError(_that);case ErrorConnectionTimeout():
return connectionTimeout(_that);case ErrorNotDefined():
return notDefined(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ErrorInitial value)?  initial,TResult? Function( ErrorBadRequest value)?  badRequest,TResult? Function( ErrorUnauthorized value)?  unauthorized,TResult? Function( ErrorTokenExpired value)?  tokenExpired,TResult? Function( ErrorForbidden value)?  forbidden,TResult? Function( ErrorNotFound value)?  notFound,TResult? Function( ErrorConflict value)?  conflict,TResult? Function( ErrorTooManyRequests value)?  tooManyRequests,TResult? Function( ErrorConnectionError value)?  connectionError,TResult? Function( ErrorConnectionTimeout value)?  connectionTimeout,TResult? Function( ErrorNotDefined value)?  notDefined,}){
final _that = this;
switch (_that) {
case ErrorInitial() when initial != null:
return initial(_that);case ErrorBadRequest() when badRequest != null:
return badRequest(_that);case ErrorUnauthorized() when unauthorized != null:
return unauthorized(_that);case ErrorTokenExpired() when tokenExpired != null:
return tokenExpired(_that);case ErrorForbidden() when forbidden != null:
return forbidden(_that);case ErrorNotFound() when notFound != null:
return notFound(_that);case ErrorConflict() when conflict != null:
return conflict(_that);case ErrorTooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that);case ErrorConnectionError() when connectionError != null:
return connectionError(_that);case ErrorConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case ErrorNotDefined() when notDefined != null:
return notDefined(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  badRequest,TResult Function( String message)?  unauthorized,TResult Function( String message)?  tokenExpired,TResult Function( String message)?  forbidden,TResult Function( String message)?  notFound,TResult Function( String message)?  conflict,TResult Function( String message)?  tooManyRequests,TResult Function( String message)?  connectionError,TResult Function( String message)?  connectionTimeout,TResult Function( String message)?  notDefined,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ErrorInitial() when initial != null:
return initial();case ErrorBadRequest() when badRequest != null:
return badRequest(_that.message);case ErrorUnauthorized() when unauthorized != null:
return unauthorized(_that.message);case ErrorTokenExpired() when tokenExpired != null:
return tokenExpired(_that.message);case ErrorForbidden() when forbidden != null:
return forbidden(_that.message);case ErrorNotFound() when notFound != null:
return notFound(_that.message);case ErrorConflict() when conflict != null:
return conflict(_that.message);case ErrorTooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that.message);case ErrorConnectionError() when connectionError != null:
return connectionError(_that.message);case ErrorConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that.message);case ErrorNotDefined() when notDefined != null:
return notDefined(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  badRequest,required TResult Function( String message)  unauthorized,required TResult Function( String message)  tokenExpired,required TResult Function( String message)  forbidden,required TResult Function( String message)  notFound,required TResult Function( String message)  conflict,required TResult Function( String message)  tooManyRequests,required TResult Function( String message)  connectionError,required TResult Function( String message)  connectionTimeout,required TResult Function( String message)  notDefined,}) {final _that = this;
switch (_that) {
case ErrorInitial():
return initial();case ErrorBadRequest():
return badRequest(_that.message);case ErrorUnauthorized():
return unauthorized(_that.message);case ErrorTokenExpired():
return tokenExpired(_that.message);case ErrorForbidden():
return forbidden(_that.message);case ErrorNotFound():
return notFound(_that.message);case ErrorConflict():
return conflict(_that.message);case ErrorTooManyRequests():
return tooManyRequests(_that.message);case ErrorConnectionError():
return connectionError(_that.message);case ErrorConnectionTimeout():
return connectionTimeout(_that.message);case ErrorNotDefined():
return notDefined(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  badRequest,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  tokenExpired,TResult? Function( String message)?  forbidden,TResult? Function( String message)?  notFound,TResult? Function( String message)?  conflict,TResult? Function( String message)?  tooManyRequests,TResult? Function( String message)?  connectionError,TResult? Function( String message)?  connectionTimeout,TResult? Function( String message)?  notDefined,}) {final _that = this;
switch (_that) {
case ErrorInitial() when initial != null:
return initial();case ErrorBadRequest() when badRequest != null:
return badRequest(_that.message);case ErrorUnauthorized() when unauthorized != null:
return unauthorized(_that.message);case ErrorTokenExpired() when tokenExpired != null:
return tokenExpired(_that.message);case ErrorForbidden() when forbidden != null:
return forbidden(_that.message);case ErrorNotFound() when notFound != null:
return notFound(_that.message);case ErrorConflict() when conflict != null:
return conflict(_that.message);case ErrorTooManyRequests() when tooManyRequests != null:
return tooManyRequests(_that.message);case ErrorConnectionError() when connectionError != null:
return connectionError(_that.message);case ErrorConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that.message);case ErrorNotDefined() when notDefined != null:
return notDefined(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ErrorInitial with DiagnosticableTreeMixin implements ErrorState {
  const ErrorInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.initial()';
}


}




/// @nodoc


class ErrorBadRequest with DiagnosticableTreeMixin implements ErrorState {
  const ErrorBadRequest({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBadRequestCopyWith<ErrorBadRequest> get copyWith => _$ErrorBadRequestCopyWithImpl<ErrorBadRequest>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.badRequest'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBadRequest&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.badRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorBadRequestCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorBadRequestCopyWith(ErrorBadRequest value, $Res Function(ErrorBadRequest) _then) = _$ErrorBadRequestCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorBadRequestCopyWithImpl<$Res>
    implements $ErrorBadRequestCopyWith<$Res> {
  _$ErrorBadRequestCopyWithImpl(this._self, this._then);

  final ErrorBadRequest _self;
  final $Res Function(ErrorBadRequest) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorBadRequest(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorUnauthorized with DiagnosticableTreeMixin implements ErrorState {
  const ErrorUnauthorized({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorUnauthorizedCopyWith<ErrorUnauthorized> get copyWith => _$ErrorUnauthorizedCopyWithImpl<ErrorUnauthorized>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.unauthorized'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorUnauthorized&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorUnauthorizedCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorUnauthorizedCopyWith(ErrorUnauthorized value, $Res Function(ErrorUnauthorized) _then) = _$ErrorUnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorUnauthorizedCopyWithImpl<$Res>
    implements $ErrorUnauthorizedCopyWith<$Res> {
  _$ErrorUnauthorizedCopyWithImpl(this._self, this._then);

  final ErrorUnauthorized _self;
  final $Res Function(ErrorUnauthorized) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorUnauthorized(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorTokenExpired with DiagnosticableTreeMixin implements ErrorState {
  const ErrorTokenExpired({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorTokenExpiredCopyWith<ErrorTokenExpired> get copyWith => _$ErrorTokenExpiredCopyWithImpl<ErrorTokenExpired>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.tokenExpired'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorTokenExpired&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.tokenExpired(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorTokenExpiredCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorTokenExpiredCopyWith(ErrorTokenExpired value, $Res Function(ErrorTokenExpired) _then) = _$ErrorTokenExpiredCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorTokenExpiredCopyWithImpl<$Res>
    implements $ErrorTokenExpiredCopyWith<$Res> {
  _$ErrorTokenExpiredCopyWithImpl(this._self, this._then);

  final ErrorTokenExpired _self;
  final $Res Function(ErrorTokenExpired) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorTokenExpired(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorForbidden with DiagnosticableTreeMixin implements ErrorState {
  const ErrorForbidden({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorForbiddenCopyWith<ErrorForbidden> get copyWith => _$ErrorForbiddenCopyWithImpl<ErrorForbidden>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.forbidden'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorForbidden&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.forbidden(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorForbiddenCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorForbiddenCopyWith(ErrorForbidden value, $Res Function(ErrorForbidden) _then) = _$ErrorForbiddenCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorForbiddenCopyWithImpl<$Res>
    implements $ErrorForbiddenCopyWith<$Res> {
  _$ErrorForbiddenCopyWithImpl(this._self, this._then);

  final ErrorForbidden _self;
  final $Res Function(ErrorForbidden) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorForbidden(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorNotFound with DiagnosticableTreeMixin implements ErrorState {
  const ErrorNotFound({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNotFoundCopyWith<ErrorNotFound> get copyWith => _$ErrorNotFoundCopyWithImpl<ErrorNotFound>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.notFound'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorNotFoundCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorNotFoundCopyWith(ErrorNotFound value, $Res Function(ErrorNotFound) _then) = _$ErrorNotFoundCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorNotFoundCopyWithImpl<$Res>
    implements $ErrorNotFoundCopyWith<$Res> {
  _$ErrorNotFoundCopyWithImpl(this._self, this._then);

  final ErrorNotFound _self;
  final $Res Function(ErrorNotFound) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorNotFound(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorConflict with DiagnosticableTreeMixin implements ErrorState {
  const ErrorConflict({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorConflictCopyWith<ErrorConflict> get copyWith => _$ErrorConflictCopyWithImpl<ErrorConflict>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.conflict'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorConflict&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.conflict(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorConflictCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorConflictCopyWith(ErrorConflict value, $Res Function(ErrorConflict) _then) = _$ErrorConflictCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorConflictCopyWithImpl<$Res>
    implements $ErrorConflictCopyWith<$Res> {
  _$ErrorConflictCopyWithImpl(this._self, this._then);

  final ErrorConflict _self;
  final $Res Function(ErrorConflict) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorConflict(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorTooManyRequests with DiagnosticableTreeMixin implements ErrorState {
  const ErrorTooManyRequests({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorTooManyRequestsCopyWith<ErrorTooManyRequests> get copyWith => _$ErrorTooManyRequestsCopyWithImpl<ErrorTooManyRequests>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.tooManyRequests'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorTooManyRequests&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.tooManyRequests(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorTooManyRequestsCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorTooManyRequestsCopyWith(ErrorTooManyRequests value, $Res Function(ErrorTooManyRequests) _then) = _$ErrorTooManyRequestsCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorTooManyRequestsCopyWithImpl<$Res>
    implements $ErrorTooManyRequestsCopyWith<$Res> {
  _$ErrorTooManyRequestsCopyWithImpl(this._self, this._then);

  final ErrorTooManyRequests _self;
  final $Res Function(ErrorTooManyRequests) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorTooManyRequests(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorConnectionError with DiagnosticableTreeMixin implements ErrorState {
  const ErrorConnectionError({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorConnectionErrorCopyWith<ErrorConnectionError> get copyWith => _$ErrorConnectionErrorCopyWithImpl<ErrorConnectionError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.connectionError'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorConnectionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.connectionError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorConnectionErrorCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorConnectionErrorCopyWith(ErrorConnectionError value, $Res Function(ErrorConnectionError) _then) = _$ErrorConnectionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorConnectionErrorCopyWithImpl<$Res>
    implements $ErrorConnectionErrorCopyWith<$Res> {
  _$ErrorConnectionErrorCopyWithImpl(this._self, this._then);

  final ErrorConnectionError _self;
  final $Res Function(ErrorConnectionError) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorConnectionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorConnectionTimeout with DiagnosticableTreeMixin implements ErrorState {
  const ErrorConnectionTimeout({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorConnectionTimeoutCopyWith<ErrorConnectionTimeout> get copyWith => _$ErrorConnectionTimeoutCopyWithImpl<ErrorConnectionTimeout>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.connectionTimeout'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorConnectionTimeout&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.connectionTimeout(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorConnectionTimeoutCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorConnectionTimeoutCopyWith(ErrorConnectionTimeout value, $Res Function(ErrorConnectionTimeout) _then) = _$ErrorConnectionTimeoutCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorConnectionTimeoutCopyWithImpl<$Res>
    implements $ErrorConnectionTimeoutCopyWith<$Res> {
  _$ErrorConnectionTimeoutCopyWithImpl(this._self, this._then);

  final ErrorConnectionTimeout _self;
  final $Res Function(ErrorConnectionTimeout) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorConnectionTimeout(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorNotDefined with DiagnosticableTreeMixin implements ErrorState {
  const ErrorNotDefined({required this.message});
  

 final  String message;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNotDefinedCopyWith<ErrorNotDefined> get copyWith => _$ErrorNotDefinedCopyWithImpl<ErrorNotDefined>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ErrorState.notDefined'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNotDefined&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ErrorState.notDefined(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorNotDefinedCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $ErrorNotDefinedCopyWith(ErrorNotDefined value, $Res Function(ErrorNotDefined) _then) = _$ErrorNotDefinedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorNotDefinedCopyWithImpl<$Res>
    implements $ErrorNotDefinedCopyWith<$Res> {
  _$ErrorNotDefinedCopyWithImpl(this._self, this._then);

  final ErrorNotDefined _self;
  final $Res Function(ErrorNotDefined) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorNotDefined(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$IssueExportState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState()';
}


}

/// @nodoc
class $IssueExportStateCopyWith<$Res>  {
$IssueExportStateCopyWith(IssueExportState _, $Res Function(IssueExportState) __);
}


/// Adds pattern-matching-related methods to [IssueExportState].
extension IssueExportStatePatterns on IssueExportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IssueExportIdle value)?  idle,TResult Function( IssueExportLoading value)?  loading,TResult Function( IssueExportRendering value)?  rendering,TResult Function( IssueExportSuccess value)?  success,TResult Function( IssueExportFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IssueExportIdle() when idle != null:
return idle(_that);case IssueExportLoading() when loading != null:
return loading(_that);case IssueExportRendering() when rendering != null:
return rendering(_that);case IssueExportSuccess() when success != null:
return success(_that);case IssueExportFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IssueExportIdle value)  idle,required TResult Function( IssueExportLoading value)  loading,required TResult Function( IssueExportRendering value)  rendering,required TResult Function( IssueExportSuccess value)  success,required TResult Function( IssueExportFailed value)  failed,}){
final _that = this;
switch (_that) {
case IssueExportIdle():
return idle(_that);case IssueExportLoading():
return loading(_that);case IssueExportRendering():
return rendering(_that);case IssueExportSuccess():
return success(_that);case IssueExportFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IssueExportIdle value)?  idle,TResult? Function( IssueExportLoading value)?  loading,TResult? Function( IssueExportRendering value)?  rendering,TResult? Function( IssueExportSuccess value)?  success,TResult? Function( IssueExportFailed value)?  failed,}){
final _that = this;
switch (_that) {
case IssueExportIdle() when idle != null:
return idle(_that);case IssueExportLoading() when loading != null:
return loading(_that);case IssueExportRendering() when rendering != null:
return rendering(_that);case IssueExportSuccess() when success != null:
return success(_that);case IssueExportFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function()?  rendering,TResult Function()?  success,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IssueExportIdle() when idle != null:
return idle();case IssueExportLoading() when loading != null:
return loading();case IssueExportRendering() when rendering != null:
return rendering();case IssueExportSuccess() when success != null:
return success();case IssueExportFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function()  rendering,required TResult Function()  success,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case IssueExportIdle():
return idle();case IssueExportLoading():
return loading();case IssueExportRendering():
return rendering();case IssueExportSuccess():
return success();case IssueExportFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function()?  rendering,TResult? Function()?  success,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case IssueExportIdle() when idle != null:
return idle();case IssueExportLoading() when loading != null:
return loading();case IssueExportRendering() when rendering != null:
return rendering();case IssueExportSuccess() when success != null:
return success();case IssueExportFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class IssueExportIdle with DiagnosticableTreeMixin implements IssueExportState {
   IssueExportIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState.idle()';
}


}




/// @nodoc


class IssueExportLoading with DiagnosticableTreeMixin implements IssueExportState {
   IssueExportLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState.loading()';
}


}




/// @nodoc


class IssueExportRendering with DiagnosticableTreeMixin implements IssueExportState {
   IssueExportRendering();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState.rendering'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportRendering);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState.rendering()';
}


}




/// @nodoc


class IssueExportSuccess with DiagnosticableTreeMixin implements IssueExportState {
   IssueExportSuccess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState.success()';
}


}




/// @nodoc


class IssueExportFailed with DiagnosticableTreeMixin implements IssueExportState {
   IssueExportFailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueExportState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueExportFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueExportState.failed()';
}


}




/// @nodoc
mixin _$IssueFormState implements DiagnosticableTreeMixin {

 IssueCategory get category; String? get content; List<IssueAttachment> get attachments; List<XFile> get files; Currency? get currency; DateTime? get kickoffDate; List<ContractIssueItem> get contractItems; List<TransactionIssueItem> get transactionItems; List<ProcurementIssueItem> get procurementItems; List<ProcurementIssueRequest> get requests;
/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueFormStateCopyWith<IssueFormState> get copyWith => _$IssueFormStateCopyWithImpl<IssueFormState>(this as IssueFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueFormState'))
    ..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('currency', currency))..add(DiagnosticsProperty('kickoffDate', kickoffDate))..add(DiagnosticsProperty('contractItems', contractItems))..add(DiagnosticsProperty('transactionItems', transactionItems))..add(DiagnosticsProperty('procurementItems', procurementItems))..add(DiagnosticsProperty('requests', requests));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueFormState&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.kickoffDate, kickoffDate) || other.kickoffDate == kickoffDate)&&const DeepCollectionEquality().equals(other.contractItems, contractItems)&&const DeepCollectionEquality().equals(other.transactionItems, transactionItems)&&const DeepCollectionEquality().equals(other.procurementItems, procurementItems)&&const DeepCollectionEquality().equals(other.requests, requests));
}


@override
int get hashCode => Object.hash(runtimeType,category,content,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(files),currency,kickoffDate,const DeepCollectionEquality().hash(contractItems),const DeepCollectionEquality().hash(transactionItems),const DeepCollectionEquality().hash(procurementItems),const DeepCollectionEquality().hash(requests));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueFormState(category: $category, content: $content, attachments: $attachments, files: $files, currency: $currency, kickoffDate: $kickoffDate, contractItems: $contractItems, transactionItems: $transactionItems, procurementItems: $procurementItems, requests: $requests)';
}


}

/// @nodoc
abstract mixin class $IssueFormStateCopyWith<$Res>  {
  factory $IssueFormStateCopyWith(IssueFormState value, $Res Function(IssueFormState) _then) = _$IssueFormStateCopyWithImpl;
@useResult
$Res call({
 IssueCategory category, String? content, List<IssueAttachment> attachments, List<XFile> files, Currency? currency, DateTime? kickoffDate, List<ContractIssueItem> contractItems, List<TransactionIssueItem> transactionItems, List<ProcurementIssueItem> procurementItems, List<ProcurementIssueRequest> requests
});


$IssueCategoryCopyWith<$Res> get category;$CurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class _$IssueFormStateCopyWithImpl<$Res>
    implements $IssueFormStateCopyWith<$Res> {
  _$IssueFormStateCopyWithImpl(this._self, this._then);

  final IssueFormState _self;
  final $Res Function(IssueFormState) _then;

/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? content = freezed,Object? attachments = null,Object? files = null,Object? currency = freezed,Object? kickoffDate = freezed,Object? contractItems = null,Object? transactionItems = null,Object? procurementItems = null,Object? requests = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IssueCategory,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<IssueAttachment>,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,kickoffDate: freezed == kickoffDate ? _self.kickoffDate : kickoffDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractItems: null == contractItems ? _self.contractItems : contractItems // ignore: cast_nullable_to_non_nullable
as List<ContractIssueItem>,transactionItems: null == transactionItems ? _self.transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItem>,procurementItems: null == procurementItems ? _self.procurementItems : procurementItems // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueItem>,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueRequest>,
  ));
}
/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueCategoryCopyWith<$Res> get category {
  
  return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueFormState value)  $default,){
final _that = this;
switch (_that) {
case _IssueFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueFormState value)?  $default,){
final _that = this;
switch (_that) {
case _IssueFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IssueCategory category,  String? content,  List<IssueAttachment> attachments,  List<XFile> files,  Currency? currency,  DateTime? kickoffDate,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems,  List<ProcurementIssueItem> procurementItems,  List<ProcurementIssueRequest> requests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueFormState() when $default != null:
return $default(_that.category,_that.content,_that.attachments,_that.files,_that.currency,_that.kickoffDate,_that.contractItems,_that.transactionItems,_that.procurementItems,_that.requests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IssueCategory category,  String? content,  List<IssueAttachment> attachments,  List<XFile> files,  Currency? currency,  DateTime? kickoffDate,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems,  List<ProcurementIssueItem> procurementItems,  List<ProcurementIssueRequest> requests)  $default,) {final _that = this;
switch (_that) {
case _IssueFormState():
return $default(_that.category,_that.content,_that.attachments,_that.files,_that.currency,_that.kickoffDate,_that.contractItems,_that.transactionItems,_that.procurementItems,_that.requests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IssueCategory category,  String? content,  List<IssueAttachment> attachments,  List<XFile> files,  Currency? currency,  DateTime? kickoffDate,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems,  List<ProcurementIssueItem> procurementItems,  List<ProcurementIssueRequest> requests)?  $default,) {final _that = this;
switch (_that) {
case _IssueFormState() when $default != null:
return $default(_that.category,_that.content,_that.attachments,_that.files,_that.currency,_that.kickoffDate,_that.contractItems,_that.transactionItems,_that.procurementItems,_that.requests);case _:
  return null;

}
}

}

/// @nodoc


class _IssueFormState with DiagnosticableTreeMixin implements IssueFormState {
  const _IssueFormState({required this.category, this.content, final  List<IssueAttachment> attachments = const <IssueAttachment>[], final  List<XFile> files = const <XFile>[], this.currency, this.kickoffDate, final  List<ContractIssueItem> contractItems = const [], final  List<TransactionIssueItem> transactionItems = const [], final  List<ProcurementIssueItem> procurementItems = const [], final  List<ProcurementIssueRequest> requests = const []}): _attachments = attachments,_files = files,_contractItems = contractItems,_transactionItems = transactionItems,_procurementItems = procurementItems,_requests = requests;
  

@override final  IssueCategory category;
@override final  String? content;
 final  List<IssueAttachment> _attachments;
@override@JsonKey() List<IssueAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  List<XFile> _files;
@override@JsonKey() List<XFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  Currency? currency;
@override final  DateTime? kickoffDate;
 final  List<ContractIssueItem> _contractItems;
@override@JsonKey() List<ContractIssueItem> get contractItems {
  if (_contractItems is EqualUnmodifiableListView) return _contractItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contractItems);
}

 final  List<TransactionIssueItem> _transactionItems;
@override@JsonKey() List<TransactionIssueItem> get transactionItems {
  if (_transactionItems is EqualUnmodifiableListView) return _transactionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionItems);
}

 final  List<ProcurementIssueItem> _procurementItems;
@override@JsonKey() List<ProcurementIssueItem> get procurementItems {
  if (_procurementItems is EqualUnmodifiableListView) return _procurementItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_procurementItems);
}

 final  List<ProcurementIssueRequest> _requests;
@override@JsonKey() List<ProcurementIssueRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}


/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueFormStateCopyWith<_IssueFormState> get copyWith => __$IssueFormStateCopyWithImpl<_IssueFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueFormState'))
    ..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('currency', currency))..add(DiagnosticsProperty('kickoffDate', kickoffDate))..add(DiagnosticsProperty('contractItems', contractItems))..add(DiagnosticsProperty('transactionItems', transactionItems))..add(DiagnosticsProperty('procurementItems', procurementItems))..add(DiagnosticsProperty('requests', requests));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueFormState&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.kickoffDate, kickoffDate) || other.kickoffDate == kickoffDate)&&const DeepCollectionEquality().equals(other._contractItems, _contractItems)&&const DeepCollectionEquality().equals(other._transactionItems, _transactionItems)&&const DeepCollectionEquality().equals(other._procurementItems, _procurementItems)&&const DeepCollectionEquality().equals(other._requests, _requests));
}


@override
int get hashCode => Object.hash(runtimeType,category,content,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_files),currency,kickoffDate,const DeepCollectionEquality().hash(_contractItems),const DeepCollectionEquality().hash(_transactionItems),const DeepCollectionEquality().hash(_procurementItems),const DeepCollectionEquality().hash(_requests));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueFormState(category: $category, content: $content, attachments: $attachments, files: $files, currency: $currency, kickoffDate: $kickoffDate, contractItems: $contractItems, transactionItems: $transactionItems, procurementItems: $procurementItems, requests: $requests)';
}


}

/// @nodoc
abstract mixin class _$IssueFormStateCopyWith<$Res> implements $IssueFormStateCopyWith<$Res> {
  factory _$IssueFormStateCopyWith(_IssueFormState value, $Res Function(_IssueFormState) _then) = __$IssueFormStateCopyWithImpl;
@override @useResult
$Res call({
 IssueCategory category, String? content, List<IssueAttachment> attachments, List<XFile> files, Currency? currency, DateTime? kickoffDate, List<ContractIssueItem> contractItems, List<TransactionIssueItem> transactionItems, List<ProcurementIssueItem> procurementItems, List<ProcurementIssueRequest> requests
});


@override $IssueCategoryCopyWith<$Res> get category;@override $CurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class __$IssueFormStateCopyWithImpl<$Res>
    implements _$IssueFormStateCopyWith<$Res> {
  __$IssueFormStateCopyWithImpl(this._self, this._then);

  final _IssueFormState _self;
  final $Res Function(_IssueFormState) _then;

/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? content = freezed,Object? attachments = null,Object? files = null,Object? currency = freezed,Object? kickoffDate = freezed,Object? contractItems = null,Object? transactionItems = null,Object? procurementItems = null,Object? requests = null,}) {
  return _then(_IssueFormState(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IssueCategory,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<IssueAttachment>,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,kickoffDate: freezed == kickoffDate ? _self.kickoffDate : kickoffDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractItems: null == contractItems ? _self._contractItems : contractItems // ignore: cast_nullable_to_non_nullable
as List<ContractIssueItem>,transactionItems: null == transactionItems ? _self._transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItem>,procurementItems: null == procurementItems ? _self._procurementItems : procurementItems // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueItem>,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueRequest>,
  ));
}

/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueCategoryCopyWith<$Res> get category {
  
  return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of IssueFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}

/// @nodoc
mixin _$IssueListState implements DiagnosticableTreeMixin {

 ContractIssue? get contract; KickoffIssue? get kickoff; TransactionIssue? get transaction; PaymentIssue? get payment; List<ApprovalIssue> get approvals; int get approvalsPage; int get approvalsTotal; bool get approvalsHasReachEnd; List<ProcurementIssue> get procurements; int get procurementsPage; int get procurementsTotal; bool get procurementsHasReachEnd; List<ContractIssueItem> get contractItems; List<TransactionIssueItem> get transactionItems;
/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueListStateCopyWith<IssueListState> get copyWith => _$IssueListStateCopyWithImpl<IssueListState>(this as IssueListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueListState'))
    ..add(DiagnosticsProperty('contract', contract))..add(DiagnosticsProperty('kickoff', kickoff))..add(DiagnosticsProperty('transaction', transaction))..add(DiagnosticsProperty('payment', payment))..add(DiagnosticsProperty('approvals', approvals))..add(DiagnosticsProperty('approvalsPage', approvalsPage))..add(DiagnosticsProperty('approvalsTotal', approvalsTotal))..add(DiagnosticsProperty('approvalsHasReachEnd', approvalsHasReachEnd))..add(DiagnosticsProperty('procurements', procurements))..add(DiagnosticsProperty('procurementsPage', procurementsPage))..add(DiagnosticsProperty('procurementsTotal', procurementsTotal))..add(DiagnosticsProperty('procurementsHasReachEnd', procurementsHasReachEnd))..add(DiagnosticsProperty('contractItems', contractItems))..add(DiagnosticsProperty('transactionItems', transactionItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueListState&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.kickoff, kickoff) || other.kickoff == kickoff)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other.approvals, approvals)&&(identical(other.approvalsPage, approvalsPage) || other.approvalsPage == approvalsPage)&&(identical(other.approvalsTotal, approvalsTotal) || other.approvalsTotal == approvalsTotal)&&(identical(other.approvalsHasReachEnd, approvalsHasReachEnd) || other.approvalsHasReachEnd == approvalsHasReachEnd)&&const DeepCollectionEquality().equals(other.procurements, procurements)&&(identical(other.procurementsPage, procurementsPage) || other.procurementsPage == procurementsPage)&&(identical(other.procurementsTotal, procurementsTotal) || other.procurementsTotal == procurementsTotal)&&(identical(other.procurementsHasReachEnd, procurementsHasReachEnd) || other.procurementsHasReachEnd == procurementsHasReachEnd)&&const DeepCollectionEquality().equals(other.contractItems, contractItems)&&const DeepCollectionEquality().equals(other.transactionItems, transactionItems));
}


@override
int get hashCode => Object.hash(runtimeType,contract,kickoff,transaction,payment,const DeepCollectionEquality().hash(approvals),approvalsPage,approvalsTotal,approvalsHasReachEnd,const DeepCollectionEquality().hash(procurements),procurementsPage,procurementsTotal,procurementsHasReachEnd,const DeepCollectionEquality().hash(contractItems),const DeepCollectionEquality().hash(transactionItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueListState(contract: $contract, kickoff: $kickoff, transaction: $transaction, payment: $payment, approvals: $approvals, approvalsPage: $approvalsPage, approvalsTotal: $approvalsTotal, approvalsHasReachEnd: $approvalsHasReachEnd, procurements: $procurements, procurementsPage: $procurementsPage, procurementsTotal: $procurementsTotal, procurementsHasReachEnd: $procurementsHasReachEnd, contractItems: $contractItems, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class $IssueListStateCopyWith<$Res>  {
  factory $IssueListStateCopyWith(IssueListState value, $Res Function(IssueListState) _then) = _$IssueListStateCopyWithImpl;
@useResult
$Res call({
 ContractIssue? contract, KickoffIssue? kickoff, TransactionIssue? transaction, PaymentIssue? payment, List<ApprovalIssue> approvals, int approvalsPage, int approvalsTotal, bool approvalsHasReachEnd, List<ProcurementIssue> procurements, int procurementsPage, int procurementsTotal, bool procurementsHasReachEnd, List<ContractIssueItem> contractItems, List<TransactionIssueItem> transactionItems
});


$ContractIssueCopyWith<$Res>? get contract;$KickoffIssueCopyWith<$Res>? get kickoff;$TransactionIssueCopyWith<$Res>? get transaction;$PaymentIssueCopyWith<$Res>? get payment;

}
/// @nodoc
class _$IssueListStateCopyWithImpl<$Res>
    implements $IssueListStateCopyWith<$Res> {
  _$IssueListStateCopyWithImpl(this._self, this._then);

  final IssueListState _self;
  final $Res Function(IssueListState) _then;

/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contract = freezed,Object? kickoff = freezed,Object? transaction = freezed,Object? payment = freezed,Object? approvals = null,Object? approvalsPage = null,Object? approvalsTotal = null,Object? approvalsHasReachEnd = null,Object? procurements = null,Object? procurementsPage = null,Object? procurementsTotal = null,Object? procurementsHasReachEnd = null,Object? contractItems = null,Object? transactionItems = null,}) {
  return _then(_self.copyWith(
contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractIssue?,kickoff: freezed == kickoff ? _self.kickoff : kickoff // ignore: cast_nullable_to_non_nullable
as KickoffIssue?,transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionIssue?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentIssue?,approvals: null == approvals ? _self.approvals : approvals // ignore: cast_nullable_to_non_nullable
as List<ApprovalIssue>,approvalsPage: null == approvalsPage ? _self.approvalsPage : approvalsPage // ignore: cast_nullable_to_non_nullable
as int,approvalsTotal: null == approvalsTotal ? _self.approvalsTotal : approvalsTotal // ignore: cast_nullable_to_non_nullable
as int,approvalsHasReachEnd: null == approvalsHasReachEnd ? _self.approvalsHasReachEnd : approvalsHasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,procurements: null == procurements ? _self.procurements : procurements // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssue>,procurementsPage: null == procurementsPage ? _self.procurementsPage : procurementsPage // ignore: cast_nullable_to_non_nullable
as int,procurementsTotal: null == procurementsTotal ? _self.procurementsTotal : procurementsTotal // ignore: cast_nullable_to_non_nullable
as int,procurementsHasReachEnd: null == procurementsHasReachEnd ? _self.procurementsHasReachEnd : procurementsHasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,contractItems: null == contractItems ? _self.contractItems : contractItems // ignore: cast_nullable_to_non_nullable
as List<ContractIssueItem>,transactionItems: null == transactionItems ? _self.transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItem>,
  ));
}
/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractIssueCopyWith<$Res>? get contract {
    if (_self.contract == null) {
    return null;
  }

  return $ContractIssueCopyWith<$Res>(_self.contract!, (value) {
    return _then(_self.copyWith(contract: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KickoffIssueCopyWith<$Res>? get kickoff {
    if (_self.kickoff == null) {
    return null;
  }

  return $KickoffIssueCopyWith<$Res>(_self.kickoff!, (value) {
    return _then(_self.copyWith(kickoff: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionIssueCopyWith<$Res>? get transaction {
    if (_self.transaction == null) {
    return null;
  }

  return $TransactionIssueCopyWith<$Res>(_self.transaction!, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentIssueCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentIssueCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueListState value)  $default,){
final _that = this;
switch (_that) {
case _IssueListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueListState value)?  $default,){
final _that = this;
switch (_that) {
case _IssueListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractIssue? contract,  KickoffIssue? kickoff,  TransactionIssue? transaction,  PaymentIssue? payment,  List<ApprovalIssue> approvals,  int approvalsPage,  int approvalsTotal,  bool approvalsHasReachEnd,  List<ProcurementIssue> procurements,  int procurementsPage,  int procurementsTotal,  bool procurementsHasReachEnd,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueListState() when $default != null:
return $default(_that.contract,_that.kickoff,_that.transaction,_that.payment,_that.approvals,_that.approvalsPage,_that.approvalsTotal,_that.approvalsHasReachEnd,_that.procurements,_that.procurementsPage,_that.procurementsTotal,_that.procurementsHasReachEnd,_that.contractItems,_that.transactionItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractIssue? contract,  KickoffIssue? kickoff,  TransactionIssue? transaction,  PaymentIssue? payment,  List<ApprovalIssue> approvals,  int approvalsPage,  int approvalsTotal,  bool approvalsHasReachEnd,  List<ProcurementIssue> procurements,  int procurementsPage,  int procurementsTotal,  bool procurementsHasReachEnd,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems)  $default,) {final _that = this;
switch (_that) {
case _IssueListState():
return $default(_that.contract,_that.kickoff,_that.transaction,_that.payment,_that.approvals,_that.approvalsPage,_that.approvalsTotal,_that.approvalsHasReachEnd,_that.procurements,_that.procurementsPage,_that.procurementsTotal,_that.procurementsHasReachEnd,_that.contractItems,_that.transactionItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractIssue? contract,  KickoffIssue? kickoff,  TransactionIssue? transaction,  PaymentIssue? payment,  List<ApprovalIssue> approvals,  int approvalsPage,  int approvalsTotal,  bool approvalsHasReachEnd,  List<ProcurementIssue> procurements,  int procurementsPage,  int procurementsTotal,  bool procurementsHasReachEnd,  List<ContractIssueItem> contractItems,  List<TransactionIssueItem> transactionItems)?  $default,) {final _that = this;
switch (_that) {
case _IssueListState() when $default != null:
return $default(_that.contract,_that.kickoff,_that.transaction,_that.payment,_that.approvals,_that.approvalsPage,_that.approvalsTotal,_that.approvalsHasReachEnd,_that.procurements,_that.procurementsPage,_that.procurementsTotal,_that.procurementsHasReachEnd,_that.contractItems,_that.transactionItems);case _:
  return null;

}
}

}

/// @nodoc


class _IssueListState with DiagnosticableTreeMixin implements IssueListState {
   _IssueListState({this.contract, this.kickoff, this.transaction, this.payment, final  List<ApprovalIssue> approvals = const [], this.approvalsPage = 1, this.approvalsTotal = 0, this.approvalsHasReachEnd = false, final  List<ProcurementIssue> procurements = const [], this.procurementsPage = 1, this.procurementsTotal = 0, this.procurementsHasReachEnd = false, final  List<ContractIssueItem> contractItems = const [], final  List<TransactionIssueItem> transactionItems = const []}): _approvals = approvals,_procurements = procurements,_contractItems = contractItems,_transactionItems = transactionItems;
  

@override final  ContractIssue? contract;
@override final  KickoffIssue? kickoff;
@override final  TransactionIssue? transaction;
@override final  PaymentIssue? payment;
 final  List<ApprovalIssue> _approvals;
@override@JsonKey() List<ApprovalIssue> get approvals {
  if (_approvals is EqualUnmodifiableListView) return _approvals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_approvals);
}

@override@JsonKey() final  int approvalsPage;
@override@JsonKey() final  int approvalsTotal;
@override@JsonKey() final  bool approvalsHasReachEnd;
 final  List<ProcurementIssue> _procurements;
@override@JsonKey() List<ProcurementIssue> get procurements {
  if (_procurements is EqualUnmodifiableListView) return _procurements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_procurements);
}

@override@JsonKey() final  int procurementsPage;
@override@JsonKey() final  int procurementsTotal;
@override@JsonKey() final  bool procurementsHasReachEnd;
 final  List<ContractIssueItem> _contractItems;
@override@JsonKey() List<ContractIssueItem> get contractItems {
  if (_contractItems is EqualUnmodifiableListView) return _contractItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contractItems);
}

 final  List<TransactionIssueItem> _transactionItems;
@override@JsonKey() List<TransactionIssueItem> get transactionItems {
  if (_transactionItems is EqualUnmodifiableListView) return _transactionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionItems);
}


/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueListStateCopyWith<_IssueListState> get copyWith => __$IssueListStateCopyWithImpl<_IssueListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueListState'))
    ..add(DiagnosticsProperty('contract', contract))..add(DiagnosticsProperty('kickoff', kickoff))..add(DiagnosticsProperty('transaction', transaction))..add(DiagnosticsProperty('payment', payment))..add(DiagnosticsProperty('approvals', approvals))..add(DiagnosticsProperty('approvalsPage', approvalsPage))..add(DiagnosticsProperty('approvalsTotal', approvalsTotal))..add(DiagnosticsProperty('approvalsHasReachEnd', approvalsHasReachEnd))..add(DiagnosticsProperty('procurements', procurements))..add(DiagnosticsProperty('procurementsPage', procurementsPage))..add(DiagnosticsProperty('procurementsTotal', procurementsTotal))..add(DiagnosticsProperty('procurementsHasReachEnd', procurementsHasReachEnd))..add(DiagnosticsProperty('contractItems', contractItems))..add(DiagnosticsProperty('transactionItems', transactionItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueListState&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.kickoff, kickoff) || other.kickoff == kickoff)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other._approvals, _approvals)&&(identical(other.approvalsPage, approvalsPage) || other.approvalsPage == approvalsPage)&&(identical(other.approvalsTotal, approvalsTotal) || other.approvalsTotal == approvalsTotal)&&(identical(other.approvalsHasReachEnd, approvalsHasReachEnd) || other.approvalsHasReachEnd == approvalsHasReachEnd)&&const DeepCollectionEquality().equals(other._procurements, _procurements)&&(identical(other.procurementsPage, procurementsPage) || other.procurementsPage == procurementsPage)&&(identical(other.procurementsTotal, procurementsTotal) || other.procurementsTotal == procurementsTotal)&&(identical(other.procurementsHasReachEnd, procurementsHasReachEnd) || other.procurementsHasReachEnd == procurementsHasReachEnd)&&const DeepCollectionEquality().equals(other._contractItems, _contractItems)&&const DeepCollectionEquality().equals(other._transactionItems, _transactionItems));
}


@override
int get hashCode => Object.hash(runtimeType,contract,kickoff,transaction,payment,const DeepCollectionEquality().hash(_approvals),approvalsPage,approvalsTotal,approvalsHasReachEnd,const DeepCollectionEquality().hash(_procurements),procurementsPage,procurementsTotal,procurementsHasReachEnd,const DeepCollectionEquality().hash(_contractItems),const DeepCollectionEquality().hash(_transactionItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueListState(contract: $contract, kickoff: $kickoff, transaction: $transaction, payment: $payment, approvals: $approvals, approvalsPage: $approvalsPage, approvalsTotal: $approvalsTotal, approvalsHasReachEnd: $approvalsHasReachEnd, procurements: $procurements, procurementsPage: $procurementsPage, procurementsTotal: $procurementsTotal, procurementsHasReachEnd: $procurementsHasReachEnd, contractItems: $contractItems, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class _$IssueListStateCopyWith<$Res> implements $IssueListStateCopyWith<$Res> {
  factory _$IssueListStateCopyWith(_IssueListState value, $Res Function(_IssueListState) _then) = __$IssueListStateCopyWithImpl;
@override @useResult
$Res call({
 ContractIssue? contract, KickoffIssue? kickoff, TransactionIssue? transaction, PaymentIssue? payment, List<ApprovalIssue> approvals, int approvalsPage, int approvalsTotal, bool approvalsHasReachEnd, List<ProcurementIssue> procurements, int procurementsPage, int procurementsTotal, bool procurementsHasReachEnd, List<ContractIssueItem> contractItems, List<TransactionIssueItem> transactionItems
});


@override $ContractIssueCopyWith<$Res>? get contract;@override $KickoffIssueCopyWith<$Res>? get kickoff;@override $TransactionIssueCopyWith<$Res>? get transaction;@override $PaymentIssueCopyWith<$Res>? get payment;

}
/// @nodoc
class __$IssueListStateCopyWithImpl<$Res>
    implements _$IssueListStateCopyWith<$Res> {
  __$IssueListStateCopyWithImpl(this._self, this._then);

  final _IssueListState _self;
  final $Res Function(_IssueListState) _then;

/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contract = freezed,Object? kickoff = freezed,Object? transaction = freezed,Object? payment = freezed,Object? approvals = null,Object? approvalsPage = null,Object? approvalsTotal = null,Object? approvalsHasReachEnd = null,Object? procurements = null,Object? procurementsPage = null,Object? procurementsTotal = null,Object? procurementsHasReachEnd = null,Object? contractItems = null,Object? transactionItems = null,}) {
  return _then(_IssueListState(
contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractIssue?,kickoff: freezed == kickoff ? _self.kickoff : kickoff // ignore: cast_nullable_to_non_nullable
as KickoffIssue?,transaction: freezed == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionIssue?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentIssue?,approvals: null == approvals ? _self._approvals : approvals // ignore: cast_nullable_to_non_nullable
as List<ApprovalIssue>,approvalsPage: null == approvalsPage ? _self.approvalsPage : approvalsPage // ignore: cast_nullable_to_non_nullable
as int,approvalsTotal: null == approvalsTotal ? _self.approvalsTotal : approvalsTotal // ignore: cast_nullable_to_non_nullable
as int,approvalsHasReachEnd: null == approvalsHasReachEnd ? _self.approvalsHasReachEnd : approvalsHasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,procurements: null == procurements ? _self._procurements : procurements // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssue>,procurementsPage: null == procurementsPage ? _self.procurementsPage : procurementsPage // ignore: cast_nullable_to_non_nullable
as int,procurementsTotal: null == procurementsTotal ? _self.procurementsTotal : procurementsTotal // ignore: cast_nullable_to_non_nullable
as int,procurementsHasReachEnd: null == procurementsHasReachEnd ? _self.procurementsHasReachEnd : procurementsHasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,contractItems: null == contractItems ? _self._contractItems : contractItems // ignore: cast_nullable_to_non_nullable
as List<ContractIssueItem>,transactionItems: null == transactionItems ? _self._transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItem>,
  ));
}

/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractIssueCopyWith<$Res>? get contract {
    if (_self.contract == null) {
    return null;
  }

  return $ContractIssueCopyWith<$Res>(_self.contract!, (value) {
    return _then(_self.copyWith(contract: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KickoffIssueCopyWith<$Res>? get kickoff {
    if (_self.kickoff == null) {
    return null;
  }

  return $KickoffIssueCopyWith<$Res>(_self.kickoff!, (value) {
    return _then(_self.copyWith(kickoff: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionIssueCopyWith<$Res>? get transaction {
    if (_self.transaction == null) {
    return null;
  }

  return $TransactionIssueCopyWith<$Res>(_self.transaction!, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}/// Create a copy of IssueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentIssueCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentIssueCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

/// @nodoc
mixin _$IssueOptionsState implements DiagnosticableTreeMixin {

 List<IssueCategory> get categories; List<TransactionIssueItemCategory> get transactionCategories; List<Currency> get currencies;
/// Create a copy of IssueOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueOptionsStateCopyWith<IssueOptionsState> get copyWith => _$IssueOptionsStateCopyWithImpl<IssueOptionsState>(this as IssueOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueOptionsState'))
    ..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('transactionCategories', transactionCategories))..add(DiagnosticsProperty('currencies', currencies));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueOptionsState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.transactionCategories, transactionCategories)&&const DeepCollectionEquality().equals(other.currencies, currencies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(transactionCategories),const DeepCollectionEquality().hash(currencies));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueOptionsState(categories: $categories, transactionCategories: $transactionCategories, currencies: $currencies)';
}


}

/// @nodoc
abstract mixin class $IssueOptionsStateCopyWith<$Res>  {
  factory $IssueOptionsStateCopyWith(IssueOptionsState value, $Res Function(IssueOptionsState) _then) = _$IssueOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<IssueCategory> categories, List<TransactionIssueItemCategory> transactionCategories, List<Currency> currencies
});




}
/// @nodoc
class _$IssueOptionsStateCopyWithImpl<$Res>
    implements $IssueOptionsStateCopyWith<$Res> {
  _$IssueOptionsStateCopyWithImpl(this._self, this._then);

  final IssueOptionsState _self;
  final $Res Function(IssueOptionsState) _then;

/// Create a copy of IssueOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? transactionCategories = null,Object? currencies = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<IssueCategory>,transactionCategories: null == transactionCategories ? _self.transactionCategories : transactionCategories // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItemCategory>,currencies: null == currencies ? _self.currencies : currencies // ignore: cast_nullable_to_non_nullable
as List<Currency>,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueOptionsState].
extension IssueOptionsStatePatterns on IssueOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _IssueOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _IssueOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IssueCategory> categories,  List<TransactionIssueItemCategory> transactionCategories,  List<Currency> currencies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueOptionsState() when $default != null:
return $default(_that.categories,_that.transactionCategories,_that.currencies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IssueCategory> categories,  List<TransactionIssueItemCategory> transactionCategories,  List<Currency> currencies)  $default,) {final _that = this;
switch (_that) {
case _IssueOptionsState():
return $default(_that.categories,_that.transactionCategories,_that.currencies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IssueCategory> categories,  List<TransactionIssueItemCategory> transactionCategories,  List<Currency> currencies)?  $default,) {final _that = this;
switch (_that) {
case _IssueOptionsState() when $default != null:
return $default(_that.categories,_that.transactionCategories,_that.currencies);case _:
  return null;

}
}

}

/// @nodoc


class _IssueOptionsState with DiagnosticableTreeMixin implements IssueOptionsState {
   _IssueOptionsState({final  List<IssueCategory> categories = const [], final  List<TransactionIssueItemCategory> transactionCategories = const [], final  List<Currency> currencies = const []}): _categories = categories,_transactionCategories = transactionCategories,_currencies = currencies;
  

 final  List<IssueCategory> _categories;
@override@JsonKey() List<IssueCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<TransactionIssueItemCategory> _transactionCategories;
@override@JsonKey() List<TransactionIssueItemCategory> get transactionCategories {
  if (_transactionCategories is EqualUnmodifiableListView) return _transactionCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionCategories);
}

 final  List<Currency> _currencies;
@override@JsonKey() List<Currency> get currencies {
  if (_currencies is EqualUnmodifiableListView) return _currencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currencies);
}


/// Create a copy of IssueOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueOptionsStateCopyWith<_IssueOptionsState> get copyWith => __$IssueOptionsStateCopyWithImpl<_IssueOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueOptionsState'))
    ..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('transactionCategories', transactionCategories))..add(DiagnosticsProperty('currencies', currencies));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueOptionsState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._transactionCategories, _transactionCategories)&&const DeepCollectionEquality().equals(other._currencies, _currencies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_transactionCategories),const DeepCollectionEquality().hash(_currencies));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueOptionsState(categories: $categories, transactionCategories: $transactionCategories, currencies: $currencies)';
}


}

/// @nodoc
abstract mixin class _$IssueOptionsStateCopyWith<$Res> implements $IssueOptionsStateCopyWith<$Res> {
  factory _$IssueOptionsStateCopyWith(_IssueOptionsState value, $Res Function(_IssueOptionsState) _then) = __$IssueOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<IssueCategory> categories, List<TransactionIssueItemCategory> transactionCategories, List<Currency> currencies
});




}
/// @nodoc
class __$IssueOptionsStateCopyWithImpl<$Res>
    implements _$IssueOptionsStateCopyWith<$Res> {
  __$IssueOptionsStateCopyWithImpl(this._self, this._then);

  final _IssueOptionsState _self;
  final $Res Function(_IssueOptionsState) _then;

/// Create a copy of IssueOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? transactionCategories = null,Object? currencies = null,}) {
  return _then(_IssueOptionsState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<IssueCategory>,transactionCategories: null == transactionCategories ? _self._transactionCategories : transactionCategories // ignore: cast_nullable_to_non_nullable
as List<TransactionIssueItemCategory>,currencies: null == currencies ? _self._currencies : currencies // ignore: cast_nullable_to_non_nullable
as List<Currency>,
  ));
}


}

/// @nodoc
mixin _$IssueSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState()';
}


}

/// @nodoc
class $IssueSubmitStateCopyWith<$Res>  {
$IssueSubmitStateCopyWith(IssueSubmitState _, $Res Function(IssueSubmitState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IssueSubmitIdle value)?  idle,TResult Function( IssueSubmitPending value)?  pending,TResult Function( IssueSubmitCreated value)?  created,TResult Function( IssueSubmitUpdated value)?  updated,TResult Function( IssueSubmitDeleted value)?  deleted,TResult Function( IssueSubmitMailed value)?  mailed,TResult Function( IssueSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IssueSubmitIdle() when idle != null:
return idle(_that);case IssueSubmitPending() when pending != null:
return pending(_that);case IssueSubmitCreated() when created != null:
return created(_that);case IssueSubmitUpdated() when updated != null:
return updated(_that);case IssueSubmitDeleted() when deleted != null:
return deleted(_that);case IssueSubmitMailed() when mailed != null:
return mailed(_that);case IssueSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IssueSubmitIdle value)  idle,required TResult Function( IssueSubmitPending value)  pending,required TResult Function( IssueSubmitCreated value)  created,required TResult Function( IssueSubmitUpdated value)  updated,required TResult Function( IssueSubmitDeleted value)  deleted,required TResult Function( IssueSubmitMailed value)  mailed,required TResult Function( IssueSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case IssueSubmitIdle():
return idle(_that);case IssueSubmitPending():
return pending(_that);case IssueSubmitCreated():
return created(_that);case IssueSubmitUpdated():
return updated(_that);case IssueSubmitDeleted():
return deleted(_that);case IssueSubmitMailed():
return mailed(_that);case IssueSubmitFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IssueSubmitIdle value)?  idle,TResult? Function( IssueSubmitPending value)?  pending,TResult? Function( IssueSubmitCreated value)?  created,TResult? Function( IssueSubmitUpdated value)?  updated,TResult? Function( IssueSubmitDeleted value)?  deleted,TResult? Function( IssueSubmitMailed value)?  mailed,TResult? Function( IssueSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case IssueSubmitIdle() when idle != null:
return idle(_that);case IssueSubmitPending() when pending != null:
return pending(_that);case IssueSubmitCreated() when created != null:
return created(_that);case IssueSubmitUpdated() when updated != null:
return updated(_that);case IssueSubmitDeleted() when deleted != null:
return deleted(_that);case IssueSubmitMailed() when mailed != null:
return mailed(_that);case IssueSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( Issue issue)?  created,TResult Function( Issue issue)?  updated,TResult Function()?  deleted,TResult Function()?  mailed,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IssueSubmitIdle() when idle != null:
return idle();case IssueSubmitPending() when pending != null:
return pending();case IssueSubmitCreated() when created != null:
return created(_that.issue);case IssueSubmitUpdated() when updated != null:
return updated(_that.issue);case IssueSubmitDeleted() when deleted != null:
return deleted();case IssueSubmitMailed() when mailed != null:
return mailed();case IssueSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( Issue issue)  created,required TResult Function( Issue issue)  updated,required TResult Function()  deleted,required TResult Function()  mailed,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case IssueSubmitIdle():
return idle();case IssueSubmitPending():
return pending();case IssueSubmitCreated():
return created(_that.issue);case IssueSubmitUpdated():
return updated(_that.issue);case IssueSubmitDeleted():
return deleted();case IssueSubmitMailed():
return mailed();case IssueSubmitFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( Issue issue)?  created,TResult? Function( Issue issue)?  updated,TResult? Function()?  deleted,TResult? Function()?  mailed,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case IssueSubmitIdle() when idle != null:
return idle();case IssueSubmitPending() when pending != null:
return pending();case IssueSubmitCreated() when created != null:
return created(_that.issue);case IssueSubmitUpdated() when updated != null:
return updated(_that.issue);case IssueSubmitDeleted() when deleted != null:
return deleted();case IssueSubmitMailed() when mailed != null:
return mailed();case IssueSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class IssueSubmitIdle with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.idle()';
}


}




/// @nodoc


class IssueSubmitPending with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.pending()';
}


}




/// @nodoc


class IssueSubmitCreated with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitCreated(this.issue);
  

 final  Issue issue;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueSubmitCreatedCopyWith<IssueSubmitCreated> get copyWith => _$IssueSubmitCreatedCopyWithImpl<IssueSubmitCreated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.created'))
    ..add(DiagnosticsProperty('issue', issue));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitCreated&&(identical(other.issue, issue) || other.issue == issue));
}


@override
int get hashCode => Object.hash(runtimeType,issue);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.created(issue: $issue)';
}


}

/// @nodoc
abstract mixin class $IssueSubmitCreatedCopyWith<$Res> implements $IssueSubmitStateCopyWith<$Res> {
  factory $IssueSubmitCreatedCopyWith(IssueSubmitCreated value, $Res Function(IssueSubmitCreated) _then) = _$IssueSubmitCreatedCopyWithImpl;
@useResult
$Res call({
 Issue issue
});


$IssueCopyWith<$Res> get issue;

}
/// @nodoc
class _$IssueSubmitCreatedCopyWithImpl<$Res>
    implements $IssueSubmitCreatedCopyWith<$Res> {
  _$IssueSubmitCreatedCopyWithImpl(this._self, this._then);

  final IssueSubmitCreated _self;
  final $Res Function(IssueSubmitCreated) _then;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? issue = null,}) {
  return _then(IssueSubmitCreated(
null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
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


class IssueSubmitUpdated with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitUpdated(this.issue);
  

 final  Issue issue;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueSubmitUpdatedCopyWith<IssueSubmitUpdated> get copyWith => _$IssueSubmitUpdatedCopyWithImpl<IssueSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.updated'))
    ..add(DiagnosticsProperty('issue', issue));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitUpdated&&(identical(other.issue, issue) || other.issue == issue));
}


@override
int get hashCode => Object.hash(runtimeType,issue);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.updated(issue: $issue)';
}


}

/// @nodoc
abstract mixin class $IssueSubmitUpdatedCopyWith<$Res> implements $IssueSubmitStateCopyWith<$Res> {
  factory $IssueSubmitUpdatedCopyWith(IssueSubmitUpdated value, $Res Function(IssueSubmitUpdated) _then) = _$IssueSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 Issue issue
});


$IssueCopyWith<$Res> get issue;

}
/// @nodoc
class _$IssueSubmitUpdatedCopyWithImpl<$Res>
    implements $IssueSubmitUpdatedCopyWith<$Res> {
  _$IssueSubmitUpdatedCopyWithImpl(this._self, this._then);

  final IssueSubmitUpdated _self;
  final $Res Function(IssueSubmitUpdated) _then;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? issue = null,}) {
  return _then(IssueSubmitUpdated(
null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
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


class IssueSubmitDeleted with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.deleted()';
}


}




/// @nodoc


class IssueSubmitMailed with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitMailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.mailed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitMailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.mailed()';
}


}




/// @nodoc


class IssueSubmitFailure with DiagnosticableTreeMixin implements IssueSubmitState {
  const IssueSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueSubmitFailureCopyWith<IssueSubmitFailure> get copyWith => _$IssueSubmitFailureCopyWithImpl<IssueSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $IssueSubmitFailureCopyWith<$Res> implements $IssueSubmitStateCopyWith<$Res> {
  factory $IssueSubmitFailureCopyWith(IssueSubmitFailure value, $Res Function(IssueSubmitFailure) _then) = _$IssueSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$IssueSubmitFailureCopyWithImpl<$Res>
    implements $IssueSubmitFailureCopyWith<$Res> {
  _$IssueSubmitFailureCopyWithImpl(this._self, this._then);

  final IssueSubmitFailure _self;
  final $Res Function(IssueSubmitFailure) _then;

/// Create a copy of IssueSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(IssueSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$IssueValidationState implements DiagnosticableTreeMixin {

 bool get contentInvalid; bool get contractItemsMissing; bool get contractItemInvalid; bool get transactionItemsMissing; bool get transactionItemInvalid; bool get ratioInvalid; bool get kickoffDateMissing; bool get procurementItemsMissing; bool get procurementItemInvalid;
/// Create a copy of IssueValidationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueValidationStateCopyWith<IssueValidationState> get copyWith => _$IssueValidationStateCopyWithImpl<IssueValidationState>(this as IssueValidationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueValidationState'))
    ..add(DiagnosticsProperty('contentInvalid', contentInvalid))..add(DiagnosticsProperty('contractItemsMissing', contractItemsMissing))..add(DiagnosticsProperty('contractItemInvalid', contractItemInvalid))..add(DiagnosticsProperty('transactionItemsMissing', transactionItemsMissing))..add(DiagnosticsProperty('transactionItemInvalid', transactionItemInvalid))..add(DiagnosticsProperty('ratioInvalid', ratioInvalid))..add(DiagnosticsProperty('kickoffDateMissing', kickoffDateMissing))..add(DiagnosticsProperty('procurementItemsMissing', procurementItemsMissing))..add(DiagnosticsProperty('procurementItemInvalid', procurementItemInvalid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueValidationState&&(identical(other.contentInvalid, contentInvalid) || other.contentInvalid == contentInvalid)&&(identical(other.contractItemsMissing, contractItemsMissing) || other.contractItemsMissing == contractItemsMissing)&&(identical(other.contractItemInvalid, contractItemInvalid) || other.contractItemInvalid == contractItemInvalid)&&(identical(other.transactionItemsMissing, transactionItemsMissing) || other.transactionItemsMissing == transactionItemsMissing)&&(identical(other.transactionItemInvalid, transactionItemInvalid) || other.transactionItemInvalid == transactionItemInvalid)&&(identical(other.ratioInvalid, ratioInvalid) || other.ratioInvalid == ratioInvalid)&&(identical(other.kickoffDateMissing, kickoffDateMissing) || other.kickoffDateMissing == kickoffDateMissing)&&(identical(other.procurementItemsMissing, procurementItemsMissing) || other.procurementItemsMissing == procurementItemsMissing)&&(identical(other.procurementItemInvalid, procurementItemInvalid) || other.procurementItemInvalid == procurementItemInvalid));
}


@override
int get hashCode => Object.hash(runtimeType,contentInvalid,contractItemsMissing,contractItemInvalid,transactionItemsMissing,transactionItemInvalid,ratioInvalid,kickoffDateMissing,procurementItemsMissing,procurementItemInvalid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueValidationState(contentInvalid: $contentInvalid, contractItemsMissing: $contractItemsMissing, contractItemInvalid: $contractItemInvalid, transactionItemsMissing: $transactionItemsMissing, transactionItemInvalid: $transactionItemInvalid, ratioInvalid: $ratioInvalid, kickoffDateMissing: $kickoffDateMissing, procurementItemsMissing: $procurementItemsMissing, procurementItemInvalid: $procurementItemInvalid)';
}


}

/// @nodoc
abstract mixin class $IssueValidationStateCopyWith<$Res>  {
  factory $IssueValidationStateCopyWith(IssueValidationState value, $Res Function(IssueValidationState) _then) = _$IssueValidationStateCopyWithImpl;
@useResult
$Res call({
 bool contentInvalid, bool contractItemsMissing, bool contractItemInvalid, bool transactionItemsMissing, bool transactionItemInvalid, bool ratioInvalid, bool kickoffDateMissing, bool procurementItemsMissing, bool procurementItemInvalid
});




}
/// @nodoc
class _$IssueValidationStateCopyWithImpl<$Res>
    implements $IssueValidationStateCopyWith<$Res> {
  _$IssueValidationStateCopyWithImpl(this._self, this._then);

  final IssueValidationState _self;
  final $Res Function(IssueValidationState) _then;

/// Create a copy of IssueValidationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contentInvalid = null,Object? contractItemsMissing = null,Object? contractItemInvalid = null,Object? transactionItemsMissing = null,Object? transactionItemInvalid = null,Object? ratioInvalid = null,Object? kickoffDateMissing = null,Object? procurementItemsMissing = null,Object? procurementItemInvalid = null,}) {
  return _then(_self.copyWith(
contentInvalid: null == contentInvalid ? _self.contentInvalid : contentInvalid // ignore: cast_nullable_to_non_nullable
as bool,contractItemsMissing: null == contractItemsMissing ? _self.contractItemsMissing : contractItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,contractItemInvalid: null == contractItemInvalid ? _self.contractItemInvalid : contractItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,transactionItemsMissing: null == transactionItemsMissing ? _self.transactionItemsMissing : transactionItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,transactionItemInvalid: null == transactionItemInvalid ? _self.transactionItemInvalid : transactionItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,ratioInvalid: null == ratioInvalid ? _self.ratioInvalid : ratioInvalid // ignore: cast_nullable_to_non_nullable
as bool,kickoffDateMissing: null == kickoffDateMissing ? _self.kickoffDateMissing : kickoffDateMissing // ignore: cast_nullable_to_non_nullable
as bool,procurementItemsMissing: null == procurementItemsMissing ? _self.procurementItemsMissing : procurementItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,procurementItemInvalid: null == procurementItemInvalid ? _self.procurementItemInvalid : procurementItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueValidationState].
extension IssueValidationStatePatterns on IssueValidationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueValidationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueValidationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueValidationState value)  $default,){
final _that = this;
switch (_that) {
case _IssueValidationState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueValidationState value)?  $default,){
final _that = this;
switch (_that) {
case _IssueValidationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool contentInvalid,  bool contractItemsMissing,  bool contractItemInvalid,  bool transactionItemsMissing,  bool transactionItemInvalid,  bool ratioInvalid,  bool kickoffDateMissing,  bool procurementItemsMissing,  bool procurementItemInvalid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueValidationState() when $default != null:
return $default(_that.contentInvalid,_that.contractItemsMissing,_that.contractItemInvalid,_that.transactionItemsMissing,_that.transactionItemInvalid,_that.ratioInvalid,_that.kickoffDateMissing,_that.procurementItemsMissing,_that.procurementItemInvalid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool contentInvalid,  bool contractItemsMissing,  bool contractItemInvalid,  bool transactionItemsMissing,  bool transactionItemInvalid,  bool ratioInvalid,  bool kickoffDateMissing,  bool procurementItemsMissing,  bool procurementItemInvalid)  $default,) {final _that = this;
switch (_that) {
case _IssueValidationState():
return $default(_that.contentInvalid,_that.contractItemsMissing,_that.contractItemInvalid,_that.transactionItemsMissing,_that.transactionItemInvalid,_that.ratioInvalid,_that.kickoffDateMissing,_that.procurementItemsMissing,_that.procurementItemInvalid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool contentInvalid,  bool contractItemsMissing,  bool contractItemInvalid,  bool transactionItemsMissing,  bool transactionItemInvalid,  bool ratioInvalid,  bool kickoffDateMissing,  bool procurementItemsMissing,  bool procurementItemInvalid)?  $default,) {final _that = this;
switch (_that) {
case _IssueValidationState() when $default != null:
return $default(_that.contentInvalid,_that.contractItemsMissing,_that.contractItemInvalid,_that.transactionItemsMissing,_that.transactionItemInvalid,_that.ratioInvalid,_that.kickoffDateMissing,_that.procurementItemsMissing,_that.procurementItemInvalid);case _:
  return null;

}
}

}

/// @nodoc


class _IssueValidationState with DiagnosticableTreeMixin implements IssueValidationState {
   _IssueValidationState({this.contentInvalid = false, this.contractItemsMissing = false, this.contractItemInvalid = false, this.transactionItemsMissing = false, this.transactionItemInvalid = false, this.ratioInvalid = false, this.kickoffDateMissing = false, this.procurementItemsMissing = false, this.procurementItemInvalid = false});
  

@override@JsonKey() final  bool contentInvalid;
@override@JsonKey() final  bool contractItemsMissing;
@override@JsonKey() final  bool contractItemInvalid;
@override@JsonKey() final  bool transactionItemsMissing;
@override@JsonKey() final  bool transactionItemInvalid;
@override@JsonKey() final  bool ratioInvalid;
@override@JsonKey() final  bool kickoffDateMissing;
@override@JsonKey() final  bool procurementItemsMissing;
@override@JsonKey() final  bool procurementItemInvalid;

/// Create a copy of IssueValidationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueValidationStateCopyWith<_IssueValidationState> get copyWith => __$IssueValidationStateCopyWithImpl<_IssueValidationState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IssueValidationState'))
    ..add(DiagnosticsProperty('contentInvalid', contentInvalid))..add(DiagnosticsProperty('contractItemsMissing', contractItemsMissing))..add(DiagnosticsProperty('contractItemInvalid', contractItemInvalid))..add(DiagnosticsProperty('transactionItemsMissing', transactionItemsMissing))..add(DiagnosticsProperty('transactionItemInvalid', transactionItemInvalid))..add(DiagnosticsProperty('ratioInvalid', ratioInvalid))..add(DiagnosticsProperty('kickoffDateMissing', kickoffDateMissing))..add(DiagnosticsProperty('procurementItemsMissing', procurementItemsMissing))..add(DiagnosticsProperty('procurementItemInvalid', procurementItemInvalid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueValidationState&&(identical(other.contentInvalid, contentInvalid) || other.contentInvalid == contentInvalid)&&(identical(other.contractItemsMissing, contractItemsMissing) || other.contractItemsMissing == contractItemsMissing)&&(identical(other.contractItemInvalid, contractItemInvalid) || other.contractItemInvalid == contractItemInvalid)&&(identical(other.transactionItemsMissing, transactionItemsMissing) || other.transactionItemsMissing == transactionItemsMissing)&&(identical(other.transactionItemInvalid, transactionItemInvalid) || other.transactionItemInvalid == transactionItemInvalid)&&(identical(other.ratioInvalid, ratioInvalid) || other.ratioInvalid == ratioInvalid)&&(identical(other.kickoffDateMissing, kickoffDateMissing) || other.kickoffDateMissing == kickoffDateMissing)&&(identical(other.procurementItemsMissing, procurementItemsMissing) || other.procurementItemsMissing == procurementItemsMissing)&&(identical(other.procurementItemInvalid, procurementItemInvalid) || other.procurementItemInvalid == procurementItemInvalid));
}


@override
int get hashCode => Object.hash(runtimeType,contentInvalid,contractItemsMissing,contractItemInvalid,transactionItemsMissing,transactionItemInvalid,ratioInvalid,kickoffDateMissing,procurementItemsMissing,procurementItemInvalid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IssueValidationState(contentInvalid: $contentInvalid, contractItemsMissing: $contractItemsMissing, contractItemInvalid: $contractItemInvalid, transactionItemsMissing: $transactionItemsMissing, transactionItemInvalid: $transactionItemInvalid, ratioInvalid: $ratioInvalid, kickoffDateMissing: $kickoffDateMissing, procurementItemsMissing: $procurementItemsMissing, procurementItemInvalid: $procurementItemInvalid)';
}


}

/// @nodoc
abstract mixin class _$IssueValidationStateCopyWith<$Res> implements $IssueValidationStateCopyWith<$Res> {
  factory _$IssueValidationStateCopyWith(_IssueValidationState value, $Res Function(_IssueValidationState) _then) = __$IssueValidationStateCopyWithImpl;
@override @useResult
$Res call({
 bool contentInvalid, bool contractItemsMissing, bool contractItemInvalid, bool transactionItemsMissing, bool transactionItemInvalid, bool ratioInvalid, bool kickoffDateMissing, bool procurementItemsMissing, bool procurementItemInvalid
});




}
/// @nodoc
class __$IssueValidationStateCopyWithImpl<$Res>
    implements _$IssueValidationStateCopyWith<$Res> {
  __$IssueValidationStateCopyWithImpl(this._self, this._then);

  final _IssueValidationState _self;
  final $Res Function(_IssueValidationState) _then;

/// Create a copy of IssueValidationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contentInvalid = null,Object? contractItemsMissing = null,Object? contractItemInvalid = null,Object? transactionItemsMissing = null,Object? transactionItemInvalid = null,Object? ratioInvalid = null,Object? kickoffDateMissing = null,Object? procurementItemsMissing = null,Object? procurementItemInvalid = null,}) {
  return _then(_IssueValidationState(
contentInvalid: null == contentInvalid ? _self.contentInvalid : contentInvalid // ignore: cast_nullable_to_non_nullable
as bool,contractItemsMissing: null == contractItemsMissing ? _self.contractItemsMissing : contractItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,contractItemInvalid: null == contractItemInvalid ? _self.contractItemInvalid : contractItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,transactionItemsMissing: null == transactionItemsMissing ? _self.transactionItemsMissing : transactionItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,transactionItemInvalid: null == transactionItemInvalid ? _self.transactionItemInvalid : transactionItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,ratioInvalid: null == ratioInvalid ? _self.ratioInvalid : ratioInvalid // ignore: cast_nullable_to_non_nullable
as bool,kickoffDateMissing: null == kickoffDateMissing ? _self.kickoffDateMissing : kickoffDateMissing // ignore: cast_nullable_to_non_nullable
as bool,procurementItemsMissing: null == procurementItemsMissing ? _self.procurementItemsMissing : procurementItemsMissing // ignore: cast_nullable_to_non_nullable
as bool,procurementItemInvalid: null == procurementItemInvalid ? _self.procurementItemInvalid : procurementItemInvalid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ProcurementIssueFormState implements DiagnosticableTreeMixin {

 List<ProcurementIssueItem> get items; List<ProcurementIssueRequest> get requests; Set<int> get selectedSupplierIds; Map<int, String> get titles; Map<int, DateTime?> get deliveryDates; Map<int, String?> get paymentTerms; Map<int, bool> get hasFees; Map<int, String?> get notes;
/// Create a copy of ProcurementIssueFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcurementIssueFormStateCopyWith<ProcurementIssueFormState> get copyWith => _$ProcurementIssueFormStateCopyWithImpl<ProcurementIssueFormState>(this as ProcurementIssueFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProcurementIssueFormState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('requests', requests))..add(DiagnosticsProperty('selectedSupplierIds', selectedSupplierIds))..add(DiagnosticsProperty('titles', titles))..add(DiagnosticsProperty('deliveryDates', deliveryDates))..add(DiagnosticsProperty('paymentTerms', paymentTerms))..add(DiagnosticsProperty('hasFees', hasFees))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcurementIssueFormState&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.requests, requests)&&const DeepCollectionEquality().equals(other.selectedSupplierIds, selectedSupplierIds)&&const DeepCollectionEquality().equals(other.titles, titles)&&const DeepCollectionEquality().equals(other.deliveryDates, deliveryDates)&&const DeepCollectionEquality().equals(other.paymentTerms, paymentTerms)&&const DeepCollectionEquality().equals(other.hasFees, hasFees)&&const DeepCollectionEquality().equals(other.notes, notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(requests),const DeepCollectionEquality().hash(selectedSupplierIds),const DeepCollectionEquality().hash(titles),const DeepCollectionEquality().hash(deliveryDates),const DeepCollectionEquality().hash(paymentTerms),const DeepCollectionEquality().hash(hasFees),const DeepCollectionEquality().hash(notes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProcurementIssueFormState(items: $items, requests: $requests, selectedSupplierIds: $selectedSupplierIds, titles: $titles, deliveryDates: $deliveryDates, paymentTerms: $paymentTerms, hasFees: $hasFees, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ProcurementIssueFormStateCopyWith<$Res>  {
  factory $ProcurementIssueFormStateCopyWith(ProcurementIssueFormState value, $Res Function(ProcurementIssueFormState) _then) = _$ProcurementIssueFormStateCopyWithImpl;
@useResult
$Res call({
 List<ProcurementIssueItem> items, List<ProcurementIssueRequest> requests, Set<int> selectedSupplierIds, Map<int, String> titles, Map<int, DateTime?> deliveryDates, Map<int, String?> paymentTerms, Map<int, bool> hasFees, Map<int, String?> notes
});




}
/// @nodoc
class _$ProcurementIssueFormStateCopyWithImpl<$Res>
    implements $ProcurementIssueFormStateCopyWith<$Res> {
  _$ProcurementIssueFormStateCopyWithImpl(this._self, this._then);

  final ProcurementIssueFormState _self;
  final $Res Function(ProcurementIssueFormState) _then;

/// Create a copy of ProcurementIssueFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? requests = null,Object? selectedSupplierIds = null,Object? titles = null,Object? deliveryDates = null,Object? paymentTerms = null,Object? hasFees = null,Object? notes = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueItem>,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueRequest>,selectedSupplierIds: null == selectedSupplierIds ? _self.selectedSupplierIds : selectedSupplierIds // ignore: cast_nullable_to_non_nullable
as Set<int>,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as Map<int, String>,deliveryDates: null == deliveryDates ? _self.deliveryDates : deliveryDates // ignore: cast_nullable_to_non_nullable
as Map<int, DateTime?>,paymentTerms: null == paymentTerms ? _self.paymentTerms : paymentTerms // ignore: cast_nullable_to_non_nullable
as Map<int, String?>,hasFees: null == hasFees ? _self.hasFees : hasFees // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as Map<int, String?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcurementIssueFormState].
extension ProcurementIssueFormStatePatterns on ProcurementIssueFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcurementIssueFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcurementIssueFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcurementIssueFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProcurementIssueFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcurementIssueFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProcurementIssueFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProcurementIssueItem> items,  List<ProcurementIssueRequest> requests,  Set<int> selectedSupplierIds,  Map<int, String> titles,  Map<int, DateTime?> deliveryDates,  Map<int, String?> paymentTerms,  Map<int, bool> hasFees,  Map<int, String?> notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcurementIssueFormState() when $default != null:
return $default(_that.items,_that.requests,_that.selectedSupplierIds,_that.titles,_that.deliveryDates,_that.paymentTerms,_that.hasFees,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProcurementIssueItem> items,  List<ProcurementIssueRequest> requests,  Set<int> selectedSupplierIds,  Map<int, String> titles,  Map<int, DateTime?> deliveryDates,  Map<int, String?> paymentTerms,  Map<int, bool> hasFees,  Map<int, String?> notes)  $default,) {final _that = this;
switch (_that) {
case _ProcurementIssueFormState():
return $default(_that.items,_that.requests,_that.selectedSupplierIds,_that.titles,_that.deliveryDates,_that.paymentTerms,_that.hasFees,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProcurementIssueItem> items,  List<ProcurementIssueRequest> requests,  Set<int> selectedSupplierIds,  Map<int, String> titles,  Map<int, DateTime?> deliveryDates,  Map<int, String?> paymentTerms,  Map<int, bool> hasFees,  Map<int, String?> notes)?  $default,) {final _that = this;
switch (_that) {
case _ProcurementIssueFormState() when $default != null:
return $default(_that.items,_that.requests,_that.selectedSupplierIds,_that.titles,_that.deliveryDates,_that.paymentTerms,_that.hasFees,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _ProcurementIssueFormState extends ProcurementIssueFormState with DiagnosticableTreeMixin {
   _ProcurementIssueFormState({final  List<ProcurementIssueItem> items = const [], final  List<ProcurementIssueRequest> requests = const [], final  Set<int> selectedSupplierIds = const <int>{}, final  Map<int, String> titles = const {}, final  Map<int, DateTime?> deliveryDates = const {}, final  Map<int, String?> paymentTerms = const {}, final  Map<int, bool> hasFees = const {}, final  Map<int, String?> notes = const {}}): _items = items,_requests = requests,_selectedSupplierIds = selectedSupplierIds,_titles = titles,_deliveryDates = deliveryDates,_paymentTerms = paymentTerms,_hasFees = hasFees,_notes = notes,super._();
  

 final  List<ProcurementIssueItem> _items;
@override@JsonKey() List<ProcurementIssueItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<ProcurementIssueRequest> _requests;
@override@JsonKey() List<ProcurementIssueRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  Set<int> _selectedSupplierIds;
@override@JsonKey() Set<int> get selectedSupplierIds {
  if (_selectedSupplierIds is EqualUnmodifiableSetView) return _selectedSupplierIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedSupplierIds);
}

 final  Map<int, String> _titles;
@override@JsonKey() Map<int, String> get titles {
  if (_titles is EqualUnmodifiableMapView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_titles);
}

 final  Map<int, DateTime?> _deliveryDates;
@override@JsonKey() Map<int, DateTime?> get deliveryDates {
  if (_deliveryDates is EqualUnmodifiableMapView) return _deliveryDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_deliveryDates);
}

 final  Map<int, String?> _paymentTerms;
@override@JsonKey() Map<int, String?> get paymentTerms {
  if (_paymentTerms is EqualUnmodifiableMapView) return _paymentTerms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentTerms);
}

 final  Map<int, bool> _hasFees;
@override@JsonKey() Map<int, bool> get hasFees {
  if (_hasFees is EqualUnmodifiableMapView) return _hasFees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hasFees);
}

 final  Map<int, String?> _notes;
@override@JsonKey() Map<int, String?> get notes {
  if (_notes is EqualUnmodifiableMapView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_notes);
}


/// Create a copy of ProcurementIssueFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcurementIssueFormStateCopyWith<_ProcurementIssueFormState> get copyWith => __$ProcurementIssueFormStateCopyWithImpl<_ProcurementIssueFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProcurementIssueFormState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('requests', requests))..add(DiagnosticsProperty('selectedSupplierIds', selectedSupplierIds))..add(DiagnosticsProperty('titles', titles))..add(DiagnosticsProperty('deliveryDates', deliveryDates))..add(DiagnosticsProperty('paymentTerms', paymentTerms))..add(DiagnosticsProperty('hasFees', hasFees))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcurementIssueFormState&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._requests, _requests)&&const DeepCollectionEquality().equals(other._selectedSupplierIds, _selectedSupplierIds)&&const DeepCollectionEquality().equals(other._titles, _titles)&&const DeepCollectionEquality().equals(other._deliveryDates, _deliveryDates)&&const DeepCollectionEquality().equals(other._paymentTerms, _paymentTerms)&&const DeepCollectionEquality().equals(other._hasFees, _hasFees)&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_requests),const DeepCollectionEquality().hash(_selectedSupplierIds),const DeepCollectionEquality().hash(_titles),const DeepCollectionEquality().hash(_deliveryDates),const DeepCollectionEquality().hash(_paymentTerms),const DeepCollectionEquality().hash(_hasFees),const DeepCollectionEquality().hash(_notes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProcurementIssueFormState(items: $items, requests: $requests, selectedSupplierIds: $selectedSupplierIds, titles: $titles, deliveryDates: $deliveryDates, paymentTerms: $paymentTerms, hasFees: $hasFees, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ProcurementIssueFormStateCopyWith<$Res> implements $ProcurementIssueFormStateCopyWith<$Res> {
  factory _$ProcurementIssueFormStateCopyWith(_ProcurementIssueFormState value, $Res Function(_ProcurementIssueFormState) _then) = __$ProcurementIssueFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProcurementIssueItem> items, List<ProcurementIssueRequest> requests, Set<int> selectedSupplierIds, Map<int, String> titles, Map<int, DateTime?> deliveryDates, Map<int, String?> paymentTerms, Map<int, bool> hasFees, Map<int, String?> notes
});




}
/// @nodoc
class __$ProcurementIssueFormStateCopyWithImpl<$Res>
    implements _$ProcurementIssueFormStateCopyWith<$Res> {
  __$ProcurementIssueFormStateCopyWithImpl(this._self, this._then);

  final _ProcurementIssueFormState _self;
  final $Res Function(_ProcurementIssueFormState) _then;

/// Create a copy of ProcurementIssueFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? requests = null,Object? selectedSupplierIds = null,Object? titles = null,Object? deliveryDates = null,Object? paymentTerms = null,Object? hasFees = null,Object? notes = null,}) {
  return _then(_ProcurementIssueFormState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueItem>,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ProcurementIssueRequest>,selectedSupplierIds: null == selectedSupplierIds ? _self._selectedSupplierIds : selectedSupplierIds // ignore: cast_nullable_to_non_nullable
as Set<int>,titles: null == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as Map<int, String>,deliveryDates: null == deliveryDates ? _self._deliveryDates : deliveryDates // ignore: cast_nullable_to_non_nullable
as Map<int, DateTime?>,paymentTerms: null == paymentTerms ? _self._paymentTerms : paymentTerms // ignore: cast_nullable_to_non_nullable
as Map<int, String?>,hasFees: null == hasFees ? _self._hasFees : hasFees // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as Map<int, String?>,
  ));
}


}

/// @nodoc
mixin _$LocalState implements DiagnosticableTreeMixin {

 bool get persistLogin; List<Keyword> get keywords;
/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalStateCopyWith<LocalState> get copyWith => _$LocalStateCopyWithImpl<LocalState>(this as LocalState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocalState'))
    ..add(DiagnosticsProperty('persistLogin', persistLogin))..add(DiagnosticsProperty('keywords', keywords));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalState&&(identical(other.persistLogin, persistLogin) || other.persistLogin == persistLogin)&&const DeepCollectionEquality().equals(other.keywords, keywords));
}


@override
int get hashCode => Object.hash(runtimeType,persistLogin,const DeepCollectionEquality().hash(keywords));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocalState(persistLogin: $persistLogin, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class $LocalStateCopyWith<$Res>  {
  factory $LocalStateCopyWith(LocalState value, $Res Function(LocalState) _then) = _$LocalStateCopyWithImpl;
@useResult
$Res call({
 bool persistLogin, List<Keyword> keywords
});




}
/// @nodoc
class _$LocalStateCopyWithImpl<$Res>
    implements $LocalStateCopyWith<$Res> {
  _$LocalStateCopyWithImpl(this._self, this._then);

  final LocalState _self;
  final $Res Function(LocalState) _then;

/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? persistLogin = null,Object? keywords = null,}) {
  return _then(_self.copyWith(
persistLogin: null == persistLogin ? _self.persistLogin : persistLogin // ignore: cast_nullable_to_non_nullable
as bool,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalState value)  $default,){
final _that = this;
switch (_that) {
case _LocalState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool persistLogin,  List<Keyword> keywords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that.persistLogin,_that.keywords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool persistLogin,  List<Keyword> keywords)  $default,) {final _that = this;
switch (_that) {
case _LocalState():
return $default(_that.persistLogin,_that.keywords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool persistLogin,  List<Keyword> keywords)?  $default,) {final _that = this;
switch (_that) {
case _LocalState() when $default != null:
return $default(_that.persistLogin,_that.keywords);case _:
  return null;

}
}

}

/// @nodoc


class _LocalState with DiagnosticableTreeMixin implements LocalState {
   _LocalState({required this.persistLogin, final  List<Keyword> keywords = const []}): _keywords = keywords;
  

@override final  bool persistLogin;
 final  List<Keyword> _keywords;
@override@JsonKey() List<Keyword> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}


/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalStateCopyWith<_LocalState> get copyWith => __$LocalStateCopyWithImpl<_LocalState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocalState'))
    ..add(DiagnosticsProperty('persistLogin', persistLogin))..add(DiagnosticsProperty('keywords', keywords));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalState&&(identical(other.persistLogin, persistLogin) || other.persistLogin == persistLogin)&&const DeepCollectionEquality().equals(other._keywords, _keywords));
}


@override
int get hashCode => Object.hash(runtimeType,persistLogin,const DeepCollectionEquality().hash(_keywords));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocalState(persistLogin: $persistLogin, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class _$LocalStateCopyWith<$Res> implements $LocalStateCopyWith<$Res> {
  factory _$LocalStateCopyWith(_LocalState value, $Res Function(_LocalState) _then) = __$LocalStateCopyWithImpl;
@override @useResult
$Res call({
 bool persistLogin, List<Keyword> keywords
});




}
/// @nodoc
class __$LocalStateCopyWithImpl<$Res>
    implements _$LocalStateCopyWith<$Res> {
  __$LocalStateCopyWithImpl(this._self, this._then);

  final _LocalState _self;
  final $Res Function(_LocalState) _then;

/// Create a copy of LocalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? persistLogin = null,Object? keywords = null,}) {
  return _then(_LocalState(
persistLogin: null == persistLogin ? _self.persistLogin : persistLogin // ignore: cast_nullable_to_non_nullable
as bool,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<Keyword>,
  ));
}


}

/// @nodoc
mixin _$NavigationFilterState implements DiagnosticableTreeMixin {

 String get search;
/// Create a copy of NavigationFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationFilterStateCopyWith<NavigationFilterState> get copyWith => _$NavigationFilterStateCopyWithImpl<NavigationFilterState>(this as NavigationFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationFilterState'))
    ..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationFilterState&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationFilterState(search: $search)';
}


}

/// @nodoc
abstract mixin class $NavigationFilterStateCopyWith<$Res>  {
  factory $NavigationFilterStateCopyWith(NavigationFilterState value, $Res Function(NavigationFilterState) _then) = _$NavigationFilterStateCopyWithImpl;
@useResult
$Res call({
 String search
});




}
/// @nodoc
class _$NavigationFilterStateCopyWithImpl<$Res>
    implements $NavigationFilterStateCopyWith<$Res> {
  _$NavigationFilterStateCopyWithImpl(this._self, this._then);

  final NavigationFilterState _self;
  final $Res Function(NavigationFilterState) _then;

/// Create a copy of NavigationFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationFilterState].
extension NavigationFilterStatePatterns on NavigationFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationFilterState value)  $default,){
final _that = this;
switch (_that) {
case _NavigationFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationFilterState() when $default != null:
return $default(_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String search)  $default,) {final _that = this;
switch (_that) {
case _NavigationFilterState():
return $default(_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String search)?  $default,) {final _that = this;
switch (_that) {
case _NavigationFilterState() when $default != null:
return $default(_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationFilterState with DiagnosticableTreeMixin implements NavigationFilterState {
   _NavigationFilterState({this.search = ''});
  

@override@JsonKey() final  String search;

/// Create a copy of NavigationFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationFilterStateCopyWith<_NavigationFilterState> get copyWith => __$NavigationFilterStateCopyWithImpl<_NavigationFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationFilterState'))
    ..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationFilterState&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationFilterState(search: $search)';
}


}

/// @nodoc
abstract mixin class _$NavigationFilterStateCopyWith<$Res> implements $NavigationFilterStateCopyWith<$Res> {
  factory _$NavigationFilterStateCopyWith(_NavigationFilterState value, $Res Function(_NavigationFilterState) _then) = __$NavigationFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String search
});




}
/// @nodoc
class __$NavigationFilterStateCopyWithImpl<$Res>
    implements _$NavigationFilterStateCopyWith<$Res> {
  __$NavigationFilterStateCopyWithImpl(this._self, this._then);

  final _NavigationFilterState _self;
  final $Res Function(_NavigationFilterState) _then;

/// Create a copy of NavigationFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,}) {
  return _then(_NavigationFilterState(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OrganizationState implements DiagnosticableTreeMixin {

 List<UserDepartmentGroup> get departmentGroups; List<UserDepartment> get departmentItems; List<User> get users;
/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationStateCopyWith<OrganizationState> get copyWith => _$OrganizationStateCopyWithImpl<OrganizationState>(this as OrganizationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrganizationState'))
    ..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems))..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationState&&const DeepCollectionEquality().equals(other.departmentGroups, departmentGroups)&&const DeepCollectionEquality().equals(other.departmentItems, departmentItems)&&const DeepCollectionEquality().equals(other.users, users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(departmentGroups),const DeepCollectionEquality().hash(departmentItems),const DeepCollectionEquality().hash(users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrganizationState(departmentGroups: $departmentGroups, departmentItems: $departmentItems, users: $users)';
}


}

/// @nodoc
abstract mixin class $OrganizationStateCopyWith<$Res>  {
  factory $OrganizationStateCopyWith(OrganizationState value, $Res Function(OrganizationState) _then) = _$OrganizationStateCopyWithImpl;
@useResult
$Res call({
 List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems, List<User> users
});




}
/// @nodoc
class _$OrganizationStateCopyWithImpl<$Res>
    implements $OrganizationStateCopyWith<$Res> {
  _$OrganizationStateCopyWithImpl(this._self, this._then);

  final OrganizationState _self;
  final $Res Function(OrganizationState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departmentGroups = null,Object? departmentItems = null,Object? users = null,}) {
  return _then(_self.copyWith(
departmentGroups: null == departmentGroups ? _self.departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self.departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationState].
extension OrganizationStatePatterns on OrganizationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationState value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationState value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<User> users)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.departmentGroups,_that.departmentItems,_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<User> users)  $default,) {final _that = this;
switch (_that) {
case _OrganizationState():
return $default(_that.departmentGroups,_that.departmentItems,_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<User> users)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationState() when $default != null:
return $default(_that.departmentGroups,_that.departmentItems,_that.users);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationState with DiagnosticableTreeMixin implements OrganizationState {
   _OrganizationState({final  List<UserDepartmentGroup> departmentGroups = const [], final  List<UserDepartment> departmentItems = const [], final  List<User> users = const []}): _departmentGroups = departmentGroups,_departmentItems = departmentItems,_users = users;
  

 final  List<UserDepartmentGroup> _departmentGroups;
@override@JsonKey() List<UserDepartmentGroup> get departmentGroups {
  if (_departmentGroups is EqualUnmodifiableListView) return _departmentGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentGroups);
}

 final  List<UserDepartment> _departmentItems;
@override@JsonKey() List<UserDepartment> get departmentItems {
  if (_departmentItems is EqualUnmodifiableListView) return _departmentItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentItems);
}

 final  List<User> _users;
@override@JsonKey() List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationStateCopyWith<_OrganizationState> get copyWith => __$OrganizationStateCopyWithImpl<_OrganizationState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrganizationState'))
    ..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems))..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationState&&const DeepCollectionEquality().equals(other._departmentGroups, _departmentGroups)&&const DeepCollectionEquality().equals(other._departmentItems, _departmentItems)&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_departmentGroups),const DeepCollectionEquality().hash(_departmentItems),const DeepCollectionEquality().hash(_users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrganizationState(departmentGroups: $departmentGroups, departmentItems: $departmentItems, users: $users)';
}


}

/// @nodoc
abstract mixin class _$OrganizationStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory _$OrganizationStateCopyWith(_OrganizationState value, $Res Function(_OrganizationState) _then) = __$OrganizationStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems, List<User> users
});




}
/// @nodoc
class __$OrganizationStateCopyWithImpl<$Res>
    implements _$OrganizationStateCopyWith<$Res> {
  __$OrganizationStateCopyWithImpl(this._self, this._then);

  final _OrganizationState _self;
  final $Res Function(_OrganizationState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departmentGroups = null,Object? departmentItems = null,Object? users = null,}) {
  return _then(_OrganizationState(
departmentGroups: null == departmentGroups ? _self._departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self._departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

/// @nodoc
mixin _$ProjectDetailState implements DiagnosticableTreeMixin {

 Project get project; dynamic get contracts; dynamic get approvals; dynamic get procurements; dynamic get reports;
/// Create a copy of ProjectDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailStateCopyWith<ProjectDetailState> get copyWith => _$ProjectDetailStateCopyWithImpl<ProjectDetailState>(this as ProjectDetailState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectDetailState'))
    ..add(DiagnosticsProperty('project', project))..add(DiagnosticsProperty('contracts', contracts))..add(DiagnosticsProperty('approvals', approvals))..add(DiagnosticsProperty('procurements', procurements))..add(DiagnosticsProperty('reports', reports));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other.contracts, contracts)&&const DeepCollectionEquality().equals(other.approvals, approvals)&&const DeepCollectionEquality().equals(other.procurements, procurements)&&const DeepCollectionEquality().equals(other.reports, reports));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(contracts),const DeepCollectionEquality().hash(approvals),const DeepCollectionEquality().hash(procurements),const DeepCollectionEquality().hash(reports));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectDetailState(project: $project, contracts: $contracts, approvals: $approvals, procurements: $procurements, reports: $reports)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailStateCopyWith<$Res>  {
  factory $ProjectDetailStateCopyWith(ProjectDetailState value, $Res Function(ProjectDetailState) _then) = _$ProjectDetailStateCopyWithImpl;
@useResult
$Res call({
 Project project, dynamic contracts, dynamic approvals, dynamic procurements, dynamic reports
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? contracts = freezed,Object? approvals = freezed,Object? procurements = freezed,Object? reports = freezed,}) {
  return _then(_self.copyWith(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,contracts: freezed == contracts ? _self.contracts : contracts // ignore: cast_nullable_to_non_nullable
as dynamic,approvals: freezed == approvals ? _self.approvals : approvals // ignore: cast_nullable_to_non_nullable
as dynamic,procurements: freezed == procurements ? _self.procurements : procurements // ignore: cast_nullable_to_non_nullable
as dynamic,reports: freezed == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as dynamic,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Project project,  dynamic contracts,  dynamic approvals,  dynamic procurements,  dynamic reports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailState() when $default != null:
return $default(_that.project,_that.contracts,_that.approvals,_that.procurements,_that.reports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Project project,  dynamic contracts,  dynamic approvals,  dynamic procurements,  dynamic reports)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailState():
return $default(_that.project,_that.contracts,_that.approvals,_that.procurements,_that.reports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Project project,  dynamic contracts,  dynamic approvals,  dynamic procurements,  dynamic reports)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailState() when $default != null:
return $default(_that.project,_that.contracts,_that.approvals,_that.procurements,_that.reports);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectDetailState with DiagnosticableTreeMixin implements ProjectDetailState {
   _ProjectDetailState({required this.project, this.contracts = 0, this.approvals = 0, this.procurements = 0, this.reports = 0});
  

@override final  Project project;
@override@JsonKey() final  dynamic contracts;
@override@JsonKey() final  dynamic approvals;
@override@JsonKey() final  dynamic procurements;
@override@JsonKey() final  dynamic reports;

/// Create a copy of ProjectDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailStateCopyWith<_ProjectDetailState> get copyWith => __$ProjectDetailStateCopyWithImpl<_ProjectDetailState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectDetailState'))
    ..add(DiagnosticsProperty('project', project))..add(DiagnosticsProperty('contracts', contracts))..add(DiagnosticsProperty('approvals', approvals))..add(DiagnosticsProperty('procurements', procurements))..add(DiagnosticsProperty('reports', reports));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other.contracts, contracts)&&const DeepCollectionEquality().equals(other.approvals, approvals)&&const DeepCollectionEquality().equals(other.procurements, procurements)&&const DeepCollectionEquality().equals(other.reports, reports));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(contracts),const DeepCollectionEquality().hash(approvals),const DeepCollectionEquality().hash(procurements),const DeepCollectionEquality().hash(reports));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectDetailState(project: $project, contracts: $contracts, approvals: $approvals, procurements: $procurements, reports: $reports)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailStateCopyWith<$Res> implements $ProjectDetailStateCopyWith<$Res> {
  factory _$ProjectDetailStateCopyWith(_ProjectDetailState value, $Res Function(_ProjectDetailState) _then) = __$ProjectDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Project project, dynamic contracts, dynamic approvals, dynamic procurements, dynamic reports
});


@override $ProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$ProjectDetailStateCopyWithImpl<$Res>
    implements _$ProjectDetailStateCopyWith<$Res> {
  __$ProjectDetailStateCopyWithImpl(this._self, this._then);

  final _ProjectDetailState _self;
  final $Res Function(_ProjectDetailState) _then;

/// Create a copy of ProjectDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? contracts = freezed,Object? approvals = freezed,Object? procurements = freezed,Object? reports = freezed,}) {
  return _then(_ProjectDetailState(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,contracts: freezed == contracts ? _self.contracts : contracts // ignore: cast_nullable_to_non_nullable
as dynamic,approvals: freezed == approvals ? _self.approvals : approvals // ignore: cast_nullable_to_non_nullable
as dynamic,procurements: freezed == procurements ? _self.procurements : procurements // ignore: cast_nullable_to_non_nullable
as dynamic,reports: freezed == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as dynamic,
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
$ProjectDetailFilterStateCopyWith<ProjectDetailFilterState> get copyWith => _$ProjectDetailFilterStateCopyWithImpl<ProjectDetailFilterState>(this as ProjectDetailFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectDetailFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectDetailFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailFilterStateCopyWith<$Res>  {
  factory $ProjectDetailFilterStateCopyWith(ProjectDetailFilterState value, $Res Function(ProjectDetailFilterState) _then) = _$ProjectDetailFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view
});




}
/// @nodoc
class _$ProjectDetailFilterStateCopyWithImpl<$Res>
    implements $ProjectDetailFilterStateCopyWith<$Res> {
  _$ProjectDetailFilterStateCopyWithImpl(this._self, this._then);

  final ProjectDetailFilterState _self;
  final $Res Function(ProjectDetailFilterState) _then;

/// Create a copy of ProjectDetailFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailFilterState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailFilterState() when $default != null:
return $default(_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailFilterState():
return $default(_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailFilterState() when $default != null:
return $default(_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectDetailFilterState with DiagnosticableTreeMixin implements ProjectDetailFilterState {
   _ProjectDetailFilterState({this.view});
  

@override final  String? view;

/// Create a copy of ProjectDetailFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailFilterStateCopyWith<_ProjectDetailFilterState> get copyWith => __$ProjectDetailFilterStateCopyWithImpl<_ProjectDetailFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectDetailFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectDetailFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailFilterStateCopyWith<$Res> implements $ProjectDetailFilterStateCopyWith<$Res> {
  factory _$ProjectDetailFilterStateCopyWith(_ProjectDetailFilterState value, $Res Function(_ProjectDetailFilterState) _then) = __$ProjectDetailFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view
});




}
/// @nodoc
class __$ProjectDetailFilterStateCopyWithImpl<$Res>
    implements _$ProjectDetailFilterStateCopyWith<$Res> {
  __$ProjectDetailFilterStateCopyWithImpl(this._self, this._then);

  final _ProjectDetailFilterState _self;
  final $Res Function(_ProjectDetailFilterState) _then;

/// Create a copy of ProjectDetailFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,}) {
  return _then(_ProjectDetailFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProjectFilterState implements DiagnosticableTreeMixin {

 String? get view; ProjectSortOption? get sort; SortDirection? get order; String? get search; bool? get bookmark; List<int>? get clients; List<int>? get categories;
/// Create a copy of ProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFilterStateCopyWith<ProjectFilterState> get copyWith => _$ProjectFilterStateCopyWithImpl<ProjectFilterState>(this as ProjectFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectFilterState'))
    ..add(DiagnosticsProperty('view', view))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('bookmark', bookmark))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFilterState&&(identical(other.view, view) || other.view == view)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&(identical(other.bookmark, bookmark) || other.bookmark == bookmark)&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,view,sort,order,search,bookmark,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectFilterState(view: $view, sort: $sort, order: $order, search: $search, bookmark: $bookmark, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ProjectFilterStateCopyWith<$Res>  {
  factory $ProjectFilterStateCopyWith(ProjectFilterState value, $Res Function(ProjectFilterState) _then) = _$ProjectFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view, ProjectSortOption? sort, SortDirection? order, String? search, bool? bookmark, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class _$ProjectFilterStateCopyWithImpl<$Res>
    implements $ProjectFilterStateCopyWith<$Res> {
  _$ProjectFilterStateCopyWithImpl(this._self, this._then);

  final ProjectFilterState _self;
  final $Res Function(ProjectFilterState) _then;

/// Create a copy of ProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? bookmark = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProjectSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,bookmark: freezed == bookmark ? _self.bookmark : bookmark // ignore: cast_nullable_to_non_nullable
as bool?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectFilterState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view,  ProjectSortOption? sort,  SortDirection? order,  String? search,  bool? bookmark,  List<int>? clients,  List<int>? categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectFilterState() when $default != null:
return $default(_that.view,_that.sort,_that.order,_that.search,_that.bookmark,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view,  ProjectSortOption? sort,  SortDirection? order,  String? search,  bool? bookmark,  List<int>? clients,  List<int>? categories)  $default,) {final _that = this;
switch (_that) {
case _ProjectFilterState():
return $default(_that.view,_that.sort,_that.order,_that.search,_that.bookmark,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view,  ProjectSortOption? sort,  SortDirection? order,  String? search,  bool? bookmark,  List<int>? clients,  List<int>? categories)?  $default,) {final _that = this;
switch (_that) {
case _ProjectFilterState() when $default != null:
return $default(_that.view,_that.sort,_that.order,_that.search,_that.bookmark,_that.clients,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectFilterState with DiagnosticableTreeMixin implements ProjectFilterState {
  const _ProjectFilterState({this.view, this.sort, this.order, this.search, this.bookmark, final  List<int>? clients, final  List<int>? categories}): _clients = clients,_categories = categories;
  

@override final  String? view;
@override final  ProjectSortOption? sort;
@override final  SortDirection? order;
@override final  String? search;
@override final  bool? bookmark;
 final  List<int>? _clients;
@override List<int>? get clients {
  final value = _clients;
  if (value == null) return null;
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _categories;
@override List<int>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectFilterStateCopyWith<_ProjectFilterState> get copyWith => __$ProjectFilterStateCopyWithImpl<_ProjectFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectFilterState'))
    ..add(DiagnosticsProperty('view', view))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('bookmark', bookmark))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFilterState&&(identical(other.view, view) || other.view == view)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&(identical(other.bookmark, bookmark) || other.bookmark == bookmark)&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,view,sort,order,search,bookmark,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectFilterState(view: $view, sort: $sort, order: $order, search: $search, bookmark: $bookmark, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ProjectFilterStateCopyWith<$Res> implements $ProjectFilterStateCopyWith<$Res> {
  factory _$ProjectFilterStateCopyWith(_ProjectFilterState value, $Res Function(_ProjectFilterState) _then) = __$ProjectFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view, ProjectSortOption? sort, SortDirection? order, String? search, bool? bookmark, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class __$ProjectFilterStateCopyWithImpl<$Res>
    implements _$ProjectFilterStateCopyWith<$Res> {
  __$ProjectFilterStateCopyWithImpl(this._self, this._then);

  final _ProjectFilterState _self;
  final $Res Function(_ProjectFilterState) _then;

/// Create a copy of ProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? bookmark = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_ProjectFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProjectSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,bookmark: freezed == bookmark ? _self.bookmark : bookmark // ignore: cast_nullable_to_non_nullable
as bool?,clients: freezed == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc
mixin _$ProjectFormState implements DiagnosticableTreeMixin {

 List<Client>? get clients; String? get code; String? get name; User? get manager; bool get isPreexecuted; bool get isContracted; bool get isAllClientSelected; bool get isDirty;
/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormStateCopyWith<ProjectFormState> get copyWith => _$ProjectFormStateCopyWithImpl<ProjectFormState>(this as ProjectFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectFormState'))
    ..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('manager', manager))..add(DiagnosticsProperty('isPreexecuted', isPreexecuted))..add(DiagnosticsProperty('isContracted', isContracted))..add(DiagnosticsProperty('isAllClientSelected', isAllClientSelected))..add(DiagnosticsProperty('isDirty', isDirty));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormState&&const DeepCollectionEquality().equals(other.clients, clients)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.manager, manager) || other.manager == manager)&&(identical(other.isPreexecuted, isPreexecuted) || other.isPreexecuted == isPreexecuted)&&(identical(other.isContracted, isContracted) || other.isContracted == isContracted)&&(identical(other.isAllClientSelected, isAllClientSelected) || other.isAllClientSelected == isAllClientSelected)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clients),code,name,manager,isPreexecuted,isContracted,isAllClientSelected,isDirty);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectFormState(clients: $clients, code: $code, name: $name, manager: $manager, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isAllClientSelected: $isAllClientSelected, isDirty: $isDirty)';
}


}

/// @nodoc
abstract mixin class $ProjectFormStateCopyWith<$Res>  {
  factory $ProjectFormStateCopyWith(ProjectFormState value, $Res Function(ProjectFormState) _then) = _$ProjectFormStateCopyWithImpl;
@useResult
$Res call({
 List<Client>? clients, String? code, String? name, User? manager, bool isPreexecuted, bool isContracted, bool isAllClientSelected, bool isDirty
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? clients = freezed,Object? code = freezed,Object? name = freezed,Object? manager = freezed,Object? isPreexecuted = null,Object? isContracted = null,Object? isAllClientSelected = null,Object? isDirty = null,}) {
  return _then(_self.copyWith(
clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as User?,isPreexecuted: null == isPreexecuted ? _self.isPreexecuted : isPreexecuted // ignore: cast_nullable_to_non_nullable
as bool,isContracted: null == isContracted ? _self.isContracted : isContracted // ignore: cast_nullable_to_non_nullable
as bool,isAllClientSelected: null == isAllClientSelected ? _self.isAllClientSelected : isAllClientSelected // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Client>? clients,  String? code,  String? name,  User? manager,  bool isPreexecuted,  bool isContracted,  bool isAllClientSelected,  bool isDirty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that.clients,_that.code,_that.name,_that.manager,_that.isPreexecuted,_that.isContracted,_that.isAllClientSelected,_that.isDirty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Client>? clients,  String? code,  String? name,  User? manager,  bool isPreexecuted,  bool isContracted,  bool isAllClientSelected,  bool isDirty)  $default,) {final _that = this;
switch (_that) {
case _ProjectFormState():
return $default(_that.clients,_that.code,_that.name,_that.manager,_that.isPreexecuted,_that.isContracted,_that.isAllClientSelected,_that.isDirty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Client>? clients,  String? code,  String? name,  User? manager,  bool isPreexecuted,  bool isContracted,  bool isAllClientSelected,  bool isDirty)?  $default,) {final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that.clients,_that.code,_that.name,_that.manager,_that.isPreexecuted,_that.isContracted,_that.isAllClientSelected,_that.isDirty);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectFormState with DiagnosticableTreeMixin implements ProjectFormState {
   _ProjectFormState({final  List<Client>? clients, this.code, this.name, this.manager, this.isPreexecuted = false, this.isContracted = false, this.isAllClientSelected = false, this.isDirty = false}): _clients = clients;
  

 final  List<Client>? _clients;
@override List<Client>? get clients {
  final value = _clients;
  if (value == null) return null;
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? code;
@override final  String? name;
@override final  User? manager;
@override@JsonKey() final  bool isPreexecuted;
@override@JsonKey() final  bool isContracted;
@override@JsonKey() final  bool isAllClientSelected;
@override@JsonKey() final  bool isDirty;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectFormStateCopyWith<_ProjectFormState> get copyWith => __$ProjectFormStateCopyWithImpl<_ProjectFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectFormState'))
    ..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('manager', manager))..add(DiagnosticsProperty('isPreexecuted', isPreexecuted))..add(DiagnosticsProperty('isContracted', isContracted))..add(DiagnosticsProperty('isAllClientSelected', isAllClientSelected))..add(DiagnosticsProperty('isDirty', isDirty));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFormState&&const DeepCollectionEquality().equals(other._clients, _clients)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.manager, manager) || other.manager == manager)&&(identical(other.isPreexecuted, isPreexecuted) || other.isPreexecuted == isPreexecuted)&&(identical(other.isContracted, isContracted) || other.isContracted == isContracted)&&(identical(other.isAllClientSelected, isAllClientSelected) || other.isAllClientSelected == isAllClientSelected)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients),code,name,manager,isPreexecuted,isContracted,isAllClientSelected,isDirty);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectFormState(clients: $clients, code: $code, name: $name, manager: $manager, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isAllClientSelected: $isAllClientSelected, isDirty: $isDirty)';
}


}

/// @nodoc
abstract mixin class _$ProjectFormStateCopyWith<$Res> implements $ProjectFormStateCopyWith<$Res> {
  factory _$ProjectFormStateCopyWith(_ProjectFormState value, $Res Function(_ProjectFormState) _then) = __$ProjectFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<Client>? clients, String? code, String? name, User? manager, bool isPreexecuted, bool isContracted, bool isAllClientSelected, bool isDirty
});


@override $UserCopyWith<$Res>? get manager;

}
/// @nodoc
class __$ProjectFormStateCopyWithImpl<$Res>
    implements _$ProjectFormStateCopyWith<$Res> {
  __$ProjectFormStateCopyWithImpl(this._self, this._then);

  final _ProjectFormState _self;
  final $Res Function(_ProjectFormState) _then;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = freezed,Object? code = freezed,Object? name = freezed,Object? manager = freezed,Object? isPreexecuted = null,Object? isContracted = null,Object? isAllClientSelected = null,Object? isDirty = null,}) {
  return _then(_ProjectFormState(
clients: freezed == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as User?,isPreexecuted: null == isPreexecuted ? _self.isPreexecuted : isPreexecuted // ignore: cast_nullable_to_non_nullable
as bool,isContracted: null == isContracted ? _self.isContracted : isContracted // ignore: cast_nullable_to_non_nullable
as bool,isAllClientSelected: null == isAllClientSelected ? _self.isAllClientSelected : isAllClientSelected // ignore: cast_nullable_to_non_nullable
as bool,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
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

 List<ProjectListItem> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListStateCopyWith<ProjectListState> get copyWith => _$ProjectListStateCopyWithImpl<ProjectListState>(this as ProjectListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $ProjectListStateCopyWith<$Res>  {
  factory $ProjectListStateCopyWith(ProjectListState value, $Res Function(ProjectListState) _then) = _$ProjectListStateCopyWithImpl;
@useResult
$Res call({
 List<ProjectListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$ProjectListStateCopyWithImpl<$Res>
    implements $ProjectListStateCopyWith<$Res> {
  _$ProjectListStateCopyWithImpl(this._self, this._then);

  final ProjectListState _self;
  final $Res Function(ProjectListState) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProjectListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectListItem> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _ProjectListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectListState with DiagnosticableTreeMixin implements ProjectListState {
   _ProjectListState({final  List<ProjectListItem> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<ProjectListItem> _items;
@override@JsonKey() List<ProjectListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListStateCopyWith<_ProjectListState> get copyWith => __$ProjectListStateCopyWithImpl<_ProjectListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$ProjectListStateCopyWith<$Res> implements $ProjectListStateCopyWith<$Res> {
  factory _$ProjectListStateCopyWith(_ProjectListState value, $Res Function(_ProjectListState) _then) = __$ProjectListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$ProjectListStateCopyWithImpl<$Res>
    implements _$ProjectListStateCopyWith<$Res> {
  __$ProjectListStateCopyWithImpl(this._self, this._then);

  final _ProjectListState _self;
  final $Res Function(_ProjectListState) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_ProjectListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProjectListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ProjectOptionsState implements DiagnosticableTreeMixin {

 List<IssueCategory> get categoryItems; List<ClientGroup> get clientItems; int get maxClientDepth;
/// Create a copy of ProjectOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectOptionsStateCopyWith<ProjectOptionsState> get copyWith => _$ProjectOptionsStateCopyWithImpl<ProjectOptionsState>(this as ProjectOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectOptionsState'))
    ..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('clientItems', clientItems))..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectOptionsState&&const DeepCollectionEquality().equals(other.categoryItems, categoryItems)&&const DeepCollectionEquality().equals(other.clientItems, clientItems)&&(identical(other.maxClientDepth, maxClientDepth) || other.maxClientDepth == maxClientDepth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categoryItems),const DeepCollectionEquality().hash(clientItems),maxClientDepth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectOptionsState(categoryItems: $categoryItems, clientItems: $clientItems, maxClientDepth: $maxClientDepth)';
}


}

/// @nodoc
abstract mixin class $ProjectOptionsStateCopyWith<$Res>  {
  factory $ProjectOptionsStateCopyWith(ProjectOptionsState value, $Res Function(ProjectOptionsState) _then) = _$ProjectOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<IssueCategory> categoryItems, List<ClientGroup> clientItems, int maxClientDepth
});




}
/// @nodoc
class _$ProjectOptionsStateCopyWithImpl<$Res>
    implements $ProjectOptionsStateCopyWith<$Res> {
  _$ProjectOptionsStateCopyWithImpl(this._self, this._then);

  final ProjectOptionsState _self;
  final $Res Function(ProjectOptionsState) _then;

/// Create a copy of ProjectOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryItems = null,Object? clientItems = null,Object? maxClientDepth = null,}) {
  return _then(_self.copyWith(
categoryItems: null == categoryItems ? _self.categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<IssueCategory>,clientItems: null == clientItems ? _self.clientItems : clientItems // ignore: cast_nullable_to_non_nullable
as List<ClientGroup>,maxClientDepth: null == maxClientDepth ? _self.maxClientDepth : maxClientDepth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectOptionsState].
extension ProjectOptionsStatePatterns on ProjectOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IssueCategory> categoryItems,  List<ClientGroup> clientItems,  int maxClientDepth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectOptionsState() when $default != null:
return $default(_that.categoryItems,_that.clientItems,_that.maxClientDepth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IssueCategory> categoryItems,  List<ClientGroup> clientItems,  int maxClientDepth)  $default,) {final _that = this;
switch (_that) {
case _ProjectOptionsState():
return $default(_that.categoryItems,_that.clientItems,_that.maxClientDepth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IssueCategory> categoryItems,  List<ClientGroup> clientItems,  int maxClientDepth)?  $default,) {final _that = this;
switch (_that) {
case _ProjectOptionsState() when $default != null:
return $default(_that.categoryItems,_that.clientItems,_that.maxClientDepth);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectOptionsState with DiagnosticableTreeMixin implements ProjectOptionsState {
  const _ProjectOptionsState({final  List<IssueCategory> categoryItems = const [], final  List<ClientGroup> clientItems = const [], this.maxClientDepth = 0}): _categoryItems = categoryItems,_clientItems = clientItems;
  

 final  List<IssueCategory> _categoryItems;
@override@JsonKey() List<IssueCategory> get categoryItems {
  if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryItems);
}

 final  List<ClientGroup> _clientItems;
@override@JsonKey() List<ClientGroup> get clientItems {
  if (_clientItems is EqualUnmodifiableListView) return _clientItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clientItems);
}

@override@JsonKey() final  int maxClientDepth;

/// Create a copy of ProjectOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectOptionsStateCopyWith<_ProjectOptionsState> get copyWith => __$ProjectOptionsStateCopyWithImpl<_ProjectOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectOptionsState'))
    ..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('clientItems', clientItems))..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectOptionsState&&const DeepCollectionEquality().equals(other._categoryItems, _categoryItems)&&const DeepCollectionEquality().equals(other._clientItems, _clientItems)&&(identical(other.maxClientDepth, maxClientDepth) || other.maxClientDepth == maxClientDepth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoryItems),const DeepCollectionEquality().hash(_clientItems),maxClientDepth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectOptionsState(categoryItems: $categoryItems, clientItems: $clientItems, maxClientDepth: $maxClientDepth)';
}


}

/// @nodoc
abstract mixin class _$ProjectOptionsStateCopyWith<$Res> implements $ProjectOptionsStateCopyWith<$Res> {
  factory _$ProjectOptionsStateCopyWith(_ProjectOptionsState value, $Res Function(_ProjectOptionsState) _then) = __$ProjectOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<IssueCategory> categoryItems, List<ClientGroup> clientItems, int maxClientDepth
});




}
/// @nodoc
class __$ProjectOptionsStateCopyWithImpl<$Res>
    implements _$ProjectOptionsStateCopyWith<$Res> {
  __$ProjectOptionsStateCopyWithImpl(this._self, this._then);

  final _ProjectOptionsState _self;
  final $Res Function(_ProjectOptionsState) _then;

/// Create a copy of ProjectOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryItems = null,Object? clientItems = null,Object? maxClientDepth = null,}) {
  return _then(_ProjectOptionsState(
categoryItems: null == categoryItems ? _self._categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<IssueCategory>,clientItems: null == clientItems ? _self._clientItems : clientItems // ignore: cast_nullable_to_non_nullable
as List<ClientGroup>,maxClientDepth: null == maxClientDepth ? _self.maxClientDepth : maxClientDepth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProjectSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState()';
}


}

/// @nodoc
class $ProjectSubmitStateCopyWith<$Res>  {
$ProjectSubmitStateCopyWith(ProjectSubmitState _, $Res Function(ProjectSubmitState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectSubmitIdle value)?  idle,TResult Function( ProjectSubmitPending value)?  pending,TResult Function( ProjectSubmitCreated value)?  created,TResult Function( ProjectSubmitUpdated value)?  updated,TResult Function( ProjectSubmitClosed value)?  closed,TResult Function( ProjectSubmitDeleted value)?  deleted,TResult Function( ProjectSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectSubmitIdle() when idle != null:
return idle(_that);case ProjectSubmitPending() when pending != null:
return pending(_that);case ProjectSubmitCreated() when created != null:
return created(_that);case ProjectSubmitUpdated() when updated != null:
return updated(_that);case ProjectSubmitClosed() when closed != null:
return closed(_that);case ProjectSubmitDeleted() when deleted != null:
return deleted(_that);case ProjectSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectSubmitIdle value)  idle,required TResult Function( ProjectSubmitPending value)  pending,required TResult Function( ProjectSubmitCreated value)  created,required TResult Function( ProjectSubmitUpdated value)  updated,required TResult Function( ProjectSubmitClosed value)  closed,required TResult Function( ProjectSubmitDeleted value)  deleted,required TResult Function( ProjectSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectSubmitIdle():
return idle(_that);case ProjectSubmitPending():
return pending(_that);case ProjectSubmitCreated():
return created(_that);case ProjectSubmitUpdated():
return updated(_that);case ProjectSubmitClosed():
return closed(_that);case ProjectSubmitDeleted():
return deleted(_that);case ProjectSubmitFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectSubmitIdle value)?  idle,TResult? Function( ProjectSubmitPending value)?  pending,TResult? Function( ProjectSubmitCreated value)?  created,TResult? Function( ProjectSubmitUpdated value)?  updated,TResult? Function( ProjectSubmitClosed value)?  closed,TResult? Function( ProjectSubmitDeleted value)?  deleted,TResult? Function( ProjectSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectSubmitIdle() when idle != null:
return idle(_that);case ProjectSubmitPending() when pending != null:
return pending(_that);case ProjectSubmitCreated() when created != null:
return created(_that);case ProjectSubmitUpdated() when updated != null:
return updated(_that);case ProjectSubmitClosed() when closed != null:
return closed(_that);case ProjectSubmitDeleted() when deleted != null:
return deleted(_that);case ProjectSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( Project project)?  created,TResult Function( Project project)?  updated,TResult Function( Project project)?  closed,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectSubmitIdle() when idle != null:
return idle();case ProjectSubmitPending() when pending != null:
return pending();case ProjectSubmitCreated() when created != null:
return created(_that.project);case ProjectSubmitUpdated() when updated != null:
return updated(_that.project);case ProjectSubmitClosed() when closed != null:
return closed(_that.project);case ProjectSubmitDeleted() when deleted != null:
return deleted();case ProjectSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( Project project)  created,required TResult Function( Project project)  updated,required TResult Function( Project project)  closed,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProjectSubmitIdle():
return idle();case ProjectSubmitPending():
return pending();case ProjectSubmitCreated():
return created(_that.project);case ProjectSubmitUpdated():
return updated(_that.project);case ProjectSubmitClosed():
return closed(_that.project);case ProjectSubmitDeleted():
return deleted();case ProjectSubmitFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( Project project)?  created,TResult? Function( Project project)?  updated,TResult? Function( Project project)?  closed,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProjectSubmitIdle() when idle != null:
return idle();case ProjectSubmitPending() when pending != null:
return pending();case ProjectSubmitCreated() when created != null:
return created(_that.project);case ProjectSubmitUpdated() when updated != null:
return updated(_that.project);case ProjectSubmitClosed() when closed != null:
return closed(_that.project);case ProjectSubmitDeleted() when deleted != null:
return deleted();case ProjectSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectSubmitIdle with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.idle()';
}


}




/// @nodoc


class ProjectSubmitPending with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.pending()';
}


}




/// @nodoc


class ProjectSubmitCreated with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitCreated(this.project);
  

 final  Project project;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSubmitCreatedCopyWith<ProjectSubmitCreated> get copyWith => _$ProjectSubmitCreatedCopyWithImpl<ProjectSubmitCreated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.created'))
    ..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitCreated&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.created(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectSubmitCreatedCopyWith<$Res> implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitCreatedCopyWith(ProjectSubmitCreated value, $Res Function(ProjectSubmitCreated) _then) = _$ProjectSubmitCreatedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectSubmitCreatedCopyWithImpl<$Res>
    implements $ProjectSubmitCreatedCopyWith<$Res> {
  _$ProjectSubmitCreatedCopyWithImpl(this._self, this._then);

  final ProjectSubmitCreated _self;
  final $Res Function(ProjectSubmitCreated) _then;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectSubmitCreated(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
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


class ProjectSubmitUpdated with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitUpdated(this.project);
  

 final  Project project;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSubmitUpdatedCopyWith<ProjectSubmitUpdated> get copyWith => _$ProjectSubmitUpdatedCopyWithImpl<ProjectSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.updated'))
    ..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitUpdated&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.updated(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectSubmitUpdatedCopyWith<$Res> implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitUpdatedCopyWith(ProjectSubmitUpdated value, $Res Function(ProjectSubmitUpdated) _then) = _$ProjectSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectSubmitUpdatedCopyWithImpl<$Res>
    implements $ProjectSubmitUpdatedCopyWith<$Res> {
  _$ProjectSubmitUpdatedCopyWithImpl(this._self, this._then);

  final ProjectSubmitUpdated _self;
  final $Res Function(ProjectSubmitUpdated) _then;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectSubmitUpdated(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
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


class ProjectSubmitClosed with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitClosed(this.project);
  

 final  Project project;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSubmitClosedCopyWith<ProjectSubmitClosed> get copyWith => _$ProjectSubmitClosedCopyWithImpl<ProjectSubmitClosed>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.closed'))
    ..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitClosed&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.closed(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectSubmitClosedCopyWith<$Res> implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitClosedCopyWith(ProjectSubmitClosed value, $Res Function(ProjectSubmitClosed) _then) = _$ProjectSubmitClosedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectSubmitClosedCopyWithImpl<$Res>
    implements $ProjectSubmitClosedCopyWith<$Res> {
  _$ProjectSubmitClosedCopyWithImpl(this._self, this._then);

  final ProjectSubmitClosed _self;
  final $Res Function(ProjectSubmitClosed) _then;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectSubmitClosed(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
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


class ProjectSubmitDeleted with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.deleted()';
}


}




/// @nodoc


class ProjectSubmitFailure with DiagnosticableTreeMixin implements ProjectSubmitState {
  const ProjectSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSubmitFailureCopyWith<ProjectSubmitFailure> get copyWith => _$ProjectSubmitFailureCopyWithImpl<ProjectSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProjectSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProjectSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectSubmitFailureCopyWith<$Res> implements $ProjectSubmitStateCopyWith<$Res> {
  factory $ProjectSubmitFailureCopyWith(ProjectSubmitFailure value, $Res Function(ProjectSubmitFailure) _then) = _$ProjectSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectSubmitFailureCopyWithImpl<$Res>
    implements $ProjectSubmitFailureCopyWith<$Res> {
  _$ProjectSubmitFailureCopyWithImpl(this._self, this._then);

  final ProjectSubmitFailure _self;
  final $Res Function(ProjectSubmitFailure) _then;

/// Create a copy of ProjectSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ScheduleFilterState implements DiagnosticableTreeMixin {

 String? get view; String? get search; List<int>? get departments;
/// Create a copy of ScheduleFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleFilterStateCopyWith<ScheduleFilterState> get copyWith => _$ScheduleFilterStateCopyWithImpl<ScheduleFilterState>(this as ScheduleFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleFilterState'))
    ..add(DiagnosticsProperty('view', view))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('departments', departments));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleFilterState&&(identical(other.view, view) || other.view == view)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.departments, departments));
}


@override
int get hashCode => Object.hash(runtimeType,view,search,const DeepCollectionEquality().hash(departments));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleFilterState(view: $view, search: $search, departments: $departments)';
}


}

/// @nodoc
abstract mixin class $ScheduleFilterStateCopyWith<$Res>  {
  factory $ScheduleFilterStateCopyWith(ScheduleFilterState value, $Res Function(ScheduleFilterState) _then) = _$ScheduleFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view, String? search, List<int>? departments
});




}
/// @nodoc
class _$ScheduleFilterStateCopyWithImpl<$Res>
    implements $ScheduleFilterStateCopyWith<$Res> {
  _$ScheduleFilterStateCopyWithImpl(this._self, this._then);

  final ScheduleFilterState _self;
  final $Res Function(ScheduleFilterState) _then;

/// Create a copy of ScheduleFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,Object? search = freezed,Object? departments = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,departments: freezed == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<int>?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleFilterState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view,  String? search,  List<int>? departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleFilterState() when $default != null:
return $default(_that.view,_that.search,_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view,  String? search,  List<int>? departments)  $default,) {final _that = this;
switch (_that) {
case _ScheduleFilterState():
return $default(_that.view,_that.search,_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view,  String? search,  List<int>? departments)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleFilterState() when $default != null:
return $default(_that.view,_that.search,_that.departments);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleFilterState with DiagnosticableTreeMixin implements ScheduleFilterState {
   _ScheduleFilterState({this.view, this.search, final  List<int>? departments}): _departments = departments;
  

@override final  String? view;
@override final  String? search;
 final  List<int>? _departments;
@override List<int>? get departments {
  final value = _departments;
  if (value == null) return null;
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ScheduleFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleFilterStateCopyWith<_ScheduleFilterState> get copyWith => __$ScheduleFilterStateCopyWithImpl<_ScheduleFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleFilterState'))
    ..add(DiagnosticsProperty('view', view))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('departments', departments));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleFilterState&&(identical(other.view, view) || other.view == view)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._departments, _departments));
}


@override
int get hashCode => Object.hash(runtimeType,view,search,const DeepCollectionEquality().hash(_departments));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleFilterState(view: $view, search: $search, departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$ScheduleFilterStateCopyWith<$Res> implements $ScheduleFilterStateCopyWith<$Res> {
  factory _$ScheduleFilterStateCopyWith(_ScheduleFilterState value, $Res Function(_ScheduleFilterState) _then) = __$ScheduleFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view, String? search, List<int>? departments
});




}
/// @nodoc
class __$ScheduleFilterStateCopyWithImpl<$Res>
    implements _$ScheduleFilterStateCopyWith<$Res> {
  __$ScheduleFilterStateCopyWithImpl(this._self, this._then);

  final _ScheduleFilterState _self;
  final $Res Function(_ScheduleFilterState) _then;

/// Create a copy of ScheduleFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,Object? search = freezed,Object? departments = freezed,}) {
  return _then(_ScheduleFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,departments: freezed == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc
mixin _$ScheduleFormState implements DiagnosticableTreeMixin {

 int? get projectId; String? get projectName; int? get projectClientId; String? get projectClientName; String? get summary; String? get description; DateTime? get start; DateTime? get end;
/// Create a copy of ScheduleFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleFormStateCopyWith<ScheduleFormState> get copyWith => _$ScheduleFormStateCopyWithImpl<ScheduleFormState>(this as ScheduleFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleFormState'))
    ..add(DiagnosticsProperty('projectId', projectId))..add(DiagnosticsProperty('projectName', projectName))..add(DiagnosticsProperty('projectClientId', projectClientId))..add(DiagnosticsProperty('projectClientName', projectClientName))..add(DiagnosticsProperty('summary', summary))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleFormState&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.projectClientId, projectClientId) || other.projectClientId == projectClientId)&&(identical(other.projectClientName, projectClientName) || other.projectClientName == projectClientName)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,projectName,projectClientId,projectClientName,summary,description,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleFormState(projectId: $projectId, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, summary: $summary, description: $description, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $ScheduleFormStateCopyWith<$Res>  {
  factory $ScheduleFormStateCopyWith(ScheduleFormState value, $Res Function(ScheduleFormState) _then) = _$ScheduleFormStateCopyWithImpl;
@useResult
$Res call({
 int? projectId, String? projectName, int? projectClientId, String? projectClientName, String? summary, String? description, DateTime? start, DateTime? end
});




}
/// @nodoc
class _$ScheduleFormStateCopyWithImpl<$Res>
    implements $ScheduleFormStateCopyWith<$Res> {
  _$ScheduleFormStateCopyWithImpl(this._self, this._then);

  final ScheduleFormState _self;
  final $Res Function(ScheduleFormState) _then;

/// Create a copy of ScheduleFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = freezed,Object? projectName = freezed,Object? projectClientId = freezed,Object? projectClientName = freezed,Object? summary = freezed,Object? description = freezed,Object? start = freezed,Object? end = freezed,}) {
  return _then(_self.copyWith(
projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,projectName: freezed == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String?,projectClientId: freezed == projectClientId ? _self.projectClientId : projectClientId // ignore: cast_nullable_to_non_nullable
as int?,projectClientName: freezed == projectClientName ? _self.projectClientName : projectClientName // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleFormState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? projectId,  String? projectName,  int? projectClientId,  String? projectClientName,  String? summary,  String? description,  DateTime? start,  DateTime? end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleFormState() when $default != null:
return $default(_that.projectId,_that.projectName,_that.projectClientId,_that.projectClientName,_that.summary,_that.description,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? projectId,  String? projectName,  int? projectClientId,  String? projectClientName,  String? summary,  String? description,  DateTime? start,  DateTime? end)  $default,) {final _that = this;
switch (_that) {
case _ScheduleFormState():
return $default(_that.projectId,_that.projectName,_that.projectClientId,_that.projectClientName,_that.summary,_that.description,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? projectId,  String? projectName,  int? projectClientId,  String? projectClientName,  String? summary,  String? description,  DateTime? start,  DateTime? end)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleFormState() when $default != null:
return $default(_that.projectId,_that.projectName,_that.projectClientId,_that.projectClientName,_that.summary,_that.description,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleFormState with DiagnosticableTreeMixin implements ScheduleFormState {
   _ScheduleFormState({this.projectId, this.projectName, this.projectClientId, this.projectClientName, this.summary, this.description, this.start, this.end});
  

@override final  int? projectId;
@override final  String? projectName;
@override final  int? projectClientId;
@override final  String? projectClientName;
@override final  String? summary;
@override final  String? description;
@override final  DateTime? start;
@override final  DateTime? end;

/// Create a copy of ScheduleFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleFormStateCopyWith<_ScheduleFormState> get copyWith => __$ScheduleFormStateCopyWithImpl<_ScheduleFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleFormState'))
    ..add(DiagnosticsProperty('projectId', projectId))..add(DiagnosticsProperty('projectName', projectName))..add(DiagnosticsProperty('projectClientId', projectClientId))..add(DiagnosticsProperty('projectClientName', projectClientName))..add(DiagnosticsProperty('summary', summary))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleFormState&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.projectClientId, projectClientId) || other.projectClientId == projectClientId)&&(identical(other.projectClientName, projectClientName) || other.projectClientName == projectClientName)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,projectName,projectClientId,projectClientName,summary,description,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleFormState(projectId: $projectId, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, summary: $summary, description: $description, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$ScheduleFormStateCopyWith<$Res> implements $ScheduleFormStateCopyWith<$Res> {
  factory _$ScheduleFormStateCopyWith(_ScheduleFormState value, $Res Function(_ScheduleFormState) _then) = __$ScheduleFormStateCopyWithImpl;
@override @useResult
$Res call({
 int? projectId, String? projectName, int? projectClientId, String? projectClientName, String? summary, String? description, DateTime? start, DateTime? end
});




}
/// @nodoc
class __$ScheduleFormStateCopyWithImpl<$Res>
    implements _$ScheduleFormStateCopyWith<$Res> {
  __$ScheduleFormStateCopyWithImpl(this._self, this._then);

  final _ScheduleFormState _self;
  final $Res Function(_ScheduleFormState) _then;

/// Create a copy of ScheduleFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = freezed,Object? projectName = freezed,Object? projectClientId = freezed,Object? projectClientName = freezed,Object? summary = freezed,Object? description = freezed,Object? start = freezed,Object? end = freezed,}) {
  return _then(_ScheduleFormState(
projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,projectName: freezed == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String?,projectClientId: freezed == projectClientId ? _self.projectClientId : projectClientId // ignore: cast_nullable_to_non_nullable
as int?,projectClientName: freezed == projectClientName ? _self.projectClientName : projectClientName // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ScheduleHolidayFormState implements DiagnosticableTreeMixin {

 String get type; DateTime get date; String? get name; bool get isTravelOnly; DateTime? get compensatoryLeaveDate;
/// Create a copy of ScheduleHolidayFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleHolidayFormStateCopyWith<ScheduleHolidayFormState> get copyWith => _$ScheduleHolidayFormStateCopyWithImpl<ScheduleHolidayFormState>(this as ScheduleHolidayFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleHolidayFormState'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('isTravelOnly', isTravelOnly))..add(DiagnosticsProperty('compensatoryLeaveDate', compensatoryLeaveDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleHolidayFormState&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.name, name) || other.name == name)&&(identical(other.isTravelOnly, isTravelOnly) || other.isTravelOnly == isTravelOnly)&&(identical(other.compensatoryLeaveDate, compensatoryLeaveDate) || other.compensatoryLeaveDate == compensatoryLeaveDate));
}


@override
int get hashCode => Object.hash(runtimeType,type,date,name,isTravelOnly,compensatoryLeaveDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleHolidayFormState(type: $type, date: $date, name: $name, isTravelOnly: $isTravelOnly, compensatoryLeaveDate: $compensatoryLeaveDate)';
}


}

/// @nodoc
abstract mixin class $ScheduleHolidayFormStateCopyWith<$Res>  {
  factory $ScheduleHolidayFormStateCopyWith(ScheduleHolidayFormState value, $Res Function(ScheduleHolidayFormState) _then) = _$ScheduleHolidayFormStateCopyWithImpl;
@useResult
$Res call({
 String type, DateTime date, String? name, bool isTravelOnly, DateTime? compensatoryLeaveDate
});




}
/// @nodoc
class _$ScheduleHolidayFormStateCopyWithImpl<$Res>
    implements $ScheduleHolidayFormStateCopyWith<$Res> {
  _$ScheduleHolidayFormStateCopyWithImpl(this._self, this._then);

  final ScheduleHolidayFormState _self;
  final $Res Function(ScheduleHolidayFormState) _then;

/// Create a copy of ScheduleHolidayFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? date = null,Object? name = freezed,Object? isTravelOnly = null,Object? compensatoryLeaveDate = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isTravelOnly: null == isTravelOnly ? _self.isTravelOnly : isTravelOnly // ignore: cast_nullable_to_non_nullable
as bool,compensatoryLeaveDate: freezed == compensatoryLeaveDate ? _self.compensatoryLeaveDate : compensatoryLeaveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleHolidayFormState].
extension ScheduleHolidayFormStatePatterns on ScheduleHolidayFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleHolidayFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleHolidayFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleHolidayFormState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleHolidayFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleHolidayFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleHolidayFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  DateTime date,  String? name,  bool isTravelOnly,  DateTime? compensatoryLeaveDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleHolidayFormState() when $default != null:
return $default(_that.type,_that.date,_that.name,_that.isTravelOnly,_that.compensatoryLeaveDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  DateTime date,  String? name,  bool isTravelOnly,  DateTime? compensatoryLeaveDate)  $default,) {final _that = this;
switch (_that) {
case _ScheduleHolidayFormState():
return $default(_that.type,_that.date,_that.name,_that.isTravelOnly,_that.compensatoryLeaveDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  DateTime date,  String? name,  bool isTravelOnly,  DateTime? compensatoryLeaveDate)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleHolidayFormState() when $default != null:
return $default(_that.type,_that.date,_that.name,_that.isTravelOnly,_that.compensatoryLeaveDate);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleHolidayFormState with DiagnosticableTreeMixin implements ScheduleHolidayFormState {
   _ScheduleHolidayFormState({required this.type, required this.date, this.name, this.isTravelOnly = false, this.compensatoryLeaveDate});
  

@override final  String type;
@override final  DateTime date;
@override final  String? name;
@override@JsonKey() final  bool isTravelOnly;
@override final  DateTime? compensatoryLeaveDate;

/// Create a copy of ScheduleHolidayFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleHolidayFormStateCopyWith<_ScheduleHolidayFormState> get copyWith => __$ScheduleHolidayFormStateCopyWithImpl<_ScheduleHolidayFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleHolidayFormState'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('isTravelOnly', isTravelOnly))..add(DiagnosticsProperty('compensatoryLeaveDate', compensatoryLeaveDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleHolidayFormState&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.name, name) || other.name == name)&&(identical(other.isTravelOnly, isTravelOnly) || other.isTravelOnly == isTravelOnly)&&(identical(other.compensatoryLeaveDate, compensatoryLeaveDate) || other.compensatoryLeaveDate == compensatoryLeaveDate));
}


@override
int get hashCode => Object.hash(runtimeType,type,date,name,isTravelOnly,compensatoryLeaveDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleHolidayFormState(type: $type, date: $date, name: $name, isTravelOnly: $isTravelOnly, compensatoryLeaveDate: $compensatoryLeaveDate)';
}


}

/// @nodoc
abstract mixin class _$ScheduleHolidayFormStateCopyWith<$Res> implements $ScheduleHolidayFormStateCopyWith<$Res> {
  factory _$ScheduleHolidayFormStateCopyWith(_ScheduleHolidayFormState value, $Res Function(_ScheduleHolidayFormState) _then) = __$ScheduleHolidayFormStateCopyWithImpl;
@override @useResult
$Res call({
 String type, DateTime date, String? name, bool isTravelOnly, DateTime? compensatoryLeaveDate
});




}
/// @nodoc
class __$ScheduleHolidayFormStateCopyWithImpl<$Res>
    implements _$ScheduleHolidayFormStateCopyWith<$Res> {
  __$ScheduleHolidayFormStateCopyWithImpl(this._self, this._then);

  final _ScheduleHolidayFormState _self;
  final $Res Function(_ScheduleHolidayFormState) _then;

/// Create a copy of ScheduleHolidayFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? date = null,Object? name = freezed,Object? isTravelOnly = null,Object? compensatoryLeaveDate = freezed,}) {
  return _then(_ScheduleHolidayFormState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isTravelOnly: null == isTravelOnly ? _self.isTravelOnly : isTravelOnly // ignore: cast_nullable_to_non_nullable
as bool,compensatoryLeaveDate: freezed == compensatoryLeaveDate ? _self.compensatoryLeaveDate : compensatoryLeaveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ScheduleListState implements DiagnosticableTreeMixin {

 List<ScheduleGroup> get items; bool get hasNext; bool get hasPrevious; DateTime get start; DateTime get end;
/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleListStateCopyWith<ScheduleListState> get copyWith => _$ScheduleListStateCopyWithImpl<ScheduleListState>(this as ScheduleListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('hasNext', hasNext))..add(DiagnosticsProperty('hasPrevious', hasPrevious))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasNext,hasPrevious,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleListState(items: $items, hasNext: $hasNext, hasPrevious: $hasPrevious, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $ScheduleListStateCopyWith<$Res>  {
  factory $ScheduleListStateCopyWith(ScheduleListState value, $Res Function(ScheduleListState) _then) = _$ScheduleListStateCopyWithImpl;
@useResult
$Res call({
 List<ScheduleGroup> items, bool hasNext, bool hasPrevious, DateTime start, DateTime end
});




}
/// @nodoc
class _$ScheduleListStateCopyWithImpl<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  _$ScheduleListStateCopyWithImpl(this._self, this._then);

  final ScheduleListState _self;
  final $Res Function(ScheduleListState) _then;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasNext = null,Object? hasPrevious = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ScheduleGroup>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleListState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleListState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScheduleGroup> items,  bool hasNext,  bool hasPrevious,  DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that.items,_that.hasNext,_that.hasPrevious,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScheduleGroup> items,  bool hasNext,  bool hasPrevious,  DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _ScheduleListState():
return $default(_that.items,_that.hasNext,_that.hasPrevious,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScheduleGroup> items,  bool hasNext,  bool hasPrevious,  DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that.items,_that.hasNext,_that.hasPrevious,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleListState with DiagnosticableTreeMixin implements ScheduleListState {
   _ScheduleListState({final  List<ScheduleGroup> items = const [], this.hasNext = false, this.hasPrevious = false, required this.start, required this.end}): _items = items;
  

 final  List<ScheduleGroup> _items;
@override@JsonKey() List<ScheduleGroup> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  bool hasPrevious;
@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleListStateCopyWith<_ScheduleListState> get copyWith => __$ScheduleListStateCopyWithImpl<_ScheduleListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('hasNext', hasNext))..add(DiagnosticsProperty('hasPrevious', hasPrevious))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasNext,hasPrevious,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleListState(items: $items, hasNext: $hasNext, hasPrevious: $hasPrevious, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$ScheduleListStateCopyWith<$Res> implements $ScheduleListStateCopyWith<$Res> {
  factory _$ScheduleListStateCopyWith(_ScheduleListState value, $Res Function(_ScheduleListState) _then) = __$ScheduleListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ScheduleGroup> items, bool hasNext, bool hasPrevious, DateTime start, DateTime end
});




}
/// @nodoc
class __$ScheduleListStateCopyWithImpl<$Res>
    implements _$ScheduleListStateCopyWith<$Res> {
  __$ScheduleListStateCopyWithImpl(this._self, this._then);

  final _ScheduleListState _self;
  final $Res Function(_ScheduleListState) _then;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasNext = null,Object? hasPrevious = null,Object? start = null,Object? end = null,}) {
  return _then(_ScheduleListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ScheduleGroup>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ScheduleOptionsState implements DiagnosticableTreeMixin {

 List<ScheduleCategory> get categoryItems; List<UserDepartmentGroup> get departmentGroups; List<UserDepartment> get departmentItems;
/// Create a copy of ScheduleOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleOptionsStateCopyWith<ScheduleOptionsState> get copyWith => _$ScheduleOptionsStateCopyWithImpl<ScheduleOptionsState>(this as ScheduleOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleOptionsState'))
    ..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleOptionsState&&const DeepCollectionEquality().equals(other.categoryItems, categoryItems)&&const DeepCollectionEquality().equals(other.departmentGroups, departmentGroups)&&const DeepCollectionEquality().equals(other.departmentItems, departmentItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categoryItems),const DeepCollectionEquality().hash(departmentGroups),const DeepCollectionEquality().hash(departmentItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleOptionsState(categoryItems: $categoryItems, departmentGroups: $departmentGroups, departmentItems: $departmentItems)';
}


}

/// @nodoc
abstract mixin class $ScheduleOptionsStateCopyWith<$Res>  {
  factory $ScheduleOptionsStateCopyWith(ScheduleOptionsState value, $Res Function(ScheduleOptionsState) _then) = _$ScheduleOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<ScheduleCategory> categoryItems, List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems
});




}
/// @nodoc
class _$ScheduleOptionsStateCopyWithImpl<$Res>
    implements $ScheduleOptionsStateCopyWith<$Res> {
  _$ScheduleOptionsStateCopyWithImpl(this._self, this._then);

  final ScheduleOptionsState _self;
  final $Res Function(ScheduleOptionsState) _then;

/// Create a copy of ScheduleOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryItems = null,Object? departmentGroups = null,Object? departmentItems = null,}) {
  return _then(_self.copyWith(
categoryItems: null == categoryItems ? _self.categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleCategory>,departmentGroups: null == departmentGroups ? _self.departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self.departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleOptionsState].
extension ScheduleOptionsStatePatterns on ScheduleOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScheduleCategory> categoryItems,  List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleOptionsState() when $default != null:
return $default(_that.categoryItems,_that.departmentGroups,_that.departmentItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScheduleCategory> categoryItems,  List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems)  $default,) {final _that = this;
switch (_that) {
case _ScheduleOptionsState():
return $default(_that.categoryItems,_that.departmentGroups,_that.departmentItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScheduleCategory> categoryItems,  List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleOptionsState() when $default != null:
return $default(_that.categoryItems,_that.departmentGroups,_that.departmentItems);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleOptionsState with DiagnosticableTreeMixin implements ScheduleOptionsState {
   _ScheduleOptionsState({final  List<ScheduleCategory> categoryItems = const [], final  List<UserDepartmentGroup> departmentGroups = const [], final  List<UserDepartment> departmentItems = const []}): _categoryItems = categoryItems,_departmentGroups = departmentGroups,_departmentItems = departmentItems;
  

 final  List<ScheduleCategory> _categoryItems;
@override@JsonKey() List<ScheduleCategory> get categoryItems {
  if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryItems);
}

 final  List<UserDepartmentGroup> _departmentGroups;
@override@JsonKey() List<UserDepartmentGroup> get departmentGroups {
  if (_departmentGroups is EqualUnmodifiableListView) return _departmentGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentGroups);
}

 final  List<UserDepartment> _departmentItems;
@override@JsonKey() List<UserDepartment> get departmentItems {
  if (_departmentItems is EqualUnmodifiableListView) return _departmentItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentItems);
}


/// Create a copy of ScheduleOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleOptionsStateCopyWith<_ScheduleOptionsState> get copyWith => __$ScheduleOptionsStateCopyWithImpl<_ScheduleOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleOptionsState'))
    ..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleOptionsState&&const DeepCollectionEquality().equals(other._categoryItems, _categoryItems)&&const DeepCollectionEquality().equals(other._departmentGroups, _departmentGroups)&&const DeepCollectionEquality().equals(other._departmentItems, _departmentItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoryItems),const DeepCollectionEquality().hash(_departmentGroups),const DeepCollectionEquality().hash(_departmentItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleOptionsState(categoryItems: $categoryItems, departmentGroups: $departmentGroups, departmentItems: $departmentItems)';
}


}

/// @nodoc
abstract mixin class _$ScheduleOptionsStateCopyWith<$Res> implements $ScheduleOptionsStateCopyWith<$Res> {
  factory _$ScheduleOptionsStateCopyWith(_ScheduleOptionsState value, $Res Function(_ScheduleOptionsState) _then) = __$ScheduleOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ScheduleCategory> categoryItems, List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems
});




}
/// @nodoc
class __$ScheduleOptionsStateCopyWithImpl<$Res>
    implements _$ScheduleOptionsStateCopyWith<$Res> {
  __$ScheduleOptionsStateCopyWithImpl(this._self, this._then);

  final _ScheduleOptionsState _self;
  final $Res Function(_ScheduleOptionsState) _then;

/// Create a copy of ScheduleOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryItems = null,Object? departmentGroups = null,Object? departmentItems = null,}) {
  return _then(_ScheduleOptionsState(
categoryItems: null == categoryItems ? _self._categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleCategory>,departmentGroups: null == departmentGroups ? _self._departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self._departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,
  ));
}


}

/// @nodoc
mixin _$ScheduleSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState()';
}


}

/// @nodoc
class $ScheduleSubmitStateCopyWith<$Res>  {
$ScheduleSubmitStateCopyWith(ScheduleSubmitState _, $Res Function(ScheduleSubmitState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScheduleSubmitIdle value)?  idle,TResult Function( ScheduleSubmitPending value)?  pending,TResult Function( ScheduleSubmitCreated value)?  created,TResult Function( ScheduleSubmitUpdated value)?  updated,TResult Function( ScheduleSubmitDeleted value)?  deleted,TResult Function( ScheduleSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScheduleSubmitIdle() when idle != null:
return idle(_that);case ScheduleSubmitPending() when pending != null:
return pending(_that);case ScheduleSubmitCreated() when created != null:
return created(_that);case ScheduleSubmitUpdated() when updated != null:
return updated(_that);case ScheduleSubmitDeleted() when deleted != null:
return deleted(_that);case ScheduleSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScheduleSubmitIdle value)  idle,required TResult Function( ScheduleSubmitPending value)  pending,required TResult Function( ScheduleSubmitCreated value)  created,required TResult Function( ScheduleSubmitUpdated value)  updated,required TResult Function( ScheduleSubmitDeleted value)  deleted,required TResult Function( ScheduleSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case ScheduleSubmitIdle():
return idle(_that);case ScheduleSubmitPending():
return pending(_that);case ScheduleSubmitCreated():
return created(_that);case ScheduleSubmitUpdated():
return updated(_that);case ScheduleSubmitDeleted():
return deleted(_that);case ScheduleSubmitFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScheduleSubmitIdle value)?  idle,TResult? Function( ScheduleSubmitPending value)?  pending,TResult? Function( ScheduleSubmitCreated value)?  created,TResult? Function( ScheduleSubmitUpdated value)?  updated,TResult? Function( ScheduleSubmitDeleted value)?  deleted,TResult? Function( ScheduleSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ScheduleSubmitIdle() when idle != null:
return idle(_that);case ScheduleSubmitPending() when pending != null:
return pending(_that);case ScheduleSubmitCreated() when created != null:
return created(_that);case ScheduleSubmitUpdated() when updated != null:
return updated(_that);case ScheduleSubmitDeleted() when deleted != null:
return deleted(_that);case ScheduleSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( Schedule schedule)?  created,TResult Function( Schedule schedule)?  updated,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScheduleSubmitIdle() when idle != null:
return idle();case ScheduleSubmitPending() when pending != null:
return pending();case ScheduleSubmitCreated() when created != null:
return created(_that.schedule);case ScheduleSubmitUpdated() when updated != null:
return updated(_that.schedule);case ScheduleSubmitDeleted() when deleted != null:
return deleted();case ScheduleSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( Schedule schedule)  created,required TResult Function( Schedule schedule)  updated,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ScheduleSubmitIdle():
return idle();case ScheduleSubmitPending():
return pending();case ScheduleSubmitCreated():
return created(_that.schedule);case ScheduleSubmitUpdated():
return updated(_that.schedule);case ScheduleSubmitDeleted():
return deleted();case ScheduleSubmitFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( Schedule schedule)?  created,TResult? Function( Schedule schedule)?  updated,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ScheduleSubmitIdle() when idle != null:
return idle();case ScheduleSubmitPending() when pending != null:
return pending();case ScheduleSubmitCreated() when created != null:
return created(_that.schedule);case ScheduleSubmitUpdated() when updated != null:
return updated(_that.schedule);case ScheduleSubmitDeleted() when deleted != null:
return deleted();case ScheduleSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ScheduleSubmitIdle with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.idle()';
}


}




/// @nodoc


class ScheduleSubmitPending with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.pending()';
}


}




/// @nodoc


class ScheduleSubmitCreated with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitCreated(this.schedule);
  

 final  Schedule schedule;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleSubmitCreatedCopyWith<ScheduleSubmitCreated> get copyWith => _$ScheduleSubmitCreatedCopyWithImpl<ScheduleSubmitCreated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.created'))
    ..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitCreated&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,schedule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.created(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleSubmitCreatedCopyWith<$Res> implements $ScheduleSubmitStateCopyWith<$Res> {
  factory $ScheduleSubmitCreatedCopyWith(ScheduleSubmitCreated value, $Res Function(ScheduleSubmitCreated) _then) = _$ScheduleSubmitCreatedCopyWithImpl;
@useResult
$Res call({
 Schedule schedule
});


$ScheduleCopyWith<$Res> get schedule;

}
/// @nodoc
class _$ScheduleSubmitCreatedCopyWithImpl<$Res>
    implements $ScheduleSubmitCreatedCopyWith<$Res> {
  _$ScheduleSubmitCreatedCopyWithImpl(this._self, this._then);

  final ScheduleSubmitCreated _self;
  final $Res Function(ScheduleSubmitCreated) _then;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(ScheduleSubmitCreated(
null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
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


class ScheduleSubmitUpdated with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitUpdated(this.schedule);
  

 final  Schedule schedule;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleSubmitUpdatedCopyWith<ScheduleSubmitUpdated> get copyWith => _$ScheduleSubmitUpdatedCopyWithImpl<ScheduleSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.updated'))
    ..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitUpdated&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,schedule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.updated(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleSubmitUpdatedCopyWith<$Res> implements $ScheduleSubmitStateCopyWith<$Res> {
  factory $ScheduleSubmitUpdatedCopyWith(ScheduleSubmitUpdated value, $Res Function(ScheduleSubmitUpdated) _then) = _$ScheduleSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 Schedule schedule
});


$ScheduleCopyWith<$Res> get schedule;

}
/// @nodoc
class _$ScheduleSubmitUpdatedCopyWithImpl<$Res>
    implements $ScheduleSubmitUpdatedCopyWith<$Res> {
  _$ScheduleSubmitUpdatedCopyWithImpl(this._self, this._then);

  final ScheduleSubmitUpdated _self;
  final $Res Function(ScheduleSubmitUpdated) _then;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(ScheduleSubmitUpdated(
null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
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


class ScheduleSubmitDeleted with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.deleted()';
}


}




/// @nodoc


class ScheduleSubmitFailure with DiagnosticableTreeMixin implements ScheduleSubmitState {
   ScheduleSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleSubmitFailureCopyWith<ScheduleSubmitFailure> get copyWith => _$ScheduleSubmitFailureCopyWithImpl<ScheduleSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ScheduleSubmitFailureCopyWith<$Res> implements $ScheduleSubmitStateCopyWith<$Res> {
  factory $ScheduleSubmitFailureCopyWith(ScheduleSubmitFailure value, $Res Function(ScheduleSubmitFailure) _then) = _$ScheduleSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ScheduleSubmitFailureCopyWithImpl<$Res>
    implements $ScheduleSubmitFailureCopyWith<$Res> {
  _$ScheduleSubmitFailureCopyWithImpl(this._self, this._then);

  final ScheduleSubmitFailure _self;
  final $Res Function(ScheduleSubmitFailure) _then;

/// Create a copy of ScheduleSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ScheduleSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SupplierFilterState implements DiagnosticableTreeMixin {

 String get search;
/// Create a copy of SupplierFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierFilterStateCopyWith<SupplierFilterState> get copyWith => _$SupplierFilterStateCopyWithImpl<SupplierFilterState>(this as SupplierFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierFilterState'))
    ..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierFilterState&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierFilterState(search: $search)';
}


}

/// @nodoc
abstract mixin class $SupplierFilterStateCopyWith<$Res>  {
  factory $SupplierFilterStateCopyWith(SupplierFilterState value, $Res Function(SupplierFilterState) _then) = _$SupplierFilterStateCopyWithImpl;
@useResult
$Res call({
 String search
});




}
/// @nodoc
class _$SupplierFilterStateCopyWithImpl<$Res>
    implements $SupplierFilterStateCopyWith<$Res> {
  _$SupplierFilterStateCopyWithImpl(this._self, this._then);

  final SupplierFilterState _self;
  final $Res Function(SupplierFilterState) _then;

/// Create a copy of SupplierFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierFilterState].
extension SupplierFilterStatePatterns on SupplierFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierFilterState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierFilterState() when $default != null:
return $default(_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String search)  $default,) {final _that = this;
switch (_that) {
case _SupplierFilterState():
return $default(_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String search)?  $default,) {final _that = this;
switch (_that) {
case _SupplierFilterState() when $default != null:
return $default(_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierFilterState with DiagnosticableTreeMixin implements SupplierFilterState {
   _SupplierFilterState({this.search = ''});
  

@override@JsonKey() final  String search;

/// Create a copy of SupplierFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierFilterStateCopyWith<_SupplierFilterState> get copyWith => __$SupplierFilterStateCopyWithImpl<_SupplierFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierFilterState'))
    ..add(DiagnosticsProperty('search', search));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierFilterState&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,search);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierFilterState(search: $search)';
}


}

/// @nodoc
abstract mixin class _$SupplierFilterStateCopyWith<$Res> implements $SupplierFilterStateCopyWith<$Res> {
  factory _$SupplierFilterStateCopyWith(_SupplierFilterState value, $Res Function(_SupplierFilterState) _then) = __$SupplierFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String search
});




}
/// @nodoc
class __$SupplierFilterStateCopyWithImpl<$Res>
    implements _$SupplierFilterStateCopyWith<$Res> {
  __$SupplierFilterStateCopyWithImpl(this._self, this._then);

  final _SupplierFilterState _self;
  final $Res Function(_SupplierFilterState) _then;

/// Create a copy of SupplierFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,}) {
  return _then(_SupplierFilterState(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SupplierFormState implements DiagnosticableTreeMixin {

 String? get name; String? get number; String? get zipcode; String? get roadAddress; String? get roadAddressReference; String? get detailAddress; String? get phone; String? get email; String? get logo; XFile? get file; Uint8List? get fileBytes;
/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierFormStateCopyWith<SupplierFormState> get copyWith => _$SupplierFormStateCopyWithImpl<SupplierFormState>(this as SupplierFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierFormState'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('number', number))..add(DiagnosticsProperty('zipcode', zipcode))..add(DiagnosticsProperty('roadAddress', roadAddress))..add(DiagnosticsProperty('roadAddressReference', roadAddressReference))..add(DiagnosticsProperty('detailAddress', detailAddress))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('logo', logo))..add(DiagnosticsProperty('file', file))..add(DiagnosticsProperty('fileBytes', fileBytes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.roadAddressReference, roadAddressReference) || other.roadAddressReference == roadAddressReference)&&(identical(other.detailAddress, detailAddress) || other.detailAddress == detailAddress)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.file, file) || other.file == file)&&const DeepCollectionEquality().equals(other.fileBytes, fileBytes));
}


@override
int get hashCode => Object.hash(runtimeType,name,number,zipcode,roadAddress,roadAddressReference,detailAddress,phone,email,logo,file,const DeepCollectionEquality().hash(fileBytes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierFormState(name: $name, number: $number, zipcode: $zipcode, roadAddress: $roadAddress, roadAddressReference: $roadAddressReference, detailAddress: $detailAddress, phone: $phone, email: $email, logo: $logo, file: $file, fileBytes: $fileBytes)';
}


}

/// @nodoc
abstract mixin class $SupplierFormStateCopyWith<$Res>  {
  factory $SupplierFormStateCopyWith(SupplierFormState value, $Res Function(SupplierFormState) _then) = _$SupplierFormStateCopyWithImpl;
@useResult
$Res call({
 String? name, String? number, String? zipcode, String? roadAddress, String? roadAddressReference, String? detailAddress, String? phone, String? email, String? logo, XFile? file, Uint8List? fileBytes
});




}
/// @nodoc
class _$SupplierFormStateCopyWithImpl<$Res>
    implements $SupplierFormStateCopyWith<$Res> {
  _$SupplierFormStateCopyWithImpl(this._self, this._then);

  final SupplierFormState _self;
  final $Res Function(SupplierFormState) _then;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? number = freezed,Object? zipcode = freezed,Object? roadAddress = freezed,Object? roadAddressReference = freezed,Object? detailAddress = freezed,Object? phone = freezed,Object? email = freezed,Object? logo = freezed,Object? file = freezed,Object? fileBytes = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,roadAddress: freezed == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String?,roadAddressReference: freezed == roadAddressReference ? _self.roadAddressReference : roadAddressReference // ignore: cast_nullable_to_non_nullable
as String?,detailAddress: freezed == detailAddress ? _self.detailAddress : detailAddress // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as XFile?,fileBytes: freezed == fileBytes ? _self.fileBytes : fileBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierFormState].
extension SupplierFormStatePatterns on SupplierFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierFormState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? number,  String? zipcode,  String? roadAddress,  String? roadAddressReference,  String? detailAddress,  String? phone,  String? email,  String? logo,  XFile? file,  Uint8List? fileBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that.name,_that.number,_that.zipcode,_that.roadAddress,_that.roadAddressReference,_that.detailAddress,_that.phone,_that.email,_that.logo,_that.file,_that.fileBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? number,  String? zipcode,  String? roadAddress,  String? roadAddressReference,  String? detailAddress,  String? phone,  String? email,  String? logo,  XFile? file,  Uint8List? fileBytes)  $default,) {final _that = this;
switch (_that) {
case _SupplierFormState():
return $default(_that.name,_that.number,_that.zipcode,_that.roadAddress,_that.roadAddressReference,_that.detailAddress,_that.phone,_that.email,_that.logo,_that.file,_that.fileBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? number,  String? zipcode,  String? roadAddress,  String? roadAddressReference,  String? detailAddress,  String? phone,  String? email,  String? logo,  XFile? file,  Uint8List? fileBytes)?  $default,) {final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that.name,_that.number,_that.zipcode,_that.roadAddress,_that.roadAddressReference,_that.detailAddress,_that.phone,_that.email,_that.logo,_that.file,_that.fileBytes);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierFormState with DiagnosticableTreeMixin implements SupplierFormState {
   _SupplierFormState({this.name, this.number, this.zipcode, this.roadAddress, this.roadAddressReference, this.detailAddress, this.phone, this.email, this.logo, this.file, this.fileBytes});
  

@override final  String? name;
@override final  String? number;
@override final  String? zipcode;
@override final  String? roadAddress;
@override final  String? roadAddressReference;
@override final  String? detailAddress;
@override final  String? phone;
@override final  String? email;
@override final  String? logo;
@override final  XFile? file;
@override final  Uint8List? fileBytes;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierFormStateCopyWith<_SupplierFormState> get copyWith => __$SupplierFormStateCopyWithImpl<_SupplierFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierFormState'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('number', number))..add(DiagnosticsProperty('zipcode', zipcode))..add(DiagnosticsProperty('roadAddress', roadAddress))..add(DiagnosticsProperty('roadAddressReference', roadAddressReference))..add(DiagnosticsProperty('detailAddress', detailAddress))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('logo', logo))..add(DiagnosticsProperty('file', file))..add(DiagnosticsProperty('fileBytes', fileBytes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.roadAddressReference, roadAddressReference) || other.roadAddressReference == roadAddressReference)&&(identical(other.detailAddress, detailAddress) || other.detailAddress == detailAddress)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.file, file) || other.file == file)&&const DeepCollectionEquality().equals(other.fileBytes, fileBytes));
}


@override
int get hashCode => Object.hash(runtimeType,name,number,zipcode,roadAddress,roadAddressReference,detailAddress,phone,email,logo,file,const DeepCollectionEquality().hash(fileBytes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierFormState(name: $name, number: $number, zipcode: $zipcode, roadAddress: $roadAddress, roadAddressReference: $roadAddressReference, detailAddress: $detailAddress, phone: $phone, email: $email, logo: $logo, file: $file, fileBytes: $fileBytes)';
}


}

/// @nodoc
abstract mixin class _$SupplierFormStateCopyWith<$Res> implements $SupplierFormStateCopyWith<$Res> {
  factory _$SupplierFormStateCopyWith(_SupplierFormState value, $Res Function(_SupplierFormState) _then) = __$SupplierFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? number, String? zipcode, String? roadAddress, String? roadAddressReference, String? detailAddress, String? phone, String? email, String? logo, XFile? file, Uint8List? fileBytes
});




}
/// @nodoc
class __$SupplierFormStateCopyWithImpl<$Res>
    implements _$SupplierFormStateCopyWith<$Res> {
  __$SupplierFormStateCopyWithImpl(this._self, this._then);

  final _SupplierFormState _self;
  final $Res Function(_SupplierFormState) _then;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? number = freezed,Object? zipcode = freezed,Object? roadAddress = freezed,Object? roadAddressReference = freezed,Object? detailAddress = freezed,Object? phone = freezed,Object? email = freezed,Object? logo = freezed,Object? file = freezed,Object? fileBytes = freezed,}) {
  return _then(_SupplierFormState(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,roadAddress: freezed == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String?,roadAddressReference: freezed == roadAddressReference ? _self.roadAddressReference : roadAddressReference // ignore: cast_nullable_to_non_nullable
as String?,detailAddress: freezed == detailAddress ? _self.detailAddress : detailAddress // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as XFile?,fileBytes: freezed == fileBytes ? _self.fileBytes : fileBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$SupplierListState implements DiagnosticableTreeMixin {

 List<Supplier> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of SupplierListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierListStateCopyWith<SupplierListState> get copyWith => _$SupplierListStateCopyWithImpl<SupplierListState>(this as SupplierListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $SupplierListStateCopyWith<$Res>  {
  factory $SupplierListStateCopyWith(SupplierListState value, $Res Function(SupplierListState) _then) = _$SupplierListStateCopyWithImpl;
@useResult
$Res call({
 List<Supplier> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$SupplierListStateCopyWithImpl<$Res>
    implements $SupplierListStateCopyWith<$Res> {
  _$SupplierListStateCopyWithImpl(this._self, this._then);

  final SupplierListState _self;
  final $Res Function(SupplierListState) _then;

/// Create a copy of SupplierListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Supplier>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierListState].
extension SupplierListStatePatterns on SupplierListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierListState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierListState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Supplier> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Supplier> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _SupplierListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Supplier> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _SupplierListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierListState with DiagnosticableTreeMixin implements SupplierListState {
   _SupplierListState({final  List<Supplier> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<Supplier> _items;
@override@JsonKey() List<Supplier> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of SupplierListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierListStateCopyWith<_SupplierListState> get copyWith => __$SupplierListStateCopyWithImpl<_SupplierListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$SupplierListStateCopyWith<$Res> implements $SupplierListStateCopyWith<$Res> {
  factory _$SupplierListStateCopyWith(_SupplierListState value, $Res Function(_SupplierListState) _then) = __$SupplierListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Supplier> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$SupplierListStateCopyWithImpl<$Res>
    implements _$SupplierListStateCopyWith<$Res> {
  __$SupplierListStateCopyWithImpl(this._self, this._then);

  final _SupplierListState _self;
  final $Res Function(_SupplierListState) _then;

/// Create a copy of SupplierListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_SupplierListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Supplier>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SupplierSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState()';
}


}

/// @nodoc
class $SupplierSubmitStateCopyWith<$Res>  {
$SupplierSubmitStateCopyWith(SupplierSubmitState _, $Res Function(SupplierSubmitState) __);
}


/// Adds pattern-matching-related methods to [SupplierSubmitState].
extension SupplierSubmitStatePatterns on SupplierSubmitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SupplierSubmitIdle value)?  idle,TResult Function( SupplierSubmitPending value)?  pending,TResult Function( SupplierSubmitCreated value)?  created,TResult Function( SupplierSubmitUpdated value)?  updated,TResult Function( SupplierSubmitDeleted value)?  deleted,TResult Function( SupplierSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SupplierSubmitIdle() when idle != null:
return idle(_that);case SupplierSubmitPending() when pending != null:
return pending(_that);case SupplierSubmitCreated() when created != null:
return created(_that);case SupplierSubmitUpdated() when updated != null:
return updated(_that);case SupplierSubmitDeleted() when deleted != null:
return deleted(_that);case SupplierSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SupplierSubmitIdle value)  idle,required TResult Function( SupplierSubmitPending value)  pending,required TResult Function( SupplierSubmitCreated value)  created,required TResult Function( SupplierSubmitUpdated value)  updated,required TResult Function( SupplierSubmitDeleted value)  deleted,required TResult Function( SupplierSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case SupplierSubmitIdle():
return idle(_that);case SupplierSubmitPending():
return pending(_that);case SupplierSubmitCreated():
return created(_that);case SupplierSubmitUpdated():
return updated(_that);case SupplierSubmitDeleted():
return deleted(_that);case SupplierSubmitFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SupplierSubmitIdle value)?  idle,TResult? Function( SupplierSubmitPending value)?  pending,TResult? Function( SupplierSubmitCreated value)?  created,TResult? Function( SupplierSubmitUpdated value)?  updated,TResult? Function( SupplierSubmitDeleted value)?  deleted,TResult? Function( SupplierSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SupplierSubmitIdle() when idle != null:
return idle(_that);case SupplierSubmitPending() when pending != null:
return pending(_that);case SupplierSubmitCreated() when created != null:
return created(_that);case SupplierSubmitUpdated() when updated != null:
return updated(_that);case SupplierSubmitDeleted() when deleted != null:
return deleted(_that);case SupplierSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( Supplier supplier)?  created,TResult Function( Supplier supplier)?  updated,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SupplierSubmitIdle() when idle != null:
return idle();case SupplierSubmitPending() when pending != null:
return pending();case SupplierSubmitCreated() when created != null:
return created(_that.supplier);case SupplierSubmitUpdated() when updated != null:
return updated(_that.supplier);case SupplierSubmitDeleted() when deleted != null:
return deleted();case SupplierSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( Supplier supplier)  created,required TResult Function( Supplier supplier)  updated,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case SupplierSubmitIdle():
return idle();case SupplierSubmitPending():
return pending();case SupplierSubmitCreated():
return created(_that.supplier);case SupplierSubmitUpdated():
return updated(_that.supplier);case SupplierSubmitDeleted():
return deleted();case SupplierSubmitFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( Supplier supplier)?  created,TResult? Function( Supplier supplier)?  updated,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case SupplierSubmitIdle() when idle != null:
return idle();case SupplierSubmitPending() when pending != null:
return pending();case SupplierSubmitCreated() when created != null:
return created(_that.supplier);case SupplierSubmitUpdated() when updated != null:
return updated(_that.supplier);case SupplierSubmitDeleted() when deleted != null:
return deleted();case SupplierSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SupplierSubmitIdle with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.idle()';
}


}




/// @nodoc


class SupplierSubmitPending with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.pending()';
}


}




/// @nodoc


class SupplierSubmitCreated with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitCreated(this.supplier);
  

 final  Supplier supplier;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierSubmitCreatedCopyWith<SupplierSubmitCreated> get copyWith => _$SupplierSubmitCreatedCopyWithImpl<SupplierSubmitCreated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.created'))
    ..add(DiagnosticsProperty('supplier', supplier));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitCreated&&(identical(other.supplier, supplier) || other.supplier == supplier));
}


@override
int get hashCode => Object.hash(runtimeType,supplier);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.created(supplier: $supplier)';
}


}

/// @nodoc
abstract mixin class $SupplierSubmitCreatedCopyWith<$Res> implements $SupplierSubmitStateCopyWith<$Res> {
  factory $SupplierSubmitCreatedCopyWith(SupplierSubmitCreated value, $Res Function(SupplierSubmitCreated) _then) = _$SupplierSubmitCreatedCopyWithImpl;
@useResult
$Res call({
 Supplier supplier
});


$SupplierCopyWith<$Res> get supplier;

}
/// @nodoc
class _$SupplierSubmitCreatedCopyWithImpl<$Res>
    implements $SupplierSubmitCreatedCopyWith<$Res> {
  _$SupplierSubmitCreatedCopyWithImpl(this._self, this._then);

  final SupplierSubmitCreated _self;
  final $Res Function(SupplierSubmitCreated) _then;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? supplier = null,}) {
  return _then(SupplierSubmitCreated(
null == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as Supplier,
  ));
}

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierCopyWith<$Res> get supplier {
  
  return $SupplierCopyWith<$Res>(_self.supplier, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}
}

/// @nodoc


class SupplierSubmitUpdated with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitUpdated(this.supplier);
  

 final  Supplier supplier;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierSubmitUpdatedCopyWith<SupplierSubmitUpdated> get copyWith => _$SupplierSubmitUpdatedCopyWithImpl<SupplierSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.updated'))
    ..add(DiagnosticsProperty('supplier', supplier));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitUpdated&&(identical(other.supplier, supplier) || other.supplier == supplier));
}


@override
int get hashCode => Object.hash(runtimeType,supplier);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.updated(supplier: $supplier)';
}


}

/// @nodoc
abstract mixin class $SupplierSubmitUpdatedCopyWith<$Res> implements $SupplierSubmitStateCopyWith<$Res> {
  factory $SupplierSubmitUpdatedCopyWith(SupplierSubmitUpdated value, $Res Function(SupplierSubmitUpdated) _then) = _$SupplierSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 Supplier supplier
});


$SupplierCopyWith<$Res> get supplier;

}
/// @nodoc
class _$SupplierSubmitUpdatedCopyWithImpl<$Res>
    implements $SupplierSubmitUpdatedCopyWith<$Res> {
  _$SupplierSubmitUpdatedCopyWithImpl(this._self, this._then);

  final SupplierSubmitUpdated _self;
  final $Res Function(SupplierSubmitUpdated) _then;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? supplier = null,}) {
  return _then(SupplierSubmitUpdated(
null == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as Supplier,
  ));
}

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierCopyWith<$Res> get supplier {
  
  return $SupplierCopyWith<$Res>(_self.supplier, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}
}

/// @nodoc


class SupplierSubmitDeleted with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.deleted()';
}


}




/// @nodoc


class SupplierSubmitFailure with DiagnosticableTreeMixin implements SupplierSubmitState {
   SupplierSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierSubmitFailureCopyWith<SupplierSubmitFailure> get copyWith => _$SupplierSubmitFailureCopyWithImpl<SupplierSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupplierSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupplierSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $SupplierSubmitFailureCopyWith<$Res> implements $SupplierSubmitStateCopyWith<$Res> {
  factory $SupplierSubmitFailureCopyWith(SupplierSubmitFailure value, $Res Function(SupplierSubmitFailure) _then) = _$SupplierSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SupplierSubmitFailureCopyWithImpl<$Res>
    implements $SupplierSubmitFailureCopyWith<$Res> {
  _$SupplierSubmitFailureCopyWithImpl(this._self, this._then);

  final SupplierSubmitFailure _self;
  final $Res Function(SupplierSubmitFailure) _then;

/// Create a copy of SupplierSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SupplierSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReportFormState implements DiagnosticableTreeMixin {

 List<TripActualExpense> get expenses; List<TripRegulationRate> get rates; TripFuelExpense? get fuel; bool? get isDeducted; String? get content; List<ReportAttachment> get attachments; List<XFile> get files; Schedule? get schedule;
/// Create a copy of ReportFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportFormStateCopyWith<ReportFormState> get copyWith => _$ReportFormStateCopyWithImpl<ReportFormState>(this as ReportFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportFormState'))
    ..add(DiagnosticsProperty('expenses', expenses))..add(DiagnosticsProperty('rates', rates))..add(DiagnosticsProperty('fuel', fuel))..add(DiagnosticsProperty('isDeducted', isDeducted))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportFormState&&const DeepCollectionEquality().equals(other.expenses, expenses)&&const DeepCollectionEquality().equals(other.rates, rates)&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.isDeducted, isDeducted) || other.isDeducted == isDeducted)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expenses),const DeepCollectionEquality().hash(rates),fuel,isDeducted,content,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(files),schedule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportFormState(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, content: $content, attachments: $attachments, files: $files, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ReportFormStateCopyWith<$Res>  {
  factory $ReportFormStateCopyWith(ReportFormState value, $Res Function(ReportFormState) _then) = _$ReportFormStateCopyWithImpl;
@useResult
$Res call({
 List<TripActualExpense> expenses, List<TripRegulationRate> rates, TripFuelExpense? fuel, bool? isDeducted, String? content, List<ReportAttachment> attachments, List<XFile> files, Schedule? schedule
});


$TripFuelExpenseCopyWith<$Res>? get fuel;$ScheduleCopyWith<$Res>? get schedule;

}
/// @nodoc
class _$ReportFormStateCopyWithImpl<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  _$ReportFormStateCopyWithImpl(this._self, this._then);

  final ReportFormState _self;
  final $Res Function(ReportFormState) _then;

/// Create a copy of ReportFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expenses = null,Object? rates = null,Object? fuel = freezed,Object? isDeducted = freezed,Object? content = freezed,Object? attachments = null,Object? files = null,Object? schedule = freezed,}) {
  return _then(_self.copyWith(
expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<TripActualExpense>,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as List<TripRegulationRate>,fuel: freezed == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as TripFuelExpense?,isDeducted: freezed == isDeducted ? _self.isDeducted : isDeducted // ignore: cast_nullable_to_non_nullable
as bool?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ReportAttachment>,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Schedule?,
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
}/// Create a copy of ReportFormState
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportFormState value)  $default,){
final _that = this;
switch (_that) {
case _ReportFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TripActualExpense> expenses,  List<TripRegulationRate> rates,  TripFuelExpense? fuel,  bool? isDeducted,  String? content,  List<ReportAttachment> attachments,  List<XFile> files,  Schedule? schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportFormState() when $default != null:
return $default(_that.expenses,_that.rates,_that.fuel,_that.isDeducted,_that.content,_that.attachments,_that.files,_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TripActualExpense> expenses,  List<TripRegulationRate> rates,  TripFuelExpense? fuel,  bool? isDeducted,  String? content,  List<ReportAttachment> attachments,  List<XFile> files,  Schedule? schedule)  $default,) {final _that = this;
switch (_that) {
case _ReportFormState():
return $default(_that.expenses,_that.rates,_that.fuel,_that.isDeducted,_that.content,_that.attachments,_that.files,_that.schedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TripActualExpense> expenses,  List<TripRegulationRate> rates,  TripFuelExpense? fuel,  bool? isDeducted,  String? content,  List<ReportAttachment> attachments,  List<XFile> files,  Schedule? schedule)?  $default,) {final _that = this;
switch (_that) {
case _ReportFormState() when $default != null:
return $default(_that.expenses,_that.rates,_that.fuel,_that.isDeducted,_that.content,_that.attachments,_that.files,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc


class _ReportFormState extends ReportFormState with DiagnosticableTreeMixin {
   _ReportFormState({final  List<TripActualExpense> expenses = const [], final  List<TripRegulationRate> rates = const [], this.fuel, this.isDeducted, this.content, final  List<ReportAttachment> attachments = const <ReportAttachment>[], final  List<XFile> files = const <XFile>[], this.schedule}): _expenses = expenses,_rates = rates,_attachments = attachments,_files = files,super._();
  

 final  List<TripActualExpense> _expenses;
@override@JsonKey() List<TripActualExpense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  List<TripRegulationRate> _rates;
@override@JsonKey() List<TripRegulationRate> get rates {
  if (_rates is EqualUnmodifiableListView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rates);
}

@override final  TripFuelExpense? fuel;
@override final  bool? isDeducted;
@override final  String? content;
 final  List<ReportAttachment> _attachments;
@override@JsonKey() List<ReportAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  List<XFile> _files;
@override@JsonKey() List<XFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  Schedule? schedule;

/// Create a copy of ReportFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportFormStateCopyWith<_ReportFormState> get copyWith => __$ReportFormStateCopyWithImpl<_ReportFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportFormState'))
    ..add(DiagnosticsProperty('expenses', expenses))..add(DiagnosticsProperty('rates', rates))..add(DiagnosticsProperty('fuel', fuel))..add(DiagnosticsProperty('isDeducted', isDeducted))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportFormState&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&const DeepCollectionEquality().equals(other._rates, _rates)&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.isDeducted, isDeducted) || other.isDeducted == isDeducted)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_rates),fuel,isDeducted,content,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_files),schedule);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportFormState(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, content: $content, attachments: $attachments, files: $files, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ReportFormStateCopyWith<$Res> implements $ReportFormStateCopyWith<$Res> {
  factory _$ReportFormStateCopyWith(_ReportFormState value, $Res Function(_ReportFormState) _then) = __$ReportFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<TripActualExpense> expenses, List<TripRegulationRate> rates, TripFuelExpense? fuel, bool? isDeducted, String? content, List<ReportAttachment> attachments, List<XFile> files, Schedule? schedule
});


@override $TripFuelExpenseCopyWith<$Res>? get fuel;@override $ScheduleCopyWith<$Res>? get schedule;

}
/// @nodoc
class __$ReportFormStateCopyWithImpl<$Res>
    implements _$ReportFormStateCopyWith<$Res> {
  __$ReportFormStateCopyWithImpl(this._self, this._then);

  final _ReportFormState _self;
  final $Res Function(_ReportFormState) _then;

/// Create a copy of ReportFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? rates = null,Object? fuel = freezed,Object? isDeducted = freezed,Object? content = freezed,Object? attachments = null,Object? files = null,Object? schedule = freezed,}) {
  return _then(_ReportFormState(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<TripActualExpense>,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as List<TripRegulationRate>,fuel: freezed == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as TripFuelExpense?,isDeducted: freezed == isDeducted ? _self.isDeducted : isDeducted // ignore: cast_nullable_to_non_nullable
as bool?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ReportAttachment>,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<XFile>,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Schedule?,
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
}/// Create a copy of ReportFormState
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

 List<Report> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of ReportListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportListStateCopyWith<ReportListState> get copyWith => _$ReportListStateCopyWithImpl<ReportListState>(this as ReportListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $ReportListStateCopyWith<$Res>  {
  factory $ReportListStateCopyWith(ReportListState value, $Res Function(ReportListState) _then) = _$ReportListStateCopyWithImpl;
@useResult
$Res call({
 List<Report> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$ReportListStateCopyWithImpl<$Res>
    implements $ReportListStateCopyWith<$Res> {
  _$ReportListStateCopyWithImpl(this._self, this._then);

  final ReportListState _self;
  final $Res Function(ReportListState) _then;

/// Create a copy of ReportListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Report>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportListState value)  $default,){
final _that = this;
switch (_that) {
case _ReportListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportListState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Report> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Report> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _ReportListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Report> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _ReportListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _ReportListState with DiagnosticableTreeMixin implements ReportListState {
   _ReportListState({final  List<Report> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<Report> _items;
@override@JsonKey() List<Report> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of ReportListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportListStateCopyWith<_ReportListState> get copyWith => __$ReportListStateCopyWithImpl<_ReportListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$ReportListStateCopyWith<$Res> implements $ReportListStateCopyWith<$Res> {
  factory _$ReportListStateCopyWith(_ReportListState value, $Res Function(_ReportListState) _then) = __$ReportListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Report> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$ReportListStateCopyWithImpl<$Res>
    implements _$ReportListStateCopyWith<$Res> {
  __$ReportListStateCopyWithImpl(this._self, this._then);

  final _ReportListState _self;
  final $Res Function(_ReportListState) _then;

/// Create a copy of ReportListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_ReportListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Report>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ReportSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState()';
}


}

/// @nodoc
class $ReportSubmitStateCopyWith<$Res>  {
$ReportSubmitStateCopyWith(ReportSubmitState _, $Res Function(ReportSubmitState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReportSubmitIdle value)?  idle,TResult Function( ReportSubmitPending value)?  pending,TResult Function( ReportSubmitCreated value)?  created,TResult Function( ReportSubmitUpdated value)?  updated,TResult Function( ReportSubmitDeleted value)?  deleted,TResult Function( ReportSubmitMailed value)?  mailed,TResult Function( ReportSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReportSubmitIdle() when idle != null:
return idle(_that);case ReportSubmitPending() when pending != null:
return pending(_that);case ReportSubmitCreated() when created != null:
return created(_that);case ReportSubmitUpdated() when updated != null:
return updated(_that);case ReportSubmitDeleted() when deleted != null:
return deleted(_that);case ReportSubmitMailed() when mailed != null:
return mailed(_that);case ReportSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReportSubmitIdle value)  idle,required TResult Function( ReportSubmitPending value)  pending,required TResult Function( ReportSubmitCreated value)  created,required TResult Function( ReportSubmitUpdated value)  updated,required TResult Function( ReportSubmitDeleted value)  deleted,required TResult Function( ReportSubmitMailed value)  mailed,required TResult Function( ReportSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case ReportSubmitIdle():
return idle(_that);case ReportSubmitPending():
return pending(_that);case ReportSubmitCreated():
return created(_that);case ReportSubmitUpdated():
return updated(_that);case ReportSubmitDeleted():
return deleted(_that);case ReportSubmitMailed():
return mailed(_that);case ReportSubmitFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReportSubmitIdle value)?  idle,TResult? Function( ReportSubmitPending value)?  pending,TResult? Function( ReportSubmitCreated value)?  created,TResult? Function( ReportSubmitUpdated value)?  updated,TResult? Function( ReportSubmitDeleted value)?  deleted,TResult? Function( ReportSubmitMailed value)?  mailed,TResult? Function( ReportSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ReportSubmitIdle() when idle != null:
return idle(_that);case ReportSubmitPending() when pending != null:
return pending(_that);case ReportSubmitCreated() when created != null:
return created(_that);case ReportSubmitUpdated() when updated != null:
return updated(_that);case ReportSubmitDeleted() when deleted != null:
return deleted(_that);case ReportSubmitMailed() when mailed != null:
return mailed(_that);case ReportSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( Report report)?  created,TResult Function( Report report)?  updated,TResult Function()?  deleted,TResult Function()?  mailed,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReportSubmitIdle() when idle != null:
return idle();case ReportSubmitPending() when pending != null:
return pending();case ReportSubmitCreated() when created != null:
return created(_that.report);case ReportSubmitUpdated() when updated != null:
return updated(_that.report);case ReportSubmitDeleted() when deleted != null:
return deleted();case ReportSubmitMailed() when mailed != null:
return mailed();case ReportSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( Report report)  created,required TResult Function( Report report)  updated,required TResult Function()  deleted,required TResult Function()  mailed,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ReportSubmitIdle():
return idle();case ReportSubmitPending():
return pending();case ReportSubmitCreated():
return created(_that.report);case ReportSubmitUpdated():
return updated(_that.report);case ReportSubmitDeleted():
return deleted();case ReportSubmitMailed():
return mailed();case ReportSubmitFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( Report report)?  created,TResult? Function( Report report)?  updated,TResult? Function()?  deleted,TResult? Function()?  mailed,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ReportSubmitIdle() when idle != null:
return idle();case ReportSubmitPending() when pending != null:
return pending();case ReportSubmitCreated() when created != null:
return created(_that.report);case ReportSubmitUpdated() when updated != null:
return updated(_that.report);case ReportSubmitDeleted() when deleted != null:
return deleted();case ReportSubmitMailed() when mailed != null:
return mailed();case ReportSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ReportSubmitIdle with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.idle()';
}


}




/// @nodoc


class ReportSubmitPending with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.pending()';
}


}




/// @nodoc


class ReportSubmitCreated with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitCreated(this.report);
  

 final  Report report;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmitCreatedCopyWith<ReportSubmitCreated> get copyWith => _$ReportSubmitCreatedCopyWithImpl<ReportSubmitCreated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.created'))
    ..add(DiagnosticsProperty('report', report));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitCreated&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode => Object.hash(runtimeType,report);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.created(report: $report)';
}


}

/// @nodoc
abstract mixin class $ReportSubmitCreatedCopyWith<$Res> implements $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitCreatedCopyWith(ReportSubmitCreated value, $Res Function(ReportSubmitCreated) _then) = _$ReportSubmitCreatedCopyWithImpl;
@useResult
$Res call({
 Report report
});


$ReportCopyWith<$Res> get report;

}
/// @nodoc
class _$ReportSubmitCreatedCopyWithImpl<$Res>
    implements $ReportSubmitCreatedCopyWith<$Res> {
  _$ReportSubmitCreatedCopyWithImpl(this._self, this._then);

  final ReportSubmitCreated _self;
  final $Res Function(ReportSubmitCreated) _then;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,}) {
  return _then(ReportSubmitCreated(
null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
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


class ReportSubmitUpdated with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitUpdated(this.report);
  

 final  Report report;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmitUpdatedCopyWith<ReportSubmitUpdated> get copyWith => _$ReportSubmitUpdatedCopyWithImpl<ReportSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.updated'))
    ..add(DiagnosticsProperty('report', report));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitUpdated&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode => Object.hash(runtimeType,report);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.updated(report: $report)';
}


}

/// @nodoc
abstract mixin class $ReportSubmitUpdatedCopyWith<$Res> implements $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitUpdatedCopyWith(ReportSubmitUpdated value, $Res Function(ReportSubmitUpdated) _then) = _$ReportSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 Report report
});


$ReportCopyWith<$Res> get report;

}
/// @nodoc
class _$ReportSubmitUpdatedCopyWithImpl<$Res>
    implements $ReportSubmitUpdatedCopyWith<$Res> {
  _$ReportSubmitUpdatedCopyWithImpl(this._self, this._then);

  final ReportSubmitUpdated _self;
  final $Res Function(ReportSubmitUpdated) _then;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,}) {
  return _then(ReportSubmitUpdated(
null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
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


class ReportSubmitDeleted with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.deleted()';
}


}




/// @nodoc


class ReportSubmitMailed with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitMailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.mailed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitMailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.mailed()';
}


}




/// @nodoc


class ReportSubmitFailure with DiagnosticableTreeMixin implements ReportSubmitState {
  const ReportSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmitFailureCopyWith<ReportSubmitFailure> get copyWith => _$ReportSubmitFailureCopyWithImpl<ReportSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReportSubmitFailureCopyWith<$Res> implements $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitFailureCopyWith(ReportSubmitFailure value, $Res Function(ReportSubmitFailure) _then) = _$ReportSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReportSubmitFailureCopyWithImpl<$Res>
    implements $ReportSubmitFailureCopyWith<$Res> {
  _$ReportSubmitFailureCopyWithImpl(this._self, this._then);

  final ReportSubmitFailure _self;
  final $Res Function(ReportSubmitFailure) _then;

/// Create a copy of ReportSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReportSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReportValidationState implements DiagnosticableTreeMixin {

 Map<int, bool> get stepValidations; Map<int, bool> get regulationRateValidations; bool get fuelInvalid; bool get holidaysInvalid; bool get contentInvalid; bool get optionsInvalid;
/// Create a copy of ReportValidationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportValidationStateCopyWith<ReportValidationState> get copyWith => _$ReportValidationStateCopyWithImpl<ReportValidationState>(this as ReportValidationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportValidationState'))
    ..add(DiagnosticsProperty('stepValidations', stepValidations))..add(DiagnosticsProperty('regulationRateValidations', regulationRateValidations))..add(DiagnosticsProperty('fuelInvalid', fuelInvalid))..add(DiagnosticsProperty('holidaysInvalid', holidaysInvalid))..add(DiagnosticsProperty('contentInvalid', contentInvalid))..add(DiagnosticsProperty('optionsInvalid', optionsInvalid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportValidationState&&const DeepCollectionEquality().equals(other.stepValidations, stepValidations)&&const DeepCollectionEquality().equals(other.regulationRateValidations, regulationRateValidations)&&(identical(other.fuelInvalid, fuelInvalid) || other.fuelInvalid == fuelInvalid)&&(identical(other.holidaysInvalid, holidaysInvalid) || other.holidaysInvalid == holidaysInvalid)&&(identical(other.contentInvalid, contentInvalid) || other.contentInvalid == contentInvalid)&&(identical(other.optionsInvalid, optionsInvalid) || other.optionsInvalid == optionsInvalid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stepValidations),const DeepCollectionEquality().hash(regulationRateValidations),fuelInvalid,holidaysInvalid,contentInvalid,optionsInvalid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportValidationState(stepValidations: $stepValidations, regulationRateValidations: $regulationRateValidations, fuelInvalid: $fuelInvalid, holidaysInvalid: $holidaysInvalid, contentInvalid: $contentInvalid, optionsInvalid: $optionsInvalid)';
}


}

/// @nodoc
abstract mixin class $ReportValidationStateCopyWith<$Res>  {
  factory $ReportValidationStateCopyWith(ReportValidationState value, $Res Function(ReportValidationState) _then) = _$ReportValidationStateCopyWithImpl;
@useResult
$Res call({
 Map<int, bool> stepValidations, Map<int, bool> regulationRateValidations, bool fuelInvalid, bool holidaysInvalid, bool contentInvalid, bool optionsInvalid
});




}
/// @nodoc
class _$ReportValidationStateCopyWithImpl<$Res>
    implements $ReportValidationStateCopyWith<$Res> {
  _$ReportValidationStateCopyWithImpl(this._self, this._then);

  final ReportValidationState _self;
  final $Res Function(ReportValidationState) _then;

/// Create a copy of ReportValidationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepValidations = null,Object? regulationRateValidations = null,Object? fuelInvalid = null,Object? holidaysInvalid = null,Object? contentInvalid = null,Object? optionsInvalid = null,}) {
  return _then(_self.copyWith(
stepValidations: null == stepValidations ? _self.stepValidations : stepValidations // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,regulationRateValidations: null == regulationRateValidations ? _self.regulationRateValidations : regulationRateValidations // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,fuelInvalid: null == fuelInvalid ? _self.fuelInvalid : fuelInvalid // ignore: cast_nullable_to_non_nullable
as bool,holidaysInvalid: null == holidaysInvalid ? _self.holidaysInvalid : holidaysInvalid // ignore: cast_nullable_to_non_nullable
as bool,contentInvalid: null == contentInvalid ? _self.contentInvalid : contentInvalid // ignore: cast_nullable_to_non_nullable
as bool,optionsInvalid: null == optionsInvalid ? _self.optionsInvalid : optionsInvalid // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportValidationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportValidationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportValidationState value)  $default,){
final _that = this;
switch (_that) {
case _ReportValidationState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportValidationState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportValidationState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, bool> stepValidations,  Map<int, bool> regulationRateValidations,  bool fuelInvalid,  bool holidaysInvalid,  bool contentInvalid,  bool optionsInvalid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportValidationState() when $default != null:
return $default(_that.stepValidations,_that.regulationRateValidations,_that.fuelInvalid,_that.holidaysInvalid,_that.contentInvalid,_that.optionsInvalid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, bool> stepValidations,  Map<int, bool> regulationRateValidations,  bool fuelInvalid,  bool holidaysInvalid,  bool contentInvalid,  bool optionsInvalid)  $default,) {final _that = this;
switch (_that) {
case _ReportValidationState():
return $default(_that.stepValidations,_that.regulationRateValidations,_that.fuelInvalid,_that.holidaysInvalid,_that.contentInvalid,_that.optionsInvalid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, bool> stepValidations,  Map<int, bool> regulationRateValidations,  bool fuelInvalid,  bool holidaysInvalid,  bool contentInvalid,  bool optionsInvalid)?  $default,) {final _that = this;
switch (_that) {
case _ReportValidationState() when $default != null:
return $default(_that.stepValidations,_that.regulationRateValidations,_that.fuelInvalid,_that.holidaysInvalid,_that.contentInvalid,_that.optionsInvalid);case _:
  return null;

}
}

}

/// @nodoc


class _ReportValidationState with DiagnosticableTreeMixin implements ReportValidationState {
   _ReportValidationState({final  Map<int, bool> stepValidations = const {}, final  Map<int, bool> regulationRateValidations = const {}, this.fuelInvalid = false, this.holidaysInvalid = false, this.contentInvalid = false, this.optionsInvalid = false}): _stepValidations = stepValidations,_regulationRateValidations = regulationRateValidations;
  

 final  Map<int, bool> _stepValidations;
@override@JsonKey() Map<int, bool> get stepValidations {
  if (_stepValidations is EqualUnmodifiableMapView) return _stepValidations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stepValidations);
}

 final  Map<int, bool> _regulationRateValidations;
@override@JsonKey() Map<int, bool> get regulationRateValidations {
  if (_regulationRateValidations is EqualUnmodifiableMapView) return _regulationRateValidations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_regulationRateValidations);
}

@override@JsonKey() final  bool fuelInvalid;
@override@JsonKey() final  bool holidaysInvalid;
@override@JsonKey() final  bool contentInvalid;
@override@JsonKey() final  bool optionsInvalid;

/// Create a copy of ReportValidationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportValidationStateCopyWith<_ReportValidationState> get copyWith => __$ReportValidationStateCopyWithImpl<_ReportValidationState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReportValidationState'))
    ..add(DiagnosticsProperty('stepValidations', stepValidations))..add(DiagnosticsProperty('regulationRateValidations', regulationRateValidations))..add(DiagnosticsProperty('fuelInvalid', fuelInvalid))..add(DiagnosticsProperty('holidaysInvalid', holidaysInvalid))..add(DiagnosticsProperty('contentInvalid', contentInvalid))..add(DiagnosticsProperty('optionsInvalid', optionsInvalid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportValidationState&&const DeepCollectionEquality().equals(other._stepValidations, _stepValidations)&&const DeepCollectionEquality().equals(other._regulationRateValidations, _regulationRateValidations)&&(identical(other.fuelInvalid, fuelInvalid) || other.fuelInvalid == fuelInvalid)&&(identical(other.holidaysInvalid, holidaysInvalid) || other.holidaysInvalid == holidaysInvalid)&&(identical(other.contentInvalid, contentInvalid) || other.contentInvalid == contentInvalid)&&(identical(other.optionsInvalid, optionsInvalid) || other.optionsInvalid == optionsInvalid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stepValidations),const DeepCollectionEquality().hash(_regulationRateValidations),fuelInvalid,holidaysInvalid,contentInvalid,optionsInvalid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReportValidationState(stepValidations: $stepValidations, regulationRateValidations: $regulationRateValidations, fuelInvalid: $fuelInvalid, holidaysInvalid: $holidaysInvalid, contentInvalid: $contentInvalid, optionsInvalid: $optionsInvalid)';
}


}

/// @nodoc
abstract mixin class _$ReportValidationStateCopyWith<$Res> implements $ReportValidationStateCopyWith<$Res> {
  factory _$ReportValidationStateCopyWith(_ReportValidationState value, $Res Function(_ReportValidationState) _then) = __$ReportValidationStateCopyWithImpl;
@override @useResult
$Res call({
 Map<int, bool> stepValidations, Map<int, bool> regulationRateValidations, bool fuelInvalid, bool holidaysInvalid, bool contentInvalid, bool optionsInvalid
});




}
/// @nodoc
class __$ReportValidationStateCopyWithImpl<$Res>
    implements _$ReportValidationStateCopyWith<$Res> {
  __$ReportValidationStateCopyWithImpl(this._self, this._then);

  final _ReportValidationState _self;
  final $Res Function(_ReportValidationState) _then;

/// Create a copy of ReportValidationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepValidations = null,Object? regulationRateValidations = null,Object? fuelInvalid = null,Object? holidaysInvalid = null,Object? contentInvalid = null,Object? optionsInvalid = null,}) {
  return _then(_ReportValidationState(
stepValidations: null == stepValidations ? _self._stepValidations : stepValidations // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,regulationRateValidations: null == regulationRateValidations ? _self._regulationRateValidations : regulationRateValidations // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,fuelInvalid: null == fuelInvalid ? _self.fuelInvalid : fuelInvalid // ignore: cast_nullable_to_non_nullable
as bool,holidaysInvalid: null == holidaysInvalid ? _self.holidaysInvalid : holidaysInvalid // ignore: cast_nullable_to_non_nullable
as bool,contentInvalid: null == contentInvalid ? _self.contentInvalid : contentInvalid // ignore: cast_nullable_to_non_nullable
as bool,optionsInvalid: null == optionsInvalid ? _self.optionsInvalid : optionsInvalid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TripExportState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState()';
}


}

/// @nodoc
class $TripExportStateCopyWith<$Res>  {
$TripExportStateCopyWith(TripExportState _, $Res Function(TripExportState) __);
}


/// Adds pattern-matching-related methods to [TripExportState].
extension TripExportStatePatterns on TripExportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TripExportIdle value)?  idle,TResult Function( TripExportLoading value)?  loading,TResult Function( TripExportRendering value)?  rendering,TResult Function( TripExportSuccess value)?  success,TResult Function( TripExportFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TripExportIdle() when idle != null:
return idle(_that);case TripExportLoading() when loading != null:
return loading(_that);case TripExportRendering() when rendering != null:
return rendering(_that);case TripExportSuccess() when success != null:
return success(_that);case TripExportFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TripExportIdle value)  idle,required TResult Function( TripExportLoading value)  loading,required TResult Function( TripExportRendering value)  rendering,required TResult Function( TripExportSuccess value)  success,required TResult Function( TripExportFailed value)  failed,}){
final _that = this;
switch (_that) {
case TripExportIdle():
return idle(_that);case TripExportLoading():
return loading(_that);case TripExportRendering():
return rendering(_that);case TripExportSuccess():
return success(_that);case TripExportFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TripExportIdle value)?  idle,TResult? Function( TripExportLoading value)?  loading,TResult? Function( TripExportRendering value)?  rendering,TResult? Function( TripExportSuccess value)?  success,TResult? Function( TripExportFailed value)?  failed,}){
final _that = this;
switch (_that) {
case TripExportIdle() when idle != null:
return idle(_that);case TripExportLoading() when loading != null:
return loading(_that);case TripExportRendering() when rendering != null:
return rendering(_that);case TripExportSuccess() when success != null:
return success(_that);case TripExportFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function()?  rendering,TResult Function()?  success,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TripExportIdle() when idle != null:
return idle();case TripExportLoading() when loading != null:
return loading();case TripExportRendering() when rendering != null:
return rendering();case TripExportSuccess() when success != null:
return success();case TripExportFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function()  rendering,required TResult Function()  success,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case TripExportIdle():
return idle();case TripExportLoading():
return loading();case TripExportRendering():
return rendering();case TripExportSuccess():
return success();case TripExportFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function()?  rendering,TResult? Function()?  success,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case TripExportIdle() when idle != null:
return idle();case TripExportLoading() when loading != null:
return loading();case TripExportRendering() when rendering != null:
return rendering();case TripExportSuccess() when success != null:
return success();case TripExportFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class TripExportIdle with DiagnosticableTreeMixin implements TripExportState {
   TripExportIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState.idle()';
}


}




/// @nodoc


class TripExportLoading with DiagnosticableTreeMixin implements TripExportState {
   TripExportLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState.loading()';
}


}




/// @nodoc


class TripExportRendering with DiagnosticableTreeMixin implements TripExportState {
   TripExportRendering();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState.rendering'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportRendering);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState.rendering()';
}


}




/// @nodoc


class TripExportSuccess with DiagnosticableTreeMixin implements TripExportState {
   TripExportSuccess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState.success()';
}


}




/// @nodoc


class TripExportFailed with DiagnosticableTreeMixin implements TripExportState {
   TripExportFailed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripExportState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripExportFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripExportState.failed()';
}


}




/// @nodoc
mixin _$TripOptionsState implements DiagnosticableTreeMixin {

 List<TripCategory> get categories; List<TripStep> get steps; List<Currency> get currencies; List<TripRegulation> get regulations;
/// Create a copy of TripOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripOptionsStateCopyWith<TripOptionsState> get copyWith => _$TripOptionsStateCopyWithImpl<TripOptionsState>(this as TripOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripOptionsState'))
    ..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('currencies', currencies))..add(DiagnosticsProperty('regulations', regulations));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripOptionsState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.currencies, currencies)&&const DeepCollectionEquality().equals(other.regulations, regulations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(currencies),const DeepCollectionEquality().hash(regulations));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripOptionsState(categories: $categories, steps: $steps, currencies: $currencies, regulations: $regulations)';
}


}

/// @nodoc
abstract mixin class $TripOptionsStateCopyWith<$Res>  {
  factory $TripOptionsStateCopyWith(TripOptionsState value, $Res Function(TripOptionsState) _then) = _$TripOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<TripCategory> categories, List<TripStep> steps, List<Currency> currencies, List<TripRegulation> regulations
});




}
/// @nodoc
class _$TripOptionsStateCopyWithImpl<$Res>
    implements $TripOptionsStateCopyWith<$Res> {
  _$TripOptionsStateCopyWithImpl(this._self, this._then);

  final TripOptionsState _self;
  final $Res Function(TripOptionsState) _then;

/// Create a copy of TripOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? steps = null,Object? currencies = null,Object? regulations = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<TripCategory>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<TripStep>,currencies: null == currencies ? _self.currencies : currencies // ignore: cast_nullable_to_non_nullable
as List<Currency>,regulations: null == regulations ? _self.regulations : regulations // ignore: cast_nullable_to_non_nullable
as List<TripRegulation>,
  ));
}

}


/// Adds pattern-matching-related methods to [TripOptionsState].
extension TripOptionsStatePatterns on TripOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _TripOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _TripOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TripCategory> categories,  List<TripStep> steps,  List<Currency> currencies,  List<TripRegulation> regulations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripOptionsState() when $default != null:
return $default(_that.categories,_that.steps,_that.currencies,_that.regulations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TripCategory> categories,  List<TripStep> steps,  List<Currency> currencies,  List<TripRegulation> regulations)  $default,) {final _that = this;
switch (_that) {
case _TripOptionsState():
return $default(_that.categories,_that.steps,_that.currencies,_that.regulations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TripCategory> categories,  List<TripStep> steps,  List<Currency> currencies,  List<TripRegulation> regulations)?  $default,) {final _that = this;
switch (_that) {
case _TripOptionsState() when $default != null:
return $default(_that.categories,_that.steps,_that.currencies,_that.regulations);case _:
  return null;

}
}

}

/// @nodoc


class _TripOptionsState with DiagnosticableTreeMixin implements TripOptionsState {
   _TripOptionsState({final  List<TripCategory> categories = const [], final  List<TripStep> steps = const [], final  List<Currency> currencies = const [], final  List<TripRegulation> regulations = const []}): _categories = categories,_steps = steps,_currencies = currencies,_regulations = regulations;
  

 final  List<TripCategory> _categories;
@override@JsonKey() List<TripCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<TripStep> _steps;
@override@JsonKey() List<TripStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  List<Currency> _currencies;
@override@JsonKey() List<Currency> get currencies {
  if (_currencies is EqualUnmodifiableListView) return _currencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currencies);
}

 final  List<TripRegulation> _regulations;
@override@JsonKey() List<TripRegulation> get regulations {
  if (_regulations is EqualUnmodifiableListView) return _regulations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regulations);
}


/// Create a copy of TripOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripOptionsStateCopyWith<_TripOptionsState> get copyWith => __$TripOptionsStateCopyWithImpl<_TripOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripOptionsState'))
    ..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('currencies', currencies))..add(DiagnosticsProperty('regulations', regulations));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripOptionsState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._currencies, _currencies)&&const DeepCollectionEquality().equals(other._regulations, _regulations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_currencies),const DeepCollectionEquality().hash(_regulations));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripOptionsState(categories: $categories, steps: $steps, currencies: $currencies, regulations: $regulations)';
}


}

/// @nodoc
abstract mixin class _$TripOptionsStateCopyWith<$Res> implements $TripOptionsStateCopyWith<$Res> {
  factory _$TripOptionsStateCopyWith(_TripOptionsState value, $Res Function(_TripOptionsState) _then) = __$TripOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TripCategory> categories, List<TripStep> steps, List<Currency> currencies, List<TripRegulation> regulations
});




}
/// @nodoc
class __$TripOptionsStateCopyWithImpl<$Res>
    implements _$TripOptionsStateCopyWith<$Res> {
  __$TripOptionsStateCopyWithImpl(this._self, this._then);

  final _TripOptionsState _self;
  final $Res Function(_TripOptionsState) _then;

/// Create a copy of TripOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? steps = null,Object? currencies = null,Object? regulations = null,}) {
  return _then(_TripOptionsState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<TripCategory>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<TripStep>,currencies: null == currencies ? _self._currencies : currencies // ignore: cast_nullable_to_non_nullable
as List<Currency>,regulations: null == regulations ? _self._regulations : regulations // ignore: cast_nullable_to_non_nullable
as List<TripRegulation>,
  ));
}


}

/// @nodoc
mixin _$TripStepState implements DiagnosticableTreeMixin {

 int get currentIndex;
/// Create a copy of TripStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripStepStateCopyWith<TripStepState> get copyWith => _$TripStepStateCopyWithImpl<TripStepState>(this as TripStepState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripStepState'))
    ..add(DiagnosticsProperty('currentIndex', currentIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripStepState&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripStepState(currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $TripStepStateCopyWith<$Res>  {
  factory $TripStepStateCopyWith(TripStepState value, $Res Function(TripStepState) _then) = _$TripStepStateCopyWithImpl;
@useResult
$Res call({
 int currentIndex
});




}
/// @nodoc
class _$TripStepStateCopyWithImpl<$Res>
    implements $TripStepStateCopyWith<$Res> {
  _$TripStepStateCopyWithImpl(this._self, this._then);

  final TripStepState _self;
  final $Res Function(TripStepState) _then;

/// Create a copy of TripStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentIndex = null,}) {
  return _then(_self.copyWith(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripStepState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripStepState value)  $default,){
final _that = this;
switch (_that) {
case _TripStepState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripStepState value)?  $default,){
final _that = this;
switch (_that) {
case _TripStepState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripStepState() when $default != null:
return $default(_that.currentIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentIndex)  $default,) {final _that = this;
switch (_that) {
case _TripStepState():
return $default(_that.currentIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentIndex)?  $default,) {final _that = this;
switch (_that) {
case _TripStepState() when $default != null:
return $default(_that.currentIndex);case _:
  return null;

}
}

}

/// @nodoc


class _TripStepState with DiagnosticableTreeMixin implements TripStepState {
   _TripStepState({this.currentIndex = 0});
  

@override@JsonKey() final  int currentIndex;

/// Create a copy of TripStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripStepStateCopyWith<_TripStepState> get copyWith => __$TripStepStateCopyWithImpl<_TripStepState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TripStepState'))
    ..add(DiagnosticsProperty('currentIndex', currentIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripStepState&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TripStepState(currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$TripStepStateCopyWith<$Res> implements $TripStepStateCopyWith<$Res> {
  factory _$TripStepStateCopyWith(_TripStepState value, $Res Function(_TripStepState) _then) = __$TripStepStateCopyWithImpl;
@override @useResult
$Res call({
 int currentIndex
});




}
/// @nodoc
class __$TripStepStateCopyWithImpl<$Res>
    implements _$TripStepStateCopyWith<$Res> {
  __$TripStepStateCopyWithImpl(this._self, this._then);

  final _TripStepState _self;
  final $Res Function(_TripStepState) _then;

/// Create a copy of TripStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentIndex = null,}) {
  return _then(_TripStepState(
currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$UserFilterState implements DiagnosticableTreeMixin {

 String? get search; List<int>? get departments; int? get positionId;
/// Create a copy of UserFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFilterStateCopyWith<UserFilterState> get copyWith => _$UserFilterStateCopyWithImpl<UserFilterState>(this as UserFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserFilterState'))
    ..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('departments', departments))..add(DiagnosticsProperty('positionId', positionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFilterState&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.departments, departments)&&(identical(other.positionId, positionId) || other.positionId == positionId));
}


@override
int get hashCode => Object.hash(runtimeType,search,const DeepCollectionEquality().hash(departments),positionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserFilterState(search: $search, departments: $departments, positionId: $positionId)';
}


}

/// @nodoc
abstract mixin class $UserFilterStateCopyWith<$Res>  {
  factory $UserFilterStateCopyWith(UserFilterState value, $Res Function(UserFilterState) _then) = _$UserFilterStateCopyWithImpl;
@useResult
$Res call({
 String? search, List<int>? departments, int? positionId
});




}
/// @nodoc
class _$UserFilterStateCopyWithImpl<$Res>
    implements $UserFilterStateCopyWith<$Res> {
  _$UserFilterStateCopyWithImpl(this._self, this._then);

  final UserFilterState _self;
  final $Res Function(UserFilterState) _then;

/// Create a copy of UserFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = freezed,Object? departments = freezed,Object? positionId = freezed,}) {
  return _then(_self.copyWith(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,departments: freezed == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<int>?,positionId: freezed == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFilterState value)  $default,){
final _that = this;
switch (_that) {
case _UserFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _UserFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? search,  List<int>? departments,  int? positionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFilterState() when $default != null:
return $default(_that.search,_that.departments,_that.positionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? search,  List<int>? departments,  int? positionId)  $default,) {final _that = this;
switch (_that) {
case _UserFilterState():
return $default(_that.search,_that.departments,_that.positionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? search,  List<int>? departments,  int? positionId)?  $default,) {final _that = this;
switch (_that) {
case _UserFilterState() when $default != null:
return $default(_that.search,_that.departments,_that.positionId);case _:
  return null;

}
}

}

/// @nodoc


class _UserFilterState with DiagnosticableTreeMixin implements UserFilterState {
   _UserFilterState({this.search, final  List<int>? departments, this.positionId}): _departments = departments;
  

@override final  String? search;
 final  List<int>? _departments;
@override List<int>? get departments {
  final value = _departments;
  if (value == null) return null;
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? positionId;

/// Create a copy of UserFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFilterStateCopyWith<_UserFilterState> get copyWith => __$UserFilterStateCopyWithImpl<_UserFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserFilterState'))
    ..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('departments', departments))..add(DiagnosticsProperty('positionId', positionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFilterState&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._departments, _departments)&&(identical(other.positionId, positionId) || other.positionId == positionId));
}


@override
int get hashCode => Object.hash(runtimeType,search,const DeepCollectionEquality().hash(_departments),positionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserFilterState(search: $search, departments: $departments, positionId: $positionId)';
}


}

/// @nodoc
abstract mixin class _$UserFilterStateCopyWith<$Res> implements $UserFilterStateCopyWith<$Res> {
  factory _$UserFilterStateCopyWith(_UserFilterState value, $Res Function(_UserFilterState) _then) = __$UserFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? search, List<int>? departments, int? positionId
});




}
/// @nodoc
class __$UserFilterStateCopyWithImpl<$Res>
    implements _$UserFilterStateCopyWith<$Res> {
  __$UserFilterStateCopyWithImpl(this._self, this._then);

  final _UserFilterState _self;
  final $Res Function(_UserFilterState) _then;

/// Create a copy of UserFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = freezed,Object? departments = freezed,Object? positionId = freezed,}) {
  return _then(_UserFilterState(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,departments: freezed == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<int>?,positionId: freezed == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$UserFormState implements DiagnosticableTreeMixin {

 bool get isAdmin; bool get isAuthorized; int? get positionId; int? get departmentId;
/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFormStateCopyWith<UserFormState> get copyWith => _$UserFormStateCopyWithImpl<UserFormState>(this as UserFormState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserFormState'))
    ..add(DiagnosticsProperty('isAdmin', isAdmin))..add(DiagnosticsProperty('isAuthorized', isAuthorized))..add(DiagnosticsProperty('positionId', positionId))..add(DiagnosticsProperty('departmentId', departmentId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFormState&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}


@override
int get hashCode => Object.hash(runtimeType,isAdmin,isAuthorized,positionId,departmentId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserFormState(isAdmin: $isAdmin, isAuthorized: $isAuthorized, positionId: $positionId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $UserFormStateCopyWith<$Res>  {
  factory $UserFormStateCopyWith(UserFormState value, $Res Function(UserFormState) _then) = _$UserFormStateCopyWithImpl;
@useResult
$Res call({
 bool isAdmin, bool isAuthorized, int? positionId, int? departmentId
});




}
/// @nodoc
class _$UserFormStateCopyWithImpl<$Res>
    implements $UserFormStateCopyWith<$Res> {
  _$UserFormStateCopyWithImpl(this._self, this._then);

  final UserFormState _self;
  final $Res Function(UserFormState) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAdmin = null,Object? isAuthorized = null,Object? positionId = freezed,Object? departmentId = freezed,}) {
  return _then(_self.copyWith(
isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,positionId: freezed == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as int?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFormState].
extension UserFormStatePatterns on UserFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFormState value)  $default,){
final _that = this;
switch (_that) {
case _UserFormState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFormState value)?  $default,){
final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAdmin,  bool isAuthorized,  int? positionId,  int? departmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that.isAdmin,_that.isAuthorized,_that.positionId,_that.departmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAdmin,  bool isAuthorized,  int? positionId,  int? departmentId)  $default,) {final _that = this;
switch (_that) {
case _UserFormState():
return $default(_that.isAdmin,_that.isAuthorized,_that.positionId,_that.departmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAdmin,  bool isAuthorized,  int? positionId,  int? departmentId)?  $default,) {final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that.isAdmin,_that.isAuthorized,_that.positionId,_that.departmentId);case _:
  return null;

}
}

}

/// @nodoc


class _UserFormState with DiagnosticableTreeMixin implements UserFormState {
   _UserFormState({this.isAdmin = false, this.isAuthorized = false, this.positionId, this.departmentId});
  

@override@JsonKey() final  bool isAdmin;
@override@JsonKey() final  bool isAuthorized;
@override final  int? positionId;
@override final  int? departmentId;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFormStateCopyWith<_UserFormState> get copyWith => __$UserFormStateCopyWithImpl<_UserFormState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserFormState'))
    ..add(DiagnosticsProperty('isAdmin', isAdmin))..add(DiagnosticsProperty('isAuthorized', isAuthorized))..add(DiagnosticsProperty('positionId', positionId))..add(DiagnosticsProperty('departmentId', departmentId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFormState&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}


@override
int get hashCode => Object.hash(runtimeType,isAdmin,isAuthorized,positionId,departmentId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserFormState(isAdmin: $isAdmin, isAuthorized: $isAuthorized, positionId: $positionId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class _$UserFormStateCopyWith<$Res> implements $UserFormStateCopyWith<$Res> {
  factory _$UserFormStateCopyWith(_UserFormState value, $Res Function(_UserFormState) _then) = __$UserFormStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAdmin, bool isAuthorized, int? positionId, int? departmentId
});




}
/// @nodoc
class __$UserFormStateCopyWithImpl<$Res>
    implements _$UserFormStateCopyWith<$Res> {
  __$UserFormStateCopyWithImpl(this._self, this._then);

  final _UserFormState _self;
  final $Res Function(_UserFormState) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAdmin = null,Object? isAuthorized = null,Object? positionId = freezed,Object? departmentId = freezed,}) {
  return _then(_UserFormState(
isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,positionId: freezed == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as int?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$UserListState implements DiagnosticableTreeMixin {

 List<User> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListStateCopyWith<UserListState> get copyWith => _$UserListStateCopyWithImpl<UserListState>(this as UserListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $UserListStateCopyWith<$Res>  {
  factory $UserListStateCopyWith(UserListState value, $Res Function(UserListState) _then) = _$UserListStateCopyWithImpl;
@useResult
$Res call({
 List<User> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$UserListStateCopyWithImpl<$Res>
    implements $UserListStateCopyWith<$Res> {
  _$UserListStateCopyWithImpl(this._self, this._then);

  final UserListState _self;
  final $Res Function(UserListState) _then;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<User>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListState value)  $default,){
final _that = this;
switch (_that) {
case _UserListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListState value)?  $default,){
final _that = this;
switch (_that) {
case _UserListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<User> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<User> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _UserListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<User> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _UserListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _UserListState with DiagnosticableTreeMixin implements UserListState {
   _UserListState({final  List<User> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<User> _items;
@override@JsonKey() List<User> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListStateCopyWith<_UserListState> get copyWith => __$UserListStateCopyWithImpl<_UserListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$UserListStateCopyWith<$Res> implements $UserListStateCopyWith<$Res> {
  factory _$UserListStateCopyWith(_UserListState value, $Res Function(_UserListState) _then) = __$UserListStateCopyWithImpl;
@override @useResult
$Res call({
 List<User> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$UserListStateCopyWithImpl<$Res>
    implements _$UserListStateCopyWith<$Res> {
  __$UserListStateCopyWithImpl(this._self, this._then);

  final _UserListState _self;
  final $Res Function(_UserListState) _then;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_UserListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<User>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$UserOptionsState implements DiagnosticableTreeMixin {

 List<UserDepartmentGroup> get departmentGroups; List<UserDepartment> get departmentItems; List<UserRank> get rankItems; List<UserPosition> get positionItems;
/// Create a copy of UserOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserOptionsStateCopyWith<UserOptionsState> get copyWith => _$UserOptionsStateCopyWithImpl<UserOptionsState>(this as UserOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserOptionsState'))
    ..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems))..add(DiagnosticsProperty('rankItems', rankItems))..add(DiagnosticsProperty('positionItems', positionItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOptionsState&&const DeepCollectionEquality().equals(other.departmentGroups, departmentGroups)&&const DeepCollectionEquality().equals(other.departmentItems, departmentItems)&&const DeepCollectionEquality().equals(other.rankItems, rankItems)&&const DeepCollectionEquality().equals(other.positionItems, positionItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(departmentGroups),const DeepCollectionEquality().hash(departmentItems),const DeepCollectionEquality().hash(rankItems),const DeepCollectionEquality().hash(positionItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserOptionsState(departmentGroups: $departmentGroups, departmentItems: $departmentItems, rankItems: $rankItems, positionItems: $positionItems)';
}


}

/// @nodoc
abstract mixin class $UserOptionsStateCopyWith<$Res>  {
  factory $UserOptionsStateCopyWith(UserOptionsState value, $Res Function(UserOptionsState) _then) = _$UserOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems, List<UserRank> rankItems, List<UserPosition> positionItems
});




}
/// @nodoc
class _$UserOptionsStateCopyWithImpl<$Res>
    implements $UserOptionsStateCopyWith<$Res> {
  _$UserOptionsStateCopyWithImpl(this._self, this._then);

  final UserOptionsState _self;
  final $Res Function(UserOptionsState) _then;

/// Create a copy of UserOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departmentGroups = null,Object? departmentItems = null,Object? rankItems = null,Object? positionItems = null,}) {
  return _then(_self.copyWith(
departmentGroups: null == departmentGroups ? _self.departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self.departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,rankItems: null == rankItems ? _self.rankItems : rankItems // ignore: cast_nullable_to_non_nullable
as List<UserRank>,positionItems: null == positionItems ? _self.positionItems : positionItems // ignore: cast_nullable_to_non_nullable
as List<UserPosition>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserOptionsState].
extension UserOptionsStatePatterns on UserOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _UserOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _UserOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<UserRank> rankItems,  List<UserPosition> positionItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserOptionsState() when $default != null:
return $default(_that.departmentGroups,_that.departmentItems,_that.rankItems,_that.positionItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<UserRank> rankItems,  List<UserPosition> positionItems)  $default,) {final _that = this;
switch (_that) {
case _UserOptionsState():
return $default(_that.departmentGroups,_that.departmentItems,_that.rankItems,_that.positionItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserDepartmentGroup> departmentGroups,  List<UserDepartment> departmentItems,  List<UserRank> rankItems,  List<UserPosition> positionItems)?  $default,) {final _that = this;
switch (_that) {
case _UserOptionsState() when $default != null:
return $default(_that.departmentGroups,_that.departmentItems,_that.rankItems,_that.positionItems);case _:
  return null;

}
}

}

/// @nodoc


class _UserOptionsState with DiagnosticableTreeMixin implements UserOptionsState {
   _UserOptionsState({final  List<UserDepartmentGroup> departmentGroups = const [], final  List<UserDepartment> departmentItems = const [], final  List<UserRank> rankItems = const [], final  List<UserPosition> positionItems = const []}): _departmentGroups = departmentGroups,_departmentItems = departmentItems,_rankItems = rankItems,_positionItems = positionItems;
  

 final  List<UserDepartmentGroup> _departmentGroups;
@override@JsonKey() List<UserDepartmentGroup> get departmentGroups {
  if (_departmentGroups is EqualUnmodifiableListView) return _departmentGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentGroups);
}

 final  List<UserDepartment> _departmentItems;
@override@JsonKey() List<UserDepartment> get departmentItems {
  if (_departmentItems is EqualUnmodifiableListView) return _departmentItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentItems);
}

 final  List<UserRank> _rankItems;
@override@JsonKey() List<UserRank> get rankItems {
  if (_rankItems is EqualUnmodifiableListView) return _rankItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rankItems);
}

 final  List<UserPosition> _positionItems;
@override@JsonKey() List<UserPosition> get positionItems {
  if (_positionItems is EqualUnmodifiableListView) return _positionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_positionItems);
}


/// Create a copy of UserOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserOptionsStateCopyWith<_UserOptionsState> get copyWith => __$UserOptionsStateCopyWithImpl<_UserOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserOptionsState'))
    ..add(DiagnosticsProperty('departmentGroups', departmentGroups))..add(DiagnosticsProperty('departmentItems', departmentItems))..add(DiagnosticsProperty('rankItems', rankItems))..add(DiagnosticsProperty('positionItems', positionItems));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserOptionsState&&const DeepCollectionEquality().equals(other._departmentGroups, _departmentGroups)&&const DeepCollectionEquality().equals(other._departmentItems, _departmentItems)&&const DeepCollectionEquality().equals(other._rankItems, _rankItems)&&const DeepCollectionEquality().equals(other._positionItems, _positionItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_departmentGroups),const DeepCollectionEquality().hash(_departmentItems),const DeepCollectionEquality().hash(_rankItems),const DeepCollectionEquality().hash(_positionItems));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserOptionsState(departmentGroups: $departmentGroups, departmentItems: $departmentItems, rankItems: $rankItems, positionItems: $positionItems)';
}


}

/// @nodoc
abstract mixin class _$UserOptionsStateCopyWith<$Res> implements $UserOptionsStateCopyWith<$Res> {
  factory _$UserOptionsStateCopyWith(_UserOptionsState value, $Res Function(_UserOptionsState) _then) = __$UserOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserDepartmentGroup> departmentGroups, List<UserDepartment> departmentItems, List<UserRank> rankItems, List<UserPosition> positionItems
});




}
/// @nodoc
class __$UserOptionsStateCopyWithImpl<$Res>
    implements _$UserOptionsStateCopyWith<$Res> {
  __$UserOptionsStateCopyWithImpl(this._self, this._then);

  final _UserOptionsState _self;
  final $Res Function(_UserOptionsState) _then;

/// Create a copy of UserOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departmentGroups = null,Object? departmentItems = null,Object? rankItems = null,Object? positionItems = null,}) {
  return _then(_UserOptionsState(
departmentGroups: null == departmentGroups ? _self._departmentGroups : departmentGroups // ignore: cast_nullable_to_non_nullable
as List<UserDepartmentGroup>,departmentItems: null == departmentItems ? _self._departmentItems : departmentItems // ignore: cast_nullable_to_non_nullable
as List<UserDepartment>,rankItems: null == rankItems ? _self._rankItems : rankItems // ignore: cast_nullable_to_non_nullable
as List<UserRank>,positionItems: null == positionItems ? _self._positionItems : positionItems // ignore: cast_nullable_to_non_nullable
as List<UserPosition>,
  ));
}


}

/// @nodoc
mixin _$UserSubmitState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState()';
}


}

/// @nodoc
class $UserSubmitStateCopyWith<$Res>  {
$UserSubmitStateCopyWith(UserSubmitState _, $Res Function(UserSubmitState) __);
}


/// Adds pattern-matching-related methods to [UserSubmitState].
extension UserSubmitStatePatterns on UserSubmitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserSubmitIdle value)?  idle,TResult Function( UserSubmitPending value)?  pending,TResult Function( UserSubmitUpdated value)?  updated,TResult Function( UserSubmitDeleted value)?  deleted,TResult Function( UserSubmitFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserSubmitIdle() when idle != null:
return idle(_that);case UserSubmitPending() when pending != null:
return pending(_that);case UserSubmitUpdated() when updated != null:
return updated(_that);case UserSubmitDeleted() when deleted != null:
return deleted(_that);case UserSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserSubmitIdle value)  idle,required TResult Function( UserSubmitPending value)  pending,required TResult Function( UserSubmitUpdated value)  updated,required TResult Function( UserSubmitDeleted value)  deleted,required TResult Function( UserSubmitFailure value)  failure,}){
final _that = this;
switch (_that) {
case UserSubmitIdle():
return idle(_that);case UserSubmitPending():
return pending(_that);case UserSubmitUpdated():
return updated(_that);case UserSubmitDeleted():
return deleted(_that);case UserSubmitFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserSubmitIdle value)?  idle,TResult? Function( UserSubmitPending value)?  pending,TResult? Function( UserSubmitUpdated value)?  updated,TResult? Function( UserSubmitDeleted value)?  deleted,TResult? Function( UserSubmitFailure value)?  failure,}){
final _that = this;
switch (_that) {
case UserSubmitIdle() when idle != null:
return idle(_that);case UserSubmitPending() when pending != null:
return pending(_that);case UserSubmitUpdated() when updated != null:
return updated(_that);case UserSubmitDeleted() when deleted != null:
return deleted(_that);case UserSubmitFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  pending,TResult Function( User user)?  updated,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserSubmitIdle() when idle != null:
return idle();case UserSubmitPending() when pending != null:
return pending();case UserSubmitUpdated() when updated != null:
return updated(_that.user);case UserSubmitDeleted() when deleted != null:
return deleted();case UserSubmitFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  pending,required TResult Function( User user)  updated,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case UserSubmitIdle():
return idle();case UserSubmitPending():
return pending();case UserSubmitUpdated():
return updated(_that.user);case UserSubmitDeleted():
return deleted();case UserSubmitFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  pending,TResult? Function( User user)?  updated,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case UserSubmitIdle() when idle != null:
return idle();case UserSubmitPending() when pending != null:
return pending();case UserSubmitUpdated() when updated != null:
return updated(_that.user);case UserSubmitDeleted() when deleted != null:
return deleted();case UserSubmitFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UserSubmitIdle with DiagnosticableTreeMixin implements UserSubmitState {
   UserSubmitIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState.idle()';
}


}




/// @nodoc


class UserSubmitPending with DiagnosticableTreeMixin implements UserSubmitState {
   UserSubmitPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState.pending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState.pending()';
}


}




/// @nodoc


class UserSubmitUpdated with DiagnosticableTreeMixin implements UserSubmitState {
   UserSubmitUpdated(this.user);
  

 final  User user;

/// Create a copy of UserSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubmitUpdatedCopyWith<UserSubmitUpdated> get copyWith => _$UserSubmitUpdatedCopyWithImpl<UserSubmitUpdated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState.updated'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitUpdated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState.updated(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserSubmitUpdatedCopyWith<$Res> implements $UserSubmitStateCopyWith<$Res> {
  factory $UserSubmitUpdatedCopyWith(UserSubmitUpdated value, $Res Function(UserSubmitUpdated) _then) = _$UserSubmitUpdatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserSubmitUpdatedCopyWithImpl<$Res>
    implements $UserSubmitUpdatedCopyWith<$Res> {
  _$UserSubmitUpdatedCopyWithImpl(this._self, this._then);

  final UserSubmitUpdated _self;
  final $Res Function(UserSubmitUpdated) _then;

/// Create a copy of UserSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserSubmitUpdated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserSubmitState
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


class UserSubmitDeleted with DiagnosticableTreeMixin implements UserSubmitState {
   UserSubmitDeleted();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState.deleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState.deleted()';
}


}




/// @nodoc


class UserSubmitFailure with DiagnosticableTreeMixin implements UserSubmitState {
   UserSubmitFailure(this.message);
  

 final  String message;

/// Create a copy of UserSubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubmitFailureCopyWith<UserSubmitFailure> get copyWith => _$UserSubmitFailureCopyWithImpl<UserSubmitFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserSubmitState.failure'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubmitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserSubmitState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserSubmitFailureCopyWith<$Res> implements $UserSubmitStateCopyWith<$Res> {
  factory $UserSubmitFailureCopyWith(UserSubmitFailure value, $Res Function(UserSubmitFailure) _then) = _$UserSubmitFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserSubmitFailureCopyWithImpl<$Res>
    implements $UserSubmitFailureCopyWith<$Res> {
  _$UserSubmitFailureCopyWithImpl(this._self, this._then);

  final UserSubmitFailure _self;
  final $Res Function(UserSubmitFailure) _then;

/// Create a copy of UserSubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserSubmitFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
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
$WorkFilterStateCopyWith<WorkFilterState> get copyWith => _$WorkFilterStateCopyWithImpl<WorkFilterState>(this as WorkFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class $WorkFilterStateCopyWith<$Res>  {
  factory $WorkFilterStateCopyWith(WorkFilterState value, $Res Function(WorkFilterState) _then) = _$WorkFilterStateCopyWithImpl;
@useResult
$Res call({
 String? view
});




}
/// @nodoc
class _$WorkFilterStateCopyWithImpl<$Res>
    implements $WorkFilterStateCopyWith<$Res> {
  _$WorkFilterStateCopyWithImpl(this._self, this._then);

  final WorkFilterState _self;
  final $Res Function(WorkFilterState) _then;

/// Create a copy of WorkFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? view = freezed,}) {
  return _then(_self.copyWith(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkFilterState value)  $default,){
final _that = this;
switch (_that) {
case _WorkFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkFilterState() when $default != null:
return $default(_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? view)  $default,) {final _that = this;
switch (_that) {
case _WorkFilterState():
return $default(_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? view)?  $default,) {final _that = this;
switch (_that) {
case _WorkFilterState() when $default != null:
return $default(_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _WorkFilterState with DiagnosticableTreeMixin implements WorkFilterState {
   _WorkFilterState({this.view});
  

@override final  String? view;

/// Create a copy of WorkFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkFilterStateCopyWith<_WorkFilterState> get copyWith => __$WorkFilterStateCopyWithImpl<_WorkFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkFilterState'))
    ..add(DiagnosticsProperty('view', view));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkFilterState&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,view);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkFilterState(view: $view)';
}


}

/// @nodoc
abstract mixin class _$WorkFilterStateCopyWith<$Res> implements $WorkFilterStateCopyWith<$Res> {
  factory _$WorkFilterStateCopyWith(_WorkFilterState value, $Res Function(_WorkFilterState) _then) = __$WorkFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? view
});




}
/// @nodoc
class __$WorkFilterStateCopyWithImpl<$Res>
    implements _$WorkFilterStateCopyWith<$Res> {
  __$WorkFilterStateCopyWithImpl(this._self, this._then);

  final _WorkFilterState _self;
  final $Res Function(_WorkFilterState) _then;

/// Create a copy of WorkFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? view = freezed,}) {
  return _then(_WorkFilterState(
view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$WorkIssueFilterState implements DiagnosticableTreeMixin {

 WorkIssueSortOption? get sort; SortDirection? get order; String? get search; List<int>? get clients; List<int>? get categories;
/// Create a copy of WorkIssueFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkIssueFilterStateCopyWith<WorkIssueFilterState> get copyWith => _$WorkIssueFilterStateCopyWithImpl<WorkIssueFilterState>(this as WorkIssueFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkIssueFilterState'))
    ..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkIssueFilterState&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,sort,order,search,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkIssueFilterState(sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $WorkIssueFilterStateCopyWith<$Res>  {
  factory $WorkIssueFilterStateCopyWith(WorkIssueFilterState value, $Res Function(WorkIssueFilterState) _then) = _$WorkIssueFilterStateCopyWithImpl;
@useResult
$Res call({
 WorkIssueSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class _$WorkIssueFilterStateCopyWithImpl<$Res>
    implements $WorkIssueFilterStateCopyWith<$Res> {
  _$WorkIssueFilterStateCopyWithImpl(this._self, this._then);

  final WorkIssueFilterState _self;
  final $Res Function(WorkIssueFilterState) _then;

/// Create a copy of WorkIssueFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_self.copyWith(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkIssueSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkIssueFilterState].
extension WorkIssueFilterStatePatterns on WorkIssueFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkIssueFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkIssueFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkIssueFilterState value)  $default,){
final _that = this;
switch (_that) {
case _WorkIssueFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkIssueFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkIssueFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkIssueSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkIssueFilterState() when $default != null:
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkIssueSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)  $default,) {final _that = this;
switch (_that) {
case _WorkIssueFilterState():
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkIssueSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)?  $default,) {final _that = this;
switch (_that) {
case _WorkIssueFilterState() when $default != null:
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _WorkIssueFilterState with DiagnosticableTreeMixin implements WorkIssueFilterState {
   _WorkIssueFilterState({this.sort, this.order, this.search, final  List<int>? clients, final  List<int>? categories}): _clients = clients,_categories = categories;
  

@override final  WorkIssueSortOption? sort;
@override final  SortDirection? order;
@override final  String? search;
 final  List<int>? _clients;
@override List<int>? get clients {
  final value = _clients;
  if (value == null) return null;
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _categories;
@override List<int>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WorkIssueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkIssueFilterStateCopyWith<_WorkIssueFilterState> get copyWith => __$WorkIssueFilterStateCopyWithImpl<_WorkIssueFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkIssueFilterState'))
    ..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkIssueFilterState&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,sort,order,search,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkIssueFilterState(sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$WorkIssueFilterStateCopyWith<$Res> implements $WorkIssueFilterStateCopyWith<$Res> {
  factory _$WorkIssueFilterStateCopyWith(_WorkIssueFilterState value, $Res Function(_WorkIssueFilterState) _then) = __$WorkIssueFilterStateCopyWithImpl;
@override @useResult
$Res call({
 WorkIssueSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class __$WorkIssueFilterStateCopyWithImpl<$Res>
    implements _$WorkIssueFilterStateCopyWith<$Res> {
  __$WorkIssueFilterStateCopyWithImpl(this._self, this._then);

  final _WorkIssueFilterState _self;
  final $Res Function(_WorkIssueFilterState) _then;

/// Create a copy of WorkIssueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_WorkIssueFilterState(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkIssueSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc
mixin _$WorkIssueListState implements DiagnosticableTreeMixin {

 List<WorkIssueListItem> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of WorkIssueListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkIssueListStateCopyWith<WorkIssueListState> get copyWith => _$WorkIssueListStateCopyWithImpl<WorkIssueListState>(this as WorkIssueListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkIssueListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkIssueListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkIssueListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $WorkIssueListStateCopyWith<$Res>  {
  factory $WorkIssueListStateCopyWith(WorkIssueListState value, $Res Function(WorkIssueListState) _then) = _$WorkIssueListStateCopyWithImpl;
@useResult
$Res call({
 List<WorkIssueListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$WorkIssueListStateCopyWithImpl<$Res>
    implements $WorkIssueListStateCopyWith<$Res> {
  _$WorkIssueListStateCopyWithImpl(this._self, this._then);

  final WorkIssueListState _self;
  final $Res Function(WorkIssueListState) _then;

/// Create a copy of WorkIssueListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WorkIssueListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkIssueListState].
extension WorkIssueListStatePatterns on WorkIssueListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkIssueListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkIssueListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkIssueListState value)  $default,){
final _that = this;
switch (_that) {
case _WorkIssueListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkIssueListState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkIssueListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkIssueListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkIssueListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkIssueListItem> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _WorkIssueListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkIssueListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _WorkIssueListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _WorkIssueListState with DiagnosticableTreeMixin implements WorkIssueListState {
   _WorkIssueListState({final  List<WorkIssueListItem> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<WorkIssueListItem> _items;
@override@JsonKey() List<WorkIssueListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of WorkIssueListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkIssueListStateCopyWith<_WorkIssueListState> get copyWith => __$WorkIssueListStateCopyWithImpl<_WorkIssueListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkIssueListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkIssueListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkIssueListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$WorkIssueListStateCopyWith<$Res> implements $WorkIssueListStateCopyWith<$Res> {
  factory _$WorkIssueListStateCopyWith(_WorkIssueListState value, $Res Function(_WorkIssueListState) _then) = __$WorkIssueListStateCopyWithImpl;
@override @useResult
$Res call({
 List<WorkIssueListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$WorkIssueListStateCopyWithImpl<$Res>
    implements _$WorkIssueListStateCopyWith<$Res> {
  __$WorkIssueListStateCopyWithImpl(this._self, this._then);

  final _WorkIssueListState _self;
  final $Res Function(_WorkIssueListState) _then;

/// Create a copy of WorkIssueListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_WorkIssueListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WorkIssueListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$WorkProjectFilterState implements DiagnosticableTreeMixin {

 ProjectStatusFilter get status; WorkProjectSortOption? get sort; SortDirection? get order; String? get search; List<int>? get clients; List<int>? get categories;
/// Create a copy of WorkProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkProjectFilterStateCopyWith<WorkProjectFilterState> get copyWith => _$WorkProjectFilterStateCopyWithImpl<WorkProjectFilterState>(this as WorkProjectFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkProjectFilterState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkProjectFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,status,sort,order,search,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkProjectFilterState(status: $status, sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $WorkProjectFilterStateCopyWith<$Res>  {
  factory $WorkProjectFilterStateCopyWith(WorkProjectFilterState value, $Res Function(WorkProjectFilterState) _then) = _$WorkProjectFilterStateCopyWithImpl;
@useResult
$Res call({
 ProjectStatusFilter status, WorkProjectSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class _$WorkProjectFilterStateCopyWithImpl<$Res>
    implements $WorkProjectFilterStateCopyWith<$Res> {
  _$WorkProjectFilterStateCopyWithImpl(this._self, this._then);

  final WorkProjectFilterState _self;
  final $Res Function(WorkProjectFilterState) _then;

/// Create a copy of WorkProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatusFilter,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkProjectSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkProjectFilterState].
extension WorkProjectFilterStatePatterns on WorkProjectFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkProjectFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkProjectFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkProjectFilterState value)  $default,){
final _that = this;
switch (_that) {
case _WorkProjectFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkProjectFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkProjectFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectStatusFilter status,  WorkProjectSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkProjectFilterState() when $default != null:
return $default(_that.status,_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectStatusFilter status,  WorkProjectSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)  $default,) {final _that = this;
switch (_that) {
case _WorkProjectFilterState():
return $default(_that.status,_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectStatusFilter status,  WorkProjectSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories)?  $default,) {final _that = this;
switch (_that) {
case _WorkProjectFilterState() when $default != null:
return $default(_that.status,_that.sort,_that.order,_that.search,_that.clients,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _WorkProjectFilterState with DiagnosticableTreeMixin implements WorkProjectFilterState {
   _WorkProjectFilterState({this.status = ProjectStatusFilter.all, this.sort, this.order, this.search, final  List<int>? clients, final  List<int>? categories}): _clients = clients,_categories = categories;
  

@override@JsonKey() final  ProjectStatusFilter status;
@override final  WorkProjectSortOption? sort;
@override final  SortDirection? order;
@override final  String? search;
 final  List<int>? _clients;
@override List<int>? get clients {
  final value = _clients;
  if (value == null) return null;
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _categories;
@override List<int>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WorkProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkProjectFilterStateCopyWith<_WorkProjectFilterState> get copyWith => __$WorkProjectFilterStateCopyWithImpl<_WorkProjectFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkProjectFilterState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkProjectFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,status,sort,order,search,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_categories));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkProjectFilterState(status: $status, sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$WorkProjectFilterStateCopyWith<$Res> implements $WorkProjectFilterStateCopyWith<$Res> {
  factory _$WorkProjectFilterStateCopyWith(_WorkProjectFilterState value, $Res Function(_WorkProjectFilterState) _then) = __$WorkProjectFilterStateCopyWithImpl;
@override @useResult
$Res call({
 ProjectStatusFilter status, WorkProjectSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories
});




}
/// @nodoc
class __$WorkProjectFilterStateCopyWithImpl<$Res>
    implements _$WorkProjectFilterStateCopyWith<$Res> {
  __$WorkProjectFilterStateCopyWithImpl(this._self, this._then);

  final _WorkProjectFilterState _self;
  final $Res Function(_WorkProjectFilterState) _then;

/// Create a copy of WorkProjectFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,}) {
  return _then(_WorkProjectFilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatusFilter,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkProjectSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc
mixin _$WorkProjectListState implements DiagnosticableTreeMixin {

 List<WorkProjectListItem> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of WorkProjectListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkProjectListStateCopyWith<WorkProjectListState> get copyWith => _$WorkProjectListStateCopyWithImpl<WorkProjectListState>(this as WorkProjectListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkProjectListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkProjectListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $WorkProjectListStateCopyWith<$Res>  {
  factory $WorkProjectListStateCopyWith(WorkProjectListState value, $Res Function(WorkProjectListState) _then) = _$WorkProjectListStateCopyWithImpl;
@useResult
$Res call({
 List<WorkProjectListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$WorkProjectListStateCopyWithImpl<$Res>
    implements $WorkProjectListStateCopyWith<$Res> {
  _$WorkProjectListStateCopyWithImpl(this._self, this._then);

  final WorkProjectListState _self;
  final $Res Function(WorkProjectListState) _then;

/// Create a copy of WorkProjectListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WorkProjectListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkProjectListState].
extension WorkProjectListStatePatterns on WorkProjectListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkProjectListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkProjectListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkProjectListState value)  $default,){
final _that = this;
switch (_that) {
case _WorkProjectListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkProjectListState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkProjectListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkProjectListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkProjectListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkProjectListItem> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _WorkProjectListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkProjectListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _WorkProjectListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _WorkProjectListState with DiagnosticableTreeMixin implements WorkProjectListState {
   _WorkProjectListState({final  List<WorkProjectListItem> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<WorkProjectListItem> _items;
@override@JsonKey() List<WorkProjectListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of WorkProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkProjectListStateCopyWith<_WorkProjectListState> get copyWith => __$WorkProjectListStateCopyWithImpl<_WorkProjectListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkProjectListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkProjectListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkProjectListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$WorkProjectListStateCopyWith<$Res> implements $WorkProjectListStateCopyWith<$Res> {
  factory _$WorkProjectListStateCopyWith(_WorkProjectListState value, $Res Function(_WorkProjectListState) _then) = __$WorkProjectListStateCopyWithImpl;
@override @useResult
$Res call({
 List<WorkProjectListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$WorkProjectListStateCopyWithImpl<$Res>
    implements _$WorkProjectListStateCopyWith<$Res> {
  __$WorkProjectListStateCopyWithImpl(this._self, this._then);

  final _WorkProjectListState _self;
  final $Res Function(_WorkProjectListState) _then;

/// Create a copy of WorkProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_WorkProjectListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WorkProjectListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$WorkReportFilterState implements DiagnosticableTreeMixin {

 WorkReportSortOption? get sort; SortDirection? get order; String? get search; List<int>? get clients; List<int>? get categories; DateTime? get start; DateTime? get end;
/// Create a copy of WorkReportFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkReportFilterStateCopyWith<WorkReportFilterState> get copyWith => _$WorkReportFilterStateCopyWithImpl<WorkReportFilterState>(this as WorkReportFilterState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportFilterState'))
    ..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkReportFilterState&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,sort,order,search,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(categories),start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportFilterState(sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $WorkReportFilterStateCopyWith<$Res>  {
  factory $WorkReportFilterStateCopyWith(WorkReportFilterState value, $Res Function(WorkReportFilterState) _then) = _$WorkReportFilterStateCopyWithImpl;
@useResult
$Res call({
 WorkReportSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories, DateTime? start, DateTime? end
});




}
/// @nodoc
class _$WorkReportFilterStateCopyWithImpl<$Res>
    implements $WorkReportFilterStateCopyWith<$Res> {
  _$WorkReportFilterStateCopyWithImpl(this._self, this._then);

  final WorkReportFilterState _self;
  final $Res Function(WorkReportFilterState) _then;

/// Create a copy of WorkReportFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,Object? start = freezed,Object? end = freezed,}) {
  return _then(_self.copyWith(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkReportSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkReportFilterState].
extension WorkReportFilterStatePatterns on WorkReportFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkReportFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkReportFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkReportFilterState value)  $default,){
final _that = this;
switch (_that) {
case _WorkReportFilterState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkReportFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkReportFilterState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkReportSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories,  DateTime? start,  DateTime? end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkReportFilterState() when $default != null:
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkReportSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories,  DateTime? start,  DateTime? end)  $default,) {final _that = this;
switch (_that) {
case _WorkReportFilterState():
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkReportSortOption? sort,  SortDirection? order,  String? search,  List<int>? clients,  List<int>? categories,  DateTime? start,  DateTime? end)?  $default,) {final _that = this;
switch (_that) {
case _WorkReportFilterState() when $default != null:
return $default(_that.sort,_that.order,_that.search,_that.clients,_that.categories,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _WorkReportFilterState with DiagnosticableTreeMixin implements WorkReportFilterState {
   _WorkReportFilterState({this.sort, this.order, this.search, final  List<int>? clients, final  List<int>? categories, this.start, this.end}): _clients = clients,_categories = categories;
  

@override final  WorkReportSortOption? sort;
@override final  SortDirection? order;
@override final  String? search;
 final  List<int>? _clients;
@override List<int>? get clients {
  final value = _clients;
  if (value == null) return null;
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _categories;
@override List<int>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? start;
@override final  DateTime? end;

/// Create a copy of WorkReportFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkReportFilterStateCopyWith<_WorkReportFilterState> get copyWith => __$WorkReportFilterStateCopyWithImpl<_WorkReportFilterState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportFilterState'))
    ..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('search', search))..add(DiagnosticsProperty('clients', clients))..add(DiagnosticsProperty('categories', categories))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkReportFilterState&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,sort,order,search,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_categories),start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportFilterState(sort: $sort, order: $order, search: $search, clients: $clients, categories: $categories, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$WorkReportFilterStateCopyWith<$Res> implements $WorkReportFilterStateCopyWith<$Res> {
  factory _$WorkReportFilterStateCopyWith(_WorkReportFilterState value, $Res Function(_WorkReportFilterState) _then) = __$WorkReportFilterStateCopyWithImpl;
@override @useResult
$Res call({
 WorkReportSortOption? sort, SortDirection? order, String? search, List<int>? clients, List<int>? categories, DateTime? start, DateTime? end
});




}
/// @nodoc
class __$WorkReportFilterStateCopyWithImpl<$Res>
    implements _$WorkReportFilterStateCopyWith<$Res> {
  __$WorkReportFilterStateCopyWithImpl(this._self, this._then);

  final _WorkReportFilterState _self;
  final $Res Function(_WorkReportFilterState) _then;

/// Create a copy of WorkReportFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sort = freezed,Object? order = freezed,Object? search = freezed,Object? clients = freezed,Object? categories = freezed,Object? start = freezed,Object? end = freezed,}) {
  return _then(_WorkReportFilterState(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WorkReportSortOption?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as SortDirection?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,clients: freezed == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$WorkReportListState implements DiagnosticableTreeMixin {

 List<WorkReportListItem> get items; int get page; int get total; bool get hasReachEnd;
/// Create a copy of WorkReportListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkReportListStateCopyWith<WorkReportListState> get copyWith => _$WorkReportListStateCopyWithImpl<WorkReportListState>(this as WorkReportListState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkReportListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class $WorkReportListStateCopyWith<$Res>  {
  factory $WorkReportListStateCopyWith(WorkReportListState value, $Res Function(WorkReportListState) _then) = _$WorkReportListStateCopyWithImpl;
@useResult
$Res call({
 List<WorkReportListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class _$WorkReportListStateCopyWithImpl<$Res>
    implements $WorkReportListStateCopyWith<$Res> {
  _$WorkReportListStateCopyWithImpl(this._self, this._then);

  final WorkReportListState _self;
  final $Res Function(WorkReportListState) _then;

/// Create a copy of WorkReportListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WorkReportListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkReportListState].
extension WorkReportListStatePatterns on WorkReportListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkReportListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkReportListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkReportListState value)  $default,){
final _that = this;
switch (_that) {
case _WorkReportListState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkReportListState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkReportListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkReportListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkReportListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkReportListItem> items,  int page,  int total,  bool hasReachEnd)  $default,) {final _that = this;
switch (_that) {
case _WorkReportListState():
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkReportListItem> items,  int page,  int total,  bool hasReachEnd)?  $default,) {final _that = this;
switch (_that) {
case _WorkReportListState() when $default != null:
return $default(_that.items,_that.page,_that.total,_that.hasReachEnd);case _:
  return null;

}
}

}

/// @nodoc


class _WorkReportListState with DiagnosticableTreeMixin implements WorkReportListState {
   _WorkReportListState({final  List<WorkReportListItem> items = const [], this.page = 0, this.total = 0, this.hasReachEnd = false}): _items = items;
  

 final  List<WorkReportListItem> _items;
@override@JsonKey() List<WorkReportListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasReachEnd;

/// Create a copy of WorkReportListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkReportListStateCopyWith<_WorkReportListState> get copyWith => __$WorkReportListStateCopyWithImpl<_WorkReportListState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportListState'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasReachEnd', hasReachEnd));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkReportListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasReachEnd, hasReachEnd) || other.hasReachEnd == hasReachEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,total,hasReachEnd);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportListState(items: $items, page: $page, total: $total, hasReachEnd: $hasReachEnd)';
}


}

/// @nodoc
abstract mixin class _$WorkReportListStateCopyWith<$Res> implements $WorkReportListStateCopyWith<$Res> {
  factory _$WorkReportListStateCopyWith(_WorkReportListState value, $Res Function(_WorkReportListState) _then) = __$WorkReportListStateCopyWithImpl;
@override @useResult
$Res call({
 List<WorkReportListItem> items, int page, int total, bool hasReachEnd
});




}
/// @nodoc
class __$WorkReportListStateCopyWithImpl<$Res>
    implements _$WorkReportListStateCopyWith<$Res> {
  __$WorkReportListStateCopyWithImpl(this._self, this._then);

  final _WorkReportListState _self;
  final $Res Function(_WorkReportListState) _then;

/// Create a copy of WorkReportListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? total = null,Object? hasReachEnd = null,}) {
  return _then(_WorkReportListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WorkReportListItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasReachEnd: null == hasReachEnd ? _self.hasReachEnd : hasReachEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$WorkReportOptionsState implements DiagnosticableTreeMixin {

 List<ClientGroup> get clientItems; List<ScheduleCategory> get categoryItems; int get maxClientDepth;
/// Create a copy of WorkReportOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkReportOptionsStateCopyWith<WorkReportOptionsState> get copyWith => _$WorkReportOptionsStateCopyWithImpl<WorkReportOptionsState>(this as WorkReportOptionsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportOptionsState'))
    ..add(DiagnosticsProperty('clientItems', clientItems))..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkReportOptionsState&&const DeepCollectionEquality().equals(other.clientItems, clientItems)&&const DeepCollectionEquality().equals(other.categoryItems, categoryItems)&&(identical(other.maxClientDepth, maxClientDepth) || other.maxClientDepth == maxClientDepth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clientItems),const DeepCollectionEquality().hash(categoryItems),maxClientDepth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportOptionsState(clientItems: $clientItems, categoryItems: $categoryItems, maxClientDepth: $maxClientDepth)';
}


}

/// @nodoc
abstract mixin class $WorkReportOptionsStateCopyWith<$Res>  {
  factory $WorkReportOptionsStateCopyWith(WorkReportOptionsState value, $Res Function(WorkReportOptionsState) _then) = _$WorkReportOptionsStateCopyWithImpl;
@useResult
$Res call({
 List<ClientGroup> clientItems, List<ScheduleCategory> categoryItems, int maxClientDepth
});




}
/// @nodoc
class _$WorkReportOptionsStateCopyWithImpl<$Res>
    implements $WorkReportOptionsStateCopyWith<$Res> {
  _$WorkReportOptionsStateCopyWithImpl(this._self, this._then);

  final WorkReportOptionsState _self;
  final $Res Function(WorkReportOptionsState) _then;

/// Create a copy of WorkReportOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientItems = null,Object? categoryItems = null,Object? maxClientDepth = null,}) {
  return _then(_self.copyWith(
clientItems: null == clientItems ? _self.clientItems : clientItems // ignore: cast_nullable_to_non_nullable
as List<ClientGroup>,categoryItems: null == categoryItems ? _self.categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleCategory>,maxClientDepth: null == maxClientDepth ? _self.maxClientDepth : maxClientDepth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkReportOptionsState].
extension WorkReportOptionsStatePatterns on WorkReportOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkReportOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkReportOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkReportOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _WorkReportOptionsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkReportOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkReportOptionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ClientGroup> clientItems,  List<ScheduleCategory> categoryItems,  int maxClientDepth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkReportOptionsState() when $default != null:
return $default(_that.clientItems,_that.categoryItems,_that.maxClientDepth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ClientGroup> clientItems,  List<ScheduleCategory> categoryItems,  int maxClientDepth)  $default,) {final _that = this;
switch (_that) {
case _WorkReportOptionsState():
return $default(_that.clientItems,_that.categoryItems,_that.maxClientDepth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ClientGroup> clientItems,  List<ScheduleCategory> categoryItems,  int maxClientDepth)?  $default,) {final _that = this;
switch (_that) {
case _WorkReportOptionsState() when $default != null:
return $default(_that.clientItems,_that.categoryItems,_that.maxClientDepth);case _:
  return null;

}
}

}

/// @nodoc


class _WorkReportOptionsState with DiagnosticableTreeMixin implements WorkReportOptionsState {
  const _WorkReportOptionsState({final  List<ClientGroup> clientItems = const [], final  List<ScheduleCategory> categoryItems = const [], this.maxClientDepth = 0}): _clientItems = clientItems,_categoryItems = categoryItems;
  

 final  List<ClientGroup> _clientItems;
@override@JsonKey() List<ClientGroup> get clientItems {
  if (_clientItems is EqualUnmodifiableListView) return _clientItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clientItems);
}

 final  List<ScheduleCategory> _categoryItems;
@override@JsonKey() List<ScheduleCategory> get categoryItems {
  if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryItems);
}

@override@JsonKey() final  int maxClientDepth;

/// Create a copy of WorkReportOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkReportOptionsStateCopyWith<_WorkReportOptionsState> get copyWith => __$WorkReportOptionsStateCopyWithImpl<_WorkReportOptionsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WorkReportOptionsState'))
    ..add(DiagnosticsProperty('clientItems', clientItems))..add(DiagnosticsProperty('categoryItems', categoryItems))..add(DiagnosticsProperty('maxClientDepth', maxClientDepth));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkReportOptionsState&&const DeepCollectionEquality().equals(other._clientItems, _clientItems)&&const DeepCollectionEquality().equals(other._categoryItems, _categoryItems)&&(identical(other.maxClientDepth, maxClientDepth) || other.maxClientDepth == maxClientDepth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clientItems),const DeepCollectionEquality().hash(_categoryItems),maxClientDepth);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WorkReportOptionsState(clientItems: $clientItems, categoryItems: $categoryItems, maxClientDepth: $maxClientDepth)';
}


}

/// @nodoc
abstract mixin class _$WorkReportOptionsStateCopyWith<$Res> implements $WorkReportOptionsStateCopyWith<$Res> {
  factory _$WorkReportOptionsStateCopyWith(_WorkReportOptionsState value, $Res Function(_WorkReportOptionsState) _then) = __$WorkReportOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ClientGroup> clientItems, List<ScheduleCategory> categoryItems, int maxClientDepth
});




}
/// @nodoc
class __$WorkReportOptionsStateCopyWithImpl<$Res>
    implements _$WorkReportOptionsStateCopyWith<$Res> {
  __$WorkReportOptionsStateCopyWithImpl(this._self, this._then);

  final _WorkReportOptionsState _self;
  final $Res Function(_WorkReportOptionsState) _then;

/// Create a copy of WorkReportOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientItems = null,Object? categoryItems = null,Object? maxClientDepth = null,}) {
  return _then(_WorkReportOptionsState(
clientItems: null == clientItems ? _self._clientItems : clientItems // ignore: cast_nullable_to_non_nullable
as List<ClientGroup>,categoryItems: null == categoryItems ? _self._categoryItems : categoryItems // ignore: cast_nullable_to_non_nullable
as List<ScheduleCategory>,maxClientDepth: null == maxClientDepth ? _self.maxClientDepth : maxClientDepth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
