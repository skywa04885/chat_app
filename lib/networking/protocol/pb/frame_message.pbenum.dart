///
//  Generated code. Do not modify.
//  source: proto/nl/lukerieff/chat/protocol/messages/frame_message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Error_Code extends $pb.ProtobufEnum {
  static const Error_Code CLAIM_CHANNEL__ALREADY_CLAIMED = Error_Code._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_CHANNEL__ALREADY_CLAIMED');
  static const Error_Code CLAIM_CHANNEL__AUTHENTICATION_FAILURE = Error_Code._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAIM_CHANNEL__AUTHENTICATION_FAILURE');
  static const Error_Code RELEASE_CHANNEL__NOT_CLAIMED = Error_Code._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RELEASE_CHANNEL__NOT_CLAIMED');

  static const $core.List<Error_Code> values = <Error_Code> [
    CLAIM_CHANNEL__ALREADY_CLAIMED,
    CLAIM_CHANNEL__AUTHENTICATION_FAILURE,
    RELEASE_CHANNEL__NOT_CLAIMED,
  ];

  static final $core.Map<$core.int, Error_Code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Error_Code? valueOf($core.int value) => _byValue[value];

  const Error_Code._($core.int v, $core.String n) : super(v, n);
}

