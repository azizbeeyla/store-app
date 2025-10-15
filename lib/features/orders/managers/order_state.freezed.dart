// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {

 bool? get isCreateLoad; bool? get isOrderLoad; bool? get createSuccess; String? get createError; String? get orderError; List<OrderModel>? get orders; int? get selectedIndex;
/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStateCopyWith<OrderState> get copyWith => _$OrderStateCopyWithImpl<OrderState>(this as OrderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState&&(identical(other.isCreateLoad, isCreateLoad) || other.isCreateLoad == isCreateLoad)&&(identical(other.isOrderLoad, isOrderLoad) || other.isOrderLoad == isOrderLoad)&&(identical(other.createSuccess, createSuccess) || other.createSuccess == createSuccess)&&(identical(other.createError, createError) || other.createError == createError)&&(identical(other.orderError, orderError) || other.orderError == orderError)&&const DeepCollectionEquality().equals(other.orders, orders)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,isCreateLoad,isOrderLoad,createSuccess,createError,orderError,const DeepCollectionEquality().hash(orders),selectedIndex);

@override
String toString() {
  return 'OrderState(isCreateLoad: $isCreateLoad, isOrderLoad: $isOrderLoad, createSuccess: $createSuccess, createError: $createError, orderError: $orderError, orders: $orders, selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class $OrderStateCopyWith<$Res>  {
  factory $OrderStateCopyWith(OrderState value, $Res Function(OrderState) _then) = _$OrderStateCopyWithImpl;
@useResult
$Res call({
 bool? isCreateLoad, bool? isOrderLoad, bool? createSuccess, String? createError, String? orderError, List<OrderModel>? orders, int? selectedIndex
});




}
/// @nodoc
class _$OrderStateCopyWithImpl<$Res>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._self, this._then);

  final OrderState _self;
  final $Res Function(OrderState) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCreateLoad = freezed,Object? isOrderLoad = freezed,Object? createSuccess = freezed,Object? createError = freezed,Object? orderError = freezed,Object? orders = freezed,Object? selectedIndex = freezed,}) {
  return _then(_self.copyWith(
isCreateLoad: freezed == isCreateLoad ? _self.isCreateLoad : isCreateLoad // ignore: cast_nullable_to_non_nullable
as bool?,isOrderLoad: freezed == isOrderLoad ? _self.isOrderLoad : isOrderLoad // ignore: cast_nullable_to_non_nullable
as bool?,createSuccess: freezed == createSuccess ? _self.createSuccess : createSuccess // ignore: cast_nullable_to_non_nullable
as bool?,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,orderError: freezed == orderError ? _self.orderError : orderError // ignore: cast_nullable_to_non_nullable
as String?,orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderState value)  $default,){
final _that = this;
switch (_that) {
case _OrderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isCreateLoad,  bool? isOrderLoad,  bool? createSuccess,  String? createError,  String? orderError,  List<OrderModel>? orders,  int? selectedIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that.isCreateLoad,_that.isOrderLoad,_that.createSuccess,_that.createError,_that.orderError,_that.orders,_that.selectedIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isCreateLoad,  bool? isOrderLoad,  bool? createSuccess,  String? createError,  String? orderError,  List<OrderModel>? orders,  int? selectedIndex)  $default,) {final _that = this;
switch (_that) {
case _OrderState():
return $default(_that.isCreateLoad,_that.isOrderLoad,_that.createSuccess,_that.createError,_that.orderError,_that.orders,_that.selectedIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isCreateLoad,  bool? isOrderLoad,  bool? createSuccess,  String? createError,  String? orderError,  List<OrderModel>? orders,  int? selectedIndex)?  $default,) {final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that.isCreateLoad,_that.isOrderLoad,_that.createSuccess,_that.createError,_that.orderError,_that.orders,_that.selectedIndex);case _:
  return null;

}
}

}

/// @nodoc


class _OrderState implements OrderState {
  const _OrderState({this.isCreateLoad, this.isOrderLoad, this.createSuccess, this.createError, this.orderError, final  List<OrderModel>? orders, this.selectedIndex}): _orders = orders;
  

@override final  bool? isCreateLoad;
@override final  bool? isOrderLoad;
@override final  bool? createSuccess;
@override final  String? createError;
@override final  String? orderError;
 final  List<OrderModel>? _orders;
@override List<OrderModel>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? selectedIndex;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStateCopyWith<_OrderState> get copyWith => __$OrderStateCopyWithImpl<_OrderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderState&&(identical(other.isCreateLoad, isCreateLoad) || other.isCreateLoad == isCreateLoad)&&(identical(other.isOrderLoad, isOrderLoad) || other.isOrderLoad == isOrderLoad)&&(identical(other.createSuccess, createSuccess) || other.createSuccess == createSuccess)&&(identical(other.createError, createError) || other.createError == createError)&&(identical(other.orderError, orderError) || other.orderError == orderError)&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,isCreateLoad,isOrderLoad,createSuccess,createError,orderError,const DeepCollectionEquality().hash(_orders),selectedIndex);

@override
String toString() {
  return 'OrderState(isCreateLoad: $isCreateLoad, isOrderLoad: $isOrderLoad, createSuccess: $createSuccess, createError: $createError, orderError: $orderError, orders: $orders, selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class _$OrderStateCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrderStateCopyWith(_OrderState value, $Res Function(_OrderState) _then) = __$OrderStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isCreateLoad, bool? isOrderLoad, bool? createSuccess, String? createError, String? orderError, List<OrderModel>? orders, int? selectedIndex
});




}
/// @nodoc
class __$OrderStateCopyWithImpl<$Res>
    implements _$OrderStateCopyWith<$Res> {
  __$OrderStateCopyWithImpl(this._self, this._then);

  final _OrderState _self;
  final $Res Function(_OrderState) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCreateLoad = freezed,Object? isOrderLoad = freezed,Object? createSuccess = freezed,Object? createError = freezed,Object? orderError = freezed,Object? orders = freezed,Object? selectedIndex = freezed,}) {
  return _then(_OrderState(
isCreateLoad: freezed == isCreateLoad ? _self.isCreateLoad : isCreateLoad // ignore: cast_nullable_to_non_nullable
as bool?,isOrderLoad: freezed == isOrderLoad ? _self.isOrderLoad : isOrderLoad // ignore: cast_nullable_to_non_nullable
as bool?,createSuccess: freezed == createSuccess ? _self.createSuccess : createSuccess // ignore: cast_nullable_to_non_nullable
as bool?,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,orderError: freezed == orderError ? _self.orderError : orderError // ignore: cast_nullable_to_non_nullable
as String?,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
