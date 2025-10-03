// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressState {

 String? get errorMessage; bool? get loading; List<AddressModel>? get address; int? get selectedAddressId;
/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressStateCopyWith<AddressState> get copyWith => _$AddressStateCopyWithImpl<AddressState>(this as AddressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.address, address)&&(identical(other.selectedAddressId, selectedAddressId) || other.selectedAddressId == selectedAddressId));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(address),selectedAddressId);

@override
String toString() {
  return 'AddressState(errorMessage: $errorMessage, loading: $loading, address: $address, selectedAddressId: $selectedAddressId)';
}


}

/// @nodoc
abstract mixin class $AddressStateCopyWith<$Res>  {
  factory $AddressStateCopyWith(AddressState value, $Res Function(AddressState) _then) = _$AddressStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, bool? loading, List<AddressModel>? address, int? selectedAddressId
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
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? loading = freezed,Object? address = freezed,Object? selectedAddressId = freezed,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: freezed == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as List<AddressModel>?,selectedAddressId: freezed == selectedAddressId ? _self.selectedAddressId : selectedAddressId // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  bool? loading,  List<AddressModel>? address,  int? selectedAddressId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.address,_that.selectedAddressId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  bool? loading,  List<AddressModel>? address,  int? selectedAddressId)  $default,) {final _that = this;
switch (_that) {
case _AddressState():
return $default(_that.errorMessage,_that.loading,_that.address,_that.selectedAddressId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  bool? loading,  List<AddressModel>? address,  int? selectedAddressId)?  $default,) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.address,_that.selectedAddressId);case _:
  return null;

}
}

}

/// @nodoc


class _AddressState implements AddressState {
  const _AddressState({this.errorMessage, this.loading, final  List<AddressModel>? address, this.selectedAddressId}): _address = address;
  

@override final  String? errorMessage;
@override final  bool? loading;
 final  List<AddressModel>? _address;
@override List<AddressModel>? get address {
  final value = _address;
  if (value == null) return null;
  if (_address is EqualUnmodifiableListView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? selectedAddressId;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressStateCopyWith<_AddressState> get copyWith => __$AddressStateCopyWithImpl<_AddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.selectedAddressId, selectedAddressId) || other.selectedAddressId == selectedAddressId));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(_address),selectedAddressId);

@override
String toString() {
  return 'AddressState(errorMessage: $errorMessage, loading: $loading, address: $address, selectedAddressId: $selectedAddressId)';
}


}

/// @nodoc
abstract mixin class _$AddressStateCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory _$AddressStateCopyWith(_AddressState value, $Res Function(_AddressState) _then) = __$AddressStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, bool? loading, List<AddressModel>? address, int? selectedAddressId
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
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? loading = freezed,Object? address = freezed,Object? selectedAddressId = freezed,}) {
  return _then(_AddressState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: freezed == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as List<AddressModel>?,selectedAddressId: freezed == selectedAddressId ? _self.selectedAddressId : selectedAddressId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
