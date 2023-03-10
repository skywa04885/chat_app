///
//  Generated code. Do not modify.
//  source: proto/nl/lukerieff/chat/protocol/messages/frame_message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'frame_message.pbenum.dart';

export 'frame_message.pbenum.dart';

class TokenAuthenticationBody extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenAuthenticationBody', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  TokenAuthenticationBody._() : super();
  factory TokenAuthenticationBody({
    $core.String? token,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory TokenAuthenticationBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenAuthenticationBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenAuthenticationBody clone() => TokenAuthenticationBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenAuthenticationBody copyWith(void Function(TokenAuthenticationBody) updates) => super.copyWith((message) => updates(message as TokenAuthenticationBody)) as TokenAuthenticationBody; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenAuthenticationBody create() => TokenAuthenticationBody._();
  TokenAuthenticationBody createEmptyInstance() => create();
  static $pb.PbList<TokenAuthenticationBody> createRepeated() => $pb.PbList<TokenAuthenticationBody>();
  @$core.pragma('dart2js:noInline')
  static TokenAuthenticationBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenAuthenticationBody>(create);
  static TokenAuthenticationBody? _defaultInstance;

  @$pb.TagNumber(10)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(10)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(10)
  void clearToken() => clearField(10);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Error', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..e<Error_Code>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: Error_Code.CLAIM_CHANNEL__ALREADY_CLAIMED, valueOf: Error_Code.valueOf, enumValues: Error_Code.values)
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error({
    Error_Code? code,
    $core.String? message,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Error clone() => Error()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error)) as Error; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(10)
  Error_Code get code => $_getN(0);
  @$pb.TagNumber(10)
  set code(Error_Code v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(10)
  void clearCode() => clearField(10);

  @$pb.TagNumber(20)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(20)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(20)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(20)
  void clearMessage() => clearField(20);
}

class Frame_Channeled_Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.Channeled.Event', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', $pb.PbFieldType.O3)
    ..aInt64(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..a<$core.List<$core.int>>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Frame_Channeled_Event._() : super();
  factory Frame_Channeled_Event({
    $core.int? event,
    $fixnum.Int64? timestamp,
    $core.List<$core.int>? body,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory Frame_Channeled_Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_Channeled_Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Event clone() => Frame_Channeled_Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Event copyWith(void Function(Frame_Channeled_Event) updates) => super.copyWith((message) => updates(message as Frame_Channeled_Event)) as Frame_Channeled_Event; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Event create() => Frame_Channeled_Event._();
  Frame_Channeled_Event createEmptyInstance() => create();
  static $pb.PbList<Frame_Channeled_Event> createRepeated() => $pb.PbList<Frame_Channeled_Event>();
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_Channeled_Event>(create);
  static Frame_Channeled_Event? _defaultInstance;

  @$pb.TagNumber(10)
  $core.int get event => $_getIZ(0);
  @$pb.TagNumber(10)
  set event($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(10)
  void clearEvent() => clearField(10);

  @$pb.TagNumber(20)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(20)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(20)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(20)
  void clearTimestamp() => clearField(20);

  @$pb.TagNumber(30)
  $core.List<$core.int> get body => $_getN(2);
  @$pb.TagNumber(30)
  set body($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(30)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(30)
  void clearBody() => clearField(30);
}

class Frame_Channeled_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.Channeled.Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqNo', $pb.PbFieldType.O3)
    ..aInt64(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..a<$core.int>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceNo', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Frame_Channeled_Request._() : super();
  factory Frame_Channeled_Request({
    $core.int? reqNo,
    $fixnum.Int64? timestamp,
    $core.int? serviceNo,
    $core.List<$core.int>? body,
  }) {
    final _result = create();
    if (reqNo != null) {
      _result.reqNo = reqNo;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (serviceNo != null) {
      _result.serviceNo = serviceNo;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory Frame_Channeled_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_Channeled_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Request clone() => Frame_Channeled_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Request copyWith(void Function(Frame_Channeled_Request) updates) => super.copyWith((message) => updates(message as Frame_Channeled_Request)) as Frame_Channeled_Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Request create() => Frame_Channeled_Request._();
  Frame_Channeled_Request createEmptyInstance() => create();
  static $pb.PbList<Frame_Channeled_Request> createRepeated() => $pb.PbList<Frame_Channeled_Request>();
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_Channeled_Request>(create);
  static Frame_Channeled_Request? _defaultInstance;

  @$pb.TagNumber(10)
  $core.int get reqNo => $_getIZ(0);
  @$pb.TagNumber(10)
  set reqNo($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasReqNo() => $_has(0);
  @$pb.TagNumber(10)
  void clearReqNo() => clearField(10);

  @$pb.TagNumber(20)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(20)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(20)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(20)
  void clearTimestamp() => clearField(20);

  @$pb.TagNumber(30)
  $core.int get serviceNo => $_getIZ(2);
  @$pb.TagNumber(30)
  set serviceNo($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(30)
  $core.bool hasServiceNo() => $_has(2);
  @$pb.TagNumber(30)
  void clearServiceNo() => clearField(30);

  @$pb.TagNumber(40)
  $core.List<$core.int> get body => $_getN(3);
  @$pb.TagNumber(40)
  set body($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(40)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(40)
  void clearBody() => clearField(40);
}

class Frame_Channeled_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.Channeled.Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqNo', $pb.PbFieldType.O3)
    ..aInt64(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..a<$core.List<$core.int>>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Frame_Channeled_Response._() : super();
  factory Frame_Channeled_Response({
    $core.int? reqNo,
    $fixnum.Int64? timestamp,
    $core.List<$core.int>? body,
  }) {
    final _result = create();
    if (reqNo != null) {
      _result.reqNo = reqNo;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory Frame_Channeled_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_Channeled_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Response clone() => Frame_Channeled_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_Channeled_Response copyWith(void Function(Frame_Channeled_Response) updates) => super.copyWith((message) => updates(message as Frame_Channeled_Response)) as Frame_Channeled_Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Response create() => Frame_Channeled_Response._();
  Frame_Channeled_Response createEmptyInstance() => create();
  static $pb.PbList<Frame_Channeled_Response> createRepeated() => $pb.PbList<Frame_Channeled_Response>();
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_Channeled_Response>(create);
  static Frame_Channeled_Response? _defaultInstance;

  @$pb.TagNumber(10)
  $core.int get reqNo => $_getIZ(0);
  @$pb.TagNumber(10)
  set reqNo($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasReqNo() => $_has(0);
  @$pb.TagNumber(10)
  void clearReqNo() => clearField(10);

  @$pb.TagNumber(20)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(20)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(20)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(20)
  void clearTimestamp() => clearField(20);

  @$pb.TagNumber(30)
  $core.List<$core.int> get body => $_getN(2);
  @$pb.TagNumber(30)
  set body($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(30)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(30)
  void clearBody() => clearField(30);
}

enum Frame_Channeled_Child {
  event, 
  request, 
  response, 
  notSet
}

class Frame_Channeled extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Frame_Channeled_Child> _Frame_Channeled_ChildByTag = {
    20 : Frame_Channeled_Child.event,
    30 : Frame_Channeled_Child.request,
    40 : Frame_Channeled_Child.response,
    0 : Frame_Channeled_Child.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.Channeled', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..oo(0, [20, 30, 40])
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.O3)
    ..aOM<Frame_Channeled_Event>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Frame_Channeled_Event.create)
    ..aOM<Frame_Channeled_Request>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: Frame_Channeled_Request.create)
    ..aOM<Frame_Channeled_Response>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'response', subBuilder: Frame_Channeled_Response.create)
    ..hasRequiredFields = false
  ;

  Frame_Channeled._() : super();
  factory Frame_Channeled({
    $core.int? channel,
    Frame_Channeled_Event? event,
    Frame_Channeled_Request? request,
    Frame_Channeled_Response? response,
  }) {
    final _result = create();
    if (channel != null) {
      _result.channel = channel;
    }
    if (event != null) {
      _result.event = event;
    }
    if (request != null) {
      _result.request = request;
    }
    if (response != null) {
      _result.response = response;
    }
    return _result;
  }
  factory Frame_Channeled.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_Channeled.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_Channeled clone() => Frame_Channeled()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_Channeled copyWith(void Function(Frame_Channeled) updates) => super.copyWith((message) => updates(message as Frame_Channeled)) as Frame_Channeled; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled create() => Frame_Channeled._();
  Frame_Channeled createEmptyInstance() => create();
  static $pb.PbList<Frame_Channeled> createRepeated() => $pb.PbList<Frame_Channeled>();
  @$core.pragma('dart2js:noInline')
  static Frame_Channeled getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_Channeled>(create);
  static Frame_Channeled? _defaultInstance;

  Frame_Channeled_Child whichChild() => _Frame_Channeled_ChildByTag[$_whichOneof(0)]!;
  void clearChild() => clearField($_whichOneof(0));

  @$pb.TagNumber(10)
  $core.int get channel => $_getIZ(0);
  @$pb.TagNumber(10)
  set channel($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(10)
  void clearChannel() => clearField(10);

  @$pb.TagNumber(20)
  Frame_Channeled_Event get event => $_getN(1);
  @$pb.TagNumber(20)
  set event(Frame_Channeled_Event v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(20)
  void clearEvent() => clearField(20);
  @$pb.TagNumber(20)
  Frame_Channeled_Event ensureEvent() => $_ensure(1);

  @$pb.TagNumber(30)
  Frame_Channeled_Request get request => $_getN(2);
  @$pb.TagNumber(30)
  set request(Frame_Channeled_Request v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasRequest() => $_has(2);
  @$pb.TagNumber(30)
  void clearRequest() => clearField(30);
  @$pb.TagNumber(30)
  Frame_Channeled_Request ensureRequest() => $_ensure(2);

  @$pb.TagNumber(40)
  Frame_Channeled_Response get response => $_getN(3);
  @$pb.TagNumber(40)
  set response(Frame_Channeled_Response v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasResponse() => $_has(3);
  @$pb.TagNumber(40)
  void clearResponse() => clearField(40);
  @$pb.TagNumber(40)
  Frame_Channeled_Response ensureResponse() => $_ensure(3);
}

class Frame_ProtoCmd_ClaimChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoCmd.ClaimChannel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Frame_ProtoCmd_ClaimChannel._() : super();
  factory Frame_ProtoCmd_ClaimChannel({
    $core.int? channel,
    $core.List<$core.int>? body,
  }) {
    final _result = create();
    if (channel != null) {
      _result.channel = channel;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory Frame_ProtoCmd_ClaimChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoCmd_ClaimChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ClaimChannel clone() => Frame_ProtoCmd_ClaimChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ClaimChannel copyWith(void Function(Frame_ProtoCmd_ClaimChannel) updates) => super.copyWith((message) => updates(message as Frame_ProtoCmd_ClaimChannel)) as Frame_ProtoCmd_ClaimChannel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ClaimChannel create() => Frame_ProtoCmd_ClaimChannel._();
  Frame_ProtoCmd_ClaimChannel createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoCmd_ClaimChannel> createRepeated() => $pb.PbList<Frame_ProtoCmd_ClaimChannel>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ClaimChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoCmd_ClaimChannel>(create);
  static Frame_ProtoCmd_ClaimChannel? _defaultInstance;

  @$pb.TagNumber(10)
  $core.int get channel => $_getIZ(0);
  @$pb.TagNumber(10)
  set channel($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(10)
  void clearChannel() => clearField(10);

  @$pb.TagNumber(20)
  $core.List<$core.int> get body => $_getN(1);
  @$pb.TagNumber(20)
  set body($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(20)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(20)
  void clearBody() => clearField(20);
}

class Frame_ProtoCmd_ReleaseChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoCmd.ReleaseChannel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Frame_ProtoCmd_ReleaseChannel._() : super();
  factory Frame_ProtoCmd_ReleaseChannel({
    $core.int? channel,
  }) {
    final _result = create();
    if (channel != null) {
      _result.channel = channel;
    }
    return _result;
  }
  factory Frame_ProtoCmd_ReleaseChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoCmd_ReleaseChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ReleaseChannel clone() => Frame_ProtoCmd_ReleaseChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ReleaseChannel copyWith(void Function(Frame_ProtoCmd_ReleaseChannel) updates) => super.copyWith((message) => updates(message as Frame_ProtoCmd_ReleaseChannel)) as Frame_ProtoCmd_ReleaseChannel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ReleaseChannel create() => Frame_ProtoCmd_ReleaseChannel._();
  Frame_ProtoCmd_ReleaseChannel createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoCmd_ReleaseChannel> createRepeated() => $pb.PbList<Frame_ProtoCmd_ReleaseChannel>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ReleaseChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoCmd_ReleaseChannel>(create);
  static Frame_ProtoCmd_ReleaseChannel? _defaultInstance;

  @$pb.TagNumber(10)
  $core.int get channel => $_getIZ(0);
  @$pb.TagNumber(10)
  set channel($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(10)
  void clearChannel() => clearField(10);
}

class Frame_ProtoCmd_ChangeHeartbeatPeriod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoCmd.ChangeHeartbeatPeriod', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'period')
    ..hasRequiredFields = false
  ;

  Frame_ProtoCmd_ChangeHeartbeatPeriod._() : super();
  factory Frame_ProtoCmd_ChangeHeartbeatPeriod({
    $fixnum.Int64? period,
  }) {
    final _result = create();
    if (period != null) {
      _result.period = period;
    }
    return _result;
  }
  factory Frame_ProtoCmd_ChangeHeartbeatPeriod.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoCmd_ChangeHeartbeatPeriod.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ChangeHeartbeatPeriod clone() => Frame_ProtoCmd_ChangeHeartbeatPeriod()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd_ChangeHeartbeatPeriod copyWith(void Function(Frame_ProtoCmd_ChangeHeartbeatPeriod) updates) => super.copyWith((message) => updates(message as Frame_ProtoCmd_ChangeHeartbeatPeriod)) as Frame_ProtoCmd_ChangeHeartbeatPeriod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ChangeHeartbeatPeriod create() => Frame_ProtoCmd_ChangeHeartbeatPeriod._();
  Frame_ProtoCmd_ChangeHeartbeatPeriod createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoCmd_ChangeHeartbeatPeriod> createRepeated() => $pb.PbList<Frame_ProtoCmd_ChangeHeartbeatPeriod>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd_ChangeHeartbeatPeriod getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoCmd_ChangeHeartbeatPeriod>(create);
  static Frame_ProtoCmd_ChangeHeartbeatPeriod? _defaultInstance;

  @$pb.TagNumber(10)
  $fixnum.Int64 get period => $_getI64(0);
  @$pb.TagNumber(10)
  set period($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasPeriod() => $_has(0);
  @$pb.TagNumber(10)
  void clearPeriod() => clearField(10);
}

enum Frame_ProtoCmd_Child {
  claimChannel, 
  releaseChannel, 
  changeHeartbeatPeriod, 
  notSet
}

class Frame_ProtoCmd extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Frame_ProtoCmd_Child> _Frame_ProtoCmd_ChildByTag = {
    20 : Frame_ProtoCmd_Child.claimChannel,
    30 : Frame_ProtoCmd_Child.releaseChannel,
    40 : Frame_ProtoCmd_Child.changeHeartbeatPeriod,
    0 : Frame_ProtoCmd_Child.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoCmd', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..oo(0, [20, 30, 40])
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commandNo', $pb.PbFieldType.O3)
    ..aOM<Frame_ProtoCmd_ClaimChannel>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'claimChannel', subBuilder: Frame_ProtoCmd_ClaimChannel.create)
    ..aOM<Frame_ProtoCmd_ReleaseChannel>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseChannel', subBuilder: Frame_ProtoCmd_ReleaseChannel.create)
    ..aOM<Frame_ProtoCmd_ChangeHeartbeatPeriod>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeHeartbeatPeriod', subBuilder: Frame_ProtoCmd_ChangeHeartbeatPeriod.create)
    ..hasRequiredFields = false
  ;

  Frame_ProtoCmd._() : super();
  factory Frame_ProtoCmd({
    $core.int? commandNo,
    Frame_ProtoCmd_ClaimChannel? claimChannel,
    Frame_ProtoCmd_ReleaseChannel? releaseChannel,
    Frame_ProtoCmd_ChangeHeartbeatPeriod? changeHeartbeatPeriod,
  }) {
    final _result = create();
    if (commandNo != null) {
      _result.commandNo = commandNo;
    }
    if (claimChannel != null) {
      _result.claimChannel = claimChannel;
    }
    if (releaseChannel != null) {
      _result.releaseChannel = releaseChannel;
    }
    if (changeHeartbeatPeriod != null) {
      _result.changeHeartbeatPeriod = changeHeartbeatPeriod;
    }
    return _result;
  }
  factory Frame_ProtoCmd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoCmd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd clone() => Frame_ProtoCmd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoCmd copyWith(void Function(Frame_ProtoCmd) updates) => super.copyWith((message) => updates(message as Frame_ProtoCmd)) as Frame_ProtoCmd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd create() => Frame_ProtoCmd._();
  Frame_ProtoCmd createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoCmd> createRepeated() => $pb.PbList<Frame_ProtoCmd>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoCmd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoCmd>(create);
  static Frame_ProtoCmd? _defaultInstance;

  Frame_ProtoCmd_Child whichChild() => _Frame_ProtoCmd_ChildByTag[$_whichOneof(0)]!;
  void clearChild() => clearField($_whichOneof(0));

  @$pb.TagNumber(10)
  $core.int get commandNo => $_getIZ(0);
  @$pb.TagNumber(10)
  set commandNo($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasCommandNo() => $_has(0);
  @$pb.TagNumber(10)
  void clearCommandNo() => clearField(10);

  @$pb.TagNumber(20)
  Frame_ProtoCmd_ClaimChannel get claimChannel => $_getN(1);
  @$pb.TagNumber(20)
  set claimChannel(Frame_ProtoCmd_ClaimChannel v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasClaimChannel() => $_has(1);
  @$pb.TagNumber(20)
  void clearClaimChannel() => clearField(20);
  @$pb.TagNumber(20)
  Frame_ProtoCmd_ClaimChannel ensureClaimChannel() => $_ensure(1);

  @$pb.TagNumber(30)
  Frame_ProtoCmd_ReleaseChannel get releaseChannel => $_getN(2);
  @$pb.TagNumber(30)
  set releaseChannel(Frame_ProtoCmd_ReleaseChannel v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasReleaseChannel() => $_has(2);
  @$pb.TagNumber(30)
  void clearReleaseChannel() => clearField(30);
  @$pb.TagNumber(30)
  Frame_ProtoCmd_ReleaseChannel ensureReleaseChannel() => $_ensure(2);

  @$pb.TagNumber(40)
  Frame_ProtoCmd_ChangeHeartbeatPeriod get changeHeartbeatPeriod => $_getN(3);
  @$pb.TagNumber(40)
  set changeHeartbeatPeriod(Frame_ProtoCmd_ChangeHeartbeatPeriod v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasChangeHeartbeatPeriod() => $_has(3);
  @$pb.TagNumber(40)
  void clearChangeHeartbeatPeriod() => clearField(40);
  @$pb.TagNumber(40)
  Frame_ProtoCmd_ChangeHeartbeatPeriod ensureChangeHeartbeatPeriod() => $_ensure(3);
}

class Frame_ProtoReply_ClaimChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoReply.ClaimChannel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Frame_ProtoReply_ClaimChannel._() : super();
  factory Frame_ProtoReply_ClaimChannel() => create();
  factory Frame_ProtoReply_ClaimChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoReply_ClaimChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ClaimChannel clone() => Frame_ProtoReply_ClaimChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ClaimChannel copyWith(void Function(Frame_ProtoReply_ClaimChannel) updates) => super.copyWith((message) => updates(message as Frame_ProtoReply_ClaimChannel)) as Frame_ProtoReply_ClaimChannel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ClaimChannel create() => Frame_ProtoReply_ClaimChannel._();
  Frame_ProtoReply_ClaimChannel createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoReply_ClaimChannel> createRepeated() => $pb.PbList<Frame_ProtoReply_ClaimChannel>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ClaimChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoReply_ClaimChannel>(create);
  static Frame_ProtoReply_ClaimChannel? _defaultInstance;
}

class Frame_ProtoReply_ReleaseChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoReply.ReleaseChannel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Frame_ProtoReply_ReleaseChannel._() : super();
  factory Frame_ProtoReply_ReleaseChannel() => create();
  factory Frame_ProtoReply_ReleaseChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoReply_ReleaseChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ReleaseChannel clone() => Frame_ProtoReply_ReleaseChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ReleaseChannel copyWith(void Function(Frame_ProtoReply_ReleaseChannel) updates) => super.copyWith((message) => updates(message as Frame_ProtoReply_ReleaseChannel)) as Frame_ProtoReply_ReleaseChannel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ReleaseChannel create() => Frame_ProtoReply_ReleaseChannel._();
  Frame_ProtoReply_ReleaseChannel createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoReply_ReleaseChannel> createRepeated() => $pb.PbList<Frame_ProtoReply_ReleaseChannel>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ReleaseChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoReply_ReleaseChannel>(create);
  static Frame_ProtoReply_ReleaseChannel? _defaultInstance;
}

class Frame_ProtoReply_ChangeHeartbeatPeriod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoReply.ChangeHeartbeatPeriod', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Frame_ProtoReply_ChangeHeartbeatPeriod._() : super();
  factory Frame_ProtoReply_ChangeHeartbeatPeriod() => create();
  factory Frame_ProtoReply_ChangeHeartbeatPeriod.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoReply_ChangeHeartbeatPeriod.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ChangeHeartbeatPeriod clone() => Frame_ProtoReply_ChangeHeartbeatPeriod()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply_ChangeHeartbeatPeriod copyWith(void Function(Frame_ProtoReply_ChangeHeartbeatPeriod) updates) => super.copyWith((message) => updates(message as Frame_ProtoReply_ChangeHeartbeatPeriod)) as Frame_ProtoReply_ChangeHeartbeatPeriod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ChangeHeartbeatPeriod create() => Frame_ProtoReply_ChangeHeartbeatPeriod._();
  Frame_ProtoReply_ChangeHeartbeatPeriod createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoReply_ChangeHeartbeatPeriod> createRepeated() => $pb.PbList<Frame_ProtoReply_ChangeHeartbeatPeriod>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply_ChangeHeartbeatPeriod getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoReply_ChangeHeartbeatPeriod>(create);
  static Frame_ProtoReply_ChangeHeartbeatPeriod? _defaultInstance;
}

enum Frame_ProtoReply_Child {
  error, 
  claimChannel, 
  releaseChannel, 
  changeHeartbeatPeriod, 
  notSet
}

class Frame_ProtoReply extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Frame_ProtoReply_Child> _Frame_ProtoReply_ChildByTag = {
    20 : Frame_ProtoReply_Child.error,
    30 : Frame_ProtoReply_Child.claimChannel,
    40 : Frame_ProtoReply_Child.releaseChannel,
    50 : Frame_ProtoReply_Child.changeHeartbeatPeriod,
    0 : Frame_ProtoReply_Child.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.ProtoReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..oo(0, [20, 30, 40, 50])
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commandNo', $pb.PbFieldType.O3)
    ..aOM<Error>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: Error.create)
    ..aOM<Frame_ProtoReply_ClaimChannel>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'claimChannel', subBuilder: Frame_ProtoReply_ClaimChannel.create)
    ..aOM<Frame_ProtoReply_ReleaseChannel>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseChannel', subBuilder: Frame_ProtoReply_ReleaseChannel.create)
    ..aOM<Frame_ProtoReply_ChangeHeartbeatPeriod>(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeHeartbeatPeriod', subBuilder: Frame_ProtoReply_ChangeHeartbeatPeriod.create)
    ..hasRequiredFields = false
  ;

  Frame_ProtoReply._() : super();
  factory Frame_ProtoReply({
    $core.int? commandNo,
    Error? error,
    Frame_ProtoReply_ClaimChannel? claimChannel,
    Frame_ProtoReply_ReleaseChannel? releaseChannel,
    Frame_ProtoReply_ChangeHeartbeatPeriod? changeHeartbeatPeriod,
  }) {
    final _result = create();
    if (commandNo != null) {
      _result.commandNo = commandNo;
    }
    if (error != null) {
      _result.error = error;
    }
    if (claimChannel != null) {
      _result.claimChannel = claimChannel;
    }
    if (releaseChannel != null) {
      _result.releaseChannel = releaseChannel;
    }
    if (changeHeartbeatPeriod != null) {
      _result.changeHeartbeatPeriod = changeHeartbeatPeriod;
    }
    return _result;
  }
  factory Frame_ProtoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_ProtoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply clone() => Frame_ProtoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_ProtoReply copyWith(void Function(Frame_ProtoReply) updates) => super.copyWith((message) => updates(message as Frame_ProtoReply)) as Frame_ProtoReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply create() => Frame_ProtoReply._();
  Frame_ProtoReply createEmptyInstance() => create();
  static $pb.PbList<Frame_ProtoReply> createRepeated() => $pb.PbList<Frame_ProtoReply>();
  @$core.pragma('dart2js:noInline')
  static Frame_ProtoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_ProtoReply>(create);
  static Frame_ProtoReply? _defaultInstance;

  Frame_ProtoReply_Child whichChild() => _Frame_ProtoReply_ChildByTag[$_whichOneof(0)]!;
  void clearChild() => clearField($_whichOneof(0));

  @$pb.TagNumber(10)
  $core.int get commandNo => $_getIZ(0);
  @$pb.TagNumber(10)
  set commandNo($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasCommandNo() => $_has(0);
  @$pb.TagNumber(10)
  void clearCommandNo() => clearField(10);

  @$pb.TagNumber(20)
  Error get error => $_getN(1);
  @$pb.TagNumber(20)
  set error(Error v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(20)
  void clearError() => clearField(20);
  @$pb.TagNumber(20)
  Error ensureError() => $_ensure(1);

  @$pb.TagNumber(30)
  Frame_ProtoReply_ClaimChannel get claimChannel => $_getN(2);
  @$pb.TagNumber(30)
  set claimChannel(Frame_ProtoReply_ClaimChannel v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasClaimChannel() => $_has(2);
  @$pb.TagNumber(30)
  void clearClaimChannel() => clearField(30);
  @$pb.TagNumber(30)
  Frame_ProtoReply_ClaimChannel ensureClaimChannel() => $_ensure(2);

  @$pb.TagNumber(40)
  Frame_ProtoReply_ReleaseChannel get releaseChannel => $_getN(3);
  @$pb.TagNumber(40)
  set releaseChannel(Frame_ProtoReply_ReleaseChannel v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasReleaseChannel() => $_has(3);
  @$pb.TagNumber(40)
  void clearReleaseChannel() => clearField(40);
  @$pb.TagNumber(40)
  Frame_ProtoReply_ReleaseChannel ensureReleaseChannel() => $_ensure(3);

  @$pb.TagNumber(50)
  Frame_ProtoReply_ChangeHeartbeatPeriod get changeHeartbeatPeriod => $_getN(4);
  @$pb.TagNumber(50)
  set changeHeartbeatPeriod(Frame_ProtoReply_ChangeHeartbeatPeriod v) { setField(50, v); }
  @$pb.TagNumber(50)
  $core.bool hasChangeHeartbeatPeriod() => $_has(4);
  @$pb.TagNumber(50)
  void clearChangeHeartbeatPeriod() => clearField(50);
  @$pb.TagNumber(50)
  Frame_ProtoReply_ChangeHeartbeatPeriod ensureChangeHeartbeatPeriod() => $_ensure(4);
}

class Frame_Heartbeat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.Heartbeat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  Frame_Heartbeat._() : super();
  factory Frame_Heartbeat({
    $fixnum.Int64? timestamp,
  }) {
    final _result = create();
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory Frame_Heartbeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_Heartbeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_Heartbeat clone() => Frame_Heartbeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_Heartbeat copyWith(void Function(Frame_Heartbeat) updates) => super.copyWith((message) => updates(message as Frame_Heartbeat)) as Frame_Heartbeat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_Heartbeat create() => Frame_Heartbeat._();
  Frame_Heartbeat createEmptyInstance() => create();
  static $pb.PbList<Frame_Heartbeat> createRepeated() => $pb.PbList<Frame_Heartbeat>();
  @$core.pragma('dart2js:noInline')
  static Frame_Heartbeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_Heartbeat>(create);
  static Frame_Heartbeat? _defaultInstance;

  @$pb.TagNumber(10)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(10)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(10)
  void clearTimestamp() => clearField(10);
}

class Frame_HalfDuplexStream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame.HalfDuplexStream', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Frame_HalfDuplexStream._() : super();
  factory Frame_HalfDuplexStream() => create();
  factory Frame_HalfDuplexStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame_HalfDuplexStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame_HalfDuplexStream clone() => Frame_HalfDuplexStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame_HalfDuplexStream copyWith(void Function(Frame_HalfDuplexStream) updates) => super.copyWith((message) => updates(message as Frame_HalfDuplexStream)) as Frame_HalfDuplexStream; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame_HalfDuplexStream create() => Frame_HalfDuplexStream._();
  Frame_HalfDuplexStream createEmptyInstance() => create();
  static $pb.PbList<Frame_HalfDuplexStream> createRepeated() => $pb.PbList<Frame_HalfDuplexStream>();
  @$core.pragma('dart2js:noInline')
  static Frame_HalfDuplexStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame_HalfDuplexStream>(create);
  static Frame_HalfDuplexStream? _defaultInstance;
}

enum Frame_Child {
  channeled, 
  heartbeat, 
  protoCmd, 
  protoReply, 
  notSet
}

class Frame extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Frame_Child> _Frame_ChildByTag = {
    10 : Frame_Child.channeled,
    20 : Frame_Child.heartbeat,
    30 : Frame_Child.protoCmd,
    40 : Frame_Child.protoReply,
    0 : Frame_Child.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Frame', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'nl.lukerieff.chat.protocol.messages'), createEmptyInstance: create)
    ..oo(0, [10, 20, 30, 40])
    ..aOM<Frame_Channeled>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channeled', subBuilder: Frame_Channeled.create)
    ..aOM<Frame_Heartbeat>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'heartbeat', subBuilder: Frame_Heartbeat.create)
    ..aOM<Frame_ProtoCmd>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protoCmd', subBuilder: Frame_ProtoCmd.create)
    ..aOM<Frame_ProtoReply>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protoReply', subBuilder: Frame_ProtoReply.create)
    ..hasRequiredFields = false
  ;

  Frame._() : super();
  factory Frame({
    Frame_Channeled? channeled,
    Frame_Heartbeat? heartbeat,
    Frame_ProtoCmd? protoCmd,
    Frame_ProtoReply? protoReply,
  }) {
    final _result = create();
    if (channeled != null) {
      _result.channeled = channeled;
    }
    if (heartbeat != null) {
      _result.heartbeat = heartbeat;
    }
    if (protoCmd != null) {
      _result.protoCmd = protoCmd;
    }
    if (protoReply != null) {
      _result.protoReply = protoReply;
    }
    return _result;
  }
  factory Frame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Frame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Frame clone() => Frame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Frame copyWith(void Function(Frame) updates) => super.copyWith((message) => updates(message as Frame)) as Frame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Frame create() => Frame._();
  Frame createEmptyInstance() => create();
  static $pb.PbList<Frame> createRepeated() => $pb.PbList<Frame>();
  @$core.pragma('dart2js:noInline')
  static Frame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame>(create);
  static Frame? _defaultInstance;

  Frame_Child whichChild() => _Frame_ChildByTag[$_whichOneof(0)]!;
  void clearChild() => clearField($_whichOneof(0));

  @$pb.TagNumber(10)
  Frame_Channeled get channeled => $_getN(0);
  @$pb.TagNumber(10)
  set channeled(Frame_Channeled v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasChanneled() => $_has(0);
  @$pb.TagNumber(10)
  void clearChanneled() => clearField(10);
  @$pb.TagNumber(10)
  Frame_Channeled ensureChanneled() => $_ensure(0);

  @$pb.TagNumber(20)
  Frame_Heartbeat get heartbeat => $_getN(1);
  @$pb.TagNumber(20)
  set heartbeat(Frame_Heartbeat v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasHeartbeat() => $_has(1);
  @$pb.TagNumber(20)
  void clearHeartbeat() => clearField(20);
  @$pb.TagNumber(20)
  Frame_Heartbeat ensureHeartbeat() => $_ensure(1);

  @$pb.TagNumber(30)
  Frame_ProtoCmd get protoCmd => $_getN(2);
  @$pb.TagNumber(30)
  set protoCmd(Frame_ProtoCmd v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasProtoCmd() => $_has(2);
  @$pb.TagNumber(30)
  void clearProtoCmd() => clearField(30);
  @$pb.TagNumber(30)
  Frame_ProtoCmd ensureProtoCmd() => $_ensure(2);

  @$pb.TagNumber(40)
  Frame_ProtoReply get protoReply => $_getN(3);
  @$pb.TagNumber(40)
  set protoReply(Frame_ProtoReply v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasProtoReply() => $_has(3);
  @$pb.TagNumber(40)
  void clearProtoReply() => clearField(40);
  @$pb.TagNumber(40)
  Frame_ProtoReply ensureProtoReply() => $_ensure(3);
}

