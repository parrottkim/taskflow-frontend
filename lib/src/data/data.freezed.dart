// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {
  int get userId;
  int get projectId;
  DateTime get createdAt;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkCopyWith<Bookmark> get copyWith =>
      _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bookmark &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, projectId, createdAt);

  @override
  String toString() {
    return 'Bookmark(userId: $userId, projectId: $projectId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) =
      _$BookmarkCopyWithImpl;
  @useResult
  $Res call({int userId, int projectId, DateTime createdAt});
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res> implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? projectId = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Bookmark].
extension BookmarkPatterns on Bookmark {
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
    TResult Function(_Bookmark value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bookmark() when $default != null:
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
    TResult Function(_Bookmark value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bookmark():
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
    TResult? Function(_Bookmark value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bookmark() when $default != null:
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
    TResult Function(int userId, int projectId, DateTime createdAt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bookmark() when $default != null:
        return $default(_that.userId, _that.projectId, _that.createdAt);
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
    TResult Function(int userId, int projectId, DateTime createdAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bookmark():
        return $default(_that.userId, _that.projectId, _that.createdAt);
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
    TResult? Function(int userId, int projectId, DateTime createdAt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bookmark() when $default != null:
        return $default(_that.userId, _that.projectId, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Bookmark implements Bookmark {
  _Bookmark(
      {required this.userId, required this.projectId, required this.createdAt});
  factory _Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);

  @override
  final int userId;
  @override
  final int projectId;
  @override
  final DateTime createdAt;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookmarkCopyWith<_Bookmark> get copyWith =>
      __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookmarkToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bookmark &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, projectId, createdAt);

  @override
  String toString() {
    return 'Bookmark(userId: $userId, projectId: $projectId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) =
      __$BookmarkCopyWithImpl;
  @override
  @useResult
  $Res call({int userId, int projectId, DateTime createdAt});
}

/// @nodoc
class __$BookmarkCopyWithImpl<$Res> implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? projectId = null,
    Object? createdAt = null,
  }) {
    return _then(_Bookmark(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$Currency {
  int get id;
  String get code;
  String get symbol;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<Currency> get copyWith =>
      _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Currency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, symbol);

  @override
  String toString() {
    return 'Currency(id: $id, code: $code, symbol: $symbol)';
  }
}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) =
      _$CurrencyCopyWithImpl;
  @useResult
  $Res call({int id, String code, String symbol});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res> implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? symbol = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
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
    TResult Function(_Currency value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
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
    TResult Function(_Currency value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency():
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
    TResult? Function(_Currency value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
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
    TResult Function(int id, String code, String symbol)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
        return $default(_that.id, _that.code, _that.symbol);
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
    TResult Function(int id, String code, String symbol) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency():
        return $default(_that.id, _that.code, _that.symbol);
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
    TResult? Function(int id, String code, String symbol)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
        return $default(_that.id, _that.code, _that.symbol);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Currency implements Currency {
  _Currency({required this.id, required this.code, required this.symbol});
  factory _Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String symbol;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencyCopyWith<_Currency> get copyWith =>
      __$CurrencyCopyWithImpl<_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrencyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Currency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, symbol);

  @override
  String toString() {
    return 'Currency(id: $id, code: $code, symbol: $symbol)';
  }
}

/// @nodoc
abstract mixin class _$CurrencyCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) _then) =
      __$CurrencyCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String code, String symbol});
}

/// @nodoc
class __$CurrencyCopyWithImpl<$Res> implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(this._self, this._then);

  final _Currency _self;
  final $Res Function(_Currency) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? symbol = null,
  }) {
    return _then(_Currency(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LatestIssue {
  int get id;
  int get projectId;
  String get projectCode;
  String get projectName;
  IssueCategory get category;
  List<Client> get clients;
  User get user;
  DateTime get createdAt;

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LatestIssueCopyWith<LatestIssue> get copyWith =>
      _$LatestIssueCopyWithImpl<LatestIssue>(this as LatestIssue, _$identity);

  /// Serializes this LatestIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LatestIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.clients, clients) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      projectCode,
      projectName,
      category,
      const DeepCollectionEquality().hash(clients),
      user,
      createdAt);

  @override
  String toString() {
    return 'LatestIssue(id: $id, projectId: $projectId, projectCode: $projectCode, projectName: $projectName, category: $category, clients: $clients, user: $user, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $LatestIssueCopyWith<$Res> {
  factory $LatestIssueCopyWith(
          LatestIssue value, $Res Function(LatestIssue) _then) =
      _$LatestIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int projectId,
      String projectCode,
      String projectName,
      IssueCategory category,
      List<Client> clients,
      User user,
      DateTime createdAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$LatestIssueCopyWithImpl<$Res> implements $LatestIssueCopyWith<$Res> {
  _$LatestIssueCopyWithImpl(this._self, this._then);

  final LatestIssue _self;
  final $Res Function(LatestIssue) _then;

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? category = null,
    Object? clients = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LatestIssue].
extension LatestIssuePatterns on LatestIssue {
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
    TResult Function(_LatestIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LatestIssue() when $default != null:
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
    TResult Function(_LatestIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestIssue():
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
    TResult? Function(_LatestIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestIssue() when $default != null:
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            IssueCategory category,
            List<Client> clients,
            User user,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LatestIssue() when $default != null:
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.category,
            _that.clients,
            _that.user,
            _that.createdAt);
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            IssueCategory category,
            List<Client> clients,
            User user,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestIssue():
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.category,
            _that.clients,
            _that.user,
            _that.createdAt);
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            IssueCategory category,
            List<Client> clients,
            User user,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LatestIssue() when $default != null:
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.category,
            _that.clients,
            _that.user,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LatestIssue implements LatestIssue {
  _LatestIssue(
      {required this.id,
      required this.projectId,
      required this.projectCode,
      required this.projectName,
      required this.category,
      required final List<Client> clients,
      required this.user,
      required this.createdAt})
      : _clients = clients;
  factory _LatestIssue.fromJson(Map<String, dynamic> json) =>
      _$LatestIssueFromJson(json);

  @override
  final int id;
  @override
  final int projectId;
  @override
  final String projectCode;
  @override
  final String projectName;
  @override
  final IssueCategory category;
  final List<Client> _clients;
  @override
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  @override
  final User user;
  @override
  final DateTime createdAt;

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LatestIssueCopyWith<_LatestIssue> get copyWith =>
      __$LatestIssueCopyWithImpl<_LatestIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LatestIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LatestIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      projectCode,
      projectName,
      category,
      const DeepCollectionEquality().hash(_clients),
      user,
      createdAt);

  @override
  String toString() {
    return 'LatestIssue(id: $id, projectId: $projectId, projectCode: $projectCode, projectName: $projectName, category: $category, clients: $clients, user: $user, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$LatestIssueCopyWith<$Res>
    implements $LatestIssueCopyWith<$Res> {
  factory _$LatestIssueCopyWith(
          _LatestIssue value, $Res Function(_LatestIssue) _then) =
      __$LatestIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int projectId,
      String projectCode,
      String projectName,
      IssueCategory category,
      List<Client> clients,
      User user,
      DateTime createdAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$LatestIssueCopyWithImpl<$Res> implements _$LatestIssueCopyWith<$Res> {
  __$LatestIssueCopyWithImpl(this._self, this._then);

  final _LatestIssue _self;
  final $Res Function(_LatestIssue) _then;

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? category = null,
    Object? clients = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_LatestIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      clients: null == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of LatestIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

IssueCategory _$IssueCategoryFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'kickoff':
      return IssueKickoff.fromJson(json);
    case 'contract':
      return IssueContract.fromJson(json);
    case 'transaction':
      return IssueTransaction.fromJson(json);
    case 'payment':
      return IssuePayment.fromJson(json);
    case 'declaration':
      return IssueDeclaration.fromJson(json);
    case 'procurement':
      return IssueProcurement.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'IssueCategory',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$IssueCategory {
  int get id;
  String get name;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<IssueCategory> get copyWith =>
      _$IssueCategoryCopyWithImpl<IssueCategory>(
          this as IssueCategory, _$identity);

  /// Serializes this IssueCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueCategoryCopyWith<$Res> {
  factory $IssueCategoryCopyWith(
          IssueCategory value, $Res Function(IssueCategory) _then) =
      _$IssueCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueCategoryCopyWithImpl<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  _$IssueCategoryCopyWithImpl(this._self, this._then);

  final IssueCategory _self;
  final $Res Function(IssueCategory) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IssueCategory].
extension IssueCategoryPatterns on IssueCategory {
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
    TResult Function(IssueKickoff value)? kickoff,
    TResult Function(IssueContract value)? contract,
    TResult Function(IssueTransaction value)? transaction,
    TResult Function(IssuePayment value)? payment,
    TResult Function(IssueDeclaration value)? declaration,
    TResult Function(IssueProcurement value)? procurement,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff() when kickoff != null:
        return kickoff(_that);
      case IssueContract() when contract != null:
        return contract(_that);
      case IssueTransaction() when transaction != null:
        return transaction(_that);
      case IssuePayment() when payment != null:
        return payment(_that);
      case IssueDeclaration() when declaration != null:
        return declaration(_that);
      case IssueProcurement() when procurement != null:
        return procurement(_that);
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
    required TResult Function(IssueKickoff value) kickoff,
    required TResult Function(IssueContract value) contract,
    required TResult Function(IssueTransaction value) transaction,
    required TResult Function(IssuePayment value) payment,
    required TResult Function(IssueDeclaration value) declaration,
    required TResult Function(IssueProcurement value) procurement,
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff():
        return kickoff(_that);
      case IssueContract():
        return contract(_that);
      case IssueTransaction():
        return transaction(_that);
      case IssuePayment():
        return payment(_that);
      case IssueDeclaration():
        return declaration(_that);
      case IssueProcurement():
        return procurement(_that);
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
    TResult? Function(IssueKickoff value)? kickoff,
    TResult? Function(IssueContract value)? contract,
    TResult? Function(IssueTransaction value)? transaction,
    TResult? Function(IssuePayment value)? payment,
    TResult? Function(IssueDeclaration value)? declaration,
    TResult? Function(IssueProcurement value)? procurement,
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff() when kickoff != null:
        return kickoff(_that);
      case IssueContract() when contract != null:
        return contract(_that);
      case IssueTransaction() when transaction != null:
        return transaction(_that);
      case IssuePayment() when payment != null:
        return payment(_that);
      case IssueDeclaration() when declaration != null:
        return declaration(_that);
      case IssueProcurement() when procurement != null:
        return procurement(_that);
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
    TResult Function(int id, String name)? kickoff,
    TResult Function(int id, String name)? contract,
    TResult Function(int id, String name)? transaction,
    TResult Function(int id, String name)? payment,
    TResult Function(int id, String name)? declaration,
    TResult Function(int id, String name)? procurement,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff() when kickoff != null:
        return kickoff(_that.id, _that.name);
      case IssueContract() when contract != null:
        return contract(_that.id, _that.name);
      case IssueTransaction() when transaction != null:
        return transaction(_that.id, _that.name);
      case IssuePayment() when payment != null:
        return payment(_that.id, _that.name);
      case IssueDeclaration() when declaration != null:
        return declaration(_that.id, _that.name);
      case IssueProcurement() when procurement != null:
        return procurement(_that.id, _that.name);
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
    required TResult Function(int id, String name) kickoff,
    required TResult Function(int id, String name) contract,
    required TResult Function(int id, String name) transaction,
    required TResult Function(int id, String name) payment,
    required TResult Function(int id, String name) declaration,
    required TResult Function(int id, String name) procurement,
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff():
        return kickoff(_that.id, _that.name);
      case IssueContract():
        return contract(_that.id, _that.name);
      case IssueTransaction():
        return transaction(_that.id, _that.name);
      case IssuePayment():
        return payment(_that.id, _that.name);
      case IssueDeclaration():
        return declaration(_that.id, _that.name);
      case IssueProcurement():
        return procurement(_that.id, _that.name);
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
    TResult? Function(int id, String name)? kickoff,
    TResult? Function(int id, String name)? contract,
    TResult? Function(int id, String name)? transaction,
    TResult? Function(int id, String name)? payment,
    TResult? Function(int id, String name)? declaration,
    TResult? Function(int id, String name)? procurement,
  }) {
    final _that = this;
    switch (_that) {
      case IssueKickoff() when kickoff != null:
        return kickoff(_that.id, _that.name);
      case IssueContract() when contract != null:
        return contract(_that.id, _that.name);
      case IssueTransaction() when transaction != null:
        return transaction(_that.id, _that.name);
      case IssuePayment() when payment != null:
        return payment(_that.id, _that.name);
      case IssueDeclaration() when declaration != null:
        return declaration(_that.id, _that.name);
      case IssueProcurement() when procurement != null:
        return procurement(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class IssueKickoff implements IssueCategory {
  IssueKickoff({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'kickoff';
  factory IssueKickoff.fromJson(Map<String, dynamic> json) =>
      _$IssueKickoffFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueKickoffCopyWith<IssueKickoff> get copyWith =>
      _$IssueKickoffCopyWithImpl<IssueKickoff>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueKickoffToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueKickoff &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.kickoff(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueKickoffCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssueKickoffCopyWith(
          IssueKickoff value, $Res Function(IssueKickoff) _then) =
      _$IssueKickoffCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueKickoffCopyWithImpl<$Res> implements $IssueKickoffCopyWith<$Res> {
  _$IssueKickoffCopyWithImpl(this._self, this._then);

  final IssueKickoff _self;
  final $Res Function(IssueKickoff) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssueKickoff(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class IssueContract implements IssueCategory {
  IssueContract({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'contract';
  factory IssueContract.fromJson(Map<String, dynamic> json) =>
      _$IssueContractFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueContractCopyWith<IssueContract> get copyWith =>
      _$IssueContractCopyWithImpl<IssueContract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueContractToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueContract &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.contract(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueContractCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssueContractCopyWith(
          IssueContract value, $Res Function(IssueContract) _then) =
      _$IssueContractCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueContractCopyWithImpl<$Res>
    implements $IssueContractCopyWith<$Res> {
  _$IssueContractCopyWithImpl(this._self, this._then);

  final IssueContract _self;
  final $Res Function(IssueContract) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssueContract(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class IssueTransaction implements IssueCategory {
  IssueTransaction({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'transaction';
  factory IssueTransaction.fromJson(Map<String, dynamic> json) =>
      _$IssueTransactionFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueTransactionCopyWith<IssueTransaction> get copyWith =>
      _$IssueTransactionCopyWithImpl<IssueTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueTransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.transaction(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueTransactionCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssueTransactionCopyWith(
          IssueTransaction value, $Res Function(IssueTransaction) _then) =
      _$IssueTransactionCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueTransactionCopyWithImpl<$Res>
    implements $IssueTransactionCopyWith<$Res> {
  _$IssueTransactionCopyWithImpl(this._self, this._then);

  final IssueTransaction _self;
  final $Res Function(IssueTransaction) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssueTransaction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class IssuePayment implements IssueCategory {
  IssuePayment({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'payment';
  factory IssuePayment.fromJson(Map<String, dynamic> json) =>
      _$IssuePaymentFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssuePaymentCopyWith<IssuePayment> get copyWith =>
      _$IssuePaymentCopyWithImpl<IssuePayment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssuePaymentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssuePayment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.payment(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssuePaymentCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssuePaymentCopyWith(
          IssuePayment value, $Res Function(IssuePayment) _then) =
      _$IssuePaymentCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssuePaymentCopyWithImpl<$Res> implements $IssuePaymentCopyWith<$Res> {
  _$IssuePaymentCopyWithImpl(this._self, this._then);

  final IssuePayment _self;
  final $Res Function(IssuePayment) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssuePayment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class IssueDeclaration implements IssueCategory {
  IssueDeclaration({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'declaration';
  factory IssueDeclaration.fromJson(Map<String, dynamic> json) =>
      _$IssueDeclarationFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueDeclarationCopyWith<IssueDeclaration> get copyWith =>
      _$IssueDeclarationCopyWithImpl<IssueDeclaration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueDeclarationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueDeclaration &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.declaration(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueDeclarationCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssueDeclarationCopyWith(
          IssueDeclaration value, $Res Function(IssueDeclaration) _then) =
      _$IssueDeclarationCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueDeclarationCopyWithImpl<$Res>
    implements $IssueDeclarationCopyWith<$Res> {
  _$IssueDeclarationCopyWithImpl(this._self, this._then);

  final IssueDeclaration _self;
  final $Res Function(IssueDeclaration) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssueDeclaration(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class IssueProcurement implements IssueCategory {
  IssueProcurement({required this.id, required this.name, final String? $type})
      : $type = $type ?? 'procurement';
  factory IssueProcurement.fromJson(Map<String, dynamic> json) =>
      _$IssueProcurementFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueProcurementCopyWith<IssueProcurement> get copyWith =>
      _$IssueProcurementCopyWithImpl<IssueProcurement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueProcurementToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueProcurement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'IssueCategory.procurement(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $IssueProcurementCopyWith<$Res>
    implements $IssueCategoryCopyWith<$Res> {
  factory $IssueProcurementCopyWith(
          IssueProcurement value, $Res Function(IssueProcurement) _then) =
      _$IssueProcurementCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$IssueProcurementCopyWithImpl<$Res>
    implements $IssueProcurementCopyWith<$Res> {
  _$IssueProcurementCopyWithImpl(this._self, this._then);

  final IssueProcurement _self;
  final $Res Function(IssueProcurement) _then;

  /// Create a copy of IssueCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(IssueProcurement(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Issue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  List<IssueAttachment> get attachments;
  List<ContractItem> get contractItems;
  List<TransactionItem> get transactionItems;
  List<ProcurementItem> get procurementItems;
  DateTime? get kickoffDate;
  Currency? get currency;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueCopyWith<Issue> get copyWith =>
      _$IssueCopyWithImpl<Issue>(this as Issue, _$identity);

  /// Serializes this Issue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Issue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality()
                .equals(other.contractItems, contractItems) &&
            const DeepCollectionEquality()
                .equals(other.transactionItems, transactionItems) &&
            const DeepCollectionEquality()
                .equals(other.procurementItems, procurementItems) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(contractItems),
      const DeepCollectionEquality().hash(transactionItems),
      const DeepCollectionEquality().hash(procurementItems),
      kickoffDate,
      currency,
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'Issue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, contractItems: $contractItems, transactionItems: $transactionItems, procurementItems: $procurementItems, kickoffDate: $kickoffDate, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $IssueCopyWith<$Res> {
  factory $IssueCopyWith(Issue value, $Res Function(Issue) _then) =
      _$IssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      List<ContractItem> contractItems,
      List<TransactionItem> transactionItems,
      List<ProcurementItem> procurementItems,
      DateTime? kickoffDate,
      Currency? currency,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class _$IssueCopyWithImpl<$Res> implements $IssueCopyWith<$Res> {
  _$IssueCopyWithImpl(this._self, this._then);

  final Issue _self;
  final $Res Function(Issue) _then;

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? contractItems = null,
    Object? transactionItems = null,
    Object? procurementItems = null,
    Object? kickoffDate = freezed,
    Object? currency = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      contractItems: null == contractItems
          ? _self.contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<ContractItem>,
      transactionItems: null == transactionItems
          ? _self.transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      procurementItems: null == procurementItems
          ? _self.procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<ProcurementItem>,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Issue
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

/// Adds pattern-matching-related methods to [Issue].
extension IssuePatterns on Issue {
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
    TResult Function(_Issue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Issue() when $default != null:
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
    TResult Function(_Issue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Issue():
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
    TResult? Function(_Issue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Issue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            List<ContractItem> contractItems,
            List<TransactionItem> transactionItems,
            List<ProcurementItem> procurementItems,
            DateTime? kickoffDate,
            Currency? currency,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Issue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.contractItems,
            _that.transactionItems,
            _that.procurementItems,
            _that.kickoffDate,
            _that.currency,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            List<ContractItem> contractItems,
            List<TransactionItem> transactionItems,
            List<ProcurementItem> procurementItems,
            DateTime? kickoffDate,
            Currency? currency,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Issue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.contractItems,
            _that.transactionItems,
            _that.procurementItems,
            _that.kickoffDate,
            _that.currency,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            List<ContractItem> contractItems,
            List<TransactionItem> transactionItems,
            List<ProcurementItem> procurementItems,
            DateTime? kickoffDate,
            Currency? currency,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Issue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.contractItems,
            _that.transactionItems,
            _that.procurementItems,
            _that.kickoffDate,
            _that.currency,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Issue implements Issue {
  _Issue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      final List<IssueAttachment> attachments = const [],
      final List<ContractItem> contractItems = const [],
      final List<TransactionItem> transactionItems = const [],
      final List<ProcurementItem> procurementItems = const [],
      this.kickoffDate,
      this.currency,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments,
        _contractItems = contractItems,
        _transactionItems = transactionItems,
        _procurementItems = procurementItems;
  factory _Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  final List<ContractItem> _contractItems;
  @override
  @JsonKey()
  List<ContractItem> get contractItems {
    if (_contractItems is EqualUnmodifiableListView) return _contractItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contractItems);
  }

  final List<TransactionItem> _transactionItems;
  @override
  @JsonKey()
  List<TransactionItem> get transactionItems {
    if (_transactionItems is EqualUnmodifiableListView)
      return _transactionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionItems);
  }

  final List<ProcurementItem> _procurementItems;
  @override
  @JsonKey()
  List<ProcurementItem> get procurementItems {
    if (_procurementItems is EqualUnmodifiableListView)
      return _procurementItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_procurementItems);
  }

  @override
  final DateTime? kickoffDate;
  @override
  final Currency? currency;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueCopyWith<_Issue> get copyWith =>
      __$IssueCopyWithImpl<_Issue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Issue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality()
                .equals(other._contractItems, _contractItems) &&
            const DeepCollectionEquality()
                .equals(other._transactionItems, _transactionItems) &&
            const DeepCollectionEquality()
                .equals(other._procurementItems, _procurementItems) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_contractItems),
      const DeepCollectionEquality().hash(_transactionItems),
      const DeepCollectionEquality().hash(_procurementItems),
      kickoffDate,
      currency,
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'Issue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, contractItems: $contractItems, transactionItems: $transactionItems, procurementItems: $procurementItems, kickoffDate: $kickoffDate, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$IssueCopyWith<$Res> implements $IssueCopyWith<$Res> {
  factory _$IssueCopyWith(_Issue value, $Res Function(_Issue) _then) =
      __$IssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      List<ContractItem> contractItems,
      List<TransactionItem> transactionItems,
      List<ProcurementItem> procurementItems,
      DateTime? kickoffDate,
      Currency? currency,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class __$IssueCopyWithImpl<$Res> implements _$IssueCopyWith<$Res> {
  __$IssueCopyWithImpl(this._self, this._then);

  final _Issue _self;
  final $Res Function(_Issue) _then;

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? contractItems = null,
    Object? transactionItems = null,
    Object? procurementItems = null,
    Object? kickoffDate = freezed,
    Object? currency = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_Issue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      contractItems: null == contractItems
          ? _self._contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<ContractItem>,
      transactionItems: null == transactionItems
          ? _self._transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      procurementItems: null == procurementItems
          ? _self._procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<ProcurementItem>,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of Issue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Issue
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
mixin _$IssueAttachment {
  int get id;
  String get filename;
  int get size;
  String get path;
  DateTime get createdAt;

  /// Create a copy of IssueAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueAttachmentCopyWith<IssueAttachment> get copyWith =>
      _$IssueAttachmentCopyWithImpl<IssueAttachment>(
          this as IssueAttachment, _$identity);

  /// Serializes this IssueAttachment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueAttachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, size, path, createdAt);

  @override
  String toString() {
    return 'IssueAttachment(id: $id, filename: $filename, size: $size, path: $path, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $IssueAttachmentCopyWith<$Res> {
  factory $IssueAttachmentCopyWith(
          IssueAttachment value, $Res Function(IssueAttachment) _then) =
      _$IssueAttachmentCopyWithImpl;
  @useResult
  $Res call(
      {int id, String filename, int size, String path, DateTime createdAt});
}

/// @nodoc
class _$IssueAttachmentCopyWithImpl<$Res>
    implements $IssueAttachmentCopyWith<$Res> {
  _$IssueAttachmentCopyWithImpl(this._self, this._then);

  final IssueAttachment _self;
  final $Res Function(IssueAttachment) _then;

  /// Create a copy of IssueAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? size = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [IssueAttachment].
extension IssueAttachmentPatterns on IssueAttachment {
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
    TResult Function(_IssueAttachment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment() when $default != null:
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
    TResult Function(_IssueAttachment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment():
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
    TResult? Function(_IssueAttachment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment() when $default != null:
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
            int id, String filename, int size, String path, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment() when $default != null:
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
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
            int id, String filename, int size, String path, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment():
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
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
            int id, String filename, int size, String path, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IssueAttachment() when $default != null:
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IssueAttachment implements IssueAttachment {
  _IssueAttachment(
      {required this.id,
      required this.filename,
      required this.size,
      required this.path,
      required this.createdAt});
  factory _IssueAttachment.fromJson(Map<String, dynamic> json) =>
      _$IssueAttachmentFromJson(json);

  @override
  final int id;
  @override
  final String filename;
  @override
  final int size;
  @override
  final String path;
  @override
  final DateTime createdAt;

  /// Create a copy of IssueAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueAttachmentCopyWith<_IssueAttachment> get copyWith =>
      __$IssueAttachmentCopyWithImpl<_IssueAttachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueAttachmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueAttachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, size, path, createdAt);

  @override
  String toString() {
    return 'IssueAttachment(id: $id, filename: $filename, size: $size, path: $path, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$IssueAttachmentCopyWith<$Res>
    implements $IssueAttachmentCopyWith<$Res> {
  factory _$IssueAttachmentCopyWith(
          _IssueAttachment value, $Res Function(_IssueAttachment) _then) =
      __$IssueAttachmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String filename, int size, String path, DateTime createdAt});
}

/// @nodoc
class __$IssueAttachmentCopyWithImpl<$Res>
    implements _$IssueAttachmentCopyWith<$Res> {
  __$IssueAttachmentCopyWithImpl(this._self, this._then);

  final _IssueAttachment _self;
  final $Res Function(_IssueAttachment) _then;

  /// Create a copy of IssueAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? size = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_IssueAttachment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ContractItem {
  int? get id;
  String get item;
  String get price;

  /// Create a copy of ContractItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractItemCopyWith<ContractItem> get copyWith =>
      _$ContractItemCopyWithImpl<ContractItem>(
          this as ContractItem, _$identity);

  /// Serializes this ContractItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, price);

  @override
  String toString() {
    return 'ContractItem(id: $id, item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class $ContractItemCopyWith<$Res> {
  factory $ContractItemCopyWith(
          ContractItem value, $Res Function(ContractItem) _then) =
      _$ContractItemCopyWithImpl;
  @useResult
  $Res call({int? id, String item, String price});
}

/// @nodoc
class _$ContractItemCopyWithImpl<$Res> implements $ContractItemCopyWith<$Res> {
  _$ContractItemCopyWithImpl(this._self, this._then);

  final ContractItem _self;
  final $Res Function(ContractItem) _then;

  /// Create a copy of ContractItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContractItem].
extension ContractItemPatterns on ContractItem {
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
    TResult Function(_ContractItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContractItem() when $default != null:
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
    TResult Function(_ContractItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractItem():
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
    TResult? Function(_ContractItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractItem() when $default != null:
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
    TResult Function(int? id, String item, String price)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContractItem() when $default != null:
        return $default(_that.id, _that.item, _that.price);
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
    TResult Function(int? id, String item, String price) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractItem():
        return $default(_that.id, _that.item, _that.price);
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
    TResult? Function(int? id, String item, String price)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractItem() when $default != null:
        return $default(_that.id, _that.item, _that.price);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContractItem implements ContractItem {
  _ContractItem({this.id, required this.item, required this.price});
  factory _ContractItem.fromJson(Map<String, dynamic> json) =>
      _$ContractItemFromJson(json);

  @override
  final int? id;
  @override
  final String item;
  @override
  final String price;

  /// Create a copy of ContractItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractItemCopyWith<_ContractItem> get copyWith =>
      __$ContractItemCopyWithImpl<_ContractItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, price);

  @override
  String toString() {
    return 'ContractItem(id: $id, item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$ContractItemCopyWith<$Res>
    implements $ContractItemCopyWith<$Res> {
  factory _$ContractItemCopyWith(
          _ContractItem value, $Res Function(_ContractItem) _then) =
      __$ContractItemCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String item, String price});
}

/// @nodoc
class __$ContractItemCopyWithImpl<$Res>
    implements _$ContractItemCopyWith<$Res> {
  __$ContractItemCopyWithImpl(this._self, this._then);

  final _ContractItem _self;
  final $Res Function(_ContractItem) _then;

  /// Create a copy of ContractItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_ContractItem(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProcurementItem {
  int? get id;
  String get item;
  String get spec;
  String get quantity;
  String get unitPrice;
  String get totalAmount;
  bool get isOnlinePurchase;
  String? get purchaseUrl;
  Supplier? get supplier;

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcurementItemCopyWith<ProcurementItem> get copyWith =>
      _$ProcurementItemCopyWithImpl<ProcurementItem>(
          this as ProcurementItem, _$identity);

  /// Serializes this ProcurementItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcurementItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, spec, quantity,
      unitPrice, totalAmount, isOnlinePurchase, purchaseUrl, supplier);

  @override
  String toString() {
    return 'ProcurementItem(id: $id, item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplier: $supplier)';
  }
}

/// @nodoc
abstract mixin class $ProcurementItemCopyWith<$Res> {
  factory $ProcurementItemCopyWith(
          ProcurementItem value, $Res Function(ProcurementItem) _then) =
      _$ProcurementItemCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      Supplier? supplier});

  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class _$ProcurementItemCopyWithImpl<$Res>
    implements $ProcurementItemCopyWith<$Res> {
  _$ProcurementItemCopyWithImpl(this._self, this._then);

  final ProcurementItem _self;
  final $Res Function(ProcurementItem) _then;

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplier = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
    ));
  }

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.supplier!, (value) {
      return _then(_self.copyWith(supplier: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProcurementItem].
extension ProcurementItemPatterns on ProcurementItem {
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
    TResult Function(_ProcurementItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem() when $default != null:
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
    TResult Function(_ProcurementItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem():
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
    TResult? Function(_ProcurementItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem() when $default != null:
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            Supplier? supplier)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem() when $default != null:
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplier);
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            Supplier? supplier)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem():
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplier);
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            Supplier? supplier)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementItem() when $default != null:
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplier);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProcurementItem implements ProcurementItem {
  _ProcurementItem(
      {this.id,
      required this.item,
      required this.spec,
      required this.quantity,
      required this.unitPrice,
      required this.totalAmount,
      this.isOnlinePurchase = false,
      this.purchaseUrl,
      this.supplier});
  factory _ProcurementItem.fromJson(Map<String, dynamic> json) =>
      _$ProcurementItemFromJson(json);

  @override
  final int? id;
  @override
  final String item;
  @override
  final String spec;
  @override
  final String quantity;
  @override
  final String unitPrice;
  @override
  final String totalAmount;
  @override
  @JsonKey()
  final bool isOnlinePurchase;
  @override
  final String? purchaseUrl;
  @override
  final Supplier? supplier;

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcurementItemCopyWith<_ProcurementItem> get copyWith =>
      __$ProcurementItemCopyWithImpl<_ProcurementItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcurementItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcurementItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, spec, quantity,
      unitPrice, totalAmount, isOnlinePurchase, purchaseUrl, supplier);

  @override
  String toString() {
    return 'ProcurementItem(id: $id, item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplier: $supplier)';
  }
}

/// @nodoc
abstract mixin class _$ProcurementItemCopyWith<$Res>
    implements $ProcurementItemCopyWith<$Res> {
  factory _$ProcurementItemCopyWith(
          _ProcurementItem value, $Res Function(_ProcurementItem) _then) =
      __$ProcurementItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      Supplier? supplier});

  @override
  $SupplierCopyWith<$Res>? get supplier;
}

/// @nodoc
class __$ProcurementItemCopyWithImpl<$Res>
    implements _$ProcurementItemCopyWith<$Res> {
  __$ProcurementItemCopyWithImpl(this._self, this._then);

  final _ProcurementItem _self;
  final $Res Function(_ProcurementItem) _then;

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplier = freezed,
  }) {
    return _then(_ProcurementItem(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
    ));
  }

  /// Create a copy of ProcurementItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_self.supplier!, (value) {
      return _then(_self.copyWith(supplier: value));
    });
  }
}

/// @nodoc
mixin _$TransactionItemCategory {
  int get id;
  String get name;

  /// Create a copy of TransactionItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionItemCategoryCopyWith<TransactionItemCategory> get copyWith =>
      _$TransactionItemCategoryCopyWithImpl<TransactionItemCategory>(
          this as TransactionItemCategory, _$identity);

  /// Serializes this TransactionItemCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionItemCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'TransactionItemCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $TransactionItemCategoryCopyWith<$Res> {
  factory $TransactionItemCategoryCopyWith(TransactionItemCategory value,
          $Res Function(TransactionItemCategory) _then) =
      _$TransactionItemCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TransactionItemCategoryCopyWithImpl<$Res>
    implements $TransactionItemCategoryCopyWith<$Res> {
  _$TransactionItemCategoryCopyWithImpl(this._self, this._then);

  final TransactionItemCategory _self;
  final $Res Function(TransactionItemCategory) _then;

  /// Create a copy of TransactionItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TransactionItemCategory].
extension TransactionItemCategoryPatterns on TransactionItemCategory {
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
    TResult Function(_TransactionItemCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory() when $default != null:
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
    TResult Function(_TransactionItemCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory():
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
    TResult? Function(_TransactionItemCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItemCategory() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionItemCategory implements TransactionItemCategory {
  _TransactionItemCategory({required this.id, required this.name});
  factory _TransactionItemCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of TransactionItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionItemCategoryCopyWith<_TransactionItemCategory> get copyWith =>
      __$TransactionItemCategoryCopyWithImpl<_TransactionItemCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionItemCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionItemCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'TransactionItemCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$TransactionItemCategoryCopyWith<$Res>
    implements $TransactionItemCategoryCopyWith<$Res> {
  factory _$TransactionItemCategoryCopyWith(_TransactionItemCategory value,
          $Res Function(_TransactionItemCategory) _then) =
      __$TransactionItemCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$TransactionItemCategoryCopyWithImpl<$Res>
    implements _$TransactionItemCategoryCopyWith<$Res> {
  __$TransactionItemCategoryCopyWithImpl(this._self, this._then);

  final _TransactionItemCategory _self;
  final $Res Function(_TransactionItemCategory) _then;

  /// Create a copy of TransactionItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_TransactionItemCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TransactionItem {
  int? get id;
  TransactionItemCategory? get category;
  String get price;
  String get ratio;
  bool get isPaid;
  DateTime? get paidAt;
  String? get note;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      _$TransactionItemCopyWithImpl<TransactionItem>(
          this as TransactionItem, _$identity);

  /// Serializes this TransactionItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, category, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'TransactionItem(id: $id, category: $category, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
          TransactionItem value, $Res Function(TransactionItem) _then) =
      _$TransactionItemCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      TransactionItemCategory? category,
      String price,
      String ratio,
      bool isPaid,
      DateTime? paidAt,
      String? note});

  $TransactionItemCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$TransactionItemCopyWithImpl<$Res>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._self, this._then);

  final TransactionItem _self;
  final $Res Function(TransactionItem) _then;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = null,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionItemCategory?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionItemCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
      return null;
    }

    return $TransactionItemCategoryCopyWith<$Res>(_self.category!, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TransactionItem].
extension TransactionItemPatterns on TransactionItem {
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
    TResult Function(_TransactionItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionItem() when $default != null:
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
    TResult Function(_TransactionItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItem():
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
    TResult? Function(_TransactionItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItem() when $default != null:
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
    TResult Function(int? id, TransactionItemCategory? category, String price,
            String ratio, bool isPaid, DateTime? paidAt, String? note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionItem() when $default != null:
        return $default(_that.id, _that.category, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult Function(int? id, TransactionItemCategory? category, String price,
            String ratio, bool isPaid, DateTime? paidAt, String? note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItem():
        return $default(_that.id, _that.category, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult? Function(int? id, TransactionItemCategory? category, String price,
            String ratio, bool isPaid, DateTime? paidAt, String? note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionItem() when $default != null:
        return $default(_that.id, _that.category, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionItem implements TransactionItem {
  _TransactionItem(
      {this.id,
      this.category,
      required this.price,
      required this.ratio,
      this.isPaid = false,
      this.paidAt,
      this.note});
  factory _TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  @override
  final int? id;
  @override
  final TransactionItemCategory? category;
  @override
  final String price;
  @override
  final String ratio;
  @override
  @JsonKey()
  final bool isPaid;
  @override
  final DateTime? paidAt;
  @override
  final String? note;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionItemCopyWith<_TransactionItem> get copyWith =>
      __$TransactionItemCopyWithImpl<_TransactionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, category, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'TransactionItem(id: $id, category: $category, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$TransactionItemCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$TransactionItemCopyWith(
          _TransactionItem value, $Res Function(_TransactionItem) _then) =
      __$TransactionItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      TransactionItemCategory? category,
      String price,
      String ratio,
      bool isPaid,
      DateTime? paidAt,
      String? note});

  @override
  $TransactionItemCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$TransactionItemCopyWithImpl<$Res>
    implements _$TransactionItemCopyWith<$Res> {
  __$TransactionItemCopyWithImpl(this._self, this._then);

  final _TransactionItem _self;
  final $Res Function(_TransactionItem) _then;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = null,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_TransactionItem(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionItemCategory?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionItemCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
      return null;
    }

    return $TransactionItemCategoryCopyWith<$Res>(_self.category!, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$ContractIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  Currency get currency;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractIssueCopyWith<ContractIssue> get copyWith =>
      _$ContractIssueCopyWithImpl<ContractIssue>(
          this as ContractIssue, _$identity);

  /// Serializes this ContractIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      currency,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'ContractIssue(id: $id, category: $category, user: $user, content: $content, currency: $currency, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $ContractIssueCopyWith<$Res> {
  factory $ContractIssueCopyWith(
          ContractIssue value, $Res Function(ContractIssue) _then) =
      _$ContractIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      Currency currency,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ContractIssueCopyWithImpl<$Res>
    implements $ContractIssueCopyWith<$Res> {
  _$ContractIssueCopyWithImpl(this._self, this._then);

  final ContractIssue _self;
  final $Res Function(ContractIssue) _then;

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? currency = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_self.currency, (value) {
      return _then(_self.copyWith(currency: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContractIssue].
extension ContractIssuePatterns on ContractIssue {
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
    TResult Function(_ContractIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContractIssue() when $default != null:
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
    TResult Function(_ContractIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractIssue():
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
    TResult? Function(_ContractIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContractIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContractIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContractIssue implements ContractIssue {
  _ContractIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      required this.currency,
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments;
  factory _ContractIssue.fromJson(Map<String, dynamic> json) =>
      _$ContractIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  @override
  final Currency currency;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractIssueCopyWith<_ContractIssue> get copyWith =>
      __$ContractIssueCopyWithImpl<_ContractIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      currency,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'ContractIssue(id: $id, category: $category, user: $user, content: $content, currency: $currency, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContractIssueCopyWith<$Res>
    implements $ContractIssueCopyWith<$Res> {
  factory _$ContractIssueCopyWith(
          _ContractIssue value, $Res Function(_ContractIssue) _then) =
      __$ContractIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      Currency currency,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$ContractIssueCopyWithImpl<$Res>
    implements _$ContractIssueCopyWith<$Res> {
  __$ContractIssueCopyWithImpl(this._self, this._then);

  final _ContractIssue _self;
  final $Res Function(_ContractIssue) _then;

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? currency = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_ContractIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of ContractIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_self.currency, (value) {
      return _then(_self.copyWith(currency: value));
    });
  }
}

/// @nodoc
mixin _$KickoffIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  DateTime get kickoffDate;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KickoffIssueCopyWith<KickoffIssue> get copyWith =>
      _$KickoffIssueCopyWithImpl<KickoffIssue>(
          this as KickoffIssue, _$identity);

  /// Serializes this KickoffIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KickoffIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      kickoffDate,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'KickoffIssue(id: $id, category: $category, user: $user, content: $content, kickoffDate: $kickoffDate, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $KickoffIssueCopyWith<$Res> {
  factory $KickoffIssueCopyWith(
          KickoffIssue value, $Res Function(KickoffIssue) _then) =
      _$KickoffIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      DateTime kickoffDate,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$KickoffIssueCopyWithImpl<$Res> implements $KickoffIssueCopyWith<$Res> {
  _$KickoffIssueCopyWithImpl(this._self, this._then);

  final KickoffIssue _self;
  final $Res Function(KickoffIssue) _then;

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? kickoffDate = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      kickoffDate: null == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [KickoffIssue].
extension KickoffIssuePatterns on KickoffIssue {
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
    TResult Function(_KickoffIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue() when $default != null:
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
    TResult Function(_KickoffIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue():
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
    TResult? Function(_KickoffIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            DateTime kickoffDate,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.kickoffDate,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            DateTime kickoffDate,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.kickoffDate,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            DateTime kickoffDate,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KickoffIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.kickoffDate,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KickoffIssue implements KickoffIssue {
  _KickoffIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      required this.kickoffDate,
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments;
  factory _KickoffIssue.fromJson(Map<String, dynamic> json) =>
      _$KickoffIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  @override
  final DateTime kickoffDate;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KickoffIssueCopyWith<_KickoffIssue> get copyWith =>
      __$KickoffIssueCopyWithImpl<_KickoffIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KickoffIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KickoffIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      kickoffDate,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'KickoffIssue(id: $id, category: $category, user: $user, content: $content, kickoffDate: $kickoffDate, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$KickoffIssueCopyWith<$Res>
    implements $KickoffIssueCopyWith<$Res> {
  factory _$KickoffIssueCopyWith(
          _KickoffIssue value, $Res Function(_KickoffIssue) _then) =
      __$KickoffIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      DateTime kickoffDate,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$KickoffIssueCopyWithImpl<$Res>
    implements _$KickoffIssueCopyWith<$Res> {
  __$KickoffIssueCopyWithImpl(this._self, this._then);

  final _KickoffIssue _self;
  final $Res Function(_KickoffIssue) _then;

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? kickoffDate = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_KickoffIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      kickoffDate: null == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of KickoffIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of KickoffIssue
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
mixin _$ProcurementIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  List<ProcurementItem> get procurementItems;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcurementIssueCopyWith<ProcurementIssue> get copyWith =>
      _$ProcurementIssueCopyWithImpl<ProcurementIssue>(
          this as ProcurementIssue, _$identity);

  /// Serializes this ProcurementIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcurementIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.procurementItems, procurementItems) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(procurementItems),
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'ProcurementIssue(id: $id, category: $category, user: $user, content: $content, procurementItems: $procurementItems, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $ProcurementIssueCopyWith<$Res> {
  factory $ProcurementIssueCopyWith(
          ProcurementIssue value, $Res Function(ProcurementIssue) _then) =
      _$ProcurementIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<ProcurementItem> procurementItems,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProcurementIssueCopyWithImpl<$Res>
    implements $ProcurementIssueCopyWith<$Res> {
  _$ProcurementIssueCopyWithImpl(this._self, this._then);

  final ProcurementIssue _self;
  final $Res Function(ProcurementIssue) _then;

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? procurementItems = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      procurementItems: null == procurementItems
          ? _self.procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<ProcurementItem>,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProcurementIssue].
extension ProcurementIssuePatterns on ProcurementIssue {
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
    TResult Function(_ProcurementIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue() when $default != null:
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
    TResult Function(_ProcurementIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue():
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
    TResult? Function(_ProcurementIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<ProcurementItem> procurementItems,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.procurementItems,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<ProcurementItem> procurementItems,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.procurementItems,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<ProcurementItem> procurementItems,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProcurementIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.procurementItems,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProcurementIssue implements ProcurementIssue {
  _ProcurementIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      final List<ProcurementItem> procurementItems = const [],
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _procurementItems = procurementItems,
        _attachments = attachments;
  factory _ProcurementIssue.fromJson(Map<String, dynamic> json) =>
      _$ProcurementIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  final List<ProcurementItem> _procurementItems;
  @override
  @JsonKey()
  List<ProcurementItem> get procurementItems {
    if (_procurementItems is EqualUnmodifiableListView)
      return _procurementItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_procurementItems);
  }

  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcurementIssueCopyWith<_ProcurementIssue> get copyWith =>
      __$ProcurementIssueCopyWithImpl<_ProcurementIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcurementIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcurementIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._procurementItems, _procurementItems) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(_procurementItems),
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'ProcurementIssue(id: $id, category: $category, user: $user, content: $content, procurementItems: $procurementItems, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProcurementIssueCopyWith<$Res>
    implements $ProcurementIssueCopyWith<$Res> {
  factory _$ProcurementIssueCopyWith(
          _ProcurementIssue value, $Res Function(_ProcurementIssue) _then) =
      __$ProcurementIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<ProcurementItem> procurementItems,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$ProcurementIssueCopyWithImpl<$Res>
    implements _$ProcurementIssueCopyWith<$Res> {
  __$ProcurementIssueCopyWithImpl(this._self, this._then);

  final _ProcurementIssue _self;
  final $Res Function(_ProcurementIssue) _then;

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? procurementItems = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_ProcurementIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      procurementItems: null == procurementItems
          ? _self._procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<ProcurementItem>,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ProcurementIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of ProcurementIssue
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
mixin _$TransactionIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  Currency get currency;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionIssueCopyWith<TransactionIssue> get copyWith =>
      _$TransactionIssueCopyWithImpl<TransactionIssue>(
          this as TransactionIssue, _$identity);

  /// Serializes this TransactionIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      currency,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'TransactionIssue(id: $id, category: $category, user: $user, content: $content, currency: $currency, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $TransactionIssueCopyWith<$Res> {
  factory $TransactionIssueCopyWith(
          TransactionIssue value, $Res Function(TransactionIssue) _then) =
      _$TransactionIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      Currency currency,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$TransactionIssueCopyWithImpl<$Res>
    implements $TransactionIssueCopyWith<$Res> {
  _$TransactionIssueCopyWithImpl(this._self, this._then);

  final TransactionIssue _self;
  final $Res Function(TransactionIssue) _then;

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? currency = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_self.currency, (value) {
      return _then(_self.copyWith(currency: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TransactionIssue].
extension TransactionIssuePatterns on TransactionIssue {
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
    TResult Function(_TransactionIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue() when $default != null:
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
    TResult Function(_TransactionIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue():
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
    TResult? Function(_TransactionIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            Currency currency,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.currency,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionIssue implements TransactionIssue {
  _TransactionIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      required this.currency,
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments;
  factory _TransactionIssue.fromJson(Map<String, dynamic> json) =>
      _$TransactionIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  @override
  final Currency currency;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionIssueCopyWith<_TransactionIssue> get copyWith =>
      __$TransactionIssueCopyWithImpl<_TransactionIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      currency,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'TransactionIssue(id: $id, category: $category, user: $user, content: $content, currency: $currency, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$TransactionIssueCopyWith<$Res>
    implements $TransactionIssueCopyWith<$Res> {
  factory _$TransactionIssueCopyWith(
          _TransactionIssue value, $Res Function(_TransactionIssue) _then) =
      __$TransactionIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      Currency currency,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$TransactionIssueCopyWithImpl<$Res>
    implements _$TransactionIssueCopyWith<$Res> {
  __$TransactionIssueCopyWithImpl(this._self, this._then);

  final _TransactionIssue _self;
  final $Res Function(_TransactionIssue) _then;

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? currency = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_TransactionIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_self.currency, (value) {
      return _then(_self.copyWith(currency: value));
    });
  }
}

/// @nodoc
mixin _$PaymentIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentIssueCopyWith<PaymentIssue> get copyWith =>
      _$PaymentIssueCopyWithImpl<PaymentIssue>(
          this as PaymentIssue, _$identity);

  /// Serializes this PaymentIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'PaymentIssue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $PaymentIssueCopyWith<$Res> {
  factory $PaymentIssueCopyWith(
          PaymentIssue value, $Res Function(PaymentIssue) _then) =
      _$PaymentIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PaymentIssueCopyWithImpl<$Res> implements $PaymentIssueCopyWith<$Res> {
  _$PaymentIssueCopyWithImpl(this._self, this._then);

  final PaymentIssue _self;
  final $Res Function(PaymentIssue) _then;

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PaymentIssue].
extension PaymentIssuePatterns on PaymentIssue {
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
    TResult Function(_PaymentIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue() when $default != null:
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
    TResult Function(_PaymentIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue():
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
    TResult? Function(_PaymentIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentIssue implements PaymentIssue {
  _PaymentIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments;
  factory _PaymentIssue.fromJson(Map<String, dynamic> json) =>
      _$PaymentIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentIssueCopyWith<_PaymentIssue> get copyWith =>
      __$PaymentIssueCopyWithImpl<_PaymentIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'PaymentIssue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentIssueCopyWith<$Res>
    implements $PaymentIssueCopyWith<$Res> {
  factory _$PaymentIssueCopyWith(
          _PaymentIssue value, $Res Function(_PaymentIssue) _then) =
      __$PaymentIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$PaymentIssueCopyWithImpl<$Res>
    implements _$PaymentIssueCopyWith<$Res> {
  __$PaymentIssueCopyWithImpl(this._self, this._then);

  final _PaymentIssue _self;
  final $Res Function(_PaymentIssue) _then;

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_PaymentIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of PaymentIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of PaymentIssue
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
mixin _$DeclarationIssue {
  int get id;
  IssueCategory get category;
  User get user;
  String get content;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeclarationIssueCopyWith<DeclarationIssue> get copyWith =>
      _$DeclarationIssueCopyWithImpl<DeclarationIssue>(
          this as DeclarationIssue, _$identity);

  /// Serializes this DeclarationIssue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeclarationIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'DeclarationIssue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $DeclarationIssueCopyWith<$Res> {
  factory $DeclarationIssueCopyWith(
          DeclarationIssue value, $Res Function(DeclarationIssue) _then) =
      _$DeclarationIssueCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $IssueCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$DeclarationIssueCopyWithImpl<$Res>
    implements $DeclarationIssueCopyWith<$Res> {
  _$DeclarationIssueCopyWithImpl(this._self, this._then);

  final DeclarationIssue _self;
  final $Res Function(DeclarationIssue) _then;

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeclarationIssue].
extension DeclarationIssuePatterns on DeclarationIssue {
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
    TResult Function(_DeclarationIssue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue() when $default != null:
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
    TResult Function(_DeclarationIssue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue():
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
    TResult? Function(_DeclarationIssue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue() when $default != null:
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue():
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            IssueCategory category,
            User user,
            String content,
            List<IssueAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeclarationIssue() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.user,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeclarationIssue implements DeclarationIssue {
  _DeclarationIssue(
      {required this.id,
      required this.category,
      required this.user,
      required this.content,
      final List<IssueAttachment> attachments = const [],
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _attachments = attachments;
  factory _DeclarationIssue.fromJson(Map<String, dynamic> json) =>
      _$DeclarationIssueFromJson(json);

  @override
  final int id;
  @override
  final IssueCategory category;
  @override
  final User user;
  @override
  final String content;
  final List<IssueAttachment> _attachments;
  @override
  @JsonKey()
  List<IssueAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeclarationIssueCopyWith<_DeclarationIssue> get copyWith =>
      __$DeclarationIssueCopyWithImpl<_DeclarationIssue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeclarationIssueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeclarationIssue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      user,
      content,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'DeclarationIssue(id: $id, category: $category, user: $user, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$DeclarationIssueCopyWith<$Res>
    implements $DeclarationIssueCopyWith<$Res> {
  factory _$DeclarationIssueCopyWith(
          _DeclarationIssue value, $Res Function(_DeclarationIssue) _then) =
      __$DeclarationIssueCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      IssueCategory category,
      User user,
      String content,
      List<IssueAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $IssueCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$DeclarationIssueCopyWithImpl<$Res>
    implements _$DeclarationIssueCopyWith<$Res> {
  __$DeclarationIssueCopyWithImpl(this._self, this._then);

  final _DeclarationIssue _self;
  final $Res Function(_DeclarationIssue) _then;

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? user = null,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_DeclarationIssue(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IssueCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<IssueAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of DeclarationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res> get category {
    return $IssueCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of DeclarationIssue
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
mixin _$Project {
  int get id;
  String get code;
  String get name;
  int get views;
  User get user;
  User? get manager;
  IssueCategory? get latestCategory;
  bool get isPreexecuted;
  bool get isContracted;
  bool get isClosed;
  String? get closureMessage;
  bool get isBookmarked;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;
  List<Client> get clients;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<Project> get copyWith =>
      _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Project &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.latestCategory, latestCategory) ||
                other.latestCategory == latestCategory) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isContracted, isContracted) ||
                other.isContracted == isContracted) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closureMessage, closureMessage) ||
                other.closureMessage == closureMessage) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            const DeepCollectionEquality().equals(other.clients, clients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      views,
      user,
      manager,
      latestCategory,
      isPreexecuted,
      isContracted,
      isClosed,
      closureMessage,
      isBookmarked,
      createdAt,
      updatedAt,
      deletedAt,
      const DeepCollectionEquality().hash(clients));

  @override
  String toString() {
    return 'Project(id: $id, code: $code, name: $name, views: $views, user: $user, manager: $manager, latestCategory: $latestCategory, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isClosed: $isClosed, closureMessage: $closureMessage, isBookmarked: $isBookmarked, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, clients: $clients)';
  }
}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) =
      _$ProjectCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int views,
      User user,
      User? manager,
      IssueCategory? latestCategory,
      bool isPreexecuted,
      bool isContracted,
      bool isClosed,
      String? closureMessage,
      bool isBookmarked,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt,
      List<Client> clients});

  $UserCopyWith<$Res> get user;
  $UserCopyWith<$Res>? get manager;
  $IssueCategoryCopyWith<$Res>? get latestCategory;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? views = null,
    Object? user = null,
    Object? manager = freezed,
    Object? latestCategory = freezed,
    Object? isPreexecuted = null,
    Object? isContracted = null,
    Object? isClosed = null,
    Object? closureMessage = freezed,
    Object? isBookmarked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? clients = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as User?,
      latestCategory: freezed == latestCategory
          ? _self.latestCategory
          : latestCategory // ignore: cast_nullable_to_non_nullable
              as IssueCategory?,
      isPreexecuted: null == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isContracted: null == isContracted
          ? _self.isContracted
          : isContracted // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      closureMessage: freezed == closureMessage
          ? _self.closureMessage
          : closureMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: null == isBookmarked
          ? _self.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
    ));
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Project
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

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res>? get latestCategory {
    if (_self.latestCategory == null) {
      return null;
    }

    return $IssueCategoryCopyWith<$Res>(_self.latestCategory!, (value) {
      return _then(_self.copyWith(latestCategory: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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
    TResult Function(_Project value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
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
    TResult Function(_Project value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project():
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
    TResult? Function(_Project value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
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
            int id,
            String code,
            String name,
            int views,
            User user,
            User? manager,
            IssueCategory? latestCategory,
            bool isPreexecuted,
            bool isContracted,
            bool isClosed,
            String? closureMessage,
            bool isBookmarked,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt,
            List<Client> clients)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(
            _that.id,
            _that.code,
            _that.name,
            _that.views,
            _that.user,
            _that.manager,
            _that.latestCategory,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isClosed,
            _that.closureMessage,
            _that.isBookmarked,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt,
            _that.clients);
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
            int id,
            String code,
            String name,
            int views,
            User user,
            User? manager,
            IssueCategory? latestCategory,
            bool isPreexecuted,
            bool isContracted,
            bool isClosed,
            String? closureMessage,
            bool isBookmarked,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt,
            List<Client> clients)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project():
        return $default(
            _that.id,
            _that.code,
            _that.name,
            _that.views,
            _that.user,
            _that.manager,
            _that.latestCategory,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isClosed,
            _that.closureMessage,
            _that.isBookmarked,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt,
            _that.clients);
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
            int id,
            String code,
            String name,
            int views,
            User user,
            User? manager,
            IssueCategory? latestCategory,
            bool isPreexecuted,
            bool isContracted,
            bool isClosed,
            String? closureMessage,
            bool isBookmarked,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt,
            List<Client> clients)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(
            _that.id,
            _that.code,
            _that.name,
            _that.views,
            _that.user,
            _that.manager,
            _that.latestCategory,
            _that.isPreexecuted,
            _that.isContracted,
            _that.isClosed,
            _that.closureMessage,
            _that.isBookmarked,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt,
            _that.clients);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Project implements Project {
  _Project(
      {required this.id,
      required this.code,
      required this.name,
      required this.views,
      required this.user,
      this.manager,
      required this.latestCategory,
      required this.isPreexecuted,
      required this.isContracted,
      required this.isClosed,
      this.closureMessage,
      required this.isBookmarked,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required final List<Client> clients})
      : _clients = clients;
  factory _Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final int views;
  @override
  final User user;
  @override
  final User? manager;
  @override
  final IssueCategory? latestCategory;
  @override
  final bool isPreexecuted;
  @override
  final bool isContracted;
  @override
  final bool isClosed;
  @override
  final String? closureMessage;
  @override
  final bool isBookmarked;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;
  final List<Client> _clients;
  @override
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.latestCategory, latestCategory) ||
                other.latestCategory == latestCategory) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isContracted, isContracted) ||
                other.isContracted == isContracted) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closureMessage, closureMessage) ||
                other.closureMessage == closureMessage) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            const DeepCollectionEquality().equals(other._clients, _clients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      views,
      user,
      manager,
      latestCategory,
      isPreexecuted,
      isContracted,
      isClosed,
      closureMessage,
      isBookmarked,
      createdAt,
      updatedAt,
      deletedAt,
      const DeepCollectionEquality().hash(_clients));

  @override
  String toString() {
    return 'Project(id: $id, code: $code, name: $name, views: $views, user: $user, manager: $manager, latestCategory: $latestCategory, isPreexecuted: $isPreexecuted, isContracted: $isContracted, isClosed: $isClosed, closureMessage: $closureMessage, isBookmarked: $isBookmarked, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, clients: $clients)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) =
      __$ProjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      int views,
      User user,
      User? manager,
      IssueCategory? latestCategory,
      bool isPreexecuted,
      bool isContracted,
      bool isClosed,
      String? closureMessage,
      bool isBookmarked,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt,
      List<Client> clients});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $UserCopyWith<$Res>? get manager;
  @override
  $IssueCategoryCopyWith<$Res>? get latestCategory;
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? views = null,
    Object? user = null,
    Object? manager = freezed,
    Object? latestCategory = freezed,
    Object? isPreexecuted = null,
    Object? isContracted = null,
    Object? isClosed = null,
    Object? closureMessage = freezed,
    Object? isBookmarked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? clients = null,
  }) {
    return _then(_Project(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as User?,
      latestCategory: freezed == latestCategory
          ? _self.latestCategory
          : latestCategory // ignore: cast_nullable_to_non_nullable
              as IssueCategory?,
      isPreexecuted: null == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isContracted: null == isContracted
          ? _self.isContracted
          : isContracted // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      closureMessage: freezed == closureMessage
          ? _self.closureMessage
          : closureMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: null == isBookmarked
          ? _self.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clients: null == clients
          ? _self._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
    ));
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Project
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

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueCategoryCopyWith<$Res>? get latestCategory {
    if (_self.latestCategory == null) {
      return null;
    }

    return $IssueCategoryCopyWith<$Res>(_self.latestCategory!, (value) {
      return _then(_self.copyWith(latestCategory: value));
    });
  }
}

/// @nodoc
mixin _$ProjectSummary {
  int get total;
  int get closed;
  int get kickedOff;
  int get active;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectSummaryCopyWith<ProjectSummary> get copyWith =>
      _$ProjectSummaryCopyWithImpl<ProjectSummary>(
          this as ProjectSummary, _$identity);

  /// Serializes this ProjectSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectSummary &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.closed, closed) || other.closed == closed) &&
            (identical(other.kickedOff, kickedOff) ||
                other.kickedOff == kickedOff) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, closed, kickedOff, active);

  @override
  String toString() {
    return 'ProjectSummary(total: $total, closed: $closed, kickedOff: $kickedOff, active: $active)';
  }
}

/// @nodoc
abstract mixin class $ProjectSummaryCopyWith<$Res> {
  factory $ProjectSummaryCopyWith(
          ProjectSummary value, $Res Function(ProjectSummary) _then) =
      _$ProjectSummaryCopyWithImpl;
  @useResult
  $Res call({int total, int closed, int kickedOff, int active});
}

/// @nodoc
class _$ProjectSummaryCopyWithImpl<$Res>
    implements $ProjectSummaryCopyWith<$Res> {
  _$ProjectSummaryCopyWithImpl(this._self, this._then);

  final ProjectSummary _self;
  final $Res Function(ProjectSummary) _then;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? closed = null,
    Object? kickedOff = null,
    Object? active = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      closed: null == closed
          ? _self.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as int,
      kickedOff: null == kickedOff
          ? _self.kickedOff
          : kickedOff // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectSummary].
extension ProjectSummaryPatterns on ProjectSummary {
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
    TResult Function(_ProjectSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary() when $default != null:
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
    TResult Function(_ProjectSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary():
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
    TResult? Function(_ProjectSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary() when $default != null:
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
    TResult Function(int total, int closed, int kickedOff, int active)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary() when $default != null:
        return $default(
            _that.total, _that.closed, _that.kickedOff, _that.active);
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
    TResult Function(int total, int closed, int kickedOff, int active) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary():
        return $default(
            _that.total, _that.closed, _that.kickedOff, _that.active);
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
    TResult? Function(int total, int closed, int kickedOff, int active)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectSummary() when $default != null:
        return $default(
            _that.total, _that.closed, _that.kickedOff, _that.active);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectSummary implements ProjectSummary {
  _ProjectSummary(
      {required this.total,
      required this.closed,
      required this.kickedOff,
      required this.active});
  factory _ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);

  @override
  final int total;
  @override
  final int closed;
  @override
  final int kickedOff;
  @override
  final int active;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectSummaryCopyWith<_ProjectSummary> get copyWith =>
      __$ProjectSummaryCopyWithImpl<_ProjectSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectSummary &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.closed, closed) || other.closed == closed) &&
            (identical(other.kickedOff, kickedOff) ||
                other.kickedOff == kickedOff) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, closed, kickedOff, active);

  @override
  String toString() {
    return 'ProjectSummary(total: $total, closed: $closed, kickedOff: $kickedOff, active: $active)';
  }
}

/// @nodoc
abstract mixin class _$ProjectSummaryCopyWith<$Res>
    implements $ProjectSummaryCopyWith<$Res> {
  factory _$ProjectSummaryCopyWith(
          _ProjectSummary value, $Res Function(_ProjectSummary) _then) =
      __$ProjectSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int closed, int kickedOff, int active});
}

/// @nodoc
class __$ProjectSummaryCopyWithImpl<$Res>
    implements _$ProjectSummaryCopyWith<$Res> {
  __$ProjectSummaryCopyWithImpl(this._self, this._then);

  final _ProjectSummary _self;
  final $Res Function(_ProjectSummary) _then;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? closed = null,
    Object? kickedOff = null,
    Object? active = null,
  }) {
    return _then(_ProjectSummary(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      closed: null == closed
          ? _self.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as int,
      kickedOff: null == kickedOff
          ? _self.kickedOff
          : kickedOff // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Client {
  int get id;
  String get name;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientCopyWith<Client> get copyWith =>
      _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Client &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Client(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res> implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
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
    TResult Function(_Client value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
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
    TResult Function(_Client value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
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
    TResult? Function(_Client value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  _Client({required this.id, required this.name});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Client &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Client(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$ClientCopyWithImpl<$Res> implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_Client(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ClientGroup {
  int get depth;
  int? get parentId;
  List<Client> get items;

  /// Create a copy of ClientGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientGroupCopyWith<ClientGroup> get copyWith =>
      _$ClientGroupCopyWithImpl<ClientGroup>(this as ClientGroup, _$identity);

  /// Serializes this ClientGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientGroup &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, depth, parentId, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ClientGroup(depth: $depth, parentId: $parentId, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ClientGroupCopyWith<$Res> {
  factory $ClientGroupCopyWith(
          ClientGroup value, $Res Function(ClientGroup) _then) =
      _$ClientGroupCopyWithImpl;
  @useResult
  $Res call({int depth, int? parentId, List<Client> items});
}

/// @nodoc
class _$ClientGroupCopyWithImpl<$Res> implements $ClientGroupCopyWith<$Res> {
  _$ClientGroupCopyWithImpl(this._self, this._then);

  final ClientGroup _self;
  final $Res Function(ClientGroup) _then;

  /// Create a copy of ClientGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depth = null,
    Object? parentId = freezed,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Client>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ClientGroup].
extension ClientGroupPatterns on ClientGroup {
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
    TResult Function(_ClientGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientGroup() when $default != null:
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
    TResult Function(_ClientGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientGroup():
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
    TResult? Function(_ClientGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientGroup() when $default != null:
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
    TResult Function(int depth, int? parentId, List<Client> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientGroup() when $default != null:
        return $default(_that.depth, _that.parentId, _that.items);
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
    TResult Function(int depth, int? parentId, List<Client> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientGroup():
        return $default(_that.depth, _that.parentId, _that.items);
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
    TResult? Function(int depth, int? parentId, List<Client> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientGroup() when $default != null:
        return $default(_that.depth, _that.parentId, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ClientGroup implements ClientGroup {
  _ClientGroup(
      {required this.depth, this.parentId, required final List<Client> items})
      : _items = items;
  factory _ClientGroup.fromJson(Map<String, dynamic> json) =>
      _$ClientGroupFromJson(json);

  @override
  final int depth;
  @override
  final int? parentId;
  final List<Client> _items;
  @override
  List<Client> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ClientGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientGroupCopyWith<_ClientGroup> get copyWith =>
      __$ClientGroupCopyWithImpl<_ClientGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientGroup &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, depth, parentId,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ClientGroup(depth: $depth, parentId: $parentId, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ClientGroupCopyWith<$Res>
    implements $ClientGroupCopyWith<$Res> {
  factory _$ClientGroupCopyWith(
          _ClientGroup value, $Res Function(_ClientGroup) _then) =
      __$ClientGroupCopyWithImpl;
  @override
  @useResult
  $Res call({int depth, int? parentId, List<Client> items});
}

/// @nodoc
class __$ClientGroupCopyWithImpl<$Res> implements _$ClientGroupCopyWith<$Res> {
  __$ClientGroupCopyWithImpl(this._self, this._then);

  final _ClientGroup _self;
  final $Res Function(_ClientGroup) _then;

  /// Create a copy of ClientGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? depth = null,
    Object? parentId = freezed,
    Object? items = null,
  }) {
    return _then(_ClientGroup(
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Client>,
    ));
  }
}

/// @nodoc
mixin _$ProjectStats {
  int get valid;
  int get total;
  User get user;

  /// Create a copy of ProjectStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectStatsCopyWith<ProjectStats> get copyWith =>
      _$ProjectStatsCopyWithImpl<ProjectStats>(
          this as ProjectStats, _$identity);

  /// Serializes this ProjectStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectStats &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valid, total, user);

  @override
  String toString() {
    return 'ProjectStats(valid: $valid, total: $total, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ProjectStatsCopyWith<$Res> {
  factory $ProjectStatsCopyWith(
          ProjectStats value, $Res Function(ProjectStats) _then) =
      _$ProjectStatsCopyWithImpl;
  @useResult
  $Res call({int valid, int total, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProjectStatsCopyWithImpl<$Res> implements $ProjectStatsCopyWith<$Res> {
  _$ProjectStatsCopyWithImpl(this._self, this._then);

  final ProjectStats _self;
  final $Res Function(ProjectStats) _then;

  /// Create a copy of ProjectStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? total = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of ProjectStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProjectStats].
extension ProjectStatsPatterns on ProjectStats {
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
    TResult Function(_ProjectStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectStats() when $default != null:
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
    TResult Function(_ProjectStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStats():
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
    TResult? Function(_ProjectStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStats() when $default != null:
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
    TResult Function(int valid, int total, User user)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectStats() when $default != null:
        return $default(_that.valid, _that.total, _that.user);
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
    TResult Function(int valid, int total, User user) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStats():
        return $default(_that.valid, _that.total, _that.user);
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
    TResult? Function(int valid, int total, User user)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectStats() when $default != null:
        return $default(_that.valid, _that.total, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectStats implements ProjectStats {
  _ProjectStats({required this.valid, required this.total, required this.user});
  factory _ProjectStats.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatsFromJson(json);

  @override
  final int valid;
  @override
  final int total;
  @override
  final User user;

  /// Create a copy of ProjectStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectStatsCopyWith<_ProjectStats> get copyWith =>
      __$ProjectStatsCopyWithImpl<_ProjectStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectStats &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valid, total, user);

  @override
  String toString() {
    return 'ProjectStats(valid: $valid, total: $total, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$ProjectStatsCopyWith<$Res>
    implements $ProjectStatsCopyWith<$Res> {
  factory _$ProjectStatsCopyWith(
          _ProjectStats value, $Res Function(_ProjectStats) _then) =
      __$ProjectStatsCopyWithImpl;
  @override
  @useResult
  $Res call({int valid, int total, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$ProjectStatsCopyWithImpl<$Res>
    implements _$ProjectStatsCopyWith<$Res> {
  __$ProjectStatsCopyWithImpl(this._self, this._then);

  final _ProjectStats _self;
  final $Res Function(_ProjectStats) _then;

  /// Create a copy of ProjectStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valid = null,
    Object? total = null,
    Object? user = null,
  }) {
    return _then(_ProjectStats(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of ProjectStats
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
mixin _$ProjectItemCount {
  int get contracts;
  int get declarations;
  int get procurements;
  int get reports;

  /// Create a copy of ProjectItemCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectItemCountCopyWith<ProjectItemCount> get copyWith =>
      _$ProjectItemCountCopyWithImpl<ProjectItemCount>(
          this as ProjectItemCount, _$identity);

  /// Serializes this ProjectItemCount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectItemCount &&
            (identical(other.contracts, contracts) ||
                other.contracts == contracts) &&
            (identical(other.declarations, declarations) ||
                other.declarations == declarations) &&
            (identical(other.procurements, procurements) ||
                other.procurements == procurements) &&
            (identical(other.reports, reports) || other.reports == reports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contracts, declarations, procurements, reports);

  @override
  String toString() {
    return 'ProjectItemCount(contracts: $contracts, declarations: $declarations, procurements: $procurements, reports: $reports)';
  }
}

/// @nodoc
abstract mixin class $ProjectItemCountCopyWith<$Res> {
  factory $ProjectItemCountCopyWith(
          ProjectItemCount value, $Res Function(ProjectItemCount) _then) =
      _$ProjectItemCountCopyWithImpl;
  @useResult
  $Res call({int contracts, int declarations, int procurements, int reports});
}

/// @nodoc
class _$ProjectItemCountCopyWithImpl<$Res>
    implements $ProjectItemCountCopyWith<$Res> {
  _$ProjectItemCountCopyWithImpl(this._self, this._then);

  final ProjectItemCount _self;
  final $Res Function(ProjectItemCount) _then;

  /// Create a copy of ProjectItemCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contracts = null,
    Object? declarations = null,
    Object? procurements = null,
    Object? reports = null,
  }) {
    return _then(_self.copyWith(
      contracts: null == contracts
          ? _self.contracts
          : contracts // ignore: cast_nullable_to_non_nullable
              as int,
      declarations: null == declarations
          ? _self.declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as int,
      procurements: null == procurements
          ? _self.procurements
          : procurements // ignore: cast_nullable_to_non_nullable
              as int,
      reports: null == reports
          ? _self.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectItemCount].
extension ProjectItemCountPatterns on ProjectItemCount {
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
    TResult Function(_ProjectItemCount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount() when $default != null:
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
    TResult Function(_ProjectItemCount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount():
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
    TResult? Function(_ProjectItemCount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount() when $default != null:
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
            int contracts, int declarations, int procurements, int reports)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount() when $default != null:
        return $default(_that.contracts, _that.declarations, _that.procurements,
            _that.reports);
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
            int contracts, int declarations, int procurements, int reports)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount():
        return $default(_that.contracts, _that.declarations, _that.procurements,
            _that.reports);
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
            int contracts, int declarations, int procurements, int reports)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemCount() when $default != null:
        return $default(_that.contracts, _that.declarations, _that.procurements,
            _that.reports);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectItemCount implements ProjectItemCount {
  _ProjectItemCount(
      {this.contracts = 0,
      this.declarations = 0,
      this.procurements = 0,
      this.reports = 0});
  factory _ProjectItemCount.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemCountFromJson(json);

  @override
  @JsonKey()
  final int contracts;
  @override
  @JsonKey()
  final int declarations;
  @override
  @JsonKey()
  final int procurements;
  @override
  @JsonKey()
  final int reports;

  /// Create a copy of ProjectItemCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectItemCountCopyWith<_ProjectItemCount> get copyWith =>
      __$ProjectItemCountCopyWithImpl<_ProjectItemCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectItemCountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectItemCount &&
            (identical(other.contracts, contracts) ||
                other.contracts == contracts) &&
            (identical(other.declarations, declarations) ||
                other.declarations == declarations) &&
            (identical(other.procurements, procurements) ||
                other.procurements == procurements) &&
            (identical(other.reports, reports) || other.reports == reports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contracts, declarations, procurements, reports);

  @override
  String toString() {
    return 'ProjectItemCount(contracts: $contracts, declarations: $declarations, procurements: $procurements, reports: $reports)';
  }
}

/// @nodoc
abstract mixin class _$ProjectItemCountCopyWith<$Res>
    implements $ProjectItemCountCopyWith<$Res> {
  factory _$ProjectItemCountCopyWith(
          _ProjectItemCount value, $Res Function(_ProjectItemCount) _then) =
      __$ProjectItemCountCopyWithImpl;
  @override
  @useResult
  $Res call({int contracts, int declarations, int procurements, int reports});
}

/// @nodoc
class __$ProjectItemCountCopyWithImpl<$Res>
    implements _$ProjectItemCountCopyWith<$Res> {
  __$ProjectItemCountCopyWithImpl(this._self, this._then);

  final _ProjectItemCount _self;
  final $Res Function(_ProjectItemCount) _then;

  /// Create a copy of ProjectItemCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? contracts = null,
    Object? declarations = null,
    Object? procurements = null,
    Object? reports = null,
  }) {
    return _then(_ProjectItemCount(
      contracts: null == contracts
          ? _self.contracts
          : contracts // ignore: cast_nullable_to_non_nullable
              as int,
      declarations: null == declarations
          ? _self.declarations
          : declarations // ignore: cast_nullable_to_non_nullable
              as int,
      procurements: null == procurements
          ? _self.procurements
          : procurements // ignore: cast_nullable_to_non_nullable
              as int,
      reports: null == reports
          ? _self.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$LoginRequest {
  String get email;
  String get password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      _$LoginRequestCopyWithImpl<LoginRequest>(
          this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) _then) =
      _$LoginRequestCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res> implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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
    TResult Function(_LoginRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequest() when $default != null:
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
    TResult Function(_LoginRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginRequest():
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
    TResult? Function(_LoginRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginRequest() when $default != null:
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
    TResult Function(String email, String password)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequest() when $default != null:
        return $default(_that.email, _that.password);
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
    TResult Function(String email, String password) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginRequest():
        return $default(_that.email, _that.password);
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
    TResult? Function(String email, String password)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginRequest() when $default != null:
        return $default(_that.email, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginRequest implements LoginRequest {
  _LoginRequest({required this.email, required this.password});
  factory _LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginRequestCopyWith<_LoginRequest> get copyWith =>
      __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(
          _LoginRequest value, $Res Function(_LoginRequest) _then) =
      __$LoginRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_LoginRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RegisterRequest {
  String get username;
  String get email;
  String get password;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      _$RegisterRequestCopyWithImpl<RegisterRequest>(
          this as RegisterRequest, _$identity);

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterRequest &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password);

  @override
  String toString() {
    return 'RegisterRequest(username: $username, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
          RegisterRequest value, $Res Function(RegisterRequest) _then) =
      _$RegisterRequestCopyWithImpl;
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._self, this._then);

  final RegisterRequest _self;
  final $Res Function(RegisterRequest) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RegisterRequest].
extension RegisterRequestPatterns on RegisterRequest {
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
    TResult Function(_RegisterRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest() when $default != null:
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
    TResult Function(_RegisterRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest():
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
    TResult? Function(_RegisterRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest() when $default != null:
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
    TResult Function(String username, String email, String password)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest() when $default != null:
        return $default(_that.username, _that.email, _that.password);
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
    TResult Function(String username, String email, String password) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest():
        return $default(_that.username, _that.email, _that.password);
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
    TResult? Function(String username, String email, String password)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterRequest() when $default != null:
        return $default(_that.username, _that.email, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RegisterRequest implements RegisterRequest {
  _RegisterRequest(
      {required this.username, required this.email, required this.password});
  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestCopyWith<_RegisterRequest> get copyWith =>
      __$RegisterRequestCopyWithImpl<_RegisterRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequest &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password);

  @override
  String toString() {
    return 'RegisterRequest(username: $username, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$RegisterRequestCopyWith(
          _RegisterRequest value, $Res Function(_RegisterRequest) _then) =
      __$RegisterRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class __$RegisterRequestCopyWithImpl<$Res>
    implements _$RegisterRequestCopyWith<$Res> {
  __$RegisterRequestCopyWithImpl(this._self, this._then);

  final _RegisterRequest _self;
  final $Res Function(_RegisterRequest) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_RegisterRequest(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ForgotPasswordRequest {
  String get email;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPasswordRequestCopyWith<ForgotPasswordRequest> get copyWith =>
      _$ForgotPasswordRequestCopyWithImpl<ForgotPasswordRequest>(
          this as ForgotPasswordRequest, _$identity);

  /// Serializes this ForgotPasswordRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPasswordRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'ForgotPasswordRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class $ForgotPasswordRequestCopyWith<$Res> {
  factory $ForgotPasswordRequestCopyWith(ForgotPasswordRequest value,
          $Res Function(ForgotPasswordRequest) _then) =
      _$ForgotPasswordRequestCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestCopyWithImpl<$Res>
    implements $ForgotPasswordRequestCopyWith<$Res> {
  _$ForgotPasswordRequestCopyWithImpl(this._self, this._then);

  final ForgotPasswordRequest _self;
  final $Res Function(ForgotPasswordRequest) _then;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ForgotPasswordRequest].
extension ForgotPasswordRequestPatterns on ForgotPasswordRequest {
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
    TResult Function(_ForgotPasswordRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest() when $default != null:
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
    TResult Function(_ForgotPasswordRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest():
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
    TResult? Function(_ForgotPasswordRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest() when $default != null:
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
    TResult Function(String email)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest() when $default != null:
        return $default(_that.email);
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
    TResult Function(String email) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest():
        return $default(_that.email);
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
    TResult? Function(String email)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPasswordRequest() when $default != null:
        return $default(_that.email);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPasswordRequest implements ForgotPasswordRequest {
  _ForgotPasswordRequest({required this.email});
  factory _ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  @override
  final String email;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPasswordRequestCopyWith<_ForgotPasswordRequest> get copyWith =>
      __$ForgotPasswordRequestCopyWithImpl<_ForgotPasswordRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPasswordRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPasswordRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'ForgotPasswordRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPasswordRequestCopyWith<$Res>
    implements $ForgotPasswordRequestCopyWith<$Res> {
  factory _$ForgotPasswordRequestCopyWith(_ForgotPasswordRequest value,
          $Res Function(_ForgotPasswordRequest) _then) =
      __$ForgotPasswordRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$ForgotPasswordRequestCopyWithImpl<$Res>
    implements _$ForgotPasswordRequestCopyWith<$Res> {
  __$ForgotPasswordRequestCopyWithImpl(this._self, this._then);

  final _ForgotPasswordRequest _self;
  final $Res Function(_ForgotPasswordRequest) _then;

  /// Create a copy of ForgotPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_ForgotPasswordRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ResetPasswordRequest {
  String get token;
  String get newPassword;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResetPasswordRequestCopyWith<ResetPasswordRequest> get copyWith =>
      _$ResetPasswordRequestCopyWithImpl<ResetPasswordRequest>(
          this as ResetPasswordRequest, _$identity);

  /// Serializes this ResetPasswordRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResetPasswordRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  @override
  String toString() {
    return 'ResetPasswordRequest(token: $token, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $ResetPasswordRequestCopyWith<$Res> {
  factory $ResetPasswordRequestCopyWith(ResetPasswordRequest value,
          $Res Function(ResetPasswordRequest) _then) =
      _$ResetPasswordRequestCopyWithImpl;
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  _$ResetPasswordRequestCopyWithImpl(this._self, this._then);

  final ResetPasswordRequest _self;
  final $Res Function(ResetPasswordRequest) _then;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResetPasswordRequest].
extension ResetPasswordRequestPatterns on ResetPasswordRequest {
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
    TResult Function(_ResetPasswordRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest() when $default != null:
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
    TResult Function(_ResetPasswordRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest():
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
    TResult? Function(_ResetPasswordRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest() when $default != null:
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
    TResult Function(String token, String newPassword)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest() when $default != null:
        return $default(_that.token, _that.newPassword);
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
    TResult Function(String token, String newPassword) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest():
        return $default(_that.token, _that.newPassword);
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
    TResult? Function(String token, String newPassword)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordRequest() when $default != null:
        return $default(_that.token, _that.newPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ResetPasswordRequest implements ResetPasswordRequest {
  _ResetPasswordRequest({required this.token, required this.newPassword});
  factory _ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  @override
  final String token;
  @override
  final String newPassword;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResetPasswordRequestCopyWith<_ResetPasswordRequest> get copyWith =>
      __$ResetPasswordRequestCopyWithImpl<_ResetPasswordRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResetPasswordRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPasswordRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  @override
  String toString() {
    return 'ResetPasswordRequest(token: $token, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$ResetPasswordRequestCopyWith<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  factory _$ResetPasswordRequestCopyWith(_ResetPasswordRequest value,
          $Res Function(_ResetPasswordRequest) _then) =
      __$ResetPasswordRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class __$ResetPasswordRequestCopyWithImpl<$Res>
    implements _$ResetPasswordRequestCopyWith<$Res> {
  __$ResetPasswordRequestCopyWithImpl(this._self, this._then);

  final _ResetPasswordRequest _self;
  final $Res Function(_ResetPasswordRequest) _then;

  /// Create a copy of ResetPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_ResetPasswordRequest(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CreateProjectRequest {
  int? get managerId;
  int? get clientId;
  String? get projectCode;
  String? get projectName;
  bool? get isPreexecuted;

  /// Create a copy of CreateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateProjectRequestCopyWith<CreateProjectRequest> get copyWith =>
      _$CreateProjectRequestCopyWithImpl<CreateProjectRequest>(
          this as CreateProjectRequest, _$identity);

  /// Serializes this CreateProjectRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateProjectRequest &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, managerId, clientId, projectCode,
      projectName, isPreexecuted);

  @override
  String toString() {
    return 'CreateProjectRequest(managerId: $managerId, clientId: $clientId, projectCode: $projectCode, projectName: $projectName, isPreexecuted: $isPreexecuted)';
  }
}

/// @nodoc
abstract mixin class $CreateProjectRequestCopyWith<$Res> {
  factory $CreateProjectRequestCopyWith(CreateProjectRequest value,
          $Res Function(CreateProjectRequest) _then) =
      _$CreateProjectRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? managerId,
      int? clientId,
      String? projectCode,
      String? projectName,
      bool? isPreexecuted});
}

/// @nodoc
class _$CreateProjectRequestCopyWithImpl<$Res>
    implements $CreateProjectRequestCopyWith<$Res> {
  _$CreateProjectRequestCopyWithImpl(this._self, this._then);

  final CreateProjectRequest _self;
  final $Res Function(CreateProjectRequest) _then;

  /// Create a copy of CreateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managerId = freezed,
    Object? clientId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? isPreexecuted = freezed,
  }) {
    return _then(_self.copyWith(
      managerId: freezed == managerId
          ? _self.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreexecuted: freezed == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateProjectRequest].
extension CreateProjectRequestPatterns on CreateProjectRequest {
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
    TResult Function(_CreateProjectRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest() when $default != null:
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
    TResult Function(_CreateProjectRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest():
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
    TResult? Function(_CreateProjectRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest() when $default != null:
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
    TResult Function(int? managerId, int? clientId, String? projectCode,
            String? projectName, bool? isPreexecuted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest() when $default != null:
        return $default(_that.managerId, _that.clientId, _that.projectCode,
            _that.projectName, _that.isPreexecuted);
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
    TResult Function(int? managerId, int? clientId, String? projectCode,
            String? projectName, bool? isPreexecuted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest():
        return $default(_that.managerId, _that.clientId, _that.projectCode,
            _that.projectName, _that.isPreexecuted);
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
    TResult? Function(int? managerId, int? clientId, String? projectCode,
            String? projectName, bool? isPreexecuted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProjectRequest() when $default != null:
        return $default(_that.managerId, _that.clientId, _that.projectCode,
            _that.projectName, _that.isPreexecuted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateProjectRequest implements CreateProjectRequest {
  _CreateProjectRequest(
      {this.managerId,
      this.clientId,
      this.projectCode,
      this.projectName,
      this.isPreexecuted});
  factory _CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);

  @override
  final int? managerId;
  @override
  final int? clientId;
  @override
  final String? projectCode;
  @override
  final String? projectName;
  @override
  final bool? isPreexecuted;

  /// Create a copy of CreateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateProjectRequestCopyWith<_CreateProjectRequest> get copyWith =>
      __$CreateProjectRequestCopyWithImpl<_CreateProjectRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateProjectRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateProjectRequest &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, managerId, clientId, projectCode,
      projectName, isPreexecuted);

  @override
  String toString() {
    return 'CreateProjectRequest(managerId: $managerId, clientId: $clientId, projectCode: $projectCode, projectName: $projectName, isPreexecuted: $isPreexecuted)';
  }
}

/// @nodoc
abstract mixin class _$CreateProjectRequestCopyWith<$Res>
    implements $CreateProjectRequestCopyWith<$Res> {
  factory _$CreateProjectRequestCopyWith(_CreateProjectRequest value,
          $Res Function(_CreateProjectRequest) _then) =
      __$CreateProjectRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? managerId,
      int? clientId,
      String? projectCode,
      String? projectName,
      bool? isPreexecuted});
}

/// @nodoc
class __$CreateProjectRequestCopyWithImpl<$Res>
    implements _$CreateProjectRequestCopyWith<$Res> {
  __$CreateProjectRequestCopyWithImpl(this._self, this._then);

  final _CreateProjectRequest _self;
  final $Res Function(_CreateProjectRequest) _then;

  /// Create a copy of CreateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? managerId = freezed,
    Object? clientId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? isPreexecuted = freezed,
  }) {
    return _then(_CreateProjectRequest(
      managerId: freezed == managerId
          ? _self.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreexecuted: freezed == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$UpdateProjectRequest {
  int? get managerId;
  int? get clientId;
  String? get projectCode;
  String? get projectName;
  bool? get isPreexecuted;
  bool? get isClosed;
  String? get closureMessage;

  /// Create a copy of UpdateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProjectRequestCopyWith<UpdateProjectRequest> get copyWith =>
      _$UpdateProjectRequestCopyWithImpl<UpdateProjectRequest>(
          this as UpdateProjectRequest, _$identity);

  /// Serializes this UpdateProjectRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProjectRequest &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closureMessage, closureMessage) ||
                other.closureMessage == closureMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, managerId, clientId, projectCode,
      projectName, isPreexecuted, isClosed, closureMessage);

  @override
  String toString() {
    return 'UpdateProjectRequest(managerId: $managerId, clientId: $clientId, projectCode: $projectCode, projectName: $projectName, isPreexecuted: $isPreexecuted, isClosed: $isClosed, closureMessage: $closureMessage)';
  }
}

/// @nodoc
abstract mixin class $UpdateProjectRequestCopyWith<$Res> {
  factory $UpdateProjectRequestCopyWith(UpdateProjectRequest value,
          $Res Function(UpdateProjectRequest) _then) =
      _$UpdateProjectRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? managerId,
      int? clientId,
      String? projectCode,
      String? projectName,
      bool? isPreexecuted,
      bool? isClosed,
      String? closureMessage});
}

/// @nodoc
class _$UpdateProjectRequestCopyWithImpl<$Res>
    implements $UpdateProjectRequestCopyWith<$Res> {
  _$UpdateProjectRequestCopyWithImpl(this._self, this._then);

  final UpdateProjectRequest _self;
  final $Res Function(UpdateProjectRequest) _then;

  /// Create a copy of UpdateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managerId = freezed,
    Object? clientId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? isPreexecuted = freezed,
    Object? isClosed = freezed,
    Object? closureMessage = freezed,
  }) {
    return _then(_self.copyWith(
      managerId: freezed == managerId
          ? _self.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreexecuted: freezed == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosed: freezed == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      closureMessage: freezed == closureMessage
          ? _self.closureMessage
          : closureMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateProjectRequest].
extension UpdateProjectRequestPatterns on UpdateProjectRequest {
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
    TResult Function(_UpdateProjectRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest() when $default != null:
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
    TResult Function(_UpdateProjectRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest():
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
    TResult? Function(_UpdateProjectRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest() when $default != null:
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
            int? managerId,
            int? clientId,
            String? projectCode,
            String? projectName,
            bool? isPreexecuted,
            bool? isClosed,
            String? closureMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest() when $default != null:
        return $default(
            _that.managerId,
            _that.clientId,
            _that.projectCode,
            _that.projectName,
            _that.isPreexecuted,
            _that.isClosed,
            _that.closureMessage);
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
            int? managerId,
            int? clientId,
            String? projectCode,
            String? projectName,
            bool? isPreexecuted,
            bool? isClosed,
            String? closureMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest():
        return $default(
            _that.managerId,
            _that.clientId,
            _that.projectCode,
            _that.projectName,
            _that.isPreexecuted,
            _that.isClosed,
            _that.closureMessage);
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
            int? managerId,
            int? clientId,
            String? projectCode,
            String? projectName,
            bool? isPreexecuted,
            bool? isClosed,
            String? closureMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProjectRequest() when $default != null:
        return $default(
            _that.managerId,
            _that.clientId,
            _that.projectCode,
            _that.projectName,
            _that.isPreexecuted,
            _that.isClosed,
            _that.closureMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateProjectRequest implements UpdateProjectRequest {
  _UpdateProjectRequest(
      {this.managerId,
      this.clientId,
      this.projectCode,
      this.projectName,
      this.isPreexecuted,
      this.isClosed,
      this.closureMessage});
  factory _UpdateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectRequestFromJson(json);

  @override
  final int? managerId;
  @override
  final int? clientId;
  @override
  final String? projectCode;
  @override
  final String? projectName;
  @override
  final bool? isPreexecuted;
  @override
  final bool? isClosed;
  @override
  final String? closureMessage;

  /// Create a copy of UpdateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProjectRequestCopyWith<_UpdateProjectRequest> get copyWith =>
      __$UpdateProjectRequestCopyWithImpl<_UpdateProjectRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateProjectRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProjectRequest &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.isPreexecuted, isPreexecuted) ||
                other.isPreexecuted == isPreexecuted) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closureMessage, closureMessage) ||
                other.closureMessage == closureMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, managerId, clientId, projectCode,
      projectName, isPreexecuted, isClosed, closureMessage);

  @override
  String toString() {
    return 'UpdateProjectRequest(managerId: $managerId, clientId: $clientId, projectCode: $projectCode, projectName: $projectName, isPreexecuted: $isPreexecuted, isClosed: $isClosed, closureMessage: $closureMessage)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProjectRequestCopyWith<$Res>
    implements $UpdateProjectRequestCopyWith<$Res> {
  factory _$UpdateProjectRequestCopyWith(_UpdateProjectRequest value,
          $Res Function(_UpdateProjectRequest) _then) =
      __$UpdateProjectRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? managerId,
      int? clientId,
      String? projectCode,
      String? projectName,
      bool? isPreexecuted,
      bool? isClosed,
      String? closureMessage});
}

/// @nodoc
class __$UpdateProjectRequestCopyWithImpl<$Res>
    implements _$UpdateProjectRequestCopyWith<$Res> {
  __$UpdateProjectRequestCopyWithImpl(this._self, this._then);

  final _UpdateProjectRequest _self;
  final $Res Function(_UpdateProjectRequest) _then;

  /// Create a copy of UpdateProjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? managerId = freezed,
    Object? clientId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? isPreexecuted = freezed,
    Object? isClosed = freezed,
    Object? closureMessage = freezed,
  }) {
    return _then(_UpdateProjectRequest(
      managerId: freezed == managerId
          ? _self.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreexecuted: freezed == isPreexecuted
          ? _self.isPreexecuted
          : isPreexecuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosed: freezed == isClosed
          ? _self.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      closureMessage: freezed == closureMessage
          ? _self.closureMessage
          : closureMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CreateIssueRequest {
  int get projectId;
  int get categoryId;
  String? get content;
  int? get currencyId;
  DateTime? get kickoffDate;
  List<CreateContractItemRequest>? get contractItems;
  List<CreateProcurementItemRequest>? get procurementItems;
  List<CreateTransactionItemRequest>? get transactionItems;

  /// Create a copy of CreateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateIssueRequestCopyWith<CreateIssueRequest> get copyWith =>
      _$CreateIssueRequestCopyWithImpl<CreateIssueRequest>(
          this as CreateIssueRequest, _$identity);

  /// Serializes this CreateIssueRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateIssueRequest &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other.contractItems, contractItems) &&
            const DeepCollectionEquality()
                .equals(other.procurementItems, procurementItems) &&
            const DeepCollectionEquality()
                .equals(other.transactionItems, transactionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      categoryId,
      content,
      currencyId,
      kickoffDate,
      const DeepCollectionEquality().hash(contractItems),
      const DeepCollectionEquality().hash(procurementItems),
      const DeepCollectionEquality().hash(transactionItems));

  @override
  String toString() {
    return 'CreateIssueRequest(projectId: $projectId, categoryId: $categoryId, content: $content, currencyId: $currencyId, kickoffDate: $kickoffDate, contractItems: $contractItems, procurementItems: $procurementItems, transactionItems: $transactionItems)';
  }
}

/// @nodoc
abstract mixin class $CreateIssueRequestCopyWith<$Res> {
  factory $CreateIssueRequestCopyWith(
          CreateIssueRequest value, $Res Function(CreateIssueRequest) _then) =
      _$CreateIssueRequestCopyWithImpl;
  @useResult
  $Res call(
      {int projectId,
      int categoryId,
      String? content,
      int? currencyId,
      DateTime? kickoffDate,
      List<CreateContractItemRequest>? contractItems,
      List<CreateProcurementItemRequest>? procurementItems,
      List<CreateTransactionItemRequest>? transactionItems});
}

/// @nodoc
class _$CreateIssueRequestCopyWithImpl<$Res>
    implements $CreateIssueRequestCopyWith<$Res> {
  _$CreateIssueRequestCopyWithImpl(this._self, this._then);

  final CreateIssueRequest _self;
  final $Res Function(CreateIssueRequest) _then;

  /// Create a copy of CreateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? categoryId = null,
    Object? content = freezed,
    Object? currencyId = freezed,
    Object? kickoffDate = freezed,
    Object? contractItems = freezed,
    Object? procurementItems = freezed,
    Object? transactionItems = freezed,
  }) {
    return _then(_self.copyWith(
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _self.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractItems: freezed == contractItems
          ? _self.contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<CreateContractItemRequest>?,
      procurementItems: freezed == procurementItems
          ? _self.procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<CreateProcurementItemRequest>?,
      transactionItems: freezed == transactionItems
          ? _self.transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<CreateTransactionItemRequest>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateIssueRequest].
extension CreateIssueRequestPatterns on CreateIssueRequest {
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
    TResult Function(_CreateIssueRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest() when $default != null:
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
    TResult Function(_CreateIssueRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest():
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
    TResult? Function(_CreateIssueRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest() when $default != null:
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
            int projectId,
            int categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<CreateContractItemRequest>? contractItems,
            List<CreateProcurementItemRequest>? procurementItems,
            List<CreateTransactionItemRequest>? transactionItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest() when $default != null:
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
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
            int projectId,
            int categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<CreateContractItemRequest>? contractItems,
            List<CreateProcurementItemRequest>? procurementItems,
            List<CreateTransactionItemRequest>? transactionItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest():
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
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
            int projectId,
            int categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<CreateContractItemRequest>? contractItems,
            List<CreateProcurementItemRequest>? procurementItems,
            List<CreateTransactionItemRequest>? transactionItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateIssueRequest() when $default != null:
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateIssueRequest implements CreateIssueRequest {
  _CreateIssueRequest(
      {required this.projectId,
      required this.categoryId,
      this.content,
      this.currencyId,
      this.kickoffDate,
      final List<CreateContractItemRequest>? contractItems,
      final List<CreateProcurementItemRequest>? procurementItems,
      final List<CreateTransactionItemRequest>? transactionItems})
      : _contractItems = contractItems,
        _procurementItems = procurementItems,
        _transactionItems = transactionItems;
  factory _CreateIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateIssueRequestFromJson(json);

  @override
  final int projectId;
  @override
  final int categoryId;
  @override
  final String? content;
  @override
  final int? currencyId;
  @override
  final DateTime? kickoffDate;
  final List<CreateContractItemRequest>? _contractItems;
  @override
  List<CreateContractItemRequest>? get contractItems {
    final value = _contractItems;
    if (value == null) return null;
    if (_contractItems is EqualUnmodifiableListView) return _contractItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CreateProcurementItemRequest>? _procurementItems;
  @override
  List<CreateProcurementItemRequest>? get procurementItems {
    final value = _procurementItems;
    if (value == null) return null;
    if (_procurementItems is EqualUnmodifiableListView)
      return _procurementItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CreateTransactionItemRequest>? _transactionItems;
  @override
  List<CreateTransactionItemRequest>? get transactionItems {
    final value = _transactionItems;
    if (value == null) return null;
    if (_transactionItems is EqualUnmodifiableListView)
      return _transactionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CreateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateIssueRequestCopyWith<_CreateIssueRequest> get copyWith =>
      __$CreateIssueRequestCopyWithImpl<_CreateIssueRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateIssueRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateIssueRequest &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other._contractItems, _contractItems) &&
            const DeepCollectionEquality()
                .equals(other._procurementItems, _procurementItems) &&
            const DeepCollectionEquality()
                .equals(other._transactionItems, _transactionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      categoryId,
      content,
      currencyId,
      kickoffDate,
      const DeepCollectionEquality().hash(_contractItems),
      const DeepCollectionEquality().hash(_procurementItems),
      const DeepCollectionEquality().hash(_transactionItems));

  @override
  String toString() {
    return 'CreateIssueRequest(projectId: $projectId, categoryId: $categoryId, content: $content, currencyId: $currencyId, kickoffDate: $kickoffDate, contractItems: $contractItems, procurementItems: $procurementItems, transactionItems: $transactionItems)';
  }
}

/// @nodoc
abstract mixin class _$CreateIssueRequestCopyWith<$Res>
    implements $CreateIssueRequestCopyWith<$Res> {
  factory _$CreateIssueRequestCopyWith(
          _CreateIssueRequest value, $Res Function(_CreateIssueRequest) _then) =
      __$CreateIssueRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int projectId,
      int categoryId,
      String? content,
      int? currencyId,
      DateTime? kickoffDate,
      List<CreateContractItemRequest>? contractItems,
      List<CreateProcurementItemRequest>? procurementItems,
      List<CreateTransactionItemRequest>? transactionItems});
}

/// @nodoc
class __$CreateIssueRequestCopyWithImpl<$Res>
    implements _$CreateIssueRequestCopyWith<$Res> {
  __$CreateIssueRequestCopyWithImpl(this._self, this._then);

  final _CreateIssueRequest _self;
  final $Res Function(_CreateIssueRequest) _then;

  /// Create a copy of CreateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectId = null,
    Object? categoryId = null,
    Object? content = freezed,
    Object? currencyId = freezed,
    Object? kickoffDate = freezed,
    Object? contractItems = freezed,
    Object? procurementItems = freezed,
    Object? transactionItems = freezed,
  }) {
    return _then(_CreateIssueRequest(
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _self.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractItems: freezed == contractItems
          ? _self._contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<CreateContractItemRequest>?,
      procurementItems: freezed == procurementItems
          ? _self._procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<CreateProcurementItemRequest>?,
      transactionItems: freezed == transactionItems
          ? _self._transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<CreateTransactionItemRequest>?,
    ));
  }
}

/// @nodoc
mixin _$UpdateIssueRequest {
  int? get projectId;
  int? get categoryId;
  String? get content;
  int? get currencyId;
  DateTime? get kickoffDate;
  List<UpdateContractItemRequest>? get contractItems;
  List<UpdateProcurementItemRequest>? get procurementItems;
  List<UpdateTransactionItemRequest>? get transactionItems;

  /// Create a copy of UpdateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateIssueRequestCopyWith<UpdateIssueRequest> get copyWith =>
      _$UpdateIssueRequestCopyWithImpl<UpdateIssueRequest>(
          this as UpdateIssueRequest, _$identity);

  /// Serializes this UpdateIssueRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateIssueRequest &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other.contractItems, contractItems) &&
            const DeepCollectionEquality()
                .equals(other.procurementItems, procurementItems) &&
            const DeepCollectionEquality()
                .equals(other.transactionItems, transactionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      categoryId,
      content,
      currencyId,
      kickoffDate,
      const DeepCollectionEquality().hash(contractItems),
      const DeepCollectionEquality().hash(procurementItems),
      const DeepCollectionEquality().hash(transactionItems));

  @override
  String toString() {
    return 'UpdateIssueRequest(projectId: $projectId, categoryId: $categoryId, content: $content, currencyId: $currencyId, kickoffDate: $kickoffDate, contractItems: $contractItems, procurementItems: $procurementItems, transactionItems: $transactionItems)';
  }
}

/// @nodoc
abstract mixin class $UpdateIssueRequestCopyWith<$Res> {
  factory $UpdateIssueRequestCopyWith(
          UpdateIssueRequest value, $Res Function(UpdateIssueRequest) _then) =
      _$UpdateIssueRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? projectId,
      int? categoryId,
      String? content,
      int? currencyId,
      DateTime? kickoffDate,
      List<UpdateContractItemRequest>? contractItems,
      List<UpdateProcurementItemRequest>? procurementItems,
      List<UpdateTransactionItemRequest>? transactionItems});
}

/// @nodoc
class _$UpdateIssueRequestCopyWithImpl<$Res>
    implements $UpdateIssueRequestCopyWith<$Res> {
  _$UpdateIssueRequestCopyWithImpl(this._self, this._then);

  final UpdateIssueRequest _self;
  final $Res Function(UpdateIssueRequest) _then;

  /// Create a copy of UpdateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? categoryId = freezed,
    Object? content = freezed,
    Object? currencyId = freezed,
    Object? kickoffDate = freezed,
    Object? contractItems = freezed,
    Object? procurementItems = freezed,
    Object? transactionItems = freezed,
  }) {
    return _then(_self.copyWith(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _self.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractItems: freezed == contractItems
          ? _self.contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateContractItemRequest>?,
      procurementItems: freezed == procurementItems
          ? _self.procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateProcurementItemRequest>?,
      transactionItems: freezed == transactionItems
          ? _self.transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateTransactionItemRequest>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateIssueRequest].
extension UpdateIssueRequestPatterns on UpdateIssueRequest {
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
    TResult Function(_UpdateIssueRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest() when $default != null:
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
    TResult Function(_UpdateIssueRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest():
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
    TResult? Function(_UpdateIssueRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest() when $default != null:
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
            int? categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<UpdateContractItemRequest>? contractItems,
            List<UpdateProcurementItemRequest>? procurementItems,
            List<UpdateTransactionItemRequest>? transactionItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest() when $default != null:
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
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
            int? categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<UpdateContractItemRequest>? contractItems,
            List<UpdateProcurementItemRequest>? procurementItems,
            List<UpdateTransactionItemRequest>? transactionItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest():
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
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
            int? categoryId,
            String? content,
            int? currencyId,
            DateTime? kickoffDate,
            List<UpdateContractItemRequest>? contractItems,
            List<UpdateProcurementItemRequest>? procurementItems,
            List<UpdateTransactionItemRequest>? transactionItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIssueRequest() when $default != null:
        return $default(
            _that.projectId,
            _that.categoryId,
            _that.content,
            _that.currencyId,
            _that.kickoffDate,
            _that.contractItems,
            _that.procurementItems,
            _that.transactionItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateIssueRequest implements UpdateIssueRequest {
  _UpdateIssueRequest(
      {this.projectId,
      this.categoryId,
      this.content,
      this.currencyId,
      this.kickoffDate,
      final List<UpdateContractItemRequest>? contractItems,
      final List<UpdateProcurementItemRequest>? procurementItems,
      final List<UpdateTransactionItemRequest>? transactionItems})
      : _contractItems = contractItems,
        _procurementItems = procurementItems,
        _transactionItems = transactionItems;
  factory _UpdateIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateIssueRequestFromJson(json);

  @override
  final int? projectId;
  @override
  final int? categoryId;
  @override
  final String? content;
  @override
  final int? currencyId;
  @override
  final DateTime? kickoffDate;
  final List<UpdateContractItemRequest>? _contractItems;
  @override
  List<UpdateContractItemRequest>? get contractItems {
    final value = _contractItems;
    if (value == null) return null;
    if (_contractItems is EqualUnmodifiableListView) return _contractItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UpdateProcurementItemRequest>? _procurementItems;
  @override
  List<UpdateProcurementItemRequest>? get procurementItems {
    final value = _procurementItems;
    if (value == null) return null;
    if (_procurementItems is EqualUnmodifiableListView)
      return _procurementItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UpdateTransactionItemRequest>? _transactionItems;
  @override
  List<UpdateTransactionItemRequest>? get transactionItems {
    final value = _transactionItems;
    if (value == null) return null;
    if (_transactionItems is EqualUnmodifiableListView)
      return _transactionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UpdateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateIssueRequestCopyWith<_UpdateIssueRequest> get copyWith =>
      __$UpdateIssueRequestCopyWithImpl<_UpdateIssueRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateIssueRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateIssueRequest &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.kickoffDate, kickoffDate) ||
                other.kickoffDate == kickoffDate) &&
            const DeepCollectionEquality()
                .equals(other._contractItems, _contractItems) &&
            const DeepCollectionEquality()
                .equals(other._procurementItems, _procurementItems) &&
            const DeepCollectionEquality()
                .equals(other._transactionItems, _transactionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      categoryId,
      content,
      currencyId,
      kickoffDate,
      const DeepCollectionEquality().hash(_contractItems),
      const DeepCollectionEquality().hash(_procurementItems),
      const DeepCollectionEquality().hash(_transactionItems));

  @override
  String toString() {
    return 'UpdateIssueRequest(projectId: $projectId, categoryId: $categoryId, content: $content, currencyId: $currencyId, kickoffDate: $kickoffDate, contractItems: $contractItems, procurementItems: $procurementItems, transactionItems: $transactionItems)';
  }
}

/// @nodoc
abstract mixin class _$UpdateIssueRequestCopyWith<$Res>
    implements $UpdateIssueRequestCopyWith<$Res> {
  factory _$UpdateIssueRequestCopyWith(
          _UpdateIssueRequest value, $Res Function(_UpdateIssueRequest) _then) =
      __$UpdateIssueRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? projectId,
      int? categoryId,
      String? content,
      int? currencyId,
      DateTime? kickoffDate,
      List<UpdateContractItemRequest>? contractItems,
      List<UpdateProcurementItemRequest>? procurementItems,
      List<UpdateTransactionItemRequest>? transactionItems});
}

/// @nodoc
class __$UpdateIssueRequestCopyWithImpl<$Res>
    implements _$UpdateIssueRequestCopyWith<$Res> {
  __$UpdateIssueRequestCopyWithImpl(this._self, this._then);

  final _UpdateIssueRequest _self;
  final $Res Function(_UpdateIssueRequest) _then;

  /// Create a copy of UpdateIssueRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectId = freezed,
    Object? categoryId = freezed,
    Object? content = freezed,
    Object? currencyId = freezed,
    Object? kickoffDate = freezed,
    Object? contractItems = freezed,
    Object? procurementItems = freezed,
    Object? transactionItems = freezed,
  }) {
    return _then(_UpdateIssueRequest(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyId: freezed == currencyId
          ? _self.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      kickoffDate: freezed == kickoffDate
          ? _self.kickoffDate
          : kickoffDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractItems: freezed == contractItems
          ? _self._contractItems
          : contractItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateContractItemRequest>?,
      procurementItems: freezed == procurementItems
          ? _self._procurementItems
          : procurementItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateProcurementItemRequest>?,
      transactionItems: freezed == transactionItems
          ? _self._transactionItems
          : transactionItems // ignore: cast_nullable_to_non_nullable
              as List<UpdateTransactionItemRequest>?,
    ));
  }
}

/// @nodoc
mixin _$CreateContractItemRequest {
  String get item;
  String get price;

  /// Create a copy of CreateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateContractItemRequestCopyWith<CreateContractItemRequest> get copyWith =>
      _$CreateContractItemRequestCopyWithImpl<CreateContractItemRequest>(
          this as CreateContractItemRequest, _$identity);

  /// Serializes this CreateContractItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateContractItemRequest &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, price);

  @override
  String toString() {
    return 'CreateContractItemRequest(item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class $CreateContractItemRequestCopyWith<$Res> {
  factory $CreateContractItemRequestCopyWith(CreateContractItemRequest value,
          $Res Function(CreateContractItemRequest) _then) =
      _$CreateContractItemRequestCopyWithImpl;
  @useResult
  $Res call({String item, String price});
}

/// @nodoc
class _$CreateContractItemRequestCopyWithImpl<$Res>
    implements $CreateContractItemRequestCopyWith<$Res> {
  _$CreateContractItemRequestCopyWithImpl(this._self, this._then);

  final CreateContractItemRequest _self;
  final $Res Function(CreateContractItemRequest) _then;

  /// Create a copy of CreateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateContractItemRequest].
extension CreateContractItemRequestPatterns on CreateContractItemRequest {
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
    TResult Function(_CreateContractItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest() when $default != null:
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
    TResult Function(_CreateContractItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest():
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
    TResult? Function(_CreateContractItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest() when $default != null:
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
    TResult Function(String item, String price)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest() when $default != null:
        return $default(_that.item, _that.price);
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
    TResult Function(String item, String price) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest():
        return $default(_that.item, _that.price);
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
    TResult? Function(String item, String price)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateContractItemRequest() when $default != null:
        return $default(_that.item, _that.price);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateContractItemRequest implements CreateContractItemRequest {
  _CreateContractItemRequest({required this.item, required this.price});
  factory _CreateContractItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractItemRequestFromJson(json);

  @override
  final String item;
  @override
  final String price;

  /// Create a copy of CreateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateContractItemRequestCopyWith<_CreateContractItemRequest>
      get copyWith =>
          __$CreateContractItemRequestCopyWithImpl<_CreateContractItemRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateContractItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateContractItemRequest &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, price);

  @override
  String toString() {
    return 'CreateContractItemRequest(item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$CreateContractItemRequestCopyWith<$Res>
    implements $CreateContractItemRequestCopyWith<$Res> {
  factory _$CreateContractItemRequestCopyWith(_CreateContractItemRequest value,
          $Res Function(_CreateContractItemRequest) _then) =
      __$CreateContractItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String item, String price});
}

/// @nodoc
class __$CreateContractItemRequestCopyWithImpl<$Res>
    implements _$CreateContractItemRequestCopyWith<$Res> {
  __$CreateContractItemRequestCopyWithImpl(this._self, this._then);

  final _CreateContractItemRequest _self;
  final $Res Function(_CreateContractItemRequest) _then;

  /// Create a copy of CreateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_CreateContractItemRequest(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CreateProcurementItemRequest {
  String get item;
  String get spec;
  String get quantity;
  String get unitPrice;
  String get totalAmount;
  bool get isOnlinePurchase;
  String? get purchaseUrl;
  int? get supplierId;

  /// Create a copy of CreateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateProcurementItemRequestCopyWith<CreateProcurementItemRequest>
      get copyWith => _$CreateProcurementItemRequestCopyWithImpl<
              CreateProcurementItemRequest>(
          this as CreateProcurementItemRequest, _$identity);

  /// Serializes this CreateProcurementItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateProcurementItemRequest &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, spec, quantity, unitPrice,
      totalAmount, isOnlinePurchase, purchaseUrl, supplierId);

  @override
  String toString() {
    return 'CreateProcurementItemRequest(item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplierId: $supplierId)';
  }
}

/// @nodoc
abstract mixin class $CreateProcurementItemRequestCopyWith<$Res> {
  factory $CreateProcurementItemRequestCopyWith(
          CreateProcurementItemRequest value,
          $Res Function(CreateProcurementItemRequest) _then) =
      _$CreateProcurementItemRequestCopyWithImpl;
  @useResult
  $Res call(
      {String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      int? supplierId});
}

/// @nodoc
class _$CreateProcurementItemRequestCopyWithImpl<$Res>
    implements $CreateProcurementItemRequestCopyWith<$Res> {
  _$CreateProcurementItemRequestCopyWithImpl(this._self, this._then);

  final CreateProcurementItemRequest _self;
  final $Res Function(CreateProcurementItemRequest) _then;

  /// Create a copy of CreateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplierId = freezed,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateProcurementItemRequest].
extension CreateProcurementItemRequestPatterns on CreateProcurementItemRequest {
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
    TResult Function(_CreateProcurementItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest() when $default != null:
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
    TResult Function(_CreateProcurementItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest():
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
    TResult? Function(_CreateProcurementItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest() when $default != null:
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
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest() when $default != null:
        return $default(
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
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
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest():
        return $default(
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
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
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateProcurementItemRequest() when $default != null:
        return $default(
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateProcurementItemRequest implements CreateProcurementItemRequest {
  _CreateProcurementItemRequest(
      {required this.item,
      required this.spec,
      required this.quantity,
      required this.unitPrice,
      required this.totalAmount,
      this.isOnlinePurchase = false,
      this.purchaseUrl,
      this.supplierId});
  factory _CreateProcurementItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementItemRequestFromJson(json);

  @override
  final String item;
  @override
  final String spec;
  @override
  final String quantity;
  @override
  final String unitPrice;
  @override
  final String totalAmount;
  @override
  @JsonKey()
  final bool isOnlinePurchase;
  @override
  final String? purchaseUrl;
  @override
  final int? supplierId;

  /// Create a copy of CreateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateProcurementItemRequestCopyWith<_CreateProcurementItemRequest>
      get copyWith => __$CreateProcurementItemRequestCopyWithImpl<
          _CreateProcurementItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateProcurementItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateProcurementItemRequest &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, spec, quantity, unitPrice,
      totalAmount, isOnlinePurchase, purchaseUrl, supplierId);

  @override
  String toString() {
    return 'CreateProcurementItemRequest(item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplierId: $supplierId)';
  }
}

/// @nodoc
abstract mixin class _$CreateProcurementItemRequestCopyWith<$Res>
    implements $CreateProcurementItemRequestCopyWith<$Res> {
  factory _$CreateProcurementItemRequestCopyWith(
          _CreateProcurementItemRequest value,
          $Res Function(_CreateProcurementItemRequest) _then) =
      __$CreateProcurementItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      int? supplierId});
}

/// @nodoc
class __$CreateProcurementItemRequestCopyWithImpl<$Res>
    implements _$CreateProcurementItemRequestCopyWith<$Res> {
  __$CreateProcurementItemRequestCopyWithImpl(this._self, this._then);

  final _CreateProcurementItemRequest _self;
  final $Res Function(_CreateProcurementItemRequest) _then;

  /// Create a copy of CreateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplierId = freezed,
  }) {
    return _then(_CreateProcurementItemRequest(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$CreateTransactionItemRequest {
  int get categoryId;
  String get price;
  String get ratio;
  bool? get isPaid;
  DateTime? get paidAt;
  String? get note;

  /// Create a copy of CreateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTransactionItemRequestCopyWith<CreateTransactionItemRequest>
      get copyWith => _$CreateTransactionItemRequestCopyWithImpl<
              CreateTransactionItemRequest>(
          this as CreateTransactionItemRequest, _$identity);

  /// Serializes this CreateTransactionItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTransactionItemRequest &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'CreateTransactionItemRequest(categoryId: $categoryId, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class $CreateTransactionItemRequestCopyWith<$Res> {
  factory $CreateTransactionItemRequestCopyWith(
          CreateTransactionItemRequest value,
          $Res Function(CreateTransactionItemRequest) _then) =
      _$CreateTransactionItemRequestCopyWithImpl;
  @useResult
  $Res call(
      {int categoryId,
      String price,
      String ratio,
      bool? isPaid,
      DateTime? paidAt,
      String? note});
}

/// @nodoc
class _$CreateTransactionItemRequestCopyWithImpl<$Res>
    implements $CreateTransactionItemRequestCopyWith<$Res> {
  _$CreateTransactionItemRequestCopyWithImpl(this._self, this._then);

  final CreateTransactionItemRequest _self;
  final $Res Function(CreateTransactionItemRequest) _then;

  /// Create a copy of CreateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = freezed,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateTransactionItemRequest].
extension CreateTransactionItemRequestPatterns on CreateTransactionItemRequest {
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
    TResult Function(_CreateTransactionItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest() when $default != null:
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
    TResult Function(_CreateTransactionItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest():
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
    TResult? Function(_CreateTransactionItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest() when $default != null:
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
    TResult Function(int categoryId, String price, String ratio, bool? isPaid,
            DateTime? paidAt, String? note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest() when $default != null:
        return $default(_that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult Function(int categoryId, String price, String ratio, bool? isPaid,
            DateTime? paidAt, String? note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest():
        return $default(_that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult? Function(int categoryId, String price, String ratio, bool? isPaid,
            DateTime? paidAt, String? note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTransactionItemRequest() when $default != null:
        return $default(_that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateTransactionItemRequest implements CreateTransactionItemRequest {
  _CreateTransactionItemRequest(
      {required this.categoryId,
      required this.price,
      required this.ratio,
      this.isPaid,
      this.paidAt,
      this.note});
  factory _CreateTransactionItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionItemRequestFromJson(json);

  @override
  final int categoryId;
  @override
  final String price;
  @override
  final String ratio;
  @override
  final bool? isPaid;
  @override
  final DateTime? paidAt;
  @override
  final String? note;

  /// Create a copy of CreateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTransactionItemRequestCopyWith<_CreateTransactionItemRequest>
      get copyWith => __$CreateTransactionItemRequestCopyWithImpl<
          _CreateTransactionItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateTransactionItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTransactionItemRequest &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'CreateTransactionItemRequest(categoryId: $categoryId, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$CreateTransactionItemRequestCopyWith<$Res>
    implements $CreateTransactionItemRequestCopyWith<$Res> {
  factory _$CreateTransactionItemRequestCopyWith(
          _CreateTransactionItemRequest value,
          $Res Function(_CreateTransactionItemRequest) _then) =
      __$CreateTransactionItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String price,
      String ratio,
      bool? isPaid,
      DateTime? paidAt,
      String? note});
}

/// @nodoc
class __$CreateTransactionItemRequestCopyWithImpl<$Res>
    implements _$CreateTransactionItemRequestCopyWith<$Res> {
  __$CreateTransactionItemRequestCopyWithImpl(this._self, this._then);

  final _CreateTransactionItemRequest _self;
  final $Res Function(_CreateTransactionItemRequest) _then;

  /// Create a copy of CreateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = freezed,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_CreateTransactionItemRequest(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UpdateContractItemRequest {
  int? get id;
  String get item;
  String get price;

  /// Create a copy of UpdateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateContractItemRequestCopyWith<UpdateContractItemRequest> get copyWith =>
      _$UpdateContractItemRequestCopyWithImpl<UpdateContractItemRequest>(
          this as UpdateContractItemRequest, _$identity);

  /// Serializes this UpdateContractItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateContractItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, price);

  @override
  String toString() {
    return 'UpdateContractItemRequest(id: $id, item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class $UpdateContractItemRequestCopyWith<$Res> {
  factory $UpdateContractItemRequestCopyWith(UpdateContractItemRequest value,
          $Res Function(UpdateContractItemRequest) _then) =
      _$UpdateContractItemRequestCopyWithImpl;
  @useResult
  $Res call({int? id, String item, String price});
}

/// @nodoc
class _$UpdateContractItemRequestCopyWithImpl<$Res>
    implements $UpdateContractItemRequestCopyWith<$Res> {
  _$UpdateContractItemRequestCopyWithImpl(this._self, this._then);

  final UpdateContractItemRequest _self;
  final $Res Function(UpdateContractItemRequest) _then;

  /// Create a copy of UpdateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateContractItemRequest].
extension UpdateContractItemRequestPatterns on UpdateContractItemRequest {
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
    TResult Function(_UpdateContractItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest() when $default != null:
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
    TResult Function(_UpdateContractItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest():
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
    TResult? Function(_UpdateContractItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest() when $default != null:
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
    TResult Function(int? id, String item, String price)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest() when $default != null:
        return $default(_that.id, _that.item, _that.price);
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
    TResult Function(int? id, String item, String price) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest():
        return $default(_that.id, _that.item, _that.price);
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
    TResult? Function(int? id, String item, String price)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateContractItemRequest() when $default != null:
        return $default(_that.id, _that.item, _that.price);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateContractItemRequest implements UpdateContractItemRequest {
  _UpdateContractItemRequest(
      {this.id, required this.item, required this.price});
  factory _UpdateContractItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractItemRequestFromJson(json);

  @override
  final int? id;
  @override
  final String item;
  @override
  final String price;

  /// Create a copy of UpdateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateContractItemRequestCopyWith<_UpdateContractItemRequest>
      get copyWith =>
          __$UpdateContractItemRequestCopyWithImpl<_UpdateContractItemRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateContractItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateContractItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, price);

  @override
  String toString() {
    return 'UpdateContractItemRequest(id: $id, item: $item, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$UpdateContractItemRequestCopyWith<$Res>
    implements $UpdateContractItemRequestCopyWith<$Res> {
  factory _$UpdateContractItemRequestCopyWith(_UpdateContractItemRequest value,
          $Res Function(_UpdateContractItemRequest) _then) =
      __$UpdateContractItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String item, String price});
}

/// @nodoc
class __$UpdateContractItemRequestCopyWithImpl<$Res>
    implements _$UpdateContractItemRequestCopyWith<$Res> {
  __$UpdateContractItemRequestCopyWithImpl(this._self, this._then);

  final _UpdateContractItemRequest _self;
  final $Res Function(_UpdateContractItemRequest) _then;

  /// Create a copy of UpdateContractItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? price = null,
  }) {
    return _then(_UpdateContractItemRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UpdateProcurementItemRequest {
  int? get id;
  String get item;
  String get spec;
  String get quantity;
  String get unitPrice;
  String get totalAmount;
  bool get isOnlinePurchase;
  String? get purchaseUrl;
  int? get supplierId;

  /// Create a copy of UpdateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProcurementItemRequestCopyWith<UpdateProcurementItemRequest>
      get copyWith => _$UpdateProcurementItemRequestCopyWithImpl<
              UpdateProcurementItemRequest>(
          this as UpdateProcurementItemRequest, _$identity);

  /// Serializes this UpdateProcurementItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProcurementItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, spec, quantity,
      unitPrice, totalAmount, isOnlinePurchase, purchaseUrl, supplierId);

  @override
  String toString() {
    return 'UpdateProcurementItemRequest(id: $id, item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplierId: $supplierId)';
  }
}

/// @nodoc
abstract mixin class $UpdateProcurementItemRequestCopyWith<$Res> {
  factory $UpdateProcurementItemRequestCopyWith(
          UpdateProcurementItemRequest value,
          $Res Function(UpdateProcurementItemRequest) _then) =
      _$UpdateProcurementItemRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      int? supplierId});
}

/// @nodoc
class _$UpdateProcurementItemRequestCopyWithImpl<$Res>
    implements $UpdateProcurementItemRequestCopyWith<$Res> {
  _$UpdateProcurementItemRequestCopyWithImpl(this._self, this._then);

  final UpdateProcurementItemRequest _self;
  final $Res Function(UpdateProcurementItemRequest) _then;

  /// Create a copy of UpdateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplierId = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateProcurementItemRequest].
extension UpdateProcurementItemRequestPatterns on UpdateProcurementItemRequest {
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
    TResult Function(_UpdateProcurementItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest() when $default != null:
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
    TResult Function(_UpdateProcurementItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest():
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
    TResult? Function(_UpdateProcurementItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest() when $default != null:
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest() when $default != null:
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest():
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
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
            int? id,
            String item,
            String spec,
            String quantity,
            String unitPrice,
            String totalAmount,
            bool isOnlinePurchase,
            String? purchaseUrl,
            int? supplierId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProcurementItemRequest() when $default != null:
        return $default(
            _that.id,
            _that.item,
            _that.spec,
            _that.quantity,
            _that.unitPrice,
            _that.totalAmount,
            _that.isOnlinePurchase,
            _that.purchaseUrl,
            _that.supplierId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateProcurementItemRequest implements UpdateProcurementItemRequest {
  _UpdateProcurementItemRequest(
      {this.id,
      required this.item,
      required this.spec,
      required this.quantity,
      required this.unitPrice,
      required this.totalAmount,
      this.isOnlinePurchase = false,
      this.purchaseUrl,
      this.supplierId});
  factory _UpdateProcurementItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementItemRequestFromJson(json);

  @override
  final int? id;
  @override
  final String item;
  @override
  final String spec;
  @override
  final String quantity;
  @override
  final String unitPrice;
  @override
  final String totalAmount;
  @override
  @JsonKey()
  final bool isOnlinePurchase;
  @override
  final String? purchaseUrl;
  @override
  final int? supplierId;

  /// Create a copy of UpdateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProcurementItemRequestCopyWith<_UpdateProcurementItemRequest>
      get copyWith => __$UpdateProcurementItemRequestCopyWithImpl<
          _UpdateProcurementItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateProcurementItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProcurementItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.isOnlinePurchase, isOnlinePurchase) ||
                other.isOnlinePurchase == isOnlinePurchase) &&
            (identical(other.purchaseUrl, purchaseUrl) ||
                other.purchaseUrl == purchaseUrl) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, item, spec, quantity,
      unitPrice, totalAmount, isOnlinePurchase, purchaseUrl, supplierId);

  @override
  String toString() {
    return 'UpdateProcurementItemRequest(id: $id, item: $item, spec: $spec, quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, isOnlinePurchase: $isOnlinePurchase, purchaseUrl: $purchaseUrl, supplierId: $supplierId)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProcurementItemRequestCopyWith<$Res>
    implements $UpdateProcurementItemRequestCopyWith<$Res> {
  factory _$UpdateProcurementItemRequestCopyWith(
          _UpdateProcurementItemRequest value,
          $Res Function(_UpdateProcurementItemRequest) _then) =
      __$UpdateProcurementItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String item,
      String spec,
      String quantity,
      String unitPrice,
      String totalAmount,
      bool isOnlinePurchase,
      String? purchaseUrl,
      int? supplierId});
}

/// @nodoc
class __$UpdateProcurementItemRequestCopyWithImpl<$Res>
    implements _$UpdateProcurementItemRequestCopyWith<$Res> {
  __$UpdateProcurementItemRequestCopyWithImpl(this._self, this._then);

  final _UpdateProcurementItemRequest _self;
  final $Res Function(_UpdateProcurementItemRequest) _then;

  /// Create a copy of UpdateProcurementItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? item = null,
    Object? spec = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? isOnlinePurchase = null,
    Object? purchaseUrl = freezed,
    Object? supplierId = freezed,
  }) {
    return _then(_UpdateProcurementItemRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      spec: null == spec
          ? _self.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlinePurchase: null == isOnlinePurchase
          ? _self.isOnlinePurchase
          : isOnlinePurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseUrl: freezed == purchaseUrl
          ? _self.purchaseUrl
          : purchaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$UpdateTransactionItemRequest {
  int? get id;
  int get categoryId;
  String get price;
  String get ratio;
  bool? get isPaid;
  DateTime? get paidAt;
  String? get note;

  /// Create a copy of UpdateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTransactionItemRequestCopyWith<UpdateTransactionItemRequest>
      get copyWith => _$UpdateTransactionItemRequestCopyWithImpl<
              UpdateTransactionItemRequest>(
          this as UpdateTransactionItemRequest, _$identity);

  /// Serializes this UpdateTransactionItemRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTransactionItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, categoryId, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'UpdateTransactionItemRequest(id: $id, categoryId: $categoryId, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class $UpdateTransactionItemRequestCopyWith<$Res> {
  factory $UpdateTransactionItemRequestCopyWith(
          UpdateTransactionItemRequest value,
          $Res Function(UpdateTransactionItemRequest) _then) =
      _$UpdateTransactionItemRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      int categoryId,
      String price,
      String ratio,
      bool? isPaid,
      DateTime? paidAt,
      String? note});
}

/// @nodoc
class _$UpdateTransactionItemRequestCopyWithImpl<$Res>
    implements $UpdateTransactionItemRequestCopyWith<$Res> {
  _$UpdateTransactionItemRequestCopyWithImpl(this._self, this._then);

  final UpdateTransactionItemRequest _self;
  final $Res Function(UpdateTransactionItemRequest) _then;

  /// Create a copy of UpdateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = freezed,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateTransactionItemRequest].
extension UpdateTransactionItemRequestPatterns on UpdateTransactionItemRequest {
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
    TResult Function(_UpdateTransactionItemRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest() when $default != null:
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
    TResult Function(_UpdateTransactionItemRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest():
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
    TResult? Function(_UpdateTransactionItemRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest() when $default != null:
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
    TResult Function(int? id, int categoryId, String price, String ratio,
            bool? isPaid, DateTime? paidAt, String? note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest() when $default != null:
        return $default(_that.id, _that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult Function(int? id, int categoryId, String price, String ratio,
            bool? isPaid, DateTime? paidAt, String? note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest():
        return $default(_that.id, _that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
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
    TResult? Function(int? id, int categoryId, String price, String ratio,
            bool? isPaid, DateTime? paidAt, String? note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTransactionItemRequest() when $default != null:
        return $default(_that.id, _that.categoryId, _that.price, _that.ratio,
            _that.isPaid, _that.paidAt, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTransactionItemRequest implements UpdateTransactionItemRequest {
  _UpdateTransactionItemRequest(
      {this.id,
      required this.categoryId,
      required this.price,
      required this.ratio,
      this.isPaid,
      this.paidAt,
      this.note});
  factory _UpdateTransactionItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionItemRequestFromJson(json);

  @override
  final int? id;
  @override
  final int categoryId;
  @override
  final String price;
  @override
  final String ratio;
  @override
  final bool? isPaid;
  @override
  final DateTime? paidAt;
  @override
  final String? note;

  /// Create a copy of UpdateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTransactionItemRequestCopyWith<_UpdateTransactionItemRequest>
      get copyWith => __$UpdateTransactionItemRequestCopyWithImpl<
          _UpdateTransactionItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTransactionItemRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTransactionItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, categoryId, price, ratio, isPaid, paidAt, note);

  @override
  String toString() {
    return 'UpdateTransactionItemRequest(id: $id, categoryId: $categoryId, price: $price, ratio: $ratio, isPaid: $isPaid, paidAt: $paidAt, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTransactionItemRequestCopyWith<$Res>
    implements $UpdateTransactionItemRequestCopyWith<$Res> {
  factory _$UpdateTransactionItemRequestCopyWith(
          _UpdateTransactionItemRequest value,
          $Res Function(_UpdateTransactionItemRequest) _then) =
      __$UpdateTransactionItemRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      int categoryId,
      String price,
      String ratio,
      bool? isPaid,
      DateTime? paidAt,
      String? note});
}

/// @nodoc
class __$UpdateTransactionItemRequestCopyWithImpl<$Res>
    implements _$UpdateTransactionItemRequestCopyWith<$Res> {
  __$UpdateTransactionItemRequestCopyWithImpl(this._self, this._then);

  final _UpdateTransactionItemRequest _self;
  final $Res Function(_UpdateTransactionItemRequest) _then;

  /// Create a copy of UpdateTransactionItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? price = null,
    Object? ratio = null,
    Object? isPaid = freezed,
    Object? paidAt = freezed,
    Object? note = freezed,
  }) {
    return _then(_UpdateTransactionItemRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidAt: freezed == paidAt
          ? _self.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SupplierRequest {
  String get businessNumber;
  String get name;
  String? get phone;
  String? get address;
  String? get favicon;

  /// Create a copy of SupplierRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierRequestCopyWith<SupplierRequest> get copyWith =>
      _$SupplierRequestCopyWithImpl<SupplierRequest>(
          this as SupplierRequest, _$identity);

  /// Serializes this SupplierRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierRequest &&
            (identical(other.businessNumber, businessNumber) ||
                other.businessNumber == businessNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.favicon, favicon) || other.favicon == favicon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, businessNumber, name, phone, address, favicon);

  @override
  String toString() {
    return 'SupplierRequest(businessNumber: $businessNumber, name: $name, phone: $phone, address: $address, favicon: $favicon)';
  }
}

/// @nodoc
abstract mixin class $SupplierRequestCopyWith<$Res> {
  factory $SupplierRequestCopyWith(
          SupplierRequest value, $Res Function(SupplierRequest) _then) =
      _$SupplierRequestCopyWithImpl;
  @useResult
  $Res call(
      {String businessNumber,
      String name,
      String? phone,
      String? address,
      String? favicon});
}

/// @nodoc
class _$SupplierRequestCopyWithImpl<$Res>
    implements $SupplierRequestCopyWith<$Res> {
  _$SupplierRequestCopyWithImpl(this._self, this._then);

  final SupplierRequest _self;
  final $Res Function(SupplierRequest) _then;

  /// Create a copy of SupplierRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessNumber = null,
    Object? name = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? favicon = freezed,
  }) {
    return _then(_self.copyWith(
      businessNumber: null == businessNumber
          ? _self.businessNumber
          : businessNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      favicon: freezed == favicon
          ? _self.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SupplierRequest].
extension SupplierRequestPatterns on SupplierRequest {
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
    TResult Function(_SupplierRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest() when $default != null:
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
    TResult Function(_SupplierRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest():
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
    TResult? Function(_SupplierRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest() when $default != null:
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
    TResult Function(String businessNumber, String name, String? phone,
            String? address, String? favicon)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest() when $default != null:
        return $default(_that.businessNumber, _that.name, _that.phone,
            _that.address, _that.favicon);
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
    TResult Function(String businessNumber, String name, String? phone,
            String? address, String? favicon)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest():
        return $default(_that.businessNumber, _that.name, _that.phone,
            _that.address, _that.favicon);
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
    TResult? Function(String businessNumber, String name, String? phone,
            String? address, String? favicon)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierRequest() when $default != null:
        return $default(_that.businessNumber, _that.name, _that.phone,
            _that.address, _that.favicon);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SupplierRequest implements SupplierRequest {
  _SupplierRequest(
      {required this.businessNumber,
      required this.name,
      this.phone,
      this.address,
      this.favicon});
  factory _SupplierRequest.fromJson(Map<String, dynamic> json) =>
      _$SupplierRequestFromJson(json);

  @override
  final String businessNumber;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? favicon;

  /// Create a copy of SupplierRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierRequestCopyWith<_SupplierRequest> get copyWith =>
      __$SupplierRequestCopyWithImpl<_SupplierRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SupplierRequest &&
            (identical(other.businessNumber, businessNumber) ||
                other.businessNumber == businessNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.favicon, favicon) || other.favicon == favicon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, businessNumber, name, phone, address, favicon);

  @override
  String toString() {
    return 'SupplierRequest(businessNumber: $businessNumber, name: $name, phone: $phone, address: $address, favicon: $favicon)';
  }
}

/// @nodoc
abstract mixin class _$SupplierRequestCopyWith<$Res>
    implements $SupplierRequestCopyWith<$Res> {
  factory _$SupplierRequestCopyWith(
          _SupplierRequest value, $Res Function(_SupplierRequest) _then) =
      __$SupplierRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String businessNumber,
      String name,
      String? phone,
      String? address,
      String? favicon});
}

/// @nodoc
class __$SupplierRequestCopyWithImpl<$Res>
    implements _$SupplierRequestCopyWith<$Res> {
  __$SupplierRequestCopyWithImpl(this._self, this._then);

  final _SupplierRequest _self;
  final $Res Function(_SupplierRequest) _then;

  /// Create a copy of SupplierRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessNumber = null,
    Object? name = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? favicon = freezed,
  }) {
    return _then(_SupplierRequest(
      businessNumber: null == businessNumber
          ? _self.businessNumber
          : businessNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      favicon: freezed == favicon
          ? _self.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) {
  return _CreateScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$ScheduleRequest {
  String get summary;
  String? get description;
  String get url;
  int get projectId;
  int get categoryId;
  DateTime get start;
  DateTime get end;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleRequestCopyWith<ScheduleRequest> get copyWith =>
      _$ScheduleRequestCopyWithImpl<ScheduleRequest>(
          this as ScheduleRequest, _$identity);

  /// Serializes this ScheduleRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleRequest &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, description, url,
      projectId, categoryId, start, end);

  @override
  String toString() {
    return 'ScheduleRequest(summary: $summary, description: $description, url: $url, projectId: $projectId, categoryId: $categoryId, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $ScheduleRequestCopyWith<$Res> {
  factory $ScheduleRequestCopyWith(
          ScheduleRequest value, $Res Function(ScheduleRequest) _then) =
      _$ScheduleRequestCopyWithImpl;
  @useResult
  $Res call(
      {String summary,
      String? description,
      String url,
      int projectId,
      int categoryId,
      DateTime start,
      DateTime end});
}

/// @nodoc
class _$ScheduleRequestCopyWithImpl<$Res>
    implements $ScheduleRequestCopyWith<$Res> {
  _$ScheduleRequestCopyWithImpl(this._self, this._then);

  final ScheduleRequest _self;
  final $Res Function(ScheduleRequest) _then;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? description = freezed,
    Object? url = null,
    Object? projectId = null,
    Object? categoryId = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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

/// Adds pattern-matching-related methods to [ScheduleRequest].
extension ScheduleRequestPatterns on ScheduleRequest {
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
    TResult Function(_CreateScheduleRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest() when $default != null:
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
    TResult Function(_CreateScheduleRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest():
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
    TResult? Function(_CreateScheduleRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest() when $default != null:
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
    TResult Function(String summary, String? description, String url,
            int projectId, int categoryId, DateTime start, DateTime end)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest() when $default != null:
        return $default(_that.summary, _that.description, _that.url,
            _that.projectId, _that.categoryId, _that.start, _that.end);
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
    TResult Function(String summary, String? description, String url,
            int projectId, int categoryId, DateTime start, DateTime end)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest():
        return $default(_that.summary, _that.description, _that.url,
            _that.projectId, _that.categoryId, _that.start, _that.end);
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
    TResult? Function(String summary, String? description, String url,
            int projectId, int categoryId, DateTime start, DateTime end)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateScheduleRequest() when $default != null:
        return $default(_that.summary, _that.description, _that.url,
            _that.projectId, _that.categoryId, _that.start, _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateScheduleRequest implements ScheduleRequest {
  _CreateScheduleRequest(
      {required this.summary,
      this.description,
      required this.url,
      required this.projectId,
      required this.categoryId,
      required this.start,
      required this.end});
  factory _CreateScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleRequestFromJson(json);

  @override
  final String summary;
  @override
  final String? description;
  @override
  final String url;
  @override
  final int projectId;
  @override
  final int categoryId;
  @override
  final DateTime start;
  @override
  final DateTime end;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateScheduleRequestCopyWith<_CreateScheduleRequest> get copyWith =>
      __$CreateScheduleRequestCopyWithImpl<_CreateScheduleRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateScheduleRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateScheduleRequest &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, description, url,
      projectId, categoryId, start, end);

  @override
  String toString() {
    return 'ScheduleRequest(summary: $summary, description: $description, url: $url, projectId: $projectId, categoryId: $categoryId, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$CreateScheduleRequestCopyWith<$Res>
    implements $ScheduleRequestCopyWith<$Res> {
  factory _$CreateScheduleRequestCopyWith(_CreateScheduleRequest value,
          $Res Function(_CreateScheduleRequest) _then) =
      __$CreateScheduleRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String summary,
      String? description,
      String url,
      int projectId,
      int categoryId,
      DateTime start,
      DateTime end});
}

/// @nodoc
class __$CreateScheduleRequestCopyWithImpl<$Res>
    implements _$CreateScheduleRequestCopyWith<$Res> {
  __$CreateScheduleRequestCopyWithImpl(this._self, this._then);

  final _CreateScheduleRequest _self;
  final $Res Function(_CreateScheduleRequest) _then;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? description = freezed,
    Object? url = null,
    Object? projectId = null,
    Object? categoryId = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_CreateScheduleRequest(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
mixin _$CreateReportRequest {
  int? get scheduleId;
  int get projectId;
  String get content;
  List<ReportAttachment> get attachments;
  CreateTripReportRequest? get trip;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateReportRequestCopyWith<CreateReportRequest> get copyWith =>
      _$CreateReportRequestCopyWithImpl<CreateReportRequest>(
          this as CreateReportRequest, _$identity);

  /// Serializes this CreateReportRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateReportRequest &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scheduleId, projectId, content,
      const DeepCollectionEquality().hash(attachments), trip);

  @override
  String toString() {
    return 'CreateReportRequest(scheduleId: $scheduleId, projectId: $projectId, content: $content, attachments: $attachments, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class $CreateReportRequestCopyWith<$Res> {
  factory $CreateReportRequestCopyWith(
          CreateReportRequest value, $Res Function(CreateReportRequest) _then) =
      _$CreateReportRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? scheduleId,
      int projectId,
      String content,
      List<ReportAttachment> attachments,
      CreateTripReportRequest? trip});

  $CreateTripReportRequestCopyWith<$Res>? get trip;
}

/// @nodoc
class _$CreateReportRequestCopyWithImpl<$Res>
    implements $CreateReportRequestCopyWith<$Res> {
  _$CreateReportRequestCopyWithImpl(this._self, this._then);

  final CreateReportRequest _self;
  final $Res Function(CreateReportRequest) _then;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? projectId = null,
    Object? content = null,
    Object? attachments = null,
    Object? trip = freezed,
  }) {
    return _then(_self.copyWith(
      scheduleId: freezed == scheduleId
          ? _self.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as CreateTripReportRequest?,
    ));
  }

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTripReportRequestCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $CreateTripReportRequestCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreateReportRequest].
extension CreateReportRequestPatterns on CreateReportRequest {
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
    TResult Function(_CreateReportRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
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
    TResult Function(_CreateReportRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest():
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
    TResult? Function(_CreateReportRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
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
    TResult Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, CreateTripReportRequest? trip)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
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
    TResult Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, CreateTripReportRequest? trip)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest():
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
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
    TResult? Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, CreateTripReportRequest? trip)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateReportRequest implements CreateReportRequest {
  _CreateReportRequest(
      {this.scheduleId,
      required this.projectId,
      required this.content,
      required final List<ReportAttachment> attachments,
      this.trip})
      : _attachments = attachments;
  factory _CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);

  @override
  final int? scheduleId;
  @override
  final int projectId;
  @override
  final String content;
  final List<ReportAttachment> _attachments;
  @override
  List<ReportAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final CreateTripReportRequest? trip;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateReportRequestCopyWith<_CreateReportRequest> get copyWith =>
      __$CreateReportRequestCopyWithImpl<_CreateReportRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateReportRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateReportRequest &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scheduleId, projectId, content,
      const DeepCollectionEquality().hash(_attachments), trip);

  @override
  String toString() {
    return 'CreateReportRequest(scheduleId: $scheduleId, projectId: $projectId, content: $content, attachments: $attachments, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class _$CreateReportRequestCopyWith<$Res>
    implements $CreateReportRequestCopyWith<$Res> {
  factory _$CreateReportRequestCopyWith(_CreateReportRequest value,
          $Res Function(_CreateReportRequest) _then) =
      __$CreateReportRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? scheduleId,
      int projectId,
      String content,
      List<ReportAttachment> attachments,
      CreateTripReportRequest? trip});

  @override
  $CreateTripReportRequestCopyWith<$Res>? get trip;
}

/// @nodoc
class __$CreateReportRequestCopyWithImpl<$Res>
    implements _$CreateReportRequestCopyWith<$Res> {
  __$CreateReportRequestCopyWithImpl(this._self, this._then);

  final _CreateReportRequest _self;
  final $Res Function(_CreateReportRequest) _then;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scheduleId = freezed,
    Object? projectId = null,
    Object? content = null,
    Object? attachments = null,
    Object? trip = freezed,
  }) {
    return _then(_CreateReportRequest(
      scheduleId: freezed == scheduleId
          ? _self.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as CreateTripReportRequest?,
    ));
  }

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTripReportRequestCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $CreateTripReportRequestCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// @nodoc
mixin _$CreateTripReportRequest {
// scheduleId 제거
  List<CreateActualExpenseRequest> get expenses;
  List<CreateRegulationRateRequest> get rates;
  CreateFuelExpenseRequest? get fuel; // ⭐️ 타입 변경
  bool? get isDeducted;

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTripReportRequestCopyWith<CreateTripReportRequest> get copyWith =>
      _$CreateTripReportRequestCopyWithImpl<CreateTripReportRequest>(
          this as CreateTripReportRequest, _$identity);

  /// Serializes this CreateTripReportRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTripReportRequest &&
            const DeepCollectionEquality().equals(other.expenses, expenses) &&
            const DeepCollectionEquality().equals(other.rates, rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expenses),
      const DeepCollectionEquality().hash(rates),
      fuel,
      isDeducted);

  @override
  String toString() {
    return 'CreateTripReportRequest(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted)';
  }
}

/// @nodoc
abstract mixin class $CreateTripReportRequestCopyWith<$Res> {
  factory $CreateTripReportRequestCopyWith(CreateTripReportRequest value,
          $Res Function(CreateTripReportRequest) _then) =
      _$CreateTripReportRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<CreateActualExpenseRequest> expenses,
      List<CreateRegulationRateRequest> rates,
      CreateFuelExpenseRequest? fuel,
      bool? isDeducted});

  $CreateFuelExpenseRequestCopyWith<$Res>? get fuel;
}

/// @nodoc
class _$CreateTripReportRequestCopyWithImpl<$Res>
    implements $CreateTripReportRequestCopyWith<$Res> {
  _$CreateTripReportRequestCopyWithImpl(this._self, this._then);

  final CreateTripReportRequest _self;
  final $Res Function(CreateTripReportRequest) _then;

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
  }) {
    return _then(_self.copyWith(
      expenses: null == expenses
          ? _self.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<CreateActualExpenseRequest>,
      rates: null == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<CreateRegulationRateRequest>,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as CreateFuelExpenseRequest?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateFuelExpenseRequestCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $CreateFuelExpenseRequestCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreateTripReportRequest].
extension CreateTripReportRequestPatterns on CreateTripReportRequest {
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
    TResult Function(_CreateTripReportRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest() when $default != null:
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
    TResult Function(_CreateTripReportRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest():
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
    TResult? Function(_CreateTripReportRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest() when $default != null:
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
            List<CreateActualExpenseRequest> expenses,
            List<CreateRegulationRateRequest> rates,
            CreateFuelExpenseRequest? fuel,
            bool? isDeducted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest() when $default != null:
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
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
            List<CreateActualExpenseRequest> expenses,
            List<CreateRegulationRateRequest> rates,
            CreateFuelExpenseRequest? fuel,
            bool? isDeducted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest():
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
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
            List<CreateActualExpenseRequest> expenses,
            List<CreateRegulationRateRequest> rates,
            CreateFuelExpenseRequest? fuel,
            bool? isDeducted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTripReportRequest() when $default != null:
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateTripReportRequest implements CreateTripReportRequest {
  _CreateTripReportRequest(
      {required final List<CreateActualExpenseRequest> expenses,
      required final List<CreateRegulationRateRequest> rates,
      this.fuel,
      this.isDeducted})
      : _expenses = expenses,
        _rates = rates;
  factory _CreateTripReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTripReportRequestFromJson(json);

// scheduleId 제거
  final List<CreateActualExpenseRequest> _expenses;
// scheduleId 제거
  @override
  List<CreateActualExpenseRequest> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<CreateRegulationRateRequest> _rates;
  @override
  List<CreateRegulationRateRequest> get rates {
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rates);
  }

  @override
  final CreateFuelExpenseRequest? fuel;
// ⭐️ 타입 변경
  @override
  final bool? isDeducted;

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTripReportRequestCopyWith<_CreateTripReportRequest> get copyWith =>
      __$CreateTripReportRequestCopyWithImpl<_CreateTripReportRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateTripReportRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTripReportRequest &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      fuel,
      isDeducted);

  @override
  String toString() {
    return 'CreateTripReportRequest(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted)';
  }
}

/// @nodoc
abstract mixin class _$CreateTripReportRequestCopyWith<$Res>
    implements $CreateTripReportRequestCopyWith<$Res> {
  factory _$CreateTripReportRequestCopyWith(_CreateTripReportRequest value,
          $Res Function(_CreateTripReportRequest) _then) =
      __$CreateTripReportRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CreateActualExpenseRequest> expenses,
      List<CreateRegulationRateRequest> rates,
      CreateFuelExpenseRequest? fuel,
      bool? isDeducted});

  @override
  $CreateFuelExpenseRequestCopyWith<$Res>? get fuel;
}

/// @nodoc
class __$CreateTripReportRequestCopyWithImpl<$Res>
    implements _$CreateTripReportRequestCopyWith<$Res> {
  __$CreateTripReportRequestCopyWithImpl(this._self, this._then);

  final _CreateTripReportRequest _self;
  final $Res Function(_CreateTripReportRequest) _then;

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
  }) {
    return _then(_CreateTripReportRequest(
      expenses: null == expenses
          ? _self._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<CreateActualExpenseRequest>,
      rates: null == rates
          ? _self._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<CreateRegulationRateRequest>,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as CreateFuelExpenseRequest?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of CreateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateFuelExpenseRequestCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $CreateFuelExpenseRequestCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }
}

/// @nodoc
mixin _$CreateFuelExpenseRequest {
  String get rate;
  String get mileage;
  String get distance;

  /// Create a copy of CreateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateFuelExpenseRequestCopyWith<CreateFuelExpenseRequest> get copyWith =>
      _$CreateFuelExpenseRequestCopyWithImpl<CreateFuelExpenseRequest>(
          this as CreateFuelExpenseRequest, _$identity);

  /// Serializes this CreateFuelExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateFuelExpenseRequest &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, mileage, distance);

  @override
  String toString() {
    return 'CreateFuelExpenseRequest(rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class $CreateFuelExpenseRequestCopyWith<$Res> {
  factory $CreateFuelExpenseRequestCopyWith(CreateFuelExpenseRequest value,
          $Res Function(CreateFuelExpenseRequest) _then) =
      _$CreateFuelExpenseRequestCopyWithImpl;
  @useResult
  $Res call({String rate, String mileage, String distance});
}

/// @nodoc
class _$CreateFuelExpenseRequestCopyWithImpl<$Res>
    implements $CreateFuelExpenseRequestCopyWith<$Res> {
  _$CreateFuelExpenseRequestCopyWithImpl(this._self, this._then);

  final CreateFuelExpenseRequest _self;
  final $Res Function(CreateFuelExpenseRequest) _then;

  /// Create a copy of CreateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? mileage = null,
    Object? distance = null,
  }) {
    return _then(_self.copyWith(
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateFuelExpenseRequest].
extension CreateFuelExpenseRequestPatterns on CreateFuelExpenseRequest {
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
    TResult Function(_CreateFuelExpenseRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest() when $default != null:
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
    TResult Function(_CreateFuelExpenseRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest():
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
    TResult? Function(_CreateFuelExpenseRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest() when $default != null:
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
    TResult Function(String rate, String mileage, String distance)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest() when $default != null:
        return $default(_that.rate, _that.mileage, _that.distance);
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
    TResult Function(String rate, String mileage, String distance) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest():
        return $default(_that.rate, _that.mileage, _that.distance);
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
    TResult? Function(String rate, String mileage, String distance)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFuelExpenseRequest() when $default != null:
        return $default(_that.rate, _that.mileage, _that.distance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateFuelExpenseRequest implements CreateFuelExpenseRequest {
  _CreateFuelExpenseRequest(
      {required this.rate, required this.mileage, required this.distance});
  factory _CreateFuelExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFuelExpenseRequestFromJson(json);

  @override
  final String rate;
  @override
  final String mileage;
  @override
  final String distance;

  /// Create a copy of CreateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateFuelExpenseRequestCopyWith<_CreateFuelExpenseRequest> get copyWith =>
      __$CreateFuelExpenseRequestCopyWithImpl<_CreateFuelExpenseRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateFuelExpenseRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateFuelExpenseRequest &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, mileage, distance);

  @override
  String toString() {
    return 'CreateFuelExpenseRequest(rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class _$CreateFuelExpenseRequestCopyWith<$Res>
    implements $CreateFuelExpenseRequestCopyWith<$Res> {
  factory _$CreateFuelExpenseRequestCopyWith(_CreateFuelExpenseRequest value,
          $Res Function(_CreateFuelExpenseRequest) _then) =
      __$CreateFuelExpenseRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String rate, String mileage, String distance});
}

/// @nodoc
class __$CreateFuelExpenseRequestCopyWithImpl<$Res>
    implements _$CreateFuelExpenseRequestCopyWith<$Res> {
  __$CreateFuelExpenseRequestCopyWithImpl(this._self, this._then);

  final _CreateFuelExpenseRequest _self;
  final $Res Function(_CreateFuelExpenseRequest) _then;

  /// Create a copy of CreateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rate = null,
    Object? mileage = null,
    Object? distance = null,
  }) {
    return _then(_CreateFuelExpenseRequest(
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CreateActualExpenseRequest {
  int get stepId;
  String get price;
  String? get details;

  /// Create a copy of CreateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateActualExpenseRequestCopyWith<CreateActualExpenseRequest>
      get copyWith =>
          _$CreateActualExpenseRequestCopyWithImpl<CreateActualExpenseRequest>(
              this as CreateActualExpenseRequest, _$identity);

  /// Serializes this CreateActualExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateActualExpenseRequest &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepId, price, details);

  @override
  String toString() {
    return 'CreateActualExpenseRequest(stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class $CreateActualExpenseRequestCopyWith<$Res> {
  factory $CreateActualExpenseRequestCopyWith(CreateActualExpenseRequest value,
          $Res Function(CreateActualExpenseRequest) _then) =
      _$CreateActualExpenseRequestCopyWithImpl;
  @useResult
  $Res call({int stepId, String price, String? details});
}

/// @nodoc
class _$CreateActualExpenseRequestCopyWithImpl<$Res>
    implements $CreateActualExpenseRequestCopyWith<$Res> {
  _$CreateActualExpenseRequestCopyWithImpl(this._self, this._then);

  final CreateActualExpenseRequest _self;
  final $Res Function(CreateActualExpenseRequest) _then;

  /// Create a copy of CreateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? price = null,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateActualExpenseRequest].
extension CreateActualExpenseRequestPatterns on CreateActualExpenseRequest {
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
    TResult Function(_CreateActualExpenseRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest() when $default != null:
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
    TResult Function(_CreateActualExpenseRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest():
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
    TResult? Function(_CreateActualExpenseRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest() when $default != null:
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
    TResult Function(int stepId, String price, String? details)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest() when $default != null:
        return $default(_that.stepId, _that.price, _that.details);
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
    TResult Function(int stepId, String price, String? details) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest():
        return $default(_that.stepId, _that.price, _that.details);
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
    TResult? Function(int stepId, String price, String? details)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateActualExpenseRequest() when $default != null:
        return $default(_that.stepId, _that.price, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateActualExpenseRequest implements CreateActualExpenseRequest {
  _CreateActualExpenseRequest(
      {required this.stepId, required this.price, this.details});
  factory _CreateActualExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateActualExpenseRequestFromJson(json);

  @override
  final int stepId;
  @override
  final String price;
  @override
  final String? details;

  /// Create a copy of CreateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateActualExpenseRequestCopyWith<_CreateActualExpenseRequest>
      get copyWith => __$CreateActualExpenseRequestCopyWithImpl<
          _CreateActualExpenseRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateActualExpenseRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateActualExpenseRequest &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepId, price, details);

  @override
  String toString() {
    return 'CreateActualExpenseRequest(stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$CreateActualExpenseRequestCopyWith<$Res>
    implements $CreateActualExpenseRequestCopyWith<$Res> {
  factory _$CreateActualExpenseRequestCopyWith(
          _CreateActualExpenseRequest value,
          $Res Function(_CreateActualExpenseRequest) _then) =
      __$CreateActualExpenseRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int stepId, String price, String? details});
}

/// @nodoc
class __$CreateActualExpenseRequestCopyWithImpl<$Res>
    implements _$CreateActualExpenseRequestCopyWith<$Res> {
  __$CreateActualExpenseRequestCopyWithImpl(this._self, this._then);

  final _CreateActualExpenseRequest _self;
  final $Res Function(_CreateActualExpenseRequest) _then;

  /// Create a copy of CreateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stepId = null,
    Object? price = null,
    Object? details = freezed,
  }) {
    return _then(_CreateActualExpenseRequest(
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CreateRegulationRateRequest {
  int get stepId;
  String get days;
  String get rate;
  String? get details;

  /// Create a copy of CreateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateRegulationRateRequestCopyWith<CreateRegulationRateRequest>
      get copyWith => _$CreateRegulationRateRequestCopyWithImpl<
              CreateRegulationRateRequest>(
          this as CreateRegulationRateRequest, _$identity);

  /// Serializes this CreateRegulationRateRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateRegulationRateRequest &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepId, days, rate, details);

  @override
  String toString() {
    return 'CreateRegulationRateRequest(stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class $CreateRegulationRateRequestCopyWith<$Res> {
  factory $CreateRegulationRateRequestCopyWith(
          CreateRegulationRateRequest value,
          $Res Function(CreateRegulationRateRequest) _then) =
      _$CreateRegulationRateRequestCopyWithImpl;
  @useResult
  $Res call({int stepId, String days, String rate, String? details});
}

/// @nodoc
class _$CreateRegulationRateRequestCopyWithImpl<$Res>
    implements $CreateRegulationRateRequestCopyWith<$Res> {
  _$CreateRegulationRateRequestCopyWithImpl(this._self, this._then);

  final CreateRegulationRateRequest _self;
  final $Res Function(CreateRegulationRateRequest) _then;

  /// Create a copy of CreateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? days = null,
    Object? rate = null,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateRegulationRateRequest].
extension CreateRegulationRateRequestPatterns on CreateRegulationRateRequest {
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
    TResult Function(_CreateRegulationRateRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest() when $default != null:
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
    TResult Function(_CreateRegulationRateRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest():
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
    TResult? Function(_CreateRegulationRateRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest() when $default != null:
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
    TResult Function(int stepId, String days, String rate, String? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest() when $default != null:
        return $default(_that.stepId, _that.days, _that.rate, _that.details);
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
    TResult Function(int stepId, String days, String rate, String? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest():
        return $default(_that.stepId, _that.days, _that.rate, _that.details);
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
    TResult? Function(int stepId, String days, String rate, String? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRegulationRateRequest() when $default != null:
        return $default(_that.stepId, _that.days, _that.rate, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateRegulationRateRequest implements CreateRegulationRateRequest {
  _CreateRegulationRateRequest(
      {required this.stepId,
      required this.days,
      required this.rate,
      this.details});
  factory _CreateRegulationRateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRegulationRateRequestFromJson(json);

  @override
  final int stepId;
  @override
  final String days;
  @override
  final String rate;
  @override
  final String? details;

  /// Create a copy of CreateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateRegulationRateRequestCopyWith<_CreateRegulationRateRequest>
      get copyWith => __$CreateRegulationRateRequestCopyWithImpl<
          _CreateRegulationRateRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateRegulationRateRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateRegulationRateRequest &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepId, days, rate, details);

  @override
  String toString() {
    return 'CreateRegulationRateRequest(stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$CreateRegulationRateRequestCopyWith<$Res>
    implements $CreateRegulationRateRequestCopyWith<$Res> {
  factory _$CreateRegulationRateRequestCopyWith(
          _CreateRegulationRateRequest value,
          $Res Function(_CreateRegulationRateRequest) _then) =
      __$CreateRegulationRateRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int stepId, String days, String rate, String? details});
}

/// @nodoc
class __$CreateRegulationRateRequestCopyWithImpl<$Res>
    implements _$CreateRegulationRateRequestCopyWith<$Res> {
  __$CreateRegulationRateRequestCopyWithImpl(this._self, this._then);

  final _CreateRegulationRateRequest _self;
  final $Res Function(_CreateRegulationRateRequest) _then;

  /// Create a copy of CreateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stepId = null,
    Object? days = null,
    Object? rate = null,
    Object? details = freezed,
  }) {
    return _then(_CreateRegulationRateRequest(
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UpdateReportRequest {
  int? get scheduleId;
  int get projectId;
  String get content;
  List<ReportAttachment> get attachments;
  UpdateTripReportRequest? get trip;

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateReportRequestCopyWith<UpdateReportRequest> get copyWith =>
      _$UpdateReportRequestCopyWithImpl<UpdateReportRequest>(
          this as UpdateReportRequest, _$identity);

  /// Serializes this UpdateReportRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateReportRequest &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scheduleId, projectId, content,
      const DeepCollectionEquality().hash(attachments), trip);

  @override
  String toString() {
    return 'UpdateReportRequest(scheduleId: $scheduleId, projectId: $projectId, content: $content, attachments: $attachments, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class $UpdateReportRequestCopyWith<$Res> {
  factory $UpdateReportRequestCopyWith(
          UpdateReportRequest value, $Res Function(UpdateReportRequest) _then) =
      _$UpdateReportRequestCopyWithImpl;
  @useResult
  $Res call(
      {int? scheduleId,
      int projectId,
      String content,
      List<ReportAttachment> attachments,
      UpdateTripReportRequest? trip});

  $UpdateTripReportRequestCopyWith<$Res>? get trip;
}

/// @nodoc
class _$UpdateReportRequestCopyWithImpl<$Res>
    implements $UpdateReportRequestCopyWith<$Res> {
  _$UpdateReportRequestCopyWithImpl(this._self, this._then);

  final UpdateReportRequest _self;
  final $Res Function(UpdateReportRequest) _then;

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? projectId = null,
    Object? content = null,
    Object? attachments = null,
    Object? trip = freezed,
  }) {
    return _then(_self.copyWith(
      scheduleId: freezed == scheduleId
          ? _self.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as UpdateTripReportRequest?,
    ));
  }

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateTripReportRequestCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $UpdateTripReportRequestCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UpdateReportRequest].
extension UpdateReportRequestPatterns on UpdateReportRequest {
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
    TResult Function(_UpdateReportRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest() when $default != null:
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
    TResult Function(_UpdateReportRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest():
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
    TResult? Function(_UpdateReportRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest() when $default != null:
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
    TResult Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, UpdateTripReportRequest? trip)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest() when $default != null:
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
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
    TResult Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, UpdateTripReportRequest? trip)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest():
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
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
    TResult? Function(int? scheduleId, int projectId, String content,
            List<ReportAttachment> attachments, UpdateTripReportRequest? trip)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateReportRequest() when $default != null:
        return $default(_that.scheduleId, _that.projectId, _that.content,
            _that.attachments, _that.trip);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateReportRequest implements UpdateReportRequest {
  _UpdateReportRequest(
      {this.scheduleId,
      required this.projectId,
      required this.content,
      required final List<ReportAttachment> attachments,
      this.trip})
      : _attachments = attachments;
  factory _UpdateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportRequestFromJson(json);

  @override
  final int? scheduleId;
  @override
  final int projectId;
  @override
  final String content;
  final List<ReportAttachment> _attachments;
  @override
  List<ReportAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final UpdateTripReportRequest? trip;

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateReportRequestCopyWith<_UpdateReportRequest> get copyWith =>
      __$UpdateReportRequestCopyWithImpl<_UpdateReportRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateReportRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateReportRequest &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scheduleId, projectId, content,
      const DeepCollectionEquality().hash(_attachments), trip);

  @override
  String toString() {
    return 'UpdateReportRequest(scheduleId: $scheduleId, projectId: $projectId, content: $content, attachments: $attachments, trip: $trip)';
  }
}

/// @nodoc
abstract mixin class _$UpdateReportRequestCopyWith<$Res>
    implements $UpdateReportRequestCopyWith<$Res> {
  factory _$UpdateReportRequestCopyWith(_UpdateReportRequest value,
          $Res Function(_UpdateReportRequest) _then) =
      __$UpdateReportRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? scheduleId,
      int projectId,
      String content,
      List<ReportAttachment> attachments,
      UpdateTripReportRequest? trip});

  @override
  $UpdateTripReportRequestCopyWith<$Res>? get trip;
}

/// @nodoc
class __$UpdateReportRequestCopyWithImpl<$Res>
    implements _$UpdateReportRequestCopyWith<$Res> {
  __$UpdateReportRequestCopyWithImpl(this._self, this._then);

  final _UpdateReportRequest _self;
  final $Res Function(_UpdateReportRequest) _then;

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scheduleId = freezed,
    Object? projectId = null,
    Object? content = null,
    Object? attachments = null,
    Object? trip = freezed,
  }) {
    return _then(_UpdateReportRequest(
      scheduleId: freezed == scheduleId
          ? _self.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as UpdateTripReportRequest?,
    ));
  }

  /// Create a copy of UpdateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateTripReportRequestCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $UpdateTripReportRequestCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// @nodoc
mixin _$UpdateTripReportRequest {
// scheduleId 제거
  List<UpdateActualExpenseRequest>? get expenses; // ⭐️ Optional
  List<UpdateRegulationRateRequest>? get rates; // ⭐️ Optional
  UpdateFuelExpenseRequest? get fuel; // ⭐️ 타입 변경 및 Optional
  bool? get isDeducted;

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTripReportRequestCopyWith<UpdateTripReportRequest> get copyWith =>
      _$UpdateTripReportRequestCopyWithImpl<UpdateTripReportRequest>(
          this as UpdateTripReportRequest, _$identity);

  /// Serializes this UpdateTripReportRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTripReportRequest &&
            const DeepCollectionEquality().equals(other.expenses, expenses) &&
            const DeepCollectionEquality().equals(other.rates, rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expenses),
      const DeepCollectionEquality().hash(rates),
      fuel,
      isDeducted);

  @override
  String toString() {
    return 'UpdateTripReportRequest(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted)';
  }
}

/// @nodoc
abstract mixin class $UpdateTripReportRequestCopyWith<$Res> {
  factory $UpdateTripReportRequestCopyWith(UpdateTripReportRequest value,
          $Res Function(UpdateTripReportRequest) _then) =
      _$UpdateTripReportRequestCopyWithImpl;
  @useResult
  $Res call(
      {List<UpdateActualExpenseRequest>? expenses,
      List<UpdateRegulationRateRequest>? rates,
      UpdateFuelExpenseRequest? fuel,
      bool? isDeducted});

  $UpdateFuelExpenseRequestCopyWith<$Res>? get fuel;
}

/// @nodoc
class _$UpdateTripReportRequestCopyWithImpl<$Res>
    implements $UpdateTripReportRequestCopyWith<$Res> {
  _$UpdateTripReportRequestCopyWithImpl(this._self, this._then);

  final UpdateTripReportRequest _self;
  final $Res Function(UpdateTripReportRequest) _then;

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = freezed,
    Object? rates = freezed,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
  }) {
    return _then(_self.copyWith(
      expenses: freezed == expenses
          ? _self.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<UpdateActualExpenseRequest>?,
      rates: freezed == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<UpdateRegulationRateRequest>?,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as UpdateFuelExpenseRequest?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateFuelExpenseRequestCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $UpdateFuelExpenseRequestCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UpdateTripReportRequest].
extension UpdateTripReportRequestPatterns on UpdateTripReportRequest {
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
    TResult Function(_UpdateTripReportRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest() when $default != null:
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
    TResult Function(_UpdateTripReportRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest():
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
    TResult? Function(_UpdateTripReportRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest() when $default != null:
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
            List<UpdateActualExpenseRequest>? expenses,
            List<UpdateRegulationRateRequest>? rates,
            UpdateFuelExpenseRequest? fuel,
            bool? isDeducted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest() when $default != null:
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
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
            List<UpdateActualExpenseRequest>? expenses,
            List<UpdateRegulationRateRequest>? rates,
            UpdateFuelExpenseRequest? fuel,
            bool? isDeducted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest():
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
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
            List<UpdateActualExpenseRequest>? expenses,
            List<UpdateRegulationRateRequest>? rates,
            UpdateFuelExpenseRequest? fuel,
            bool? isDeducted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateTripReportRequest() when $default != null:
        return $default(
            _that.expenses, _that.rates, _that.fuel, _that.isDeducted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTripReportRequest implements UpdateTripReportRequest {
  _UpdateTripReportRequest(
      {final List<UpdateActualExpenseRequest>? expenses,
      final List<UpdateRegulationRateRequest>? rates,
      this.fuel,
      this.isDeducted})
      : _expenses = expenses,
        _rates = rates;
  factory _UpdateTripReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTripReportRequestFromJson(json);

// scheduleId 제거
  final List<UpdateActualExpenseRequest>? _expenses;
// scheduleId 제거
  @override
  List<UpdateActualExpenseRequest>? get expenses {
    final value = _expenses;
    if (value == null) return null;
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ⭐️ Optional
  final List<UpdateRegulationRateRequest>? _rates;
// ⭐️ Optional
  @override
  List<UpdateRegulationRateRequest>? get rates {
    final value = _rates;
    if (value == null) return null;
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ⭐️ Optional
  @override
  final UpdateFuelExpenseRequest? fuel;
// ⭐️ 타입 변경 및 Optional
  @override
  final bool? isDeducted;

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTripReportRequestCopyWith<_UpdateTripReportRequest> get copyWith =>
      __$UpdateTripReportRequestCopyWithImpl<_UpdateTripReportRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTripReportRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTripReportRequest &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      fuel,
      isDeducted);

  @override
  String toString() {
    return 'UpdateTripReportRequest(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTripReportRequestCopyWith<$Res>
    implements $UpdateTripReportRequestCopyWith<$Res> {
  factory _$UpdateTripReportRequestCopyWith(_UpdateTripReportRequest value,
          $Res Function(_UpdateTripReportRequest) _then) =
      __$UpdateTripReportRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<UpdateActualExpenseRequest>? expenses,
      List<UpdateRegulationRateRequest>? rates,
      UpdateFuelExpenseRequest? fuel,
      bool? isDeducted});

  @override
  $UpdateFuelExpenseRequestCopyWith<$Res>? get fuel;
}

/// @nodoc
class __$UpdateTripReportRequestCopyWithImpl<$Res>
    implements _$UpdateTripReportRequestCopyWith<$Res> {
  __$UpdateTripReportRequestCopyWithImpl(this._self, this._then);

  final _UpdateTripReportRequest _self;
  final $Res Function(_UpdateTripReportRequest) _then;

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expenses = freezed,
    Object? rates = freezed,
    Object? fuel = freezed,
    Object? isDeducted = freezed,
  }) {
    return _then(_UpdateTripReportRequest(
      expenses: freezed == expenses
          ? _self._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<UpdateActualExpenseRequest>?,
      rates: freezed == rates
          ? _self._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<UpdateRegulationRateRequest>?,
      fuel: freezed == fuel
          ? _self.fuel
          : fuel // ignore: cast_nullable_to_non_nullable
              as UpdateFuelExpenseRequest?,
      isDeducted: freezed == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of UpdateTripReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateFuelExpenseRequestCopyWith<$Res>? get fuel {
    if (_self.fuel == null) {
      return null;
    }

    return $UpdateFuelExpenseRequestCopyWith<$Res>(_self.fuel!, (value) {
      return _then(_self.copyWith(fuel: value));
    });
  }
}

/// @nodoc
mixin _$UpdateFuelExpenseRequest {
  int? get id;
  String? get rate;
  String? get mileage;
  String? get distance;

  /// Create a copy of UpdateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFuelExpenseRequestCopyWith<UpdateFuelExpenseRequest> get copyWith =>
      _$UpdateFuelExpenseRequestCopyWithImpl<UpdateFuelExpenseRequest>(
          this as UpdateFuelExpenseRequest, _$identity);

  /// Serializes this UpdateFuelExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFuelExpenseRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rate, mileage, distance);

  @override
  String toString() {
    return 'UpdateFuelExpenseRequest(id: $id, rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class $UpdateFuelExpenseRequestCopyWith<$Res> {
  factory $UpdateFuelExpenseRequestCopyWith(UpdateFuelExpenseRequest value,
          $Res Function(UpdateFuelExpenseRequest) _then) =
      _$UpdateFuelExpenseRequestCopyWithImpl;
  @useResult
  $Res call({int? id, String? rate, String? mileage, String? distance});
}

/// @nodoc
class _$UpdateFuelExpenseRequestCopyWithImpl<$Res>
    implements $UpdateFuelExpenseRequestCopyWith<$Res> {
  _$UpdateFuelExpenseRequestCopyWithImpl(this._self, this._then);

  final UpdateFuelExpenseRequest _self;
  final $Res Function(UpdateFuelExpenseRequest) _then;

  /// Create a copy of UpdateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? mileage = freezed,
    Object? distance = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateFuelExpenseRequest].
extension UpdateFuelExpenseRequestPatterns on UpdateFuelExpenseRequest {
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
    TResult Function(_UpdateFuelExpenseRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest() when $default != null:
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
    TResult Function(_UpdateFuelExpenseRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest():
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
    TResult? Function(_UpdateFuelExpenseRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest() when $default != null:
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
    TResult Function(int? id, String? rate, String? mileage, String? distance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest() when $default != null:
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
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
    TResult Function(int? id, String? rate, String? mileage, String? distance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest():
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
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
    TResult? Function(int? id, String? rate, String? mileage, String? distance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateFuelExpenseRequest() when $default != null:
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateFuelExpenseRequest implements UpdateFuelExpenseRequest {
  _UpdateFuelExpenseRequest({this.id, this.rate, this.mileage, this.distance});
  factory _UpdateFuelExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFuelExpenseRequestFromJson(json);

  @override
  final int? id;
  @override
  final String? rate;
  @override
  final String? mileage;
  @override
  final String? distance;

  /// Create a copy of UpdateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateFuelExpenseRequestCopyWith<_UpdateFuelExpenseRequest> get copyWith =>
      __$UpdateFuelExpenseRequestCopyWithImpl<_UpdateFuelExpenseRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateFuelExpenseRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateFuelExpenseRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rate, mileage, distance);

  @override
  String toString() {
    return 'UpdateFuelExpenseRequest(id: $id, rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class _$UpdateFuelExpenseRequestCopyWith<$Res>
    implements $UpdateFuelExpenseRequestCopyWith<$Res> {
  factory _$UpdateFuelExpenseRequestCopyWith(_UpdateFuelExpenseRequest value,
          $Res Function(_UpdateFuelExpenseRequest) _then) =
      __$UpdateFuelExpenseRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? rate, String? mileage, String? distance});
}

/// @nodoc
class __$UpdateFuelExpenseRequestCopyWithImpl<$Res>
    implements _$UpdateFuelExpenseRequestCopyWith<$Res> {
  __$UpdateFuelExpenseRequestCopyWithImpl(this._self, this._then);

  final _UpdateFuelExpenseRequest _self;
  final $Res Function(_UpdateFuelExpenseRequest) _then;

  /// Create a copy of UpdateFuelExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? mileage = freezed,
    Object? distance = freezed,
  }) {
    return _then(_UpdateFuelExpenseRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UpdateActualExpenseRequest {
  int? get id;
  int get stepId;
  String get price;
  String? get details;

  /// Create a copy of UpdateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateActualExpenseRequestCopyWith<UpdateActualExpenseRequest>
      get copyWith =>
          _$UpdateActualExpenseRequestCopyWithImpl<UpdateActualExpenseRequest>(
              this as UpdateActualExpenseRequest, _$identity);

  /// Serializes this UpdateActualExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateActualExpenseRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, price, details);

  @override
  String toString() {
    return 'UpdateActualExpenseRequest(id: $id, stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class $UpdateActualExpenseRequestCopyWith<$Res> {
  factory $UpdateActualExpenseRequestCopyWith(UpdateActualExpenseRequest value,
          $Res Function(UpdateActualExpenseRequest) _then) =
      _$UpdateActualExpenseRequestCopyWithImpl;
  @useResult
  $Res call({int? id, int stepId, String price, String? details});
}

/// @nodoc
class _$UpdateActualExpenseRequestCopyWithImpl<$Res>
    implements $UpdateActualExpenseRequestCopyWith<$Res> {
  _$UpdateActualExpenseRequestCopyWithImpl(this._self, this._then);

  final UpdateActualExpenseRequest _self;
  final $Res Function(UpdateActualExpenseRequest) _then;

  /// Create a copy of UpdateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? price = null,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateActualExpenseRequest].
extension UpdateActualExpenseRequestPatterns on UpdateActualExpenseRequest {
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
    TResult Function(_UpdateActualExpenseRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest() when $default != null:
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
    TResult Function(_UpdateActualExpenseRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest():
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
    TResult? Function(_UpdateActualExpenseRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest() when $default != null:
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
    TResult Function(int? id, int stepId, String price, String? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest() when $default != null:
        return $default(_that.id, _that.stepId, _that.price, _that.details);
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
    TResult Function(int? id, int stepId, String price, String? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest():
        return $default(_that.id, _that.stepId, _that.price, _that.details);
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
    TResult? Function(int? id, int stepId, String price, String? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateActualExpenseRequest() when $default != null:
        return $default(_that.id, _that.stepId, _that.price, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateActualExpenseRequest implements UpdateActualExpenseRequest {
  _UpdateActualExpenseRequest(
      {this.id, required this.stepId, required this.price, this.details});
  factory _UpdateActualExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateActualExpenseRequestFromJson(json);

  @override
  final int? id;
  @override
  final int stepId;
  @override
  final String price;
  @override
  final String? details;

  /// Create a copy of UpdateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateActualExpenseRequestCopyWith<_UpdateActualExpenseRequest>
      get copyWith => __$UpdateActualExpenseRequestCopyWithImpl<
          _UpdateActualExpenseRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateActualExpenseRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateActualExpenseRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, price, details);

  @override
  String toString() {
    return 'UpdateActualExpenseRequest(id: $id, stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$UpdateActualExpenseRequestCopyWith<$Res>
    implements $UpdateActualExpenseRequestCopyWith<$Res> {
  factory _$UpdateActualExpenseRequestCopyWith(
          _UpdateActualExpenseRequest value,
          $Res Function(_UpdateActualExpenseRequest) _then) =
      __$UpdateActualExpenseRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, int stepId, String price, String? details});
}

/// @nodoc
class __$UpdateActualExpenseRequestCopyWithImpl<$Res>
    implements _$UpdateActualExpenseRequestCopyWith<$Res> {
  __$UpdateActualExpenseRequestCopyWithImpl(this._self, this._then);

  final _UpdateActualExpenseRequest _self;
  final $Res Function(_UpdateActualExpenseRequest) _then;

  /// Create a copy of UpdateActualExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? price = null,
    Object? details = freezed,
  }) {
    return _then(_UpdateActualExpenseRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UpdateRegulationRateRequest {
  int? get id;
  int get stepId;
  String get days;
  String get rate;
  String? get details;

  /// Create a copy of UpdateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateRegulationRateRequestCopyWith<UpdateRegulationRateRequest>
      get copyWith => _$UpdateRegulationRateRequestCopyWithImpl<
              UpdateRegulationRateRequest>(
          this as UpdateRegulationRateRequest, _$identity);

  /// Serializes this UpdateRegulationRateRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateRegulationRateRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, days, rate, details);

  @override
  String toString() {
    return 'UpdateRegulationRateRequest(id: $id, stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class $UpdateRegulationRateRequestCopyWith<$Res> {
  factory $UpdateRegulationRateRequestCopyWith(
          UpdateRegulationRateRequest value,
          $Res Function(UpdateRegulationRateRequest) _then) =
      _$UpdateRegulationRateRequestCopyWithImpl;
  @useResult
  $Res call({int? id, int stepId, String days, String rate, String? details});
}

/// @nodoc
class _$UpdateRegulationRateRequestCopyWithImpl<$Res>
    implements $UpdateRegulationRateRequestCopyWith<$Res> {
  _$UpdateRegulationRateRequestCopyWithImpl(this._self, this._then);

  final UpdateRegulationRateRequest _self;
  final $Res Function(UpdateRegulationRateRequest) _then;

  /// Create a copy of UpdateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? days = null,
    Object? rate = null,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateRegulationRateRequest].
extension UpdateRegulationRateRequestPatterns on UpdateRegulationRateRequest {
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
    TResult Function(_UpdateRegulationRateRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest() when $default != null:
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
    TResult Function(_UpdateRegulationRateRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest():
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
    TResult? Function(_UpdateRegulationRateRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest() when $default != null:
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
            int? id, int stepId, String days, String rate, String? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest() when $default != null:
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
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
            int? id, int stepId, String days, String rate, String? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest():
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
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
            int? id, int stepId, String days, String rate, String? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateRegulationRateRequest() when $default != null:
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateRegulationRateRequest implements UpdateRegulationRateRequest {
  _UpdateRegulationRateRequest(
      {this.id,
      required this.stepId,
      required this.days,
      required this.rate,
      this.details});
  factory _UpdateRegulationRateRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegulationRateRequestFromJson(json);

  @override
  final int? id;
  @override
  final int stepId;
  @override
  final String days;
  @override
  final String rate;
  @override
  final String? details;

  /// Create a copy of UpdateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateRegulationRateRequestCopyWith<_UpdateRegulationRateRequest>
      get copyWith => __$UpdateRegulationRateRequestCopyWithImpl<
          _UpdateRegulationRateRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateRegulationRateRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateRegulationRateRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, days, rate, details);

  @override
  String toString() {
    return 'UpdateRegulationRateRequest(id: $id, stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$UpdateRegulationRateRequestCopyWith<$Res>
    implements $UpdateRegulationRateRequestCopyWith<$Res> {
  factory _$UpdateRegulationRateRequestCopyWith(
          _UpdateRegulationRateRequest value,
          $Res Function(_UpdateRegulationRateRequest) _then) =
      __$UpdateRegulationRateRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, int stepId, String days, String rate, String? details});
}

/// @nodoc
class __$UpdateRegulationRateRequestCopyWithImpl<$Res>
    implements _$UpdateRegulationRateRequestCopyWith<$Res> {
  __$UpdateRegulationRateRequestCopyWithImpl(this._self, this._then);

  final _UpdateRegulationRateRequest _self;
  final $Res Function(_UpdateRegulationRateRequest) _then;

  /// Create a copy of UpdateRegulationRateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? days = null,
    Object? rate = null,
    Object? details = freezed,
  }) {
    return _then(_UpdateRegulationRateRequest(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Result<T> {
  List<T> get items;
  int get page;
  int get total;
  bool get hasNext;
  bool get hasPrevious;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultCopyWith<T, Result<T>> get copyWith =>
      _$ResultCopyWithImpl<T, Result<T>>(this as Result<T>, _$identity);

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      page,
      total,
      hasNext,
      hasPrevious);

  @override
  String toString() {
    return 'Result<$T>(items: $items, page: $page, total: $total, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }
}

/// @nodoc
abstract mixin class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) _then) =
      _$ResultCopyWithImpl;
  @useResult
  $Res call(
      {List<T> items, int page, int total, bool hasNext, bool hasPrevious});
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result<T> _self;
  final $Res Function(Result<T>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _self.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _self.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<T> on Result<T> {
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
    TResult Function(_Result<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Result() when $default != null:
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
    TResult Function(_Result<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Result():
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
    TResult? Function(_Result<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Result() when $default != null:
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
            List<T> items, int page, int total, bool hasNext, bool hasPrevious)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Result() when $default != null:
        return $default(_that.items, _that.page, _that.total, _that.hasNext,
            _that.hasPrevious);
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
            List<T> items, int page, int total, bool hasNext, bool hasPrevious)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Result():
        return $default(_that.items, _that.page, _that.total, _that.hasNext,
            _that.hasPrevious);
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
            List<T> items, int page, int total, bool hasNext, bool hasPrevious)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Result() when $default != null:
        return $default(_that.items, _that.page, _that.total, _that.hasNext,
            _that.hasPrevious);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _Result<T> extends Result<T> {
  const _Result(
      {final List<T> items = const [],
      this.page = 0,
      this.total = 0,
      this.hasNext = false,
      this.hasPrevious = false})
      : _items = items,
        super._();
  factory _Result.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResultFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  @JsonKey()
  List<T> get items {
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
  final bool hasNext;
  @override
  @JsonKey()
  final bool hasPrevious;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultCopyWith<T, _Result<T>> get copyWith =>
      __$ResultCopyWithImpl<T, _Result<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ResultToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Result<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      page,
      total,
      hasNext,
      hasPrevious);

  @override
  String toString() {
    return 'Result<$T>(items: $items, page: $page, total: $total, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }
}

/// @nodoc
abstract mixin class _$ResultCopyWith<T, $Res>
    implements $ResultCopyWith<T, $Res> {
  factory _$ResultCopyWith(_Result<T> value, $Res Function(_Result<T>) _then) =
      __$ResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<T> items, int page, int total, bool hasNext, bool hasPrevious});
}

/// @nodoc
class __$ResultCopyWithImpl<T, $Res> implements _$ResultCopyWith<T, $Res> {
  __$ResultCopyWithImpl(this._self, this._then);

  final _Result<T> _self;
  final $Res Function(_Result<T>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_Result<T>(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _self.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _self.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$File {
  String get path;
  String get url;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileCopyWith<File> get copyWith =>
      _$FileCopyWithImpl<File>(this as File, _$identity);

  /// Serializes this File to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is File &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, url);

  @override
  String toString() {
    return 'File(path: $path, url: $url)';
  }
}

/// @nodoc
abstract mixin class $FileCopyWith<$Res> {
  factory $FileCopyWith(File value, $Res Function(File) _then) =
      _$FileCopyWithImpl;
  @useResult
  $Res call({String path, String url});
}

/// @nodoc
class _$FileCopyWithImpl<$Res> implements $FileCopyWith<$Res> {
  _$FileCopyWithImpl(this._self, this._then);

  final File _self;
  final $Res Function(File) _then;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [File].
extension FilePatterns on File {
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
    TResult Function(_File value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _File() when $default != null:
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
    TResult Function(_File value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _File():
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
    TResult? Function(_File value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _File() when $default != null:
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
    TResult Function(String path, String url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _File() when $default != null:
        return $default(_that.path, _that.url);
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
    TResult Function(String path, String url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _File():
        return $default(_that.path, _that.url);
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
    TResult? Function(String path, String url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _File() when $default != null:
        return $default(_that.path, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _File implements File {
  _File({required this.path, required this.url});
  factory _File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  @override
  final String path;
  @override
  final String url;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileCopyWith<_File> get copyWith =>
      __$FileCopyWithImpl<_File>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _File &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path, url);

  @override
  String toString() {
    return 'File(path: $path, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$FileCopyWith<$Res> implements $FileCopyWith<$Res> {
  factory _$FileCopyWith(_File value, $Res Function(_File) _then) =
      __$FileCopyWithImpl;
  @override
  @useResult
  $Res call({String path, String url});
}

/// @nodoc
class __$FileCopyWithImpl<$Res> implements _$FileCopyWith<$Res> {
  __$FileCopyWithImpl(this._self, this._then);

  final _File _self;
  final $Res Function(_File) _then;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? url = null,
  }) {
    return _then(_File(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

ScheduleCategory _$ScheduleCategoryFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'domestic':
      return ScheduleDomestic.fromJson(json);
    case 'overseas':
      return ScheduleOverseas.fromJson(json);
    case 'center':
      return ScheduleCenter.fromJson(json);
    case 'remote':
      return ScheduleRemote.fromJson(json);
    case 'conference':
      return ScheduleConference.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ScheduleCategory',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ScheduleCategory {
  int get id;
  String get name;
  String get color;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCategoryCopyWith<ScheduleCategory> get copyWith =>
      _$ScheduleCategoryCopyWithImpl<ScheduleCategory>(
          this as ScheduleCategory, _$identity);

  /// Serializes this ScheduleCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleCategoryCopyWith(
          ScheduleCategory value, $Res Function(ScheduleCategory) _then) =
      _$ScheduleCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleCategoryCopyWithImpl<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  _$ScheduleCategoryCopyWithImpl(this._self, this._then);

  final ScheduleCategory _self;
  final $Res Function(ScheduleCategory) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleCategory].
extension ScheduleCategoryPatterns on ScheduleCategory {
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
    TResult Function(ScheduleDomestic value)? domestic,
    TResult Function(ScheduleOverseas value)? overseas,
    TResult Function(ScheduleCenter value)? center,
    TResult Function(ScheduleRemote value)? remote,
    TResult Function(ScheduleConference value)? conference,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic() when domestic != null:
        return domestic(_that);
      case ScheduleOverseas() when overseas != null:
        return overseas(_that);
      case ScheduleCenter() when center != null:
        return center(_that);
      case ScheduleRemote() when remote != null:
        return remote(_that);
      case ScheduleConference() when conference != null:
        return conference(_that);
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
    required TResult Function(ScheduleDomestic value) domestic,
    required TResult Function(ScheduleOverseas value) overseas,
    required TResult Function(ScheduleCenter value) center,
    required TResult Function(ScheduleRemote value) remote,
    required TResult Function(ScheduleConference value) conference,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic():
        return domestic(_that);
      case ScheduleOverseas():
        return overseas(_that);
      case ScheduleCenter():
        return center(_that);
      case ScheduleRemote():
        return remote(_that);
      case ScheduleConference():
        return conference(_that);
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
    TResult? Function(ScheduleDomestic value)? domestic,
    TResult? Function(ScheduleOverseas value)? overseas,
    TResult? Function(ScheduleCenter value)? center,
    TResult? Function(ScheduleRemote value)? remote,
    TResult? Function(ScheduleConference value)? conference,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic() when domestic != null:
        return domestic(_that);
      case ScheduleOverseas() when overseas != null:
        return overseas(_that);
      case ScheduleCenter() when center != null:
        return center(_that);
      case ScheduleRemote() when remote != null:
        return remote(_that);
      case ScheduleConference() when conference != null:
        return conference(_that);
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
    TResult Function(int id, String name, String color)? domestic,
    TResult Function(int id, String name, String color)? overseas,
    TResult Function(int id, String name, String color)? center,
    TResult Function(int id, String name, String color)? remote,
    TResult Function(int id, String name, String color)? conference,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic() when domestic != null:
        return domestic(_that.id, _that.name, _that.color);
      case ScheduleOverseas() when overseas != null:
        return overseas(_that.id, _that.name, _that.color);
      case ScheduleCenter() when center != null:
        return center(_that.id, _that.name, _that.color);
      case ScheduleRemote() when remote != null:
        return remote(_that.id, _that.name, _that.color);
      case ScheduleConference() when conference != null:
        return conference(_that.id, _that.name, _that.color);
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
    required TResult Function(int id, String name, String color) domestic,
    required TResult Function(int id, String name, String color) overseas,
    required TResult Function(int id, String name, String color) center,
    required TResult Function(int id, String name, String color) remote,
    required TResult Function(int id, String name, String color) conference,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic():
        return domestic(_that.id, _that.name, _that.color);
      case ScheduleOverseas():
        return overseas(_that.id, _that.name, _that.color);
      case ScheduleCenter():
        return center(_that.id, _that.name, _that.color);
      case ScheduleRemote():
        return remote(_that.id, _that.name, _that.color);
      case ScheduleConference():
        return conference(_that.id, _that.name, _that.color);
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
    TResult? Function(int id, String name, String color)? domestic,
    TResult? Function(int id, String name, String color)? overseas,
    TResult? Function(int id, String name, String color)? center,
    TResult? Function(int id, String name, String color)? remote,
    TResult? Function(int id, String name, String color)? conference,
  }) {
    final _that = this;
    switch (_that) {
      case ScheduleDomestic() when domestic != null:
        return domestic(_that.id, _that.name, _that.color);
      case ScheduleOverseas() when overseas != null:
        return overseas(_that.id, _that.name, _that.color);
      case ScheduleCenter() when center != null:
        return center(_that.id, _that.name, _that.color);
      case ScheduleRemote() when remote != null:
        return remote(_that.id, _that.name, _that.color);
      case ScheduleConference() when conference != null:
        return conference(_that.id, _that.name, _that.color);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class ScheduleDomestic implements ScheduleCategory {
  ScheduleDomestic(
      {required this.id,
      required this.name,
      required this.color,
      final String? $type})
      : $type = $type ?? 'domestic';
  factory ScheduleDomestic.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDomesticFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleDomesticCopyWith<ScheduleDomestic> get copyWith =>
      _$ScheduleDomesticCopyWithImpl<ScheduleDomestic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleDomesticToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleDomestic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory.domestic(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleDomesticCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleDomesticCopyWith(
          ScheduleDomestic value, $Res Function(ScheduleDomestic) _then) =
      _$ScheduleDomesticCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleDomesticCopyWithImpl<$Res>
    implements $ScheduleDomesticCopyWith<$Res> {
  _$ScheduleDomesticCopyWithImpl(this._self, this._then);

  final ScheduleDomestic _self;
  final $Res Function(ScheduleDomestic) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(ScheduleDomestic(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ScheduleOverseas implements ScheduleCategory {
  ScheduleOverseas(
      {required this.id,
      required this.name,
      required this.color,
      final String? $type})
      : $type = $type ?? 'overseas';
  factory ScheduleOverseas.fromJson(Map<String, dynamic> json) =>
      _$ScheduleOverseasFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleOverseasCopyWith<ScheduleOverseas> get copyWith =>
      _$ScheduleOverseasCopyWithImpl<ScheduleOverseas>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleOverseasToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleOverseas &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory.overseas(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleOverseasCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleOverseasCopyWith(
          ScheduleOverseas value, $Res Function(ScheduleOverseas) _then) =
      _$ScheduleOverseasCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleOverseasCopyWithImpl<$Res>
    implements $ScheduleOverseasCopyWith<$Res> {
  _$ScheduleOverseasCopyWithImpl(this._self, this._then);

  final ScheduleOverseas _self;
  final $Res Function(ScheduleOverseas) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(ScheduleOverseas(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ScheduleCenter implements ScheduleCategory {
  ScheduleCenter(
      {required this.id,
      required this.name,
      required this.color,
      final String? $type})
      : $type = $type ?? 'center';
  factory ScheduleCenter.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCenterFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCenterCopyWith<ScheduleCenter> get copyWith =>
      _$ScheduleCenterCopyWithImpl<ScheduleCenter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleCenterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleCenter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory.center(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCenterCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleCenterCopyWith(
          ScheduleCenter value, $Res Function(ScheduleCenter) _then) =
      _$ScheduleCenterCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleCenterCopyWithImpl<$Res>
    implements $ScheduleCenterCopyWith<$Res> {
  _$ScheduleCenterCopyWithImpl(this._self, this._then);

  final ScheduleCenter _self;
  final $Res Function(ScheduleCenter) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(ScheduleCenter(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ScheduleRemote implements ScheduleCategory {
  ScheduleRemote(
      {required this.id,
      required this.name,
      required this.color,
      final String? $type})
      : $type = $type ?? 'remote';
  factory ScheduleRemote.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRemoteFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleRemoteCopyWith<ScheduleRemote> get copyWith =>
      _$ScheduleRemoteCopyWithImpl<ScheduleRemote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleRemoteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleRemote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory.remote(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleRemoteCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleRemoteCopyWith(
          ScheduleRemote value, $Res Function(ScheduleRemote) _then) =
      _$ScheduleRemoteCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleRemoteCopyWithImpl<$Res>
    implements $ScheduleRemoteCopyWith<$Res> {
  _$ScheduleRemoteCopyWithImpl(this._self, this._then);

  final ScheduleRemote _self;
  final $Res Function(ScheduleRemote) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(ScheduleRemote(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ScheduleConference implements ScheduleCategory {
  ScheduleConference(
      {required this.id,
      required this.name,
      required this.color,
      final String? $type})
      : $type = $type ?? 'conference';
  factory ScheduleConference.fromJson(Map<String, dynamic> json) =>
      _$ScheduleConferenceFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String color;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleConferenceCopyWith<ScheduleConference> get copyWith =>
      _$ScheduleConferenceCopyWithImpl<ScheduleConference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleConferenceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleConference &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @override
  String toString() {
    return 'ScheduleCategory.conference(id: $id, name: $name, color: $color)';
  }
}

/// @nodoc
abstract mixin class $ScheduleConferenceCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleConferenceCopyWith(
          ScheduleConference value, $Res Function(ScheduleConference) _then) =
      _$ScheduleConferenceCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String color});
}

/// @nodoc
class _$ScheduleConferenceCopyWithImpl<$Res>
    implements $ScheduleConferenceCopyWith<$Res> {
  _$ScheduleConferenceCopyWithImpl(this._self, this._then);

  final ScheduleConference _self;
  final $Res Function(ScheduleConference) _then;

  /// Create a copy of ScheduleCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(ScheduleConference(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ScheduleGroup {
  DateTime get date;
  List<Schedule> get items;

  /// Create a copy of ScheduleGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleGroupCopyWith<ScheduleGroup> get copyWith =>
      _$ScheduleGroupCopyWithImpl<ScheduleGroup>(
          this as ScheduleGroup, _$identity);

  /// Serializes this ScheduleGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleGroup &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ScheduleGroup(date: $date, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ScheduleGroupCopyWith<$Res> {
  factory $ScheduleGroupCopyWith(
          ScheduleGroup value, $Res Function(ScheduleGroup) _then) =
      _$ScheduleGroupCopyWithImpl;
  @useResult
  $Res call({DateTime date, List<Schedule> items});
}

/// @nodoc
class _$ScheduleGroupCopyWithImpl<$Res>
    implements $ScheduleGroupCopyWith<$Res> {
  _$ScheduleGroupCopyWithImpl(this._self, this._then);

  final ScheduleGroup _self;
  final $Res Function(ScheduleGroup) _then;

  /// Create a copy of ScheduleGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleGroup].
extension ScheduleGroupPatterns on ScheduleGroup {
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
    TResult Function(_ScheduleGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup() when $default != null:
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
    TResult Function(_ScheduleGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup():
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
    TResult? Function(_ScheduleGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup() when $default != null:
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
    TResult Function(DateTime date, List<Schedule> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup() when $default != null:
        return $default(_that.date, _that.items);
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
    TResult Function(DateTime date, List<Schedule> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup():
        return $default(_that.date, _that.items);
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
    TResult? Function(DateTime date, List<Schedule> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleGroup() when $default != null:
        return $default(_that.date, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ScheduleGroup implements ScheduleGroup {
  _ScheduleGroup({required this.date, final List<Schedule> items = const []})
      : _items = items;
  factory _ScheduleGroup.fromJson(Map<String, dynamic> json) =>
      _$ScheduleGroupFromJson(json);

  @override
  final DateTime date;
  final List<Schedule> _items;
  @override
  @JsonKey()
  List<Schedule> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ScheduleGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleGroupCopyWith<_ScheduleGroup> get copyWith =>
      __$ScheduleGroupCopyWithImpl<_ScheduleGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleGroup &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ScheduleGroup(date: $date, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleGroupCopyWith<$Res>
    implements $ScheduleGroupCopyWith<$Res> {
  factory _$ScheduleGroupCopyWith(
          _ScheduleGroup value, $Res Function(_ScheduleGroup) _then) =
      __$ScheduleGroupCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, List<Schedule> items});
}

/// @nodoc
class __$ScheduleGroupCopyWithImpl<$Res>
    implements _$ScheduleGroupCopyWith<$Res> {
  __$ScheduleGroupCopyWithImpl(this._self, this._then);

  final _ScheduleGroup _self;
  final $Res Function(_ScheduleGroup) _then;

  /// Create a copy of ScheduleGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? items = null,
  }) {
    return _then(_ScheduleGroup(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// @nodoc
mixin _$Schedule {
  int get id;
  int get projectId;
  String get projectCode;
  String get projectName;
  int get projectClientId;
  String get projectClientName;
  String get eventId;
  ScheduleCategory get category;
  User get user;
  String get summary;
  String? get description;
  String get url;
  DateTime get start;
  DateTime get end;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<Schedule> get copyWith =>
      _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectClientId, projectClientId) ||
                other.projectClientId == projectClientId) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      projectCode,
      projectName,
      projectClientId,
      projectClientName,
      eventId,
      category,
      user,
      summary,
      description,
      url,
      start,
      end);

  @override
  String toString() {
    return 'Schedule(id: $id, projectId: $projectId, projectCode: $projectCode, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, eventId: $eventId, category: $category, user: $user, summary: $summary, description: $description, url: $url, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) =
      _$ScheduleCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int projectId,
      String projectCode,
      String projectName,
      int projectClientId,
      String projectClientName,
      String eventId,
      ScheduleCategory category,
      User user,
      String summary,
      String? description,
      String url,
      DateTime start,
      DateTime end});

  $ScheduleCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res> implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectClientId = null,
    Object? projectClientName = null,
    Object? eventId = null,
    Object? category = null,
    Object? user = null,
    Object? summary = null,
    Object? description = freezed,
    Object? url = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectClientId: null == projectClientId
          ? _self.projectClientId
          : projectClientId // ignore: cast_nullable_to_non_nullable
              as int,
      projectClientName: null == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ScheduleCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCategoryCopyWith<$Res> get category {
    return $ScheduleCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Schedule].
extension SchedulePatterns on Schedule {
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
    TResult Function(_Schedule value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Schedule() when $default != null:
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
    TResult Function(_Schedule value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Schedule():
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
    TResult? Function(_Schedule value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Schedule() when $default != null:
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            int projectClientId,
            String projectClientName,
            String eventId,
            ScheduleCategory category,
            User user,
            String summary,
            String? description,
            String url,
            DateTime start,
            DateTime end)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Schedule() when $default != null:
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.eventId,
            _that.category,
            _that.user,
            _that.summary,
            _that.description,
            _that.url,
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            int projectClientId,
            String projectClientName,
            String eventId,
            ScheduleCategory category,
            User user,
            String summary,
            String? description,
            String url,
            DateTime start,
            DateTime end)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Schedule():
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.eventId,
            _that.category,
            _that.user,
            _that.summary,
            _that.description,
            _that.url,
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
            int id,
            int projectId,
            String projectCode,
            String projectName,
            int projectClientId,
            String projectClientName,
            String eventId,
            ScheduleCategory category,
            User user,
            String summary,
            String? description,
            String url,
            DateTime start,
            DateTime end)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Schedule() when $default != null:
        return $default(
            _that.id,
            _that.projectId,
            _that.projectCode,
            _that.projectName,
            _that.projectClientId,
            _that.projectClientName,
            _that.eventId,
            _that.category,
            _that.user,
            _that.summary,
            _that.description,
            _that.url,
            _that.start,
            _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Schedule implements Schedule {
  _Schedule(
      {required this.id,
      required this.projectId,
      required this.projectCode,
      required this.projectName,
      required this.projectClientId,
      required this.projectClientName,
      required this.eventId,
      required this.category,
      required this.user,
      this.summary = '',
      this.description,
      this.url = '',
      required this.start,
      required this.end});
  factory _Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  @override
  final int id;
  @override
  final int projectId;
  @override
  final String projectCode;
  @override
  final String projectName;
  @override
  final int projectClientId;
  @override
  final String projectClientName;
  @override
  final String eventId;
  @override
  final ScheduleCategory category;
  @override
  final User user;
  @override
  @JsonKey()
  final String summary;
  @override
  final String? description;
  @override
  @JsonKey()
  final String url;
  @override
  final DateTime start;
  @override
  final DateTime end;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleCopyWith<_Schedule> get copyWith =>
      __$ScheduleCopyWithImpl<_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectClientId, projectClientId) ||
                other.projectClientId == projectClientId) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      projectCode,
      projectName,
      projectClientId,
      projectClientName,
      eventId,
      category,
      user,
      summary,
      description,
      url,
      start,
      end);

  @override
  String toString() {
    return 'Schedule(id: $id, projectId: $projectId, projectCode: $projectCode, projectName: $projectName, projectClientId: $projectClientId, projectClientName: $projectClientName, eventId: $eventId, category: $category, user: $user, summary: $summary, description: $description, url: $url, start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$ScheduleCopyWith(_Schedule value, $Res Function(_Schedule) _then) =
      __$ScheduleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int projectId,
      String projectCode,
      String projectName,
      int projectClientId,
      String projectClientName,
      String eventId,
      ScheduleCategory category,
      User user,
      String summary,
      String? description,
      String url,
      DateTime start,
      DateTime end});

  @override
  $ScheduleCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$ScheduleCopyWithImpl<$Res> implements _$ScheduleCopyWith<$Res> {
  __$ScheduleCopyWithImpl(this._self, this._then);

  final _Schedule _self;
  final $Res Function(_Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectClientId = null,
    Object? projectClientName = null,
    Object? eventId = null,
    Object? category = null,
    Object? user = null,
    Object? summary = null,
    Object? description = freezed,
    Object? url = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_Schedule(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _self.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectClientId: null == projectClientId
          ? _self.projectClientId
          : projectClientId // ignore: cast_nullable_to_non_nullable
              as int,
      projectClientName: null == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ScheduleCategory,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCategoryCopyWith<$Res> get category {
    return $ScheduleCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of Schedule
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
mixin _$TodaySchedule {
  String get summary;
  ScheduleCategory get category;
  DateTime get start;
  DateTime get end;
  String get projectClientName;
  User get user;

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodayScheduleCopyWith<TodaySchedule> get copyWith =>
      _$TodayScheduleCopyWithImpl<TodaySchedule>(
          this as TodaySchedule, _$identity);

  /// Serializes this TodaySchedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodaySchedule &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, summary, category, start, end, projectClientName, user);

  @override
  String toString() {
    return 'TodaySchedule(summary: $summary, category: $category, start: $start, end: $end, projectClientName: $projectClientName, user: $user)';
  }
}

/// @nodoc
abstract mixin class $TodayScheduleCopyWith<$Res> {
  factory $TodayScheduleCopyWith(
          TodaySchedule value, $Res Function(TodaySchedule) _then) =
      _$TodayScheduleCopyWithImpl;
  @useResult
  $Res call(
      {String summary,
      ScheduleCategory category,
      DateTime start,
      DateTime end,
      String projectClientName,
      User user});

  $ScheduleCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$TodayScheduleCopyWithImpl<$Res>
    implements $TodayScheduleCopyWith<$Res> {
  _$TodayScheduleCopyWithImpl(this._self, this._then);

  final TodaySchedule _self;
  final $Res Function(TodaySchedule) _then;

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? category = null,
    Object? start = null,
    Object? end = null,
    Object? projectClientName = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ScheduleCategory,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectClientName: null == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCategoryCopyWith<$Res> get category {
    return $ScheduleCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TodaySchedule].
extension TodaySchedulePatterns on TodaySchedule {
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
    TResult Function(_TodaySchedule value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule() when $default != null:
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
    TResult Function(_TodaySchedule value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule():
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
    TResult? Function(_TodaySchedule value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule() when $default != null:
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
    TResult Function(String summary, ScheduleCategory category, DateTime start,
            DateTime end, String projectClientName, User user)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule() when $default != null:
        return $default(_that.summary, _that.category, _that.start, _that.end,
            _that.projectClientName, _that.user);
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
    TResult Function(String summary, ScheduleCategory category, DateTime start,
            DateTime end, String projectClientName, User user)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule():
        return $default(_that.summary, _that.category, _that.start, _that.end,
            _that.projectClientName, _that.user);
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
    TResult? Function(String summary, ScheduleCategory category, DateTime start,
            DateTime end, String projectClientName, User user)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TodaySchedule() when $default != null:
        return $default(_that.summary, _that.category, _that.start, _that.end,
            _that.projectClientName, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TodaySchedule implements TodaySchedule {
  _TodaySchedule(
      {required this.summary,
      required this.category,
      required this.start,
      required this.end,
      required this.projectClientName,
      required this.user});
  factory _TodaySchedule.fromJson(Map<String, dynamic> json) =>
      _$TodayScheduleFromJson(json);

  @override
  final String summary;
  @override
  final ScheduleCategory category;
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final String projectClientName;
  @override
  final User user;

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodayScheduleCopyWith<_TodaySchedule> get copyWith =>
      __$TodayScheduleCopyWithImpl<_TodaySchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodayScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodaySchedule &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.projectClientName, projectClientName) ||
                other.projectClientName == projectClientName) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, summary, category, start, end, projectClientName, user);

  @override
  String toString() {
    return 'TodaySchedule(summary: $summary, category: $category, start: $start, end: $end, projectClientName: $projectClientName, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$TodayScheduleCopyWith<$Res>
    implements $TodayScheduleCopyWith<$Res> {
  factory _$TodayScheduleCopyWith(
          _TodaySchedule value, $Res Function(_TodaySchedule) _then) =
      __$TodayScheduleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String summary,
      ScheduleCategory category,
      DateTime start,
      DateTime end,
      String projectClientName,
      User user});

  @override
  $ScheduleCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$TodayScheduleCopyWithImpl<$Res>
    implements _$TodayScheduleCopyWith<$Res> {
  __$TodayScheduleCopyWithImpl(this._self, this._then);

  final _TodaySchedule _self;
  final $Res Function(_TodaySchedule) _then;

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? category = null,
    Object? start = null,
    Object? end = null,
    Object? projectClientName = null,
    Object? user = null,
  }) {
    return _then(_TodaySchedule(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ScheduleCategory,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectClientName: null == projectClientName
          ? _self.projectClientName
          : projectClientName // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of TodaySchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCategoryCopyWith<$Res> get category {
    return $ScheduleCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of TodaySchedule
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
mixin _$Supplier {
  int get id;
  String get name;
  String get number;
  String? get address;
  String? get phone;
  String? get email;
  String? get logo;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<Supplier> get copyWith =>
      _$SupplierCopyWithImpl<Supplier>(this as Supplier, _$identity);

  /// Serializes this Supplier to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Supplier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, number, address, phone, email, logo);

  @override
  String toString() {
    return 'Supplier(id: $id, name: $name, number: $number, address: $address, phone: $phone, email: $email, logo: $logo)';
  }
}

/// @nodoc
abstract mixin class $SupplierCopyWith<$Res> {
  factory $SupplierCopyWith(Supplier value, $Res Function(Supplier) _then) =
      _$SupplierCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String number,
      String? address,
      String? phone,
      String? email,
      String? logo});
}

/// @nodoc
class _$SupplierCopyWithImpl<$Res> implements $SupplierCopyWith<$Res> {
  _$SupplierCopyWithImpl(this._self, this._then);

  final Supplier _self;
  final $Res Function(Supplier) _then;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? logo = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Supplier].
extension SupplierPatterns on Supplier {
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
    TResult Function(_Supplier value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
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
    TResult Function(_Supplier value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier():
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
    TResult? Function(_Supplier value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
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
    TResult Function(int id, String name, String number, String? address,
            String? phone, String? email, String? logo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
        return $default(_that.id, _that.name, _that.number, _that.address,
            _that.phone, _that.email, _that.logo);
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
    TResult Function(int id, String name, String number, String? address,
            String? phone, String? email, String? logo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier():
        return $default(_that.id, _that.name, _that.number, _that.address,
            _that.phone, _that.email, _that.logo);
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
    TResult? Function(int id, String name, String number, String? address,
            String? phone, String? email, String? logo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
        return $default(_that.id, _that.name, _that.number, _that.address,
            _that.phone, _that.email, _that.logo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Supplier implements Supplier {
  _Supplier(
      {required this.id,
      required this.name,
      required this.number,
      this.address,
      this.phone,
      this.email,
      this.logo});
  factory _Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String number;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? logo;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierCopyWith<_Supplier> get copyWith =>
      __$SupplierCopyWithImpl<_Supplier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Supplier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, number, address, phone, email, logo);

  @override
  String toString() {
    return 'Supplier(id: $id, name: $name, number: $number, address: $address, phone: $phone, email: $email, logo: $logo)';
  }
}

/// @nodoc
abstract mixin class _$SupplierCopyWith<$Res>
    implements $SupplierCopyWith<$Res> {
  factory _$SupplierCopyWith(_Supplier value, $Res Function(_Supplier) _then) =
      __$SupplierCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String number,
      String? address,
      String? phone,
      String? email,
      String? logo});
}

/// @nodoc
class __$SupplierCopyWithImpl<$Res> implements _$SupplierCopyWith<$Res> {
  __$SupplierCopyWithImpl(this._self, this._then);

  final _Supplier _self;
  final $Res Function(_Supplier) _then;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? logo = freezed,
  }) {
    return _then(_Supplier(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SupplierKeyword {
  int get id;
  String get name;

  /// Create a copy of SupplierKeyword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierKeywordCopyWith<SupplierKeyword> get copyWith =>
      _$SupplierKeywordCopyWithImpl<SupplierKeyword>(
          this as SupplierKeyword, _$identity);

  /// Serializes this SupplierKeyword to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SupplierKeyword &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'SupplierKeyword(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $SupplierKeywordCopyWith<$Res> {
  factory $SupplierKeywordCopyWith(
          SupplierKeyword value, $Res Function(SupplierKeyword) _then) =
      _$SupplierKeywordCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$SupplierKeywordCopyWithImpl<$Res>
    implements $SupplierKeywordCopyWith<$Res> {
  _$SupplierKeywordCopyWithImpl(this._self, this._then);

  final SupplierKeyword _self;
  final $Res Function(SupplierKeyword) _then;

  /// Create a copy of SupplierKeyword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SupplierKeyword].
extension SupplierKeywordPatterns on SupplierKeyword {
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
    TResult Function(_SupplierKeyword value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword() when $default != null:
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
    TResult Function(_SupplierKeyword value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword():
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
    TResult? Function(_SupplierKeyword value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SupplierKeyword() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SupplierKeyword implements SupplierKeyword {
  _SupplierKeyword({required this.id, required this.name});
  factory _SupplierKeyword.fromJson(Map<String, dynamic> json) =>
      _$SupplierKeywordFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of SupplierKeyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierKeywordCopyWith<_SupplierKeyword> get copyWith =>
      __$SupplierKeywordCopyWithImpl<_SupplierKeyword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SupplierKeywordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SupplierKeyword &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'SupplierKeyword(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$SupplierKeywordCopyWith<$Res>
    implements $SupplierKeywordCopyWith<$Res> {
  factory _$SupplierKeywordCopyWith(
          _SupplierKeyword value, $Res Function(_SupplierKeyword) _then) =
      __$SupplierKeywordCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$SupplierKeywordCopyWithImpl<$Res>
    implements _$SupplierKeywordCopyWith<$Res> {
  __$SupplierKeywordCopyWithImpl(this._self, this._then);

  final _SupplierKeyword _self;
  final $Res Function(_SupplierKeyword) _then;

  /// Create a copy of SupplierKeyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_SupplierKeyword(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Token {
  String get accessToken;
  String get refreshToken;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenCopyWith<Token> get copyWith =>
      _$TokenCopyWithImpl<Token>(this as Token, _$identity);

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Token &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) _then) =
      _$TokenCopyWithImpl;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._self, this._then);

  final Token _self;
  final $Res Function(Token) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Token].
extension TokenPatterns on Token {
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
    TResult Function(_Token value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Token() when $default != null:
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
    TResult Function(_Token value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Token():
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
    TResult? Function(_Token value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Token() when $default != null:
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
    TResult Function(String accessToken, String refreshToken)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Token() when $default != null:
        return $default(_that.accessToken, _that.refreshToken);
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
    TResult Function(String accessToken, String refreshToken) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Token():
        return $default(_that.accessToken, _that.refreshToken);
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
    TResult? Function(String accessToken, String refreshToken)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Token() when $default != null:
        return $default(_that.accessToken, _that.refreshToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Token implements Token {
  _Token({required this.accessToken, required this.refreshToken});
  factory _Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenCopyWith<_Token> get copyWith =>
      __$TokenCopyWithImpl<_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Token &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$TokenCopyWith(_Token value, $Res Function(_Token) _then) =
      __$TokenCopyWithImpl;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$TokenCopyWithImpl<$Res> implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(this._self, this._then);

  final _Token _self;
  final $Res Function(_Token) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_Token(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Report {
  int get id;
  Schedule? get schedule;
  User get user;
  TripReport? get trip;
  String get content;
  List<ReportAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportCopyWith<Report> get copyWith =>
      _$ReportCopyWithImpl<Report>(this as Report, _$identity);

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Report &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      schedule,
      user,
      trip,
      content,
      const DeepCollectionEquality().hash(attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'Report(id: $id, schedule: $schedule, user: $user, trip: $trip, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) _then) =
      _$ReportCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      Schedule? schedule,
      User user,
      TripReport? trip,
      String content,
      List<ReportAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $ScheduleCopyWith<$Res>? get schedule;
  $UserCopyWith<$Res> get user;
  $TripReportCopyWith<$Res>? get trip;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._self, this._then);

  final Report _self;
  final $Res Function(Report) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? schedule = freezed,
    Object? user = null,
    Object? trip = freezed,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as TripReport?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Report
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

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripReportCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $TripReportCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Report].
extension ReportPatterns on Report {
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
    TResult Function(_Report value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Report() when $default != null:
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
    TResult Function(_Report value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Report():
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
    TResult? Function(_Report value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Report() when $default != null:
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
            int id,
            Schedule? schedule,
            User user,
            TripReport? trip,
            String content,
            List<ReportAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Report() when $default != null:
        return $default(
            _that.id,
            _that.schedule,
            _that.user,
            _that.trip,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            Schedule? schedule,
            User user,
            TripReport? trip,
            String content,
            List<ReportAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Report():
        return $default(
            _that.id,
            _that.schedule,
            _that.user,
            _that.trip,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
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
            int id,
            Schedule? schedule,
            User user,
            TripReport? trip,
            String content,
            List<ReportAttachment> attachments,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? deletedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Report() when $default != null:
        return $default(
            _that.id,
            _that.schedule,
            _that.user,
            _that.trip,
            _that.content,
            _that.attachments,
            _that.createdAt,
            _that.updatedAt,
            _that.deletedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Report implements Report {
  _Report(
      {required this.id,
      this.schedule,
      required this.user,
      this.trip,
      required this.content,
      required final List<ReportAttachment> attachments,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt})
      : _attachments = attachments;
  factory _Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  @override
  final int id;
  @override
  final Schedule? schedule;
  @override
  final User user;
  @override
  final TripReport? trip;
  @override
  final String content;
  final List<ReportAttachment> _attachments;
  @override
  List<ReportAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportCopyWith<_Report> get copyWith =>
      __$ReportCopyWithImpl<_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Report &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      schedule,
      user,
      trip,
      content,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      updatedAt,
      deletedAt);

  @override
  String toString() {
    return 'Report(id: $id, schedule: $schedule, user: $user, trip: $trip, content: $content, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) =
      __$ReportCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      Schedule? schedule,
      User user,
      TripReport? trip,
      String content,
      List<ReportAttachment> attachments,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $ScheduleCopyWith<$Res>? get schedule;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $TripReportCopyWith<$Res>? get trip;
}

/// @nodoc
class __$ReportCopyWithImpl<$Res> implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? schedule = freezed,
    Object? user = null,
    Object? trip = freezed,
    Object? content = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_Report(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      trip: freezed == trip
          ? _self.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as TripReport?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<ReportAttachment>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Report
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

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripReportCopyWith<$Res>? get trip {
    if (_self.trip == null) {
      return null;
    }

    return $TripReportCopyWith<$Res>(_self.trip!, (value) {
      return _then(_self.copyWith(trip: value));
    });
  }
}

/// @nodoc
mixin _$ReportAttachment {
  int get id;
  String get filename;
  int get size;
  String get path;
  DateTime get createdAt;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportAttachmentCopyWith<ReportAttachment> get copyWith =>
      _$ReportAttachmentCopyWithImpl<ReportAttachment>(
          this as ReportAttachment, _$identity);

  /// Serializes this ReportAttachment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportAttachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, size, path, createdAt);

  @override
  String toString() {
    return 'ReportAttachment(id: $id, filename: $filename, size: $size, path: $path, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ReportAttachmentCopyWith<$Res> {
  factory $ReportAttachmentCopyWith(
          ReportAttachment value, $Res Function(ReportAttachment) _then) =
      _$ReportAttachmentCopyWithImpl;
  @useResult
  $Res call(
      {int id, String filename, int size, String path, DateTime createdAt});
}

/// @nodoc
class _$ReportAttachmentCopyWithImpl<$Res>
    implements $ReportAttachmentCopyWith<$Res> {
  _$ReportAttachmentCopyWithImpl(this._self, this._then);

  final ReportAttachment _self;
  final $Res Function(ReportAttachment) _then;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? size = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportAttachment].
extension ReportAttachmentPatterns on ReportAttachment {
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
    TResult Function(_ReportAttachment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment() when $default != null:
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
    TResult Function(_ReportAttachment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment():
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
    TResult? Function(_ReportAttachment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment() when $default != null:
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
            int id, String filename, int size, String path, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment() when $default != null:
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
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
            int id, String filename, int size, String path, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment():
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
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
            int id, String filename, int size, String path, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAttachment() when $default != null:
        return $default(
            _that.id, _that.filename, _that.size, _that.path, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportAttachment implements ReportAttachment {
  _ReportAttachment(
      {required this.id,
      required this.filename,
      required this.size,
      required this.path,
      required this.createdAt});
  factory _ReportAttachment.fromJson(Map<String, dynamic> json) =>
      _$ReportAttachmentFromJson(json);

  @override
  final int id;
  @override
  final String filename;
  @override
  final int size;
  @override
  final String path;
  @override
  final DateTime createdAt;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportAttachmentCopyWith<_ReportAttachment> get copyWith =>
      __$ReportAttachmentCopyWithImpl<_ReportAttachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportAttachmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportAttachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, size, path, createdAt);

  @override
  String toString() {
    return 'ReportAttachment(id: $id, filename: $filename, size: $size, path: $path, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ReportAttachmentCopyWith<$Res>
    implements $ReportAttachmentCopyWith<$Res> {
  factory _$ReportAttachmentCopyWith(
          _ReportAttachment value, $Res Function(_ReportAttachment) _then) =
      __$ReportAttachmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String filename, int size, String path, DateTime createdAt});
}

/// @nodoc
class __$ReportAttachmentCopyWithImpl<$Res>
    implements _$ReportAttachmentCopyWith<$Res> {
  __$ReportAttachmentCopyWithImpl(this._self, this._then);

  final _ReportAttachment _self;
  final $Res Function(_ReportAttachment) _then;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? size = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_ReportAttachment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$TripReport {
  List<TripActualExpense> get expenses;
  List<TripRegulationRate> get rates;
  TripFuelExpense? get fuel;
  bool get isDeducted;
  TripCalculations? get calculations;

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripReportCopyWith<TripReport> get copyWith =>
      _$TripReportCopyWithImpl<TripReport>(this as TripReport, _$identity);

  /// Serializes this TripReport to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripReport &&
            const DeepCollectionEquality().equals(other.expenses, expenses) &&
            const DeepCollectionEquality().equals(other.rates, rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted) &&
            (identical(other.calculations, calculations) ||
                other.calculations == calculations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expenses),
      const DeepCollectionEquality().hash(rates),
      fuel,
      isDeducted,
      calculations);

  @override
  String toString() {
    return 'TripReport(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, calculations: $calculations)';
  }
}

/// @nodoc
abstract mixin class $TripReportCopyWith<$Res> {
  factory $TripReportCopyWith(
          TripReport value, $Res Function(TripReport) _then) =
      _$TripReportCopyWithImpl;
  @useResult
  $Res call(
      {List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      TripFuelExpense? fuel,
      bool isDeducted,
      TripCalculations? calculations});

  $TripFuelExpenseCopyWith<$Res>? get fuel;
  $TripCalculationsCopyWith<$Res>? get calculations;
}

/// @nodoc
class _$TripReportCopyWithImpl<$Res> implements $TripReportCopyWith<$Res> {
  _$TripReportCopyWithImpl(this._self, this._then);

  final TripReport _self;
  final $Res Function(TripReport) _then;

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = null,
    Object? calculations = freezed,
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
      isDeducted: null == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool,
      calculations: freezed == calculations
          ? _self.calculations
          : calculations // ignore: cast_nullable_to_non_nullable
              as TripCalculations?,
    ));
  }

  /// Create a copy of TripReport
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

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripCalculationsCopyWith<$Res>? get calculations {
    if (_self.calculations == null) {
      return null;
    }

    return $TripCalculationsCopyWith<$Res>(_self.calculations!, (value) {
      return _then(_self.copyWith(calculations: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TripReport].
extension TripReportPatterns on TripReport {
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
    TResult Function(_TripReport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripReport() when $default != null:
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
    TResult Function(_TripReport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripReport():
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
    TResult? Function(_TripReport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripReport() when $default != null:
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
            bool isDeducted,
            TripCalculations? calculations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripReport() when $default != null:
        return $default(_that.expenses, _that.rates, _that.fuel,
            _that.isDeducted, _that.calculations);
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
            bool isDeducted,
            TripCalculations? calculations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripReport():
        return $default(_that.expenses, _that.rates, _that.fuel,
            _that.isDeducted, _that.calculations);
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
            List<TripActualExpense> expenses,
            List<TripRegulationRate> rates,
            TripFuelExpense? fuel,
            bool isDeducted,
            TripCalculations? calculations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripReport() when $default != null:
        return $default(_that.expenses, _that.rates, _that.fuel,
            _that.isDeducted, _that.calculations);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripReport extends TripReport {
  _TripReport(
      {required final List<TripActualExpense> expenses,
      required final List<TripRegulationRate> rates,
      this.fuel,
      this.isDeducted = false,
      this.calculations})
      : _expenses = expenses,
        _rates = rates,
        super._();
  factory _TripReport.fromJson(Map<String, dynamic> json) =>
      _$TripReportFromJson(json);

  final List<TripActualExpense> _expenses;
  @override
  List<TripActualExpense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<TripRegulationRate> _rates;
  @override
  List<TripRegulationRate> get rates {
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rates);
  }

  @override
  final TripFuelExpense? fuel;
  @override
  @JsonKey()
  final bool isDeducted;
  @override
  final TripCalculations? calculations;

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripReportCopyWith<_TripReport> get copyWith =>
      __$TripReportCopyWithImpl<_TripReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripReportToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripReport &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._rates, _rates) &&
            (identical(other.fuel, fuel) || other.fuel == fuel) &&
            (identical(other.isDeducted, isDeducted) ||
                other.isDeducted == isDeducted) &&
            (identical(other.calculations, calculations) ||
                other.calculations == calculations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_rates),
      fuel,
      isDeducted,
      calculations);

  @override
  String toString() {
    return 'TripReport(expenses: $expenses, rates: $rates, fuel: $fuel, isDeducted: $isDeducted, calculations: $calculations)';
  }
}

/// @nodoc
abstract mixin class _$TripReportCopyWith<$Res>
    implements $TripReportCopyWith<$Res> {
  factory _$TripReportCopyWith(
          _TripReport value, $Res Function(_TripReport) _then) =
      __$TripReportCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TripActualExpense> expenses,
      List<TripRegulationRate> rates,
      TripFuelExpense? fuel,
      bool isDeducted,
      TripCalculations? calculations});

  @override
  $TripFuelExpenseCopyWith<$Res>? get fuel;
  @override
  $TripCalculationsCopyWith<$Res>? get calculations;
}

/// @nodoc
class __$TripReportCopyWithImpl<$Res> implements _$TripReportCopyWith<$Res> {
  __$TripReportCopyWithImpl(this._self, this._then);

  final _TripReport _self;
  final $Res Function(_TripReport) _then;

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expenses = null,
    Object? rates = null,
    Object? fuel = freezed,
    Object? isDeducted = null,
    Object? calculations = freezed,
  }) {
    return _then(_TripReport(
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
      isDeducted: null == isDeducted
          ? _self.isDeducted
          : isDeducted // ignore: cast_nullable_to_non_nullable
              as bool,
      calculations: freezed == calculations
          ? _self.calculations
          : calculations // ignore: cast_nullable_to_non_nullable
              as TripCalculations?,
    ));
  }

  /// Create a copy of TripReport
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

  /// Create a copy of TripReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripCalculationsCopyWith<$Res>? get calculations {
    if (_self.calculations == null) {
      return null;
    }

    return $TripCalculationsCopyWith<$Res>(_self.calculations!, (value) {
      return _then(_self.copyWith(calculations: value));
    });
  }
}

/// @nodoc
mixin _$TripCategory {
  int get id;
  String get name;
  String? get description;

  /// Create a copy of TripCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripCategoryCopyWith<TripCategory> get copyWith =>
      _$TripCategoryCopyWithImpl<TripCategory>(
          this as TripCategory, _$identity);

  /// Serializes this TripCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'TripCategory(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $TripCategoryCopyWith<$Res> {
  factory $TripCategoryCopyWith(
          TripCategory value, $Res Function(TripCategory) _then) =
      _$TripCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$TripCategoryCopyWithImpl<$Res> implements $TripCategoryCopyWith<$Res> {
  _$TripCategoryCopyWithImpl(this._self, this._then);

  final TripCategory _self;
  final $Res Function(TripCategory) _then;

  /// Create a copy of TripCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripCategory].
extension TripCategoryPatterns on TripCategory {
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
    TResult Function(_TripCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripCategory() when $default != null:
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
    TResult Function(_TripCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCategory():
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
    TResult? Function(_TripCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCategory() when $default != null:
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
    TResult Function(int id, String name, String? description)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripCategory() when $default != null:
        return $default(_that.id, _that.name, _that.description);
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
    TResult Function(int id, String name, String? description) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCategory():
        return $default(_that.id, _that.name, _that.description);
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
    TResult? Function(int id, String name, String? description)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCategory() when $default != null:
        return $default(_that.id, _that.name, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripCategory implements TripCategory {
  _TripCategory({required this.id, required this.name, this.description});
  factory _TripCategory.fromJson(Map<String, dynamic> json) =>
      _$TripCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  /// Create a copy of TripCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripCategoryCopyWith<_TripCategory> get copyWith =>
      __$TripCategoryCopyWithImpl<_TripCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'TripCategory(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$TripCategoryCopyWith<$Res>
    implements $TripCategoryCopyWith<$Res> {
  factory _$TripCategoryCopyWith(
          _TripCategory value, $Res Function(_TripCategory) _then) =
      __$TripCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$TripCategoryCopyWithImpl<$Res>
    implements _$TripCategoryCopyWith<$Res> {
  __$TripCategoryCopyWithImpl(this._self, this._then);

  final _TripCategory _self;
  final $Res Function(_TripCategory) _then;

  /// Create a copy of TripCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_TripCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TripStep {
  int get id;
  int get categoryId;
  String get name;
  String? get description;

  /// Create a copy of TripStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripStepCopyWith<TripStep> get copyWith =>
      _$TripStepCopyWithImpl<TripStep>(this as TripStep, _$identity);

  /// Serializes this TripStep to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripStep &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryId, name, description);

  @override
  String toString() {
    return 'TripStep(id: $id, categoryId: $categoryId, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $TripStepCopyWith<$Res> {
  factory $TripStepCopyWith(TripStep value, $Res Function(TripStep) _then) =
      _$TripStepCopyWithImpl;
  @useResult
  $Res call({int id, int categoryId, String name, String? description});
}

/// @nodoc
class _$TripStepCopyWithImpl<$Res> implements $TripStepCopyWith<$Res> {
  _$TripStepCopyWithImpl(this._self, this._then);

  final TripStep _self;
  final $Res Function(TripStep) _then;

  /// Create a copy of TripStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripStep].
extension TripStepPatterns on TripStep {
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
    TResult Function(_TripStep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripStep() when $default != null:
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
    TResult Function(_TripStep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStep():
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
    TResult? Function(_TripStep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStep() when $default != null:
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
    TResult Function(int id, int categoryId, String name, String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripStep() when $default != null:
        return $default(
            _that.id, _that.categoryId, _that.name, _that.description);
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
    TResult Function(int id, int categoryId, String name, String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStep():
        return $default(
            _that.id, _that.categoryId, _that.name, _that.description);
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
    TResult? Function(int id, int categoryId, String name, String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripStep() when $default != null:
        return $default(
            _that.id, _that.categoryId, _that.name, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripStep implements TripStep {
  _TripStep(
      {required this.id,
      required this.categoryId,
      required this.name,
      this.description});
  factory _TripStep.fromJson(Map<String, dynamic> json) =>
      _$TripStepFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final String name;
  @override
  final String? description;

  /// Create a copy of TripStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripStepCopyWith<_TripStep> get copyWith =>
      __$TripStepCopyWithImpl<_TripStep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripStepToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripStep &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryId, name, description);

  @override
  String toString() {
    return 'TripStep(id: $id, categoryId: $categoryId, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$TripStepCopyWith<$Res>
    implements $TripStepCopyWith<$Res> {
  factory _$TripStepCopyWith(_TripStep value, $Res Function(_TripStep) _then) =
      __$TripStepCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int categoryId, String name, String? description});
}

/// @nodoc
class __$TripStepCopyWithImpl<$Res> implements _$TripStepCopyWith<$Res> {
  __$TripStepCopyWithImpl(this._self, this._then);

  final _TripStep _self;
  final $Res Function(_TripStep) _then;

  /// Create a copy of TripStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_TripStep(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TripActualExpense {
  int? get id;
  int get stepId;
  String? get price;
  String? get details;

  /// Create a copy of TripActualExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripActualExpenseCopyWith<TripActualExpense> get copyWith =>
      _$TripActualExpenseCopyWithImpl<TripActualExpense>(
          this as TripActualExpense, _$identity);

  /// Serializes this TripActualExpense to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripActualExpense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, price, details);

  @override
  String toString() {
    return 'TripActualExpense(id: $id, stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class $TripActualExpenseCopyWith<$Res> {
  factory $TripActualExpenseCopyWith(
          TripActualExpense value, $Res Function(TripActualExpense) _then) =
      _$TripActualExpenseCopyWithImpl;
  @useResult
  $Res call({int? id, int stepId, String? price, String? details});
}

/// @nodoc
class _$TripActualExpenseCopyWithImpl<$Res>
    implements $TripActualExpenseCopyWith<$Res> {
  _$TripActualExpenseCopyWithImpl(this._self, this._then);

  final TripActualExpense _self;
  final $Res Function(TripActualExpense) _then;

  /// Create a copy of TripActualExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? price = freezed,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripActualExpense].
extension TripActualExpensePatterns on TripActualExpense {
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
    TResult Function(_TripActualExpense value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense() when $default != null:
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
    TResult Function(_TripActualExpense value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense():
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
    TResult? Function(_TripActualExpense value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense() when $default != null:
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
    TResult Function(int? id, int stepId, String? price, String? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense() when $default != null:
        return $default(_that.id, _that.stepId, _that.price, _that.details);
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
    TResult Function(int? id, int stepId, String? price, String? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense():
        return $default(_that.id, _that.stepId, _that.price, _that.details);
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
    TResult? Function(int? id, int stepId, String? price, String? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripActualExpense() when $default != null:
        return $default(_that.id, _that.stepId, _that.price, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripActualExpense implements TripActualExpense {
  _TripActualExpense({this.id, required this.stepId, this.price, this.details});
  factory _TripActualExpense.fromJson(Map<String, dynamic> json) =>
      _$TripActualExpenseFromJson(json);

  @override
  final int? id;
  @override
  final int stepId;
  @override
  final String? price;
  @override
  final String? details;

  /// Create a copy of TripActualExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripActualExpenseCopyWith<_TripActualExpense> get copyWith =>
      __$TripActualExpenseCopyWithImpl<_TripActualExpense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripActualExpenseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripActualExpense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, price, details);

  @override
  String toString() {
    return 'TripActualExpense(id: $id, stepId: $stepId, price: $price, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$TripActualExpenseCopyWith<$Res>
    implements $TripActualExpenseCopyWith<$Res> {
  factory _$TripActualExpenseCopyWith(
          _TripActualExpense value, $Res Function(_TripActualExpense) _then) =
      __$TripActualExpenseCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, int stepId, String? price, String? details});
}

/// @nodoc
class __$TripActualExpenseCopyWithImpl<$Res>
    implements _$TripActualExpenseCopyWith<$Res> {
  __$TripActualExpenseCopyWithImpl(this._self, this._then);

  final _TripActualExpense _self;
  final $Res Function(_TripActualExpense) _then;

  /// Create a copy of TripActualExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? price = freezed,
    Object? details = freezed,
  }) {
    return _then(_TripActualExpense(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TripRegulationRate {
  int? get id;
  int get stepId;
  String? get days;
  String? get rate;
  String? get details;

  /// Create a copy of TripRegulationRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripRegulationRateCopyWith<TripRegulationRate> get copyWith =>
      _$TripRegulationRateCopyWithImpl<TripRegulationRate>(
          this as TripRegulationRate, _$identity);

  /// Serializes this TripRegulationRate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripRegulationRate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, days, rate, details);

  @override
  String toString() {
    return 'TripRegulationRate(id: $id, stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class $TripRegulationRateCopyWith<$Res> {
  factory $TripRegulationRateCopyWith(
          TripRegulationRate value, $Res Function(TripRegulationRate) _then) =
      _$TripRegulationRateCopyWithImpl;
  @useResult
  $Res call({int? id, int stepId, String? days, String? rate, String? details});
}

/// @nodoc
class _$TripRegulationRateCopyWithImpl<$Res>
    implements $TripRegulationRateCopyWith<$Res> {
  _$TripRegulationRateCopyWithImpl(this._self, this._then);

  final TripRegulationRate _self;
  final $Res Function(TripRegulationRate) _then;

  /// Create a copy of TripRegulationRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? days = freezed,
    Object? rate = freezed,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: freezed == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripRegulationRate].
extension TripRegulationRatePatterns on TripRegulationRate {
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
    TResult Function(_TripRegulationRate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate() when $default != null:
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
    TResult Function(_TripRegulationRate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate():
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
    TResult? Function(_TripRegulationRate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate() when $default != null:
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
            int? id, int stepId, String? days, String? rate, String? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate() when $default != null:
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
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
            int? id, int stepId, String? days, String? rate, String? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate():
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
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
            int? id, int stepId, String? days, String? rate, String? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulationRate() when $default != null:
        return $default(
            _that.id, _that.stepId, _that.days, _that.rate, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripRegulationRate implements TripRegulationRate {
  _TripRegulationRate(
      {this.id, required this.stepId, this.days, this.rate, this.details});
  factory _TripRegulationRate.fromJson(Map<String, dynamic> json) =>
      _$TripRegulationRateFromJson(json);

  @override
  final int? id;
  @override
  final int stepId;
  @override
  final String? days;
  @override
  final String? rate;
  @override
  final String? details;

  /// Create a copy of TripRegulationRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripRegulationRateCopyWith<_TripRegulationRate> get copyWith =>
      __$TripRegulationRateCopyWithImpl<_TripRegulationRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripRegulationRateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripRegulationRate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, days, rate, details);

  @override
  String toString() {
    return 'TripRegulationRate(id: $id, stepId: $stepId, days: $days, rate: $rate, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$TripRegulationRateCopyWith<$Res>
    implements $TripRegulationRateCopyWith<$Res> {
  factory _$TripRegulationRateCopyWith(
          _TripRegulationRate value, $Res Function(_TripRegulationRate) _then) =
      __$TripRegulationRateCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, int stepId, String? days, String? rate, String? details});
}

/// @nodoc
class __$TripRegulationRateCopyWithImpl<$Res>
    implements _$TripRegulationRateCopyWith<$Res> {
  __$TripRegulationRateCopyWithImpl(this._self, this._then);

  final _TripRegulationRate _self;
  final $Res Function(_TripRegulationRate) _then;

  /// Create a copy of TripRegulationRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? stepId = null,
    Object? days = freezed,
    Object? rate = freezed,
    Object? details = freezed,
  }) {
    return _then(_TripRegulationRate(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      days: freezed == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TripFuelExpense {
  int? get id;
  String? get rate;
  String? get mileage;
  String? get distance;

  /// Create a copy of TripFuelExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripFuelExpenseCopyWith<TripFuelExpense> get copyWith =>
      _$TripFuelExpenseCopyWithImpl<TripFuelExpense>(
          this as TripFuelExpense, _$identity);

  /// Serializes this TripFuelExpense to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripFuelExpense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rate, mileage, distance);

  @override
  String toString() {
    return 'TripFuelExpense(id: $id, rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class $TripFuelExpenseCopyWith<$Res> {
  factory $TripFuelExpenseCopyWith(
          TripFuelExpense value, $Res Function(TripFuelExpense) _then) =
      _$TripFuelExpenseCopyWithImpl;
  @useResult
  $Res call({int? id, String? rate, String? mileage, String? distance});
}

/// @nodoc
class _$TripFuelExpenseCopyWithImpl<$Res>
    implements $TripFuelExpenseCopyWith<$Res> {
  _$TripFuelExpenseCopyWithImpl(this._self, this._then);

  final TripFuelExpense _self;
  final $Res Function(TripFuelExpense) _then;

  /// Create a copy of TripFuelExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? mileage = freezed,
    Object? distance = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripFuelExpense].
extension TripFuelExpensePatterns on TripFuelExpense {
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
    TResult Function(_TripFuelExpense value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense() when $default != null:
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
    TResult Function(_TripFuelExpense value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense():
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
    TResult? Function(_TripFuelExpense value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense() when $default != null:
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
    TResult Function(int? id, String? rate, String? mileage, String? distance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense() when $default != null:
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
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
    TResult Function(int? id, String? rate, String? mileage, String? distance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense():
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
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
    TResult? Function(int? id, String? rate, String? mileage, String? distance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripFuelExpense() when $default != null:
        return $default(_that.id, _that.rate, _that.mileage, _that.distance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripFuelExpense implements TripFuelExpense {
  _TripFuelExpense({this.id, this.rate, this.mileage, this.distance});
  factory _TripFuelExpense.fromJson(Map<String, dynamic> json) =>
      _$TripFuelExpenseFromJson(json);

  @override
  final int? id;
  @override
  final String? rate;
  @override
  final String? mileage;
  @override
  final String? distance;

  /// Create a copy of TripFuelExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripFuelExpenseCopyWith<_TripFuelExpense> get copyWith =>
      __$TripFuelExpenseCopyWithImpl<_TripFuelExpense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripFuelExpenseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripFuelExpense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rate, mileage, distance);

  @override
  String toString() {
    return 'TripFuelExpense(id: $id, rate: $rate, mileage: $mileage, distance: $distance)';
  }
}

/// @nodoc
abstract mixin class _$TripFuelExpenseCopyWith<$Res>
    implements $TripFuelExpenseCopyWith<$Res> {
  factory _$TripFuelExpenseCopyWith(
          _TripFuelExpense value, $Res Function(_TripFuelExpense) _then) =
      __$TripFuelExpenseCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? rate, String? mileage, String? distance});
}

/// @nodoc
class __$TripFuelExpenseCopyWithImpl<$Res>
    implements _$TripFuelExpenseCopyWith<$Res> {
  __$TripFuelExpenseCopyWithImpl(this._self, this._then);

  final _TripFuelExpense _self;
  final $Res Function(_TripFuelExpense) _then;

  /// Create a copy of TripFuelExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? mileage = freezed,
    Object? distance = freezed,
  }) {
    return _then(_TripFuelExpense(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _self.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TripRegulation {
  int get id;
  int get stepId;
  String get rate;

  /// Create a copy of TripRegulation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripRegulationCopyWith<TripRegulation> get copyWith =>
      _$TripRegulationCopyWithImpl<TripRegulation>(
          this as TripRegulation, _$identity);

  /// Serializes this TripRegulation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripRegulation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, rate);

  @override
  String toString() {
    return 'TripRegulation(id: $id, stepId: $stepId, rate: $rate)';
  }
}

/// @nodoc
abstract mixin class $TripRegulationCopyWith<$Res> {
  factory $TripRegulationCopyWith(
          TripRegulation value, $Res Function(TripRegulation) _then) =
      _$TripRegulationCopyWithImpl;
  @useResult
  $Res call({int id, int stepId, String rate});
}

/// @nodoc
class _$TripRegulationCopyWithImpl<$Res>
    implements $TripRegulationCopyWith<$Res> {
  _$TripRegulationCopyWithImpl(this._self, this._then);

  final TripRegulation _self;
  final $Res Function(TripRegulation) _then;

  /// Create a copy of TripRegulation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepId = null,
    Object? rate = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripRegulation].
extension TripRegulationPatterns on TripRegulation {
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
    TResult Function(_TripRegulation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripRegulation() when $default != null:
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
    TResult Function(_TripRegulation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulation():
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
    TResult? Function(_TripRegulation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulation() when $default != null:
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
    TResult Function(int id, int stepId, String rate)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripRegulation() when $default != null:
        return $default(_that.id, _that.stepId, _that.rate);
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
    TResult Function(int id, int stepId, String rate) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulation():
        return $default(_that.id, _that.stepId, _that.rate);
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
    TResult? Function(int id, int stepId, String rate)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripRegulation() when $default != null:
        return $default(_that.id, _that.stepId, _that.rate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripRegulation implements TripRegulation {
  _TripRegulation({required this.id, required this.stepId, required this.rate});
  factory _TripRegulation.fromJson(Map<String, dynamic> json) =>
      _$TripRegulationFromJson(json);

  @override
  final int id;
  @override
  final int stepId;
  @override
  final String rate;

  /// Create a copy of TripRegulation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripRegulationCopyWith<_TripRegulation> get copyWith =>
      __$TripRegulationCopyWithImpl<_TripRegulation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripRegulationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripRegulation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stepId, rate);

  @override
  String toString() {
    return 'TripRegulation(id: $id, stepId: $stepId, rate: $rate)';
  }
}

/// @nodoc
abstract mixin class _$TripRegulationCopyWith<$Res>
    implements $TripRegulationCopyWith<$Res> {
  factory _$TripRegulationCopyWith(
          _TripRegulation value, $Res Function(_TripRegulation) _then) =
      __$TripRegulationCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int stepId, String rate});
}

/// @nodoc
class __$TripRegulationCopyWithImpl<$Res>
    implements _$TripRegulationCopyWith<$Res> {
  __$TripRegulationCopyWithImpl(this._self, this._then);

  final _TripRegulation _self;
  final $Res Function(_TripRegulation) _then;

  /// Create a copy of TripRegulation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? stepId = null,
    Object? rate = null,
  }) {
    return _then(_TripRegulation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stepId: null == stepId
          ? _self.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TripCalculations {
  int get totalCost;
  int? get taxableAmount;
  int? get nonTaxableAmount;

  /// Create a copy of TripCalculations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TripCalculationsCopyWith<TripCalculations> get copyWith =>
      _$TripCalculationsCopyWithImpl<TripCalculations>(
          this as TripCalculations, _$identity);

  /// Serializes this TripCalculations to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TripCalculations &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.nonTaxableAmount, nonTaxableAmount) ||
                other.nonTaxableAmount == nonTaxableAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCost, taxableAmount, nonTaxableAmount);

  @override
  String toString() {
    return 'TripCalculations(totalCost: $totalCost, taxableAmount: $taxableAmount, nonTaxableAmount: $nonTaxableAmount)';
  }
}

/// @nodoc
abstract mixin class $TripCalculationsCopyWith<$Res> {
  factory $TripCalculationsCopyWith(
          TripCalculations value, $Res Function(TripCalculations) _then) =
      _$TripCalculationsCopyWithImpl;
  @useResult
  $Res call({int totalCost, int? taxableAmount, int? nonTaxableAmount});
}

/// @nodoc
class _$TripCalculationsCopyWithImpl<$Res>
    implements $TripCalculationsCopyWith<$Res> {
  _$TripCalculationsCopyWithImpl(this._self, this._then);

  final TripCalculations _self;
  final $Res Function(TripCalculations) _then;

  /// Create a copy of TripCalculations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCost = null,
    Object? taxableAmount = freezed,
    Object? nonTaxableAmount = freezed,
  }) {
    return _then(_self.copyWith(
      totalCost: null == totalCost
          ? _self.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as int,
      taxableAmount: freezed == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      nonTaxableAmount: freezed == nonTaxableAmount
          ? _self.nonTaxableAmount
          : nonTaxableAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TripCalculations].
extension TripCalculationsPatterns on TripCalculations {
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
    TResult Function(_TripCalculations value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripCalculations() when $default != null:
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
    TResult Function(_TripCalculations value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCalculations():
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
    TResult? Function(_TripCalculations value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCalculations() when $default != null:
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
    TResult Function(int totalCost, int? taxableAmount, int? nonTaxableAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TripCalculations() when $default != null:
        return $default(
            _that.totalCost, _that.taxableAmount, _that.nonTaxableAmount);
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
    TResult Function(int totalCost, int? taxableAmount, int? nonTaxableAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCalculations():
        return $default(
            _that.totalCost, _that.taxableAmount, _that.nonTaxableAmount);
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
    TResult? Function(int totalCost, int? taxableAmount, int? nonTaxableAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TripCalculations() when $default != null:
        return $default(
            _that.totalCost, _that.taxableAmount, _that.nonTaxableAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TripCalculations implements TripCalculations {
  _TripCalculations(
      {required this.totalCost, this.taxableAmount, this.nonTaxableAmount});
  factory _TripCalculations.fromJson(Map<String, dynamic> json) =>
      _$TripCalculationsFromJson(json);

  @override
  final int totalCost;
  @override
  final int? taxableAmount;
  @override
  final int? nonTaxableAmount;

  /// Create a copy of TripCalculations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TripCalculationsCopyWith<_TripCalculations> get copyWith =>
      __$TripCalculationsCopyWithImpl<_TripCalculations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TripCalculationsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TripCalculations &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.nonTaxableAmount, nonTaxableAmount) ||
                other.nonTaxableAmount == nonTaxableAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCost, taxableAmount, nonTaxableAmount);

  @override
  String toString() {
    return 'TripCalculations(totalCost: $totalCost, taxableAmount: $taxableAmount, nonTaxableAmount: $nonTaxableAmount)';
  }
}

/// @nodoc
abstract mixin class _$TripCalculationsCopyWith<$Res>
    implements $TripCalculationsCopyWith<$Res> {
  factory _$TripCalculationsCopyWith(
          _TripCalculations value, $Res Function(_TripCalculations) _then) =
      __$TripCalculationsCopyWithImpl;
  @override
  @useResult
  $Res call({int totalCost, int? taxableAmount, int? nonTaxableAmount});
}

/// @nodoc
class __$TripCalculationsCopyWithImpl<$Res>
    implements _$TripCalculationsCopyWith<$Res> {
  __$TripCalculationsCopyWithImpl(this._self, this._then);

  final _TripCalculations _self;
  final $Res Function(_TripCalculations) _then;

  /// Create a copy of TripCalculations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalCost = null,
    Object? taxableAmount = freezed,
    Object? nonTaxableAmount = freezed,
  }) {
    return _then(_TripCalculations(
      totalCost: null == totalCost
          ? _self.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as int,
      taxableAmount: freezed == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      nonTaxableAmount: freezed == nonTaxableAmount
          ? _self.nonTaxableAmount
          : nonTaxableAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$User {
  int get id;
  String get email;
  String get username;
  bool get isAdmin;
  bool get isAuthorized;
  UserPosition? get position;
  UserDepartment? get department;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, username, isAdmin,
      isAuthorized, position, department);

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, isAdmin: $isAdmin, isAuthorized: $isAuthorized, position: $position, department: $department)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      bool isAdmin,
      bool isAuthorized,
      UserPosition? position,
      UserDepartment? department});

  $UserPositionCopyWith<$Res>? get position;
  $UserDepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? isAdmin = null,
    Object? isAuthorized = null,
    Object? position = freezed,
    Object? department = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _self.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _self.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as UserPosition?,
      department: freezed == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as UserDepartment?,
    ));
  }

  /// Create a copy of User
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

  /// Create a copy of User
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
}

/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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
    TResult Function(_User value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
    TResult Function(_User value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
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
    TResult? Function(_User value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
            int id,
            String email,
            String username,
            bool isAdmin,
            bool isAuthorized,
            UserPosition? position,
            UserDepartment? department)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(_that.id, _that.email, _that.username, _that.isAdmin,
            _that.isAuthorized, _that.position, _that.department);
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
            int id,
            String email,
            String username,
            bool isAdmin,
            bool isAuthorized,
            UserPosition? position,
            UserDepartment? department)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
        return $default(_that.id, _that.email, _that.username, _that.isAdmin,
            _that.isAuthorized, _that.position, _that.department);
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
            int id,
            String email,
            String username,
            bool isAdmin,
            bool isAuthorized,
            UserPosition? position,
            UserDepartment? department)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(_that.id, _that.email, _that.username, _that.isAdmin,
            _that.isAuthorized, _that.position, _that.department);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {required this.id,
      required this.email,
      required this.username,
      this.isAdmin = false,
      this.isAuthorized = false,
      this.position,
      this.department});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String username;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final bool isAuthorized;
  @override
  final UserPosition? position;
  @override
  final UserDepartment? department;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, username, isAdmin,
      isAuthorized, position, department);

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, isAdmin: $isAdmin, isAuthorized: $isAuthorized, position: $position, department: $department)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      bool isAdmin,
      bool isAuthorized,
      UserPosition? position,
      UserDepartment? department});

  @override
  $UserPositionCopyWith<$Res>? get position;
  @override
  $UserDepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? isAdmin = null,
    Object? isAuthorized = null,
    Object? position = freezed,
    Object? department = freezed,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _self.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _self.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as UserPosition?,
      department: freezed == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as UserDepartment?,
    ));
  }

  /// Create a copy of User
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

  /// Create a copy of User
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
}

/// @nodoc
mixin _$UserPosition {
  int get id;
  String get name;

  /// Create a copy of UserPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPositionCopyWith<UserPosition> get copyWith =>
      _$UserPositionCopyWithImpl<UserPosition>(
          this as UserPosition, _$identity);

  /// Serializes this UserPosition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPosition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'UserPosition(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UserPositionCopyWith<$Res> {
  factory $UserPositionCopyWith(
          UserPosition value, $Res Function(UserPosition) _then) =
      _$UserPositionCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$UserPositionCopyWithImpl<$Res> implements $UserPositionCopyWith<$Res> {
  _$UserPositionCopyWithImpl(this._self, this._then);

  final UserPosition _self;
  final $Res Function(UserPosition) _then;

  /// Create a copy of UserPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserPosition].
extension UserPositionPatterns on UserPosition {
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
    TResult Function(_UserPosition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPosition() when $default != null:
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
    TResult Function(_UserPosition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPosition():
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
    TResult? Function(_UserPosition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPosition() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPosition() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPosition():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPosition() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserPosition implements UserPosition {
  const _UserPosition({required this.id, required this.name});
  factory _UserPosition.fromJson(Map<String, dynamic> json) =>
      _$UserPositionFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of UserPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserPositionCopyWith<_UserPosition> get copyWith =>
      __$UserPositionCopyWithImpl<_UserPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserPositionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPosition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'UserPosition(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$UserPositionCopyWith<$Res>
    implements $UserPositionCopyWith<$Res> {
  factory _$UserPositionCopyWith(
          _UserPosition value, $Res Function(_UserPosition) _then) =
      __$UserPositionCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$UserPositionCopyWithImpl<$Res>
    implements _$UserPositionCopyWith<$Res> {
  __$UserPositionCopyWithImpl(this._self, this._then);

  final _UserPosition _self;
  final $Res Function(_UserPosition) _then;

  /// Create a copy of UserPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_UserPosition(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserDepartment {
  int get id;
  String get name;

  /// Create a copy of UserDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDepartmentCopyWith<UserDepartment> get copyWith =>
      _$UserDepartmentCopyWithImpl<UserDepartment>(
          this as UserDepartment, _$identity);

  /// Serializes this UserDepartment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDepartment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'UserDepartment(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UserDepartmentCopyWith<$Res> {
  factory $UserDepartmentCopyWith(
          UserDepartment value, $Res Function(UserDepartment) _then) =
      _$UserDepartmentCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$UserDepartmentCopyWithImpl<$Res>
    implements $UserDepartmentCopyWith<$Res> {
  _$UserDepartmentCopyWithImpl(this._self, this._then);

  final UserDepartment _self;
  final $Res Function(UserDepartment) _then;

  /// Create a copy of UserDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserDepartment].
extension UserDepartmentPatterns on UserDepartment {
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
    TResult Function(_UserDepartment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDepartment() when $default != null:
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
    TResult Function(_UserDepartment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDepartment():
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
    TResult? Function(_UserDepartment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDepartment() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDepartment() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDepartment():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDepartment() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserDepartment implements UserDepartment {
  const _UserDepartment({required this.id, required this.name});
  factory _UserDepartment.fromJson(Map<String, dynamic> json) =>
      _$UserDepartmentFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of UserDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDepartmentCopyWith<_UserDepartment> get copyWith =>
      __$UserDepartmentCopyWithImpl<_UserDepartment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDepartmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDepartment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'UserDepartment(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$UserDepartmentCopyWith<$Res>
    implements $UserDepartmentCopyWith<$Res> {
  factory _$UserDepartmentCopyWith(
          _UserDepartment value, $Res Function(_UserDepartment) _then) =
      __$UserDepartmentCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$UserDepartmentCopyWithImpl<$Res>
    implements _$UserDepartmentCopyWith<$Res> {
  __$UserDepartmentCopyWithImpl(this._self, this._then);

  final _UserDepartment _self;
  final $Res Function(_UserDepartment) _then;

  /// Create a copy of UserDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_UserDepartment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ValidationItem {
  String get label;
  RegExp get regex;
  bool get flag;

  /// Create a copy of ValidationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationItemCopyWith<ValidationItem> get copyWith =>
      _$ValidationItemCopyWithImpl<ValidationItem>(
          this as ValidationItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationItem &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, regex, flag);

  @override
  String toString() {
    return 'ValidationItem(label: $label, regex: $regex, flag: $flag)';
  }
}

/// @nodoc
abstract mixin class $ValidationItemCopyWith<$Res> {
  factory $ValidationItemCopyWith(
          ValidationItem value, $Res Function(ValidationItem) _then) =
      _$ValidationItemCopyWithImpl;
  @useResult
  $Res call({String label, RegExp regex, bool flag});
}

/// @nodoc
class _$ValidationItemCopyWithImpl<$Res>
    implements $ValidationItemCopyWith<$Res> {
  _$ValidationItemCopyWithImpl(this._self, this._then);

  final ValidationItem _self;
  final $Res Function(ValidationItem) _then;

  /// Create a copy of ValidationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? regex = null,
    Object? flag = null,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as RegExp,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ValidationItem].
extension ValidationItemPatterns on ValidationItem {
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
    TResult Function(_ValidationItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationItem() when $default != null:
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
    TResult Function(_ValidationItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationItem():
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
    TResult? Function(_ValidationItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationItem() when $default != null:
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
    TResult Function(String label, RegExp regex, bool flag)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationItem() when $default != null:
        return $default(_that.label, _that.regex, _that.flag);
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
    TResult Function(String label, RegExp regex, bool flag) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationItem():
        return $default(_that.label, _that.regex, _that.flag);
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
    TResult? Function(String label, RegExp regex, bool flag)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationItem() when $default != null:
        return $default(_that.label, _that.regex, _that.flag);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ValidationItem implements ValidationItem {
  _ValidationItem(
      {required this.label, required this.regex, required this.flag});

  @override
  final String label;
  @override
  final RegExp regex;
  @override
  final bool flag;

  /// Create a copy of ValidationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValidationItemCopyWith<_ValidationItem> get copyWith =>
      __$ValidationItemCopyWithImpl<_ValidationItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValidationItem &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, regex, flag);

  @override
  String toString() {
    return 'ValidationItem(label: $label, regex: $regex, flag: $flag)';
  }
}

/// @nodoc
abstract mixin class _$ValidationItemCopyWith<$Res>
    implements $ValidationItemCopyWith<$Res> {
  factory _$ValidationItemCopyWith(
          _ValidationItem value, $Res Function(_ValidationItem) _then) =
      __$ValidationItemCopyWithImpl;
  @override
  @useResult
  $Res call({String label, RegExp regex, bool flag});
}

/// @nodoc
class __$ValidationItemCopyWithImpl<$Res>
    implements _$ValidationItemCopyWith<$Res> {
  __$ValidationItemCopyWithImpl(this._self, this._then);

  final _ValidationItem _self;
  final $Res Function(_ValidationItem) _then;

  /// Create a copy of ValidationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? regex = null,
    Object? flag = null,
  }) {
    return _then(_ValidationItem(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as RegExp,
      flag: null == flag
          ? _self.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$NavigationItem {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationItem()';
  }
}

/// @nodoc
class $NavigationItemCopyWith<$Res> {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationButton value)? button,
    TResult Function(NavigationTitle value)? title,
    TResult Function(NavigationSpace value)? space,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton() when button != null:
        return button(_that);
      case NavigationTitle() when title != null:
        return title(_that);
      case NavigationSpace() when space != null:
        return space(_that);
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
    required TResult Function(NavigationButton value) button,
    required TResult Function(NavigationTitle value) title,
    required TResult Function(NavigationSpace value) space,
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton():
        return button(_that);
      case NavigationTitle():
        return title(_that);
      case NavigationSpace():
        return space(_that);
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
    TResult? Function(NavigationButton value)? button,
    TResult? Function(NavigationTitle value)? title,
    TResult? Function(NavigationSpace value)? space,
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton() when button != null:
        return button(_that);
      case NavigationTitle() when title != null:
        return title(_that);
      case NavigationSpace() when space != null:
        return space(_that);
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
    TResult Function(String route, IconData icon, String label, bool isAdmin)?
        button,
    TResult Function(String label, bool isAdmin)? title,
    TResult Function()? space,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton() when button != null:
        return button(_that.route, _that.icon, _that.label, _that.isAdmin);
      case NavigationTitle() when title != null:
        return title(_that.label, _that.isAdmin);
      case NavigationSpace() when space != null:
        return space();
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
            String route, IconData icon, String label, bool isAdmin)
        button,
    required TResult Function(String label, bool isAdmin) title,
    required TResult Function() space,
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton():
        return button(_that.route, _that.icon, _that.label, _that.isAdmin);
      case NavigationTitle():
        return title(_that.label, _that.isAdmin);
      case NavigationSpace():
        return space();
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
    TResult? Function(String route, IconData icon, String label, bool isAdmin)?
        button,
    TResult? Function(String label, bool isAdmin)? title,
    TResult? Function()? space,
  }) {
    final _that = this;
    switch (_that) {
      case NavigationButton() when button != null:
        return button(_that.route, _that.icon, _that.label, _that.isAdmin);
      case NavigationTitle() when title != null:
        return title(_that.label, _that.isAdmin);
      case NavigationSpace() when space != null:
        return space();
      case _:
        return null;
    }
  }
}

/// @nodoc

class NavigationButton implements NavigationItem {
  NavigationButton(
      {required this.route,
      required this.icon,
      required this.label,
      this.isAdmin = false});

  final String route;
  final IconData icon;
  final String label;
  @JsonKey()
  final bool isAdmin;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationButtonCopyWith<NavigationButton> get copyWith =>
      _$NavigationButtonCopyWithImpl<NavigationButton>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationButton &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route, icon, label, isAdmin);

  @override
  String toString() {
    return 'NavigationItem.button(route: $route, icon: $icon, label: $label, isAdmin: $isAdmin)';
  }
}

/// @nodoc
abstract mixin class $NavigationButtonCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory $NavigationButtonCopyWith(
          NavigationButton value, $Res Function(NavigationButton) _then) =
      _$NavigationButtonCopyWithImpl;
  @useResult
  $Res call({String route, IconData icon, String label, bool isAdmin});
}

/// @nodoc
class _$NavigationButtonCopyWithImpl<$Res>
    implements $NavigationButtonCopyWith<$Res> {
  _$NavigationButtonCopyWithImpl(this._self, this._then);

  final NavigationButton _self;
  final $Res Function(NavigationButton) _then;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? route = null,
    Object? icon = null,
    Object? label = null,
    Object? isAdmin = null,
  }) {
    return _then(NavigationButton(
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _self.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class NavigationTitle implements NavigationItem {
  NavigationTitle({required this.label, this.isAdmin = false});

  final String label;
  @JsonKey()
  final bool isAdmin;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationTitleCopyWith<NavigationTitle> get copyWith =>
      _$NavigationTitleCopyWithImpl<NavigationTitle>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationTitle &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, isAdmin);

  @override
  String toString() {
    return 'NavigationItem.title(label: $label, isAdmin: $isAdmin)';
  }
}

/// @nodoc
abstract mixin class $NavigationTitleCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory $NavigationTitleCopyWith(
          NavigationTitle value, $Res Function(NavigationTitle) _then) =
      _$NavigationTitleCopyWithImpl;
  @useResult
  $Res call({String label, bool isAdmin});
}

/// @nodoc
class _$NavigationTitleCopyWithImpl<$Res>
    implements $NavigationTitleCopyWith<$Res> {
  _$NavigationTitleCopyWithImpl(this._self, this._then);

  final NavigationTitle _self;
  final $Res Function(NavigationTitle) _then;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? isAdmin = null,
  }) {
    return _then(NavigationTitle(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _self.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class NavigationSpace implements NavigationItem {
  NavigationSpace();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationSpace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationItem.space()';
  }
}

/// @nodoc
mixin _$Keyword {
  String get keyword;
  DateTime get date;

  /// Create a copy of Keyword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KeywordCopyWith<Keyword> get copyWith =>
      _$KeywordCopyWithImpl<Keyword>(this as Keyword, _$identity);

  /// Serializes this Keyword to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Keyword &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyword, date);

  @override
  String toString() {
    return 'Keyword(keyword: $keyword, date: $date)';
  }
}

/// @nodoc
abstract mixin class $KeywordCopyWith<$Res> {
  factory $KeywordCopyWith(Keyword value, $Res Function(Keyword) _then) =
      _$KeywordCopyWithImpl;
  @useResult
  $Res call({String keyword, DateTime date});
}

/// @nodoc
class _$KeywordCopyWithImpl<$Res> implements $KeywordCopyWith<$Res> {
  _$KeywordCopyWithImpl(this._self, this._then);

  final Keyword _self;
  final $Res Function(Keyword) _then;

  /// Create a copy of Keyword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Keyword].
extension KeywordPatterns on Keyword {
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
    TResult Function(_Keyword value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Keyword() when $default != null:
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
    TResult Function(_Keyword value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Keyword():
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
    TResult? Function(_Keyword value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Keyword() when $default != null:
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
    TResult Function(String keyword, DateTime date)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Keyword() when $default != null:
        return $default(_that.keyword, _that.date);
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
    TResult Function(String keyword, DateTime date) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Keyword():
        return $default(_that.keyword, _that.date);
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
    TResult? Function(String keyword, DateTime date)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Keyword() when $default != null:
        return $default(_that.keyword, _that.date);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Keyword implements Keyword {
  const _Keyword({required this.keyword, required this.date});
  factory _Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);

  @override
  final String keyword;
  @override
  final DateTime date;

  /// Create a copy of Keyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeywordCopyWith<_Keyword> get copyWith =>
      __$KeywordCopyWithImpl<_Keyword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KeywordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Keyword &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyword, date);

  @override
  String toString() {
    return 'Keyword(keyword: $keyword, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$KeywordCopyWith<$Res> implements $KeywordCopyWith<$Res> {
  factory _$KeywordCopyWith(_Keyword value, $Res Function(_Keyword) _then) =
      __$KeywordCopyWithImpl;
  @override
  @useResult
  $Res call({String keyword, DateTime date});
}

/// @nodoc
class __$KeywordCopyWithImpl<$Res> implements _$KeywordCopyWith<$Res> {
  __$KeywordCopyWithImpl(this._self, this._then);

  final _Keyword _self;
  final $Res Function(_Keyword) _then;

  /// Create a copy of Keyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keyword = null,
    Object? date = null,
  }) {
    return _then(_Keyword(
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ClientMarker {
  double get latitude;
  double get longitude;
  List<ClientMarkerTooltip> get items;

  /// Create a copy of ClientMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientMarkerCopyWith<ClientMarker> get copyWith =>
      _$ClientMarkerCopyWithImpl<ClientMarker>(
          this as ClientMarker, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientMarker &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ClientMarker(latitude: $latitude, longitude: $longitude, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ClientMarkerCopyWith<$Res> {
  factory $ClientMarkerCopyWith(
          ClientMarker value, $Res Function(ClientMarker) _then) =
      _$ClientMarkerCopyWithImpl;
  @useResult
  $Res call(
      {double latitude, double longitude, List<ClientMarkerTooltip> items});
}

/// @nodoc
class _$ClientMarkerCopyWithImpl<$Res> implements $ClientMarkerCopyWith<$Res> {
  _$ClientMarkerCopyWithImpl(this._self, this._then);

  final ClientMarker _self;
  final $Res Function(ClientMarker) _then;

  /// Create a copy of ClientMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ClientMarker value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientMarker() when $default != null:
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
    TResult Function(_ClientMarker value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarker():
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
    TResult? Function(_ClientMarker value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarker() when $default != null:
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
            double latitude, double longitude, List<ClientMarkerTooltip> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientMarker() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.items);
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
            double latitude, double longitude, List<ClientMarkerTooltip> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarker():
        return $default(_that.latitude, _that.longitude, _that.items);
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
            double latitude, double longitude, List<ClientMarkerTooltip> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarker() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ClientMarker implements ClientMarker {
  _ClientMarker(
      {required this.latitude,
      required this.longitude,
      required final List<ClientMarkerTooltip> items})
      : _items = items;

  @override
  final double latitude;
  @override
  final double longitude;
  final List<ClientMarkerTooltip> _items;
  @override
  List<ClientMarkerTooltip> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ClientMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientMarkerCopyWith<_ClientMarker> get copyWith =>
      __$ClientMarkerCopyWithImpl<_ClientMarker>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientMarker &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ClientMarker(latitude: $latitude, longitude: $longitude, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ClientMarkerCopyWith<$Res>
    implements $ClientMarkerCopyWith<$Res> {
  factory _$ClientMarkerCopyWith(
          _ClientMarker value, $Res Function(_ClientMarker) _then) =
      __$ClientMarkerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double latitude, double longitude, List<ClientMarkerTooltip> items});
}

/// @nodoc
class __$ClientMarkerCopyWithImpl<$Res>
    implements _$ClientMarkerCopyWith<$Res> {
  __$ClientMarkerCopyWithImpl(this._self, this._then);

  final _ClientMarker _self;
  final $Res Function(_ClientMarker) _then;

  /// Create a copy of ClientMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? items = null,
  }) {
    return _then(_ClientMarker(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClientMarkerTooltip>,
    ));
  }
}

/// @nodoc
mixin _$ClientMarkerTooltip {
  ClientType get type;
  String get name;

  /// Create a copy of ClientMarkerTooltip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientMarkerTooltipCopyWith<ClientMarkerTooltip> get copyWith =>
      _$ClientMarkerTooltipCopyWithImpl<ClientMarkerTooltip>(
          this as ClientMarkerTooltip, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientMarkerTooltip &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'ClientMarkerTooltip(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ClientMarkerTooltipCopyWith<$Res> {
  factory $ClientMarkerTooltipCopyWith(
          ClientMarkerTooltip value, $Res Function(ClientMarkerTooltip) _then) =
      _$ClientMarkerTooltipCopyWithImpl;
  @useResult
  $Res call({ClientType type, String name});
}

/// @nodoc
class _$ClientMarkerTooltipCopyWithImpl<$Res>
    implements $ClientMarkerTooltipCopyWith<$Res> {
  _$ClientMarkerTooltipCopyWithImpl(this._self, this._then);

  final ClientMarkerTooltip _self;
  final $Res Function(ClientMarkerTooltip) _then;

  /// Create a copy of ClientMarkerTooltip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClientType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ClientMarkerTooltip value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip() when $default != null:
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
    TResult Function(_ClientMarkerTooltip value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip():
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
    TResult? Function(_ClientMarkerTooltip value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip() when $default != null:
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
    TResult Function(ClientType type, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip() when $default != null:
        return $default(_that.type, _that.name);
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
    TResult Function(ClientType type, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip():
        return $default(_that.type, _that.name);
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
    TResult? Function(ClientType type, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientMarkerTooltip() when $default != null:
        return $default(_that.type, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ClientMarkerTooltip implements ClientMarkerTooltip {
  _ClientMarkerTooltip({required this.type, required this.name});

  @override
  final ClientType type;
  @override
  final String name;

  /// Create a copy of ClientMarkerTooltip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientMarkerTooltipCopyWith<_ClientMarkerTooltip> get copyWith =>
      __$ClientMarkerTooltipCopyWithImpl<_ClientMarkerTooltip>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientMarkerTooltip &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'ClientMarkerTooltip(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ClientMarkerTooltipCopyWith<$Res>
    implements $ClientMarkerTooltipCopyWith<$Res> {
  factory _$ClientMarkerTooltipCopyWith(_ClientMarkerTooltip value,
          $Res Function(_ClientMarkerTooltip) _then) =
      __$ClientMarkerTooltipCopyWithImpl;
  @override
  @useResult
  $Res call({ClientType type, String name});
}

/// @nodoc
class __$ClientMarkerTooltipCopyWithImpl<$Res>
    implements _$ClientMarkerTooltipCopyWith<$Res> {
  __$ClientMarkerTooltipCopyWithImpl(this._self, this._then);

  final _ClientMarkerTooltip _self;
  final $Res Function(_ClientMarkerTooltip) _then;

  /// Create a copy of ClientMarkerTooltip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_ClientMarkerTooltip(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClientType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ClientCount {
  int get depth;
  int get count;

  /// Create a copy of ClientCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientCountCopyWith<ClientCount> get copyWith =>
      _$ClientCountCopyWithImpl<ClientCount>(this as ClientCount, _$identity);

  /// Serializes this ClientCount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientCount &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, depth, count);

  @override
  String toString() {
    return 'ClientCount(depth: $depth, count: $count)';
  }
}

/// @nodoc
abstract mixin class $ClientCountCopyWith<$Res> {
  factory $ClientCountCopyWith(
          ClientCount value, $Res Function(ClientCount) _then) =
      _$ClientCountCopyWithImpl;
  @useResult
  $Res call({int depth, int count});
}

/// @nodoc
class _$ClientCountCopyWithImpl<$Res> implements $ClientCountCopyWith<$Res> {
  _$ClientCountCopyWithImpl(this._self, this._then);

  final ClientCount _self;
  final $Res Function(ClientCount) _then;

  /// Create a copy of ClientCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depth = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ClientCount].
extension ClientCountPatterns on ClientCount {
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
    TResult Function(_ClientCount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientCount() when $default != null:
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
    TResult Function(_ClientCount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientCount():
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
    TResult? Function(_ClientCount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientCount() when $default != null:
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
    TResult Function(int depth, int count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientCount() when $default != null:
        return $default(_that.depth, _that.count);
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
    TResult Function(int depth, int count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientCount():
        return $default(_that.depth, _that.count);
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
    TResult? Function(int depth, int count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientCount() when $default != null:
        return $default(_that.depth, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ClientCount implements ClientCount {
  _ClientCount({required this.depth, required this.count});
  factory _ClientCount.fromJson(Map<String, dynamic> json) =>
      _$ClientCountFromJson(json);

  @override
  final int depth;
  @override
  final int count;

  /// Create a copy of ClientCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientCountCopyWith<_ClientCount> get copyWith =>
      __$ClientCountCopyWithImpl<_ClientCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientCountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientCount &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, depth, count);

  @override
  String toString() {
    return 'ClientCount(depth: $depth, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$ClientCountCopyWith<$Res>
    implements $ClientCountCopyWith<$Res> {
  factory _$ClientCountCopyWith(
          _ClientCount value, $Res Function(_ClientCount) _then) =
      __$ClientCountCopyWithImpl;
  @override
  @useResult
  $Res call({int depth, int count});
}

/// @nodoc
class __$ClientCountCopyWithImpl<$Res> implements _$ClientCountCopyWith<$Res> {
  __$ClientCountCopyWithImpl(this._self, this._then);

  final _ClientCount _self;
  final $Res Function(_ClientCount) _then;

  /// Create a copy of ClientCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? depth = null,
    Object? count = null,
  }) {
    return _then(_ClientCount(
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$MenuOption {
  IconData get icon;
  String get label;
  String get description;
  VoidCallback? get onPressed;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuOptionCopyWith<MenuOption> get copyWith =>
      _$MenuOptionCopyWithImpl<MenuOption>(this as MenuOption, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuOption &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, icon, label, description, onPressed);

  @override
  String toString() {
    return 'MenuOption(icon: $icon, label: $label, description: $description, onPressed: $onPressed)';
  }
}

/// @nodoc
abstract mixin class $MenuOptionCopyWith<$Res> {
  factory $MenuOptionCopyWith(
          MenuOption value, $Res Function(MenuOption) _then) =
      _$MenuOptionCopyWithImpl;
  @useResult
  $Res call(
      {IconData icon,
      String label,
      String description,
      VoidCallback? onPressed});
}

/// @nodoc
class _$MenuOptionCopyWithImpl<$Res> implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._self, this._then);

  final MenuOption _self;
  final $Res Function(MenuOption) _then;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? label = null,
    Object? description = null,
    Object? onPressed = freezed,
  }) {
    return _then(_self.copyWith(
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: freezed == onPressed
          ? _self.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MenuOption].
extension MenuOptionPatterns on MenuOption {
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
    TResult Function(_MenuOption value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuOption() when $default != null:
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
    TResult Function(_MenuOption value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuOption():
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
    TResult? Function(_MenuOption value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuOption() when $default != null:
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
    TResult Function(IconData icon, String label, String description,
            VoidCallback? onPressed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuOption() when $default != null:
        return $default(
            _that.icon, _that.label, _that.description, _that.onPressed);
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
    TResult Function(IconData icon, String label, String description,
            VoidCallback? onPressed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuOption():
        return $default(
            _that.icon, _that.label, _that.description, _that.onPressed);
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
    TResult? Function(IconData icon, String label, String description,
            VoidCallback? onPressed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuOption() when $default != null:
        return $default(
            _that.icon, _that.label, _that.description, _that.onPressed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MenuOption implements MenuOption {
  _MenuOption(
      {required this.icon,
      required this.label,
      this.description = '',
      required this.onPressed});

  @override
  final IconData icon;
  @override
  final String label;
  @override
  @JsonKey()
  final String description;
  @override
  final VoidCallback? onPressed;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuOptionCopyWith<_MenuOption> get copyWith =>
      __$MenuOptionCopyWithImpl<_MenuOption>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuOption &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, icon, label, description, onPressed);

  @override
  String toString() {
    return 'MenuOption(icon: $icon, label: $label, description: $description, onPressed: $onPressed)';
  }
}

/// @nodoc
abstract mixin class _$MenuOptionCopyWith<$Res>
    implements $MenuOptionCopyWith<$Res> {
  factory _$MenuOptionCopyWith(
          _MenuOption value, $Res Function(_MenuOption) _then) =
      __$MenuOptionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {IconData icon,
      String label,
      String description,
      VoidCallback? onPressed});
}

/// @nodoc
class __$MenuOptionCopyWithImpl<$Res> implements _$MenuOptionCopyWith<$Res> {
  __$MenuOptionCopyWithImpl(this._self, this._then);

  final _MenuOption _self;
  final $Res Function(_MenuOption) _then;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? icon = null,
    Object? label = null,
    Object? description = null,
    Object? onPressed = freezed,
  }) {
    return _then(_MenuOption(
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: freezed == onPressed
          ? _self.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc
mixin _$BottomSheetItem {
  Function() get onTap;
  String get label;

  /// Create a copy of BottomSheetItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BottomSheetItemCopyWith<BottomSheetItem> get copyWith =>
      _$BottomSheetItemCopyWithImpl<BottomSheetItem>(
          this as BottomSheetItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BottomSheetItem &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onTap, label);

  @override
  String toString() {
    return 'BottomSheetItem(onTap: $onTap, label: $label)';
  }
}

/// @nodoc
abstract mixin class $BottomSheetItemCopyWith<$Res> {
  factory $BottomSheetItemCopyWith(
          BottomSheetItem value, $Res Function(BottomSheetItem) _then) =
      _$BottomSheetItemCopyWithImpl;
  @useResult
  $Res call({Function() onTap, String label});
}

/// @nodoc
class _$BottomSheetItemCopyWithImpl<$Res>
    implements $BottomSheetItemCopyWith<$Res> {
  _$BottomSheetItemCopyWithImpl(this._self, this._then);

  final BottomSheetItem _self;
  final $Res Function(BottomSheetItem) _then;

  /// Create a copy of BottomSheetItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onTap = null,
    Object? label = null,
  }) {
    return _then(_self.copyWith(
      onTap: null == onTap
          ? _self.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as Function(),
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BottomSheetItem].
extension BottomSheetItemPatterns on BottomSheetItem {
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
    TResult Function(_BottomSheetItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem() when $default != null:
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
    TResult Function(_BottomSheetItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem():
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
    TResult? Function(_BottomSheetItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem() when $default != null:
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
    TResult Function(Function() onTap, String label)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem() when $default != null:
        return $default(_that.onTap, _that.label);
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
    TResult Function(Function() onTap, String label) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem():
        return $default(_that.onTap, _that.label);
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
    TResult? Function(Function() onTap, String label)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BottomSheetItem() when $default != null:
        return $default(_that.onTap, _that.label);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BottomSheetItem implements BottomSheetItem {
  _BottomSheetItem({required this.onTap, required this.label});

  @override
  final Function() onTap;
  @override
  final String label;

  /// Create a copy of BottomSheetItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BottomSheetItemCopyWith<_BottomSheetItem> get copyWith =>
      __$BottomSheetItemCopyWithImpl<_BottomSheetItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BottomSheetItem &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onTap, label);

  @override
  String toString() {
    return 'BottomSheetItem(onTap: $onTap, label: $label)';
  }
}

/// @nodoc
abstract mixin class _$BottomSheetItemCopyWith<$Res>
    implements $BottomSheetItemCopyWith<$Res> {
  factory _$BottomSheetItemCopyWith(
          _BottomSheetItem value, $Res Function(_BottomSheetItem) _then) =
      __$BottomSheetItemCopyWithImpl;
  @override
  @useResult
  $Res call({Function() onTap, String label});
}

/// @nodoc
class __$BottomSheetItemCopyWithImpl<$Res>
    implements _$BottomSheetItemCopyWith<$Res> {
  __$BottomSheetItemCopyWithImpl(this._self, this._then);

  final _BottomSheetItem _self;
  final $Res Function(_BottomSheetItem) _then;

  /// Create a copy of BottomSheetItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? onTap = null,
    Object? label = null,
  }) {
    return _then(_BottomSheetItem(
      onTap: null == onTap
          ? _self.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as Function(),
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
