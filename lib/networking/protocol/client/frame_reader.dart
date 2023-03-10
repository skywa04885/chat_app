import 'dart:async';
import 'dart:typed_data';

import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

enum FrameStreamReaderState {
  awaiting,
  reading,
}

class FrameReader implements StreamTransformer<Uint8List, Frame> {
  @override
  Stream<Frame> bind(Stream<Uint8List> stream) {
    StreamController<Frame> streamController = StreamController<Frame>();

    FrameStreamReaderState state = FrameStreamReaderState.awaiting;

    int frameLength = 0;

    Uint8List bytes = Uint8List(0);

    stream.listen((final Uint8List newBytes) {
      BytesBuilder bytesBuilder = BytesBuilder();
      bytesBuilder.add(bytes);
      bytesBuilder.add(newBytes);
      bytes = bytesBuilder.toBytes();

      switch (state) {
        case FrameStreamReaderState.awaiting:
          {
            if (bytes.length < 4) {
              break;
            }

            frameLength =
                bytes.sublist(0, 4).buffer.asByteData().getInt32(0, Endian.big);

            state = FrameStreamReaderState.reading;
            bytes = bytes.sublist(4);

            break;
          }
        case FrameStreamReaderState.reading:
          {
            if (bytes.length < frameLength) {
              break;
            }

            final Uint8List frameBytes = bytes.sublist(0, frameLength);
            final Frame frame = Frame.fromBuffer(frameBytes);

            streamController.sink.add(frame);

            state = FrameStreamReaderState.awaiting;
            bytes = bytes.sublist(frameLength);

            break;
          }
      }
    });

    return streamController.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    return StreamTransformer.castFrom(this);
  }
}
