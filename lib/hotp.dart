import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class HOTP {
  final List<int> doubleDigits = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9];
  final List<int> DIGITS_POWER = [
    1,
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000,
  ];

  String? getOTPValue(String transaction) {
    try {
      int epoch = DateTime.now().millisecondsSinceEpoch ~/ 30000;
      print("EPOCH: $epoch");
      print(
        "VALUE_OTP: ${PGBStorage.g().getString(Tags.REAL_DEVICE_KEY_SM) + transaction}",
      );
      return generateOTP(
        utf8.encode(
          PGBStorage.g().getString(Tags.REAL_DEVICE_KEY_SM) + transaction,
        ),
        epoch,
      );
    } catch (e) {
      print("EX: $e");
    }
    return null;
  }

  String generateOTP(Uint8List secret, int movingFactor) {
    int codeDigits = 6;
    bool addChecksum = false;
    int truncationOffset = 0;

    String result;
    int digits = addChecksum ? (codeDigits + 1) : codeDigits;
    Uint8List text = Uint8List(8);

    for (int i = text.length - 1; i >= 0; i--) {
      text[i] = (movingFactor & 0xff);
      movingFactor >>= 8;
    }

    // compute hmac hash
    Uint8List hash = hmacSha1(secret, text);

    // put selected bytes into result int
    int offset = hash[hash.length - 1] & 0xf;
    if (0 <= truncationOffset && truncationOffset < (hash.length - 4)) {
      offset = truncationOffset;
    }
    offset = hash[hash.length - 1] & 0x0F;
    int binary =
        ((hash[offset] & 0x7f) << 24) |
        ((hash[offset + 1] & 0xff) << 16) |
        ((hash[offset + 2] & 0xff) << 8) |
        (hash[offset + 3] & 0xff);

    int otp = binary % DIGITS_POWER[codeDigits];
    if (addChecksum) {
      otp = (otp * 10) + calcChecksum(otp, codeDigits);
    }
    result = otp.toString();

    while (result.length < digits) {
      result = "0$result";
    }
    return result;
  }

  int calcChecksum(int num, int digits) {
    bool doubleDigit = true;
    int total = 0;

    while (digits-- > 0) {
      int digit = num % 10;
      num ~/= 10;
      if (doubleDigit) {
        digit = doubleDigits[digit];
      }
      total += digit;
      doubleDigit = !doubleDigit;
    }

    int result = total % 10;
    if (result > 0) {
      result = 10 - result;
    }
    return result;
  }

  Uint8List hmacSha1(Uint8List key, Uint8List message) {
    var hmac = Hmac(sha1, key);
    return Uint8List.fromList(hmac.convert(message).bytes);
  }
}
