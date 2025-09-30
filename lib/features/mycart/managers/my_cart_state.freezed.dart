// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyCartState {

 String? get errorMessage; bool get loading; CartModel? get cart;
/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyCartStateCopyWith<MyCartState> get copyWith => _$MyCartStateCopyWithImpl<MyCartState>(this as MyCartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyCartState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,cart);

@override
String toString() {
  return 'MyCartState(errorMessage: $errorMessage, loading: $loading, cart: $cart)';
}


}

/// @nodoc
abstract mixin class $MyCartStateCopyWith<$Res>  {
  factory $MyCartStateCopyWith(MyCartState value, $Res Function(MyCartState) _then) = _$MyCartStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, bool loading, CartModel? cart
});




}
/// @nodoc
class _$MyCartStateCopyWithImpl<$Res>
    implements $MyCartStateCopyWith<$Res> {
  _$MyCartStateCopyWithImpl(this._self, this._then);

  final MyCartState _self;
  final $Res Function(MyCartState) _then;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? loading = null,Object? cart = freezed,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyCartState].
extension MyCartStatePatterns on MyCartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyCartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyCartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyCartState value)  $default,){
final _that = this;
switch (_that) {
case _MyCartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyCartState value)?  $default,){
final _that = this;
switch (_that) {
case _MyCartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  bool loading,  CartModel? cart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyCartState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.cart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  bool loading,  CartModel? cart)  $default,) {final _that = this;
switch (_that) {
case _MyCartState():
return $default(_that.errorMessage,_that.loading,_that.cart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  bool loading,  CartModel? cart)?  $default,) {final _that = this;
switch (_that) {
case _MyCartState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.cart);case _:
  return null;

}
}

}

/// @nodoc


class _MyCartState implements MyCartState {
  const _MyCartState({this.errorMessage, required this.loading, this.cart});
  

@override final  String? errorMessage;
@override final  bool loading;
@override final  CartModel? cart;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyCartStateCopyWith<_MyCartState> get copyWith => __$MyCartStateCopyWithImpl<_MyCartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyCartState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,cart);

@override
String toString() {
  return 'MyCartState(errorMessage: $errorMessage, loading: $loading, cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$MyCartStateCopyWith<$Res> implements $MyCartStateCopyWith<$Res> {
  factory _$MyCartStateCopyWith(_MyCartState value, $Res Function(_MyCartState) _then) = __$MyCartStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, bool loading, CartModel? cart
});




}
/// @nodoc
class __$MyCartStateCopyWithImpl<$Res>
    implements _$MyCartStateCopyWith<$Res> {
  __$MyCartStateCopyWithImpl(this._self, this._then);

  final _MyCartState _self;
  final $Res Function(_MyCartState) _then;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? loading = null,Object? cart = freezed,}) {
  return _then(_MyCartState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,
  ));
}


}

// dart format on
