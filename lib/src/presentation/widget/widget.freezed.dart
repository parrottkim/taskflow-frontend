// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionMenuItem implements DiagnosticableTreeMixin {

 IconData get icon; String get label; String get description; VoidCallback? get onPressed;
/// Create a copy of ActionMenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionMenuItemCopyWith<ActionMenuItem> get copyWith => _$ActionMenuItemCopyWithImpl<ActionMenuItem>(this as ActionMenuItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActionMenuItem'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('onPressed', onPressed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionMenuItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.onPressed, onPressed) || other.onPressed == onPressed));
}


@override
int get hashCode => Object.hash(runtimeType,icon,label,description,onPressed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActionMenuItem(icon: $icon, label: $label, description: $description, onPressed: $onPressed)';
}


}

/// @nodoc
abstract mixin class $ActionMenuItemCopyWith<$Res>  {
  factory $ActionMenuItemCopyWith(ActionMenuItem value, $Res Function(ActionMenuItem) _then) = _$ActionMenuItemCopyWithImpl;
@useResult
$Res call({
 IconData icon, String label, String description, VoidCallback? onPressed
});




}
/// @nodoc
class _$ActionMenuItemCopyWithImpl<$Res>
    implements $ActionMenuItemCopyWith<$Res> {
  _$ActionMenuItemCopyWithImpl(this._self, this._then);

  final ActionMenuItem _self;
  final $Res Function(ActionMenuItem) _then;

/// Create a copy of ActionMenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? label = null,Object? description = null,Object? onPressed = freezed,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,onPressed: freezed == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionMenuItem].
extension ActionMenuItemPatterns on ActionMenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionMenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionMenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionMenuItem value)  $default,){
final _that = this;
switch (_that) {
case _ActionMenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionMenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _ActionMenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IconData icon,  String label,  String description,  VoidCallback? onPressed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionMenuItem() when $default != null:
return $default(_that.icon,_that.label,_that.description,_that.onPressed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IconData icon,  String label,  String description,  VoidCallback? onPressed)  $default,) {final _that = this;
switch (_that) {
case _ActionMenuItem():
return $default(_that.icon,_that.label,_that.description,_that.onPressed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IconData icon,  String label,  String description,  VoidCallback? onPressed)?  $default,) {final _that = this;
switch (_that) {
case _ActionMenuItem() when $default != null:
return $default(_that.icon,_that.label,_that.description,_that.onPressed);case _:
  return null;

}
}

}

/// @nodoc


class _ActionMenuItem with DiagnosticableTreeMixin implements ActionMenuItem {
   _ActionMenuItem({required this.icon, required this.label, this.description = '', required this.onPressed});
  

@override final  IconData icon;
@override final  String label;
@override@JsonKey() final  String description;
@override final  VoidCallback? onPressed;

/// Create a copy of ActionMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionMenuItemCopyWith<_ActionMenuItem> get copyWith => __$ActionMenuItemCopyWithImpl<_ActionMenuItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActionMenuItem'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('onPressed', onPressed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionMenuItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.onPressed, onPressed) || other.onPressed == onPressed));
}


@override
int get hashCode => Object.hash(runtimeType,icon,label,description,onPressed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActionMenuItem(icon: $icon, label: $label, description: $description, onPressed: $onPressed)';
}


}

/// @nodoc
abstract mixin class _$ActionMenuItemCopyWith<$Res> implements $ActionMenuItemCopyWith<$Res> {
  factory _$ActionMenuItemCopyWith(_ActionMenuItem value, $Res Function(_ActionMenuItem) _then) = __$ActionMenuItemCopyWithImpl;
@override @useResult
$Res call({
 IconData icon, String label, String description, VoidCallback? onPressed
});




}
/// @nodoc
class __$ActionMenuItemCopyWithImpl<$Res>
    implements _$ActionMenuItemCopyWith<$Res> {
  __$ActionMenuItemCopyWithImpl(this._self, this._then);

  final _ActionMenuItem _self;
  final $Res Function(_ActionMenuItem) _then;

/// Create a copy of ActionMenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? label = null,Object? description = null,Object? onPressed = freezed,}) {
  return _then(_ActionMenuItem(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,onPressed: freezed == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

/// @nodoc
mixin _$BottomSheetAction implements DiagnosticableTreeMixin {

 VoidCallback get onTap; String get label;
/// Create a copy of BottomSheetAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomSheetActionCopyWith<BottomSheetAction> get copyWith => _$BottomSheetActionCopyWithImpl<BottomSheetAction>(this as BottomSheetAction, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BottomSheetAction'))
    ..add(DiagnosticsProperty('onTap', onTap))..add(DiagnosticsProperty('label', label));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomSheetAction&&(identical(other.onTap, onTap) || other.onTap == onTap)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,onTap,label);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BottomSheetAction(onTap: $onTap, label: $label)';
}


}

/// @nodoc
abstract mixin class $BottomSheetActionCopyWith<$Res>  {
  factory $BottomSheetActionCopyWith(BottomSheetAction value, $Res Function(BottomSheetAction) _then) = _$BottomSheetActionCopyWithImpl;
@useResult
$Res call({
 VoidCallback onTap, String label
});




}
/// @nodoc
class _$BottomSheetActionCopyWithImpl<$Res>
    implements $BottomSheetActionCopyWith<$Res> {
  _$BottomSheetActionCopyWithImpl(this._self, this._then);

  final BottomSheetAction _self;
  final $Res Function(BottomSheetAction) _then;

/// Create a copy of BottomSheetAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onTap = null,Object? label = null,}) {
  return _then(_self.copyWith(
onTap: null == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BottomSheetAction].
extension BottomSheetActionPatterns on BottomSheetAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BottomSheetAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BottomSheetAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BottomSheetAction value)  $default,){
final _that = this;
switch (_that) {
case _BottomSheetAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BottomSheetAction value)?  $default,){
final _that = this;
switch (_that) {
case _BottomSheetAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VoidCallback onTap,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BottomSheetAction() when $default != null:
return $default(_that.onTap,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VoidCallback onTap,  String label)  $default,) {final _that = this;
switch (_that) {
case _BottomSheetAction():
return $default(_that.onTap,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VoidCallback onTap,  String label)?  $default,) {final _that = this;
switch (_that) {
case _BottomSheetAction() when $default != null:
return $default(_that.onTap,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _BottomSheetAction with DiagnosticableTreeMixin implements BottomSheetAction {
   _BottomSheetAction({required this.onTap, required this.label});
  

@override final  VoidCallback onTap;
@override final  String label;

/// Create a copy of BottomSheetAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomSheetActionCopyWith<_BottomSheetAction> get copyWith => __$BottomSheetActionCopyWithImpl<_BottomSheetAction>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BottomSheetAction'))
    ..add(DiagnosticsProperty('onTap', onTap))..add(DiagnosticsProperty('label', label));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomSheetAction&&(identical(other.onTap, onTap) || other.onTap == onTap)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,onTap,label);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BottomSheetAction(onTap: $onTap, label: $label)';
}


}

/// @nodoc
abstract mixin class _$BottomSheetActionCopyWith<$Res> implements $BottomSheetActionCopyWith<$Res> {
  factory _$BottomSheetActionCopyWith(_BottomSheetAction value, $Res Function(_BottomSheetAction) _then) = __$BottomSheetActionCopyWithImpl;
@override @useResult
$Res call({
 VoidCallback onTap, String label
});




}
/// @nodoc
class __$BottomSheetActionCopyWithImpl<$Res>
    implements _$BottomSheetActionCopyWith<$Res> {
  __$BottomSheetActionCopyWithImpl(this._self, this._then);

  final _BottomSheetAction _self;
  final $Res Function(_BottomSheetAction) _then;

/// Create a copy of BottomSheetAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onTap = null,Object? label = null,}) {
  return _then(_BottomSheetAction(
onTap: null == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ClientMarker implements DiagnosticableTreeMixin {

 double get latitude; double get longitude; List<ClientMarkerTooltip> get items;
/// Create a copy of ClientMarker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientMarkerCopyWith<ClientMarker> get copyWith => _$ClientMarkerCopyWithImpl<ClientMarker>(this as ClientMarker, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientMarker'))
    ..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientMarker&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,const DeepCollectionEquality().hash(items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientMarker(latitude: $latitude, longitude: $longitude, items: $items)';
}


}

/// @nodoc
abstract mixin class $ClientMarkerCopyWith<$Res>  {
  factory $ClientMarkerCopyWith(ClientMarker value, $Res Function(ClientMarker) _then) = _$ClientMarkerCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, List<ClientMarkerTooltip> items
});




}
/// @nodoc
class _$ClientMarkerCopyWithImpl<$Res>
    implements $ClientMarkerCopyWith<$Res> {
  _$ClientMarkerCopyWithImpl(this._self, this._then);

  final ClientMarker _self;
  final $Res Function(ClientMarker) _then;

/// Create a copy of ClientMarker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? items = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ClientMarkerTooltip>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientMarker].
extension ClientMarkerPatterns on ClientMarker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientMarker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientMarker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientMarker value)  $default,){
final _that = this;
switch (_that) {
case _ClientMarker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientMarker value)?  $default,){
final _that = this;
switch (_that) {
case _ClientMarker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  List<ClientMarkerTooltip> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientMarker() when $default != null:
return $default(_that.latitude,_that.longitude,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  List<ClientMarkerTooltip> items)  $default,) {final _that = this;
switch (_that) {
case _ClientMarker():
return $default(_that.latitude,_that.longitude,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  List<ClientMarkerTooltip> items)?  $default,) {final _that = this;
switch (_that) {
case _ClientMarker() when $default != null:
return $default(_that.latitude,_that.longitude,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ClientMarker with DiagnosticableTreeMixin implements ClientMarker {
   _ClientMarker({required this.latitude, required this.longitude, required final  List<ClientMarkerTooltip> items}): _items = items;
  

@override final  double latitude;
@override final  double longitude;
 final  List<ClientMarkerTooltip> _items;
@override List<ClientMarkerTooltip> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ClientMarker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientMarkerCopyWith<_ClientMarker> get copyWith => __$ClientMarkerCopyWithImpl<_ClientMarker>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientMarker'))
    ..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientMarker&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,const DeepCollectionEquality().hash(_items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientMarker(latitude: $latitude, longitude: $longitude, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ClientMarkerCopyWith<$Res> implements $ClientMarkerCopyWith<$Res> {
  factory _$ClientMarkerCopyWith(_ClientMarker value, $Res Function(_ClientMarker) _then) = __$ClientMarkerCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, List<ClientMarkerTooltip> items
});




}
/// @nodoc
class __$ClientMarkerCopyWithImpl<$Res>
    implements _$ClientMarkerCopyWith<$Res> {
  __$ClientMarkerCopyWithImpl(this._self, this._then);

  final _ClientMarker _self;
  final $Res Function(_ClientMarker) _then;

/// Create a copy of ClientMarker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? items = null,}) {
  return _then(_ClientMarker(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ClientMarkerTooltip>,
  ));
}


}

/// @nodoc
mixin _$ClientMarkerTooltip implements DiagnosticableTreeMixin {

 ClientBrand get type; String get name;
/// Create a copy of ClientMarkerTooltip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientMarkerTooltipCopyWith<ClientMarkerTooltip> get copyWith => _$ClientMarkerTooltipCopyWithImpl<ClientMarkerTooltip>(this as ClientMarkerTooltip, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientMarkerTooltip'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientMarkerTooltip&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,type,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientMarkerTooltip(type: $type, name: $name)';
}


}

/// @nodoc
abstract mixin class $ClientMarkerTooltipCopyWith<$Res>  {
  factory $ClientMarkerTooltipCopyWith(ClientMarkerTooltip value, $Res Function(ClientMarkerTooltip) _then) = _$ClientMarkerTooltipCopyWithImpl;
@useResult
$Res call({
 ClientBrand type, String name
});




}
/// @nodoc
class _$ClientMarkerTooltipCopyWithImpl<$Res>
    implements $ClientMarkerTooltipCopyWith<$Res> {
  _$ClientMarkerTooltipCopyWithImpl(this._self, this._then);

  final ClientMarkerTooltip _self;
  final $Res Function(ClientMarkerTooltip) _then;

/// Create a copy of ClientMarkerTooltip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClientBrand,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientMarkerTooltip].
extension ClientMarkerTooltipPatterns on ClientMarkerTooltip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientMarkerTooltip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientMarkerTooltip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientMarkerTooltip value)  $default,){
final _that = this;
switch (_that) {
case _ClientMarkerTooltip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientMarkerTooltip value)?  $default,){
final _that = this;
switch (_that) {
case _ClientMarkerTooltip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClientBrand type,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientMarkerTooltip() when $default != null:
return $default(_that.type,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClientBrand type,  String name)  $default,) {final _that = this;
switch (_that) {
case _ClientMarkerTooltip():
return $default(_that.type,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClientBrand type,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ClientMarkerTooltip() when $default != null:
return $default(_that.type,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _ClientMarkerTooltip with DiagnosticableTreeMixin implements ClientMarkerTooltip {
   _ClientMarkerTooltip({required this.type, required this.name});
  

@override final  ClientBrand type;
@override final  String name;

/// Create a copy of ClientMarkerTooltip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientMarkerTooltipCopyWith<_ClientMarkerTooltip> get copyWith => __$ClientMarkerTooltipCopyWithImpl<_ClientMarkerTooltip>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientMarkerTooltip'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientMarkerTooltip&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,type,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientMarkerTooltip(type: $type, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ClientMarkerTooltipCopyWith<$Res> implements $ClientMarkerTooltipCopyWith<$Res> {
  factory _$ClientMarkerTooltipCopyWith(_ClientMarkerTooltip value, $Res Function(_ClientMarkerTooltip) _then) = __$ClientMarkerTooltipCopyWithImpl;
@override @useResult
$Res call({
 ClientBrand type, String name
});




}
/// @nodoc
class __$ClientMarkerTooltipCopyWithImpl<$Res>
    implements _$ClientMarkerTooltipCopyWith<$Res> {
  __$ClientMarkerTooltipCopyWithImpl(this._self, this._then);

  final _ClientMarkerTooltip _self;
  final $Res Function(_ClientMarkerTooltip) _then;

/// Create a copy of ClientMarkerTooltip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,}) {
  return _then(_ClientMarkerTooltip(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClientBrand,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$NavigationItem implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationItem'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationItem()';
}


}

/// @nodoc
class $NavigationItemCopyWith<$Res>  {
$NavigationItemCopyWith(NavigationItem _, $Res Function(NavigationItem) __);
}


/// Adds pattern-matching-related methods to [NavigationItem].
extension NavigationItemPatterns on NavigationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigationButton value)?  button,TResult Function( NavigationTitle value)?  title,TResult Function( NavigationSpace value)?  space,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigationButton() when button != null:
return button(_that);case NavigationTitle() when title != null:
return title(_that);case NavigationSpace() when space != null:
return space(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigationButton value)  button,required TResult Function( NavigationTitle value)  title,required TResult Function( NavigationSpace value)  space,}){
final _that = this;
switch (_that) {
case NavigationButton():
return button(_that);case NavigationTitle():
return title(_that);case NavigationSpace():
return space(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigationButton value)?  button,TResult? Function( NavigationTitle value)?  title,TResult? Function( NavigationSpace value)?  space,}){
final _that = this;
switch (_that) {
case NavigationButton() when button != null:
return button(_that);case NavigationTitle() when title != null:
return title(_that);case NavigationSpace() when space != null:
return space(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String route,  IconData icon,  String label,  bool isAdmin)?  button,TResult Function( String label,  bool isAdmin)?  title,TResult Function()?  space,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigationButton() when button != null:
return button(_that.route,_that.icon,_that.label,_that.isAdmin);case NavigationTitle() when title != null:
return title(_that.label,_that.isAdmin);case NavigationSpace() when space != null:
return space();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String route,  IconData icon,  String label,  bool isAdmin)  button,required TResult Function( String label,  bool isAdmin)  title,required TResult Function()  space,}) {final _that = this;
switch (_that) {
case NavigationButton():
return button(_that.route,_that.icon,_that.label,_that.isAdmin);case NavigationTitle():
return title(_that.label,_that.isAdmin);case NavigationSpace():
return space();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String route,  IconData icon,  String label,  bool isAdmin)?  button,TResult? Function( String label,  bool isAdmin)?  title,TResult? Function()?  space,}) {final _that = this;
switch (_that) {
case NavigationButton() when button != null:
return button(_that.route,_that.icon,_that.label,_that.isAdmin);case NavigationTitle() when title != null:
return title(_that.label,_that.isAdmin);case NavigationSpace() when space != null:
return space();case _:
  return null;

}
}

}

/// @nodoc


class NavigationButton with DiagnosticableTreeMixin implements NavigationItem {
   NavigationButton({required this.route, required this.icon, required this.label, this.isAdmin = false});
  

 final  String route;
 final  IconData icon;
 final  String label;
@JsonKey() final  bool isAdmin;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationButtonCopyWith<NavigationButton> get copyWith => _$NavigationButtonCopyWithImpl<NavigationButton>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationItem.button'))
    ..add(DiagnosticsProperty('route', route))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('isAdmin', isAdmin));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationButton&&(identical(other.route, route) || other.route == route)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}


@override
int get hashCode => Object.hash(runtimeType,route,icon,label,isAdmin);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationItem.button(route: $route, icon: $icon, label: $label, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class $NavigationButtonCopyWith<$Res> implements $NavigationItemCopyWith<$Res> {
  factory $NavigationButtonCopyWith(NavigationButton value, $Res Function(NavigationButton) _then) = _$NavigationButtonCopyWithImpl;
@useResult
$Res call({
 String route, IconData icon, String label, bool isAdmin
});




}
/// @nodoc
class _$NavigationButtonCopyWithImpl<$Res>
    implements $NavigationButtonCopyWith<$Res> {
  _$NavigationButtonCopyWithImpl(this._self, this._then);

  final NavigationButton _self;
  final $Res Function(NavigationButton) _then;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,Object? icon = null,Object? label = null,Object? isAdmin = null,}) {
  return _then(NavigationButton(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NavigationTitle with DiagnosticableTreeMixin implements NavigationItem {
   NavigationTitle({required this.label, this.isAdmin = false});
  

 final  String label;
@JsonKey() final  bool isAdmin;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationTitleCopyWith<NavigationTitle> get copyWith => _$NavigationTitleCopyWithImpl<NavigationTitle>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationItem.title'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('isAdmin', isAdmin));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationTitle&&(identical(other.label, label) || other.label == label)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}


@override
int get hashCode => Object.hash(runtimeType,label,isAdmin);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationItem.title(label: $label, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class $NavigationTitleCopyWith<$Res> implements $NavigationItemCopyWith<$Res> {
  factory $NavigationTitleCopyWith(NavigationTitle value, $Res Function(NavigationTitle) _then) = _$NavigationTitleCopyWithImpl;
@useResult
$Res call({
 String label, bool isAdmin
});




}
/// @nodoc
class _$NavigationTitleCopyWithImpl<$Res>
    implements $NavigationTitleCopyWith<$Res> {
  _$NavigationTitleCopyWithImpl(this._self, this._then);

  final NavigationTitle _self;
  final $Res Function(NavigationTitle) _then;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,Object? isAdmin = null,}) {
  return _then(NavigationTitle(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NavigationSpace with DiagnosticableTreeMixin implements NavigationItem {
   NavigationSpace();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NavigationItem.space'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationSpace);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NavigationItem.space()';
}


}




/// @nodoc
mixin _$ValidationRule implements DiagnosticableTreeMixin {

 String get label; RegExp get regex; bool get flag;
/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationRuleCopyWith<ValidationRule> get copyWith => _$ValidationRuleCopyWithImpl<ValidationRule>(this as ValidationRule, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ValidationRule'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('regex', regex))..add(DiagnosticsProperty('flag', flag));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationRule&&(identical(other.label, label) || other.label == label)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.flag, flag) || other.flag == flag));
}


@override
int get hashCode => Object.hash(runtimeType,label,regex,flag);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ValidationRule(label: $label, regex: $regex, flag: $flag)';
}


}

/// @nodoc
abstract mixin class $ValidationRuleCopyWith<$Res>  {
  factory $ValidationRuleCopyWith(ValidationRule value, $Res Function(ValidationRule) _then) = _$ValidationRuleCopyWithImpl;
@useResult
$Res call({
 String label, RegExp regex, bool flag
});




}
/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._self, this._then);

  final ValidationRule _self;
  final $Res Function(ValidationRule) _then;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? regex = null,Object? flag = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as RegExp,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationRule].
extension ValidationRulePatterns on ValidationRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationRule value)  $default,){
final _that = this;
switch (_that) {
case _ValidationRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationRule value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  RegExp regex,  bool flag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
return $default(_that.label,_that.regex,_that.flag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  RegExp regex,  bool flag)  $default,) {final _that = this;
switch (_that) {
case _ValidationRule():
return $default(_that.label,_that.regex,_that.flag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  RegExp regex,  bool flag)?  $default,) {final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
return $default(_that.label,_that.regex,_that.flag);case _:
  return null;

}
}

}

/// @nodoc


class _ValidationRule with DiagnosticableTreeMixin implements ValidationRule {
   _ValidationRule({required this.label, required this.regex, required this.flag});
  

@override final  String label;
@override final  RegExp regex;
@override final  bool flag;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationRuleCopyWith<_ValidationRule> get copyWith => __$ValidationRuleCopyWithImpl<_ValidationRule>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ValidationRule'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('regex', regex))..add(DiagnosticsProperty('flag', flag));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationRule&&(identical(other.label, label) || other.label == label)&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.flag, flag) || other.flag == flag));
}


@override
int get hashCode => Object.hash(runtimeType,label,regex,flag);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ValidationRule(label: $label, regex: $regex, flag: $flag)';
}


}

/// @nodoc
abstract mixin class _$ValidationRuleCopyWith<$Res> implements $ValidationRuleCopyWith<$Res> {
  factory _$ValidationRuleCopyWith(_ValidationRule value, $Res Function(_ValidationRule) _then) = __$ValidationRuleCopyWithImpl;
@override @useResult
$Res call({
 String label, RegExp regex, bool flag
});




}
/// @nodoc
class __$ValidationRuleCopyWithImpl<$Res>
    implements _$ValidationRuleCopyWith<$Res> {
  __$ValidationRuleCopyWithImpl(this._self, this._then);

  final _ValidationRule _self;
  final $Res Function(_ValidationRule) _then;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? regex = null,Object? flag = null,}) {
  return _then(_ValidationRule(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as RegExp,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
