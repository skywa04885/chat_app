import 'dart:typed_data';

import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

typedef ProtocolClientFrameReaderFrameMessageCallback = void Function(FrameMessage);

enum ProtocolClientFrameReaderState {
  awaiting,
  reading,
}

class ProtocolClientFrameReader {
  final ProtocolClientFrameReaderFrameMessageCallback frameMessageCallback;
  bool _readingFrame = false;
  int _frameLength = 0;
  Uint8List _previousBytes = Uint8List(0);

  /// Constructs a new frame reader.
  ProtocolClientFrameReader(this.frameMessageCallback);

  /// Reads the length of the upcoming frame.
  bool _readFrameLength() {
    if (_previousBytes.length < 4) {
      return true;
    }

    _frameLength = _previousBytes
        .sublist(0, 4)
        .buffer
        .asByteData()
        .getInt32(0, Endian.big);

    _readingFrame = true;
    _previousBytes = _previousBytes.sublist(4);

    return false;
  }

  /// Reads the frame of the previously read length.
  bool _readFrame() {
    if (_previousBytes.length < _frameLength) {
      return true;
    }

    final Uint8List frameBytes = _previousBytes.sublist(0, _frameLength);
    final FrameMessage frame = FrameMessage.fromBuffer(frameBytes);

    frameMessageCallback(frame);

    _readingFrame = false;
    _previousBytes = _previousBytes.sublist(_frameLength);

    return false;
  }

  /// Writes new data to the the frame reader.
  void write(final Uint8List newBytes) {
    BytesBuilder bytesBuilder = BytesBuilder();
    bytesBuilder.add(_previousBytes);
    bytesBuilder.add(newBytes);
    _previousBytes = bytesBuilder.toBytes();

    while (_previousBytes.isNotEmpty) {
      if (_readingFrame ? false : _readFrameLength()) {
        break;
      }

      if (_readFrame()) {
        break;
      }
    }
  }
}