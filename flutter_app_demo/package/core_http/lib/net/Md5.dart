
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

// class Md5 {
// 	static final char HEX_DIGITS[] = { '0', '1', '2', '3', '4', '5',
// 		'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
//
// 	public static String toHexString(byte[] b) { // String to byte
// 		StringBuilder sb = new StringBuilder(b.length * 2);
//
// 		for (int i = 0; i < b.length; i++) {
// 			sb.append(HEX_DIGITS[(b[i] & 0xf0) >>> 4]);
// 			sb.append(HEX_DIGITS[b[i] & 0x0f]);
// 		}
//
// 		return sb.toString();
// 	}
//
// 	public static String md5(byte[] buffer) {
// 		try {
// 			MessageDigest digest = MessageDigest.getInstance("MD5");
// 			digest.update(buffer);
// 			byte messageDigest[] = digest.digest();
//
// 			return toHexString(messageDigest);
// 		} catch (NoSuchAlgorithmException e) {
// 		}
//
// 		return null;
// 	}
// }

class Md5{
	static final List<Char> hexDigits = {'0', '1', '2', '3', '4', '5',
		'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'} as List<Char>;

	static String toHexString(List<int> b){
		var sb = StringBuffer();
		for (var value in b) {
		  sb.write(hexDigits[(b[value] & 0xf0)>>>4]);
			sb.write(hexDigits[b[value] & 0x0f]);
		}

		return sb.toString();
	}

	static String myMd5(List<int> buffer){
		//Utf8Encoder().convert(buffer);
    Utf8Encoder().convert("张三");
		return "";
	}

	///使用md5加密
	String generateMD5(String data) {
		Uint8List content = const Utf8Encoder().convert(data);
		Digest digest = md5.convert(content);
		return digest.toString();
	}

}
