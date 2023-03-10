///
//  Generated code. Do not modify.
//  source: proto/nl/lukerieff/chat/protocol/messages/frame_message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tokenAuthenticationBodyDescriptor instead')
const TokenAuthenticationBody$json = const {
  '1': 'TokenAuthenticationBody',
  '2': const [
    const {'1': 'token', '3': 10, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `TokenAuthenticationBody`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenAuthenticationBodyDescriptor = $convert.base64Decode('ChdUb2tlbkF1dGhlbnRpY2F0aW9uQm9keRIUCgV0b2tlbhgKIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'code', '3': 10, '4': 1, '5': 14, '6': '.nl.lukerieff.chat.protocol.messages.Error.Code', '10': 'code'},
    const {'1': 'message', '3': 20, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '4': const [Error_Code$json],
  '8': const [
    const {'1': '_message'},
  ],
};

@$core.Deprecated('Use errorDescriptor instead')
const Error_Code$json = const {
  '1': 'Code',
  '2': const [
    const {'1': 'CLAIM_CHANNEL__ALREADY_CLAIMED', '2': 0},
    const {'1': 'CLAIM_CHANNEL__AUTHENTICATION_FAILURE', '2': 1},
    const {'1': 'RELEASE_CHANNEL__NOT_CLAIMED', '2': 2},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode('CgVFcnJvchJDCgRjb2RlGAogASgOMi8ubmwubHVrZXJpZWZmLmNoYXQucHJvdG9jb2wubWVzc2FnZXMuRXJyb3IuQ29kZVIEY29kZRIdCgdtZXNzYWdlGBQgASgJSABSB21lc3NhZ2WIAQEidwoEQ29kZRIiCh5DTEFJTV9DSEFOTkVMX19BTFJFQURZX0NMQUlNRUQQABIpCiVDTEFJTV9DSEFOTkVMX19BVVRIRU5USUNBVElPTl9GQUlMVVJFEAESIAocUkVMRUFTRV9DSEFOTkVMX19OT1RfQ0xBSU1FRBACQgoKCF9tZXNzYWdl');
@$core.Deprecated('Use frameDescriptor instead')
const Frame$json = const {
  '1': 'Frame',
  '2': const [
    const {'1': 'channeled', '3': 10, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.Channeled', '9': 0, '10': 'channeled'},
    const {'1': 'heartbeat', '3': 20, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.Heartbeat', '9': 0, '10': 'heartbeat'},
    const {'1': 'proto_cmd', '3': 30, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoCmd', '9': 0, '10': 'protoCmd'},
    const {'1': 'proto_reply', '3': 40, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoReply', '9': 0, '10': 'protoReply'},
  ],
  '3': const [Frame_Channeled$json, Frame_ProtoCmd$json, Frame_ProtoReply$json, Frame_Heartbeat$json, Frame_HalfDuplexStream$json],
  '8': const [
    const {'1': 'child'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Channeled$json = const {
  '1': 'Channeled',
  '2': const [
    const {'1': 'channel', '3': 10, '4': 1, '5': 5, '9': 1, '10': 'channel', '17': true},
    const {'1': 'event', '3': 20, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.Channeled.Event', '9': 0, '10': 'event'},
    const {'1': 'request', '3': 30, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.Channeled.Request', '9': 0, '10': 'request'},
    const {'1': 'response', '3': 40, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.Channeled.Response', '9': 0, '10': 'response'},
  ],
  '3': const [Frame_Channeled_Event$json, Frame_Channeled_Request$json, Frame_Channeled_Response$json],
  '8': const [
    const {'1': 'child'},
    const {'1': '_channel'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Channeled_Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'event', '3': 10, '4': 1, '5': 5, '10': 'event'},
    const {'1': 'timestamp', '3': 20, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'body', '3': 30, '4': 1, '5': 12, '10': 'body'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Channeled_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'req_no', '3': 10, '4': 1, '5': 5, '10': 'reqNo'},
    const {'1': 'timestamp', '3': 20, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'service_no', '3': 30, '4': 1, '5': 5, '10': 'serviceNo'},
    const {'1': 'body', '3': 40, '4': 1, '5': 12, '9': 0, '10': 'body', '17': true},
  ],
  '8': const [
    const {'1': '_body'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Channeled_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'req_no', '3': 10, '4': 1, '5': 5, '10': 'reqNo'},
    const {'1': 'timestamp', '3': 20, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'body', '3': 30, '4': 1, '5': 12, '9': 0, '10': 'body', '17': true},
  ],
  '8': const [
    const {'1': '_body'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoCmd$json = const {
  '1': 'ProtoCmd',
  '2': const [
    const {'1': 'command_no', '3': 10, '4': 1, '5': 5, '10': 'commandNo'},
    const {'1': 'claim_channel', '3': 20, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoCmd.ClaimChannel', '9': 0, '10': 'claimChannel'},
    const {'1': 'release_channel', '3': 30, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoCmd.ReleaseChannel', '9': 0, '10': 'releaseChannel'},
    const {'1': 'change_heartbeat_period', '3': 40, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoCmd.ChangeHeartbeatPeriod', '9': 0, '10': 'changeHeartbeatPeriod'},
  ],
  '3': const [Frame_ProtoCmd_ClaimChannel$json, Frame_ProtoCmd_ReleaseChannel$json, Frame_ProtoCmd_ChangeHeartbeatPeriod$json],
  '8': const [
    const {'1': 'child'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoCmd_ClaimChannel$json = const {
  '1': 'ClaimChannel',
  '2': const [
    const {'1': 'channel', '3': 10, '4': 1, '5': 5, '10': 'channel'},
    const {'1': 'body', '3': 20, '4': 1, '5': 12, '10': 'body'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoCmd_ReleaseChannel$json = const {
  '1': 'ReleaseChannel',
  '2': const [
    const {'1': 'channel', '3': 10, '4': 1, '5': 5, '10': 'channel'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoCmd_ChangeHeartbeatPeriod$json = const {
  '1': 'ChangeHeartbeatPeriod',
  '2': const [
    const {'1': 'period', '3': 10, '4': 1, '5': 3, '10': 'period'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoReply$json = const {
  '1': 'ProtoReply',
  '2': const [
    const {'1': 'command_no', '3': 10, '4': 1, '5': 5, '10': 'commandNo'},
    const {'1': 'error', '3': 20, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Error', '9': 0, '10': 'error'},
    const {'1': 'claim_channel', '3': 30, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoReply.ClaimChannel', '9': 0, '10': 'claimChannel'},
    const {'1': 'release_channel', '3': 40, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoReply.ReleaseChannel', '9': 0, '10': 'releaseChannel'},
    const {'1': 'change_heartbeat_period', '3': 50, '4': 1, '5': 11, '6': '.nl.lukerieff.chat.protocol.messages.Frame.ProtoReply.ChangeHeartbeatPeriod', '9': 0, '10': 'changeHeartbeatPeriod'},
  ],
  '3': const [Frame_ProtoReply_ClaimChannel$json, Frame_ProtoReply_ReleaseChannel$json, Frame_ProtoReply_ChangeHeartbeatPeriod$json],
  '8': const [
    const {'1': 'child'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoReply_ClaimChannel$json = const {
  '1': 'ClaimChannel',
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoReply_ReleaseChannel$json = const {
  '1': 'ReleaseChannel',
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_ProtoReply_ChangeHeartbeatPeriod$json = const {
  '1': 'ChangeHeartbeatPeriod',
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Heartbeat$json = const {
  '1': 'Heartbeat',
  '2': const [
    const {'1': 'timestamp', '3': 10, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_HalfDuplexStream$json = const {
  '1': 'HalfDuplexStream',
};

/// Descriptor for `Frame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameDescriptor = $convert.base64Decode('CgVGcmFtZRJUCgljaGFubmVsZWQYCiABKAsyNC5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5DaGFubmVsZWRIAFIJY2hhbm5lbGVkElQKCWhlYXJ0YmVhdBgUIAEoCzI0Lm5sLmx1a2VyaWVmZi5jaGF0LnByb3RvY29sLm1lc3NhZ2VzLkZyYW1lLkhlYXJ0YmVhdEgAUgloZWFydGJlYXQSUgoJcHJvdG9fY21kGB4gASgLMjMubmwubHVrZXJpZWZmLmNoYXQucHJvdG9jb2wubWVzc2FnZXMuRnJhbWUuUHJvdG9DbWRIAFIIcHJvdG9DbWQSWAoLcHJvdG9fcmVwbHkYKCABKAsyNS5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5Qcm90b1JlcGx5SABSCnByb3RvUmVwbHka/wQKCUNoYW5uZWxlZBIdCgdjaGFubmVsGAogASgFSAFSB2NoYW5uZWyIAQESUgoFZXZlbnQYFCABKAsyOi5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5DaGFubmVsZWQuRXZlbnRIAFIFZXZlbnQSWAoHcmVxdWVzdBgeIAEoCzI8Lm5sLmx1a2VyaWVmZi5jaGF0LnByb3RvY29sLm1lc3NhZ2VzLkZyYW1lLkNoYW5uZWxlZC5SZXF1ZXN0SABSB3JlcXVlc3QSWwoIcmVzcG9uc2UYKCABKAsyPS5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5DaGFubmVsZWQuUmVzcG9uc2VIAFIIcmVzcG9uc2UaTwoFRXZlbnQSFAoFZXZlbnQYCiABKAVSBWV2ZW50EhwKCXRpbWVzdGFtcBgUIAEoA1IJdGltZXN0YW1wEhIKBGJvZHkYHiABKAxSBGJvZHkafwoHUmVxdWVzdBIVCgZyZXFfbm8YCiABKAVSBXJlcU5vEhwKCXRpbWVzdGFtcBgUIAEoA1IJdGltZXN0YW1wEh0KCnNlcnZpY2Vfbm8YHiABKAVSCXNlcnZpY2VObxIXCgRib2R5GCggASgMSABSBGJvZHmIAQFCBwoFX2JvZHkaYQoIUmVzcG9uc2USFQoGcmVxX25vGAogASgFUgVyZXFObxIcCgl0aW1lc3RhbXAYFCABKANSCXRpbWVzdGFtcBIXCgRib2R5GB4gASgMSABSBGJvZHmIAQFCBwoFX2JvZHlCBwoFY2hpbGRCCgoIX2NoYW5uZWwaqwQKCFByb3RvQ21kEh0KCmNvbW1hbmRfbm8YCiABKAVSCWNvbW1hbmRObxJnCg1jbGFpbV9jaGFubmVsGBQgASgLMkAubmwubHVrZXJpZWZmLmNoYXQucHJvdG9jb2wubWVzc2FnZXMuRnJhbWUuUHJvdG9DbWQuQ2xhaW1DaGFubmVsSABSDGNsYWltQ2hhbm5lbBJtCg9yZWxlYXNlX2NoYW5uZWwYHiABKAsyQi5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5Qcm90b0NtZC5SZWxlYXNlQ2hhbm5lbEgAUg5yZWxlYXNlQ2hhbm5lbBKDAQoXY2hhbmdlX2hlYXJ0YmVhdF9wZXJpb2QYKCABKAsySS5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5Qcm90b0NtZC5DaGFuZ2VIZWFydGJlYXRQZXJpb2RIAFIVY2hhbmdlSGVhcnRiZWF0UGVyaW9kGjwKDENsYWltQ2hhbm5lbBIYCgdjaGFubmVsGAogASgFUgdjaGFubmVsEhIKBGJvZHkYFCABKAxSBGJvZHkaKgoOUmVsZWFzZUNoYW5uZWwSGAoHY2hhbm5lbBgKIAEoBVIHY2hhbm5lbBovChVDaGFuZ2VIZWFydGJlYXRQZXJpb2QSFgoGcGVyaW9kGAogASgDUgZwZXJpb2RCBwoFY2hpbGQalwQKClByb3RvUmVwbHkSHQoKY29tbWFuZF9ubxgKIAEoBVIJY29tbWFuZE5vEkIKBWVycm9yGBQgASgLMioubmwubHVrZXJpZWZmLmNoYXQucHJvdG9jb2wubWVzc2FnZXMuRXJyb3JIAFIFZXJyb3ISaQoNY2xhaW1fY2hhbm5lbBgeIAEoCzJCLm5sLmx1a2VyaWVmZi5jaGF0LnByb3RvY29sLm1lc3NhZ2VzLkZyYW1lLlByb3RvUmVwbHkuQ2xhaW1DaGFubmVsSABSDGNsYWltQ2hhbm5lbBJvCg9yZWxlYXNlX2NoYW5uZWwYKCABKAsyRC5ubC5sdWtlcmllZmYuY2hhdC5wcm90b2NvbC5tZXNzYWdlcy5GcmFtZS5Qcm90b1JlcGx5LlJlbGVhc2VDaGFubmVsSABSDnJlbGVhc2VDaGFubmVsEoUBChdjaGFuZ2VfaGVhcnRiZWF0X3BlcmlvZBgyIAEoCzJLLm5sLmx1a2VyaWVmZi5jaGF0LnByb3RvY29sLm1lc3NhZ2VzLkZyYW1lLlByb3RvUmVwbHkuQ2hhbmdlSGVhcnRiZWF0UGVyaW9kSABSFWNoYW5nZUhlYXJ0YmVhdFBlcmlvZBoOCgxDbGFpbUNoYW5uZWwaEAoOUmVsZWFzZUNoYW5uZWwaFwoVQ2hhbmdlSGVhcnRiZWF0UGVyaW9kQgcKBWNoaWxkGikKCUhlYXJ0YmVhdBIcCgl0aW1lc3RhbXAYCiABKANSCXRpbWVzdGFtcBoSChBIYWxmRHVwbGV4U3RyZWFtQgcKBWNoaWxk');
