package com.optimalroute.app.objects;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("ukrainianTransliterationService")
public class UkrainianTransliterationService {
	private static String transliteration(char symbol) {

		switch (symbol) {
		case 'а':
			return "a";
		case 'А':
			return "A";
		case 'б':
			return "b";
		case 'Б':
			return "B";
		case 'в':
			return "v";
		case 'В':
			return "V";
		case 'г':
			return "h";
		case 'Г':
			return "H";
		case 'ґ':
			return "g";
		case 'Ґ':
			return "G";
		case 'д':
			return "d";
		case 'Д':
			return "D";
		case 'е':
			return "e";
		case 'Е':
			return "E";
		// case 'є': return ""; вимагає особливої ​​обробки
		case 'Є':
			return "Ye";
		case 'ж':
			return "zh";
		case 'Ж':
			return "Zh";
		case 'з':
			return "z";
		case 'З':
			return "Z";
		case 'и':
			return "y";
		case 'И':
			return "Y";
		case 'і':
			return "i";
		case 'І':
			return "I";
		// case 'ї': return ""; вимагає особливої ​​обробки
		case 'Ї':
			return "Yi";
		// case 'й': return ""; вимагає особливої ​​обробки
		case 'Й':
			return "Y";
		case 'к':
			return "k";
		case 'К':
			return "K";
		case 'л':
			return "l";
		case 'Л':
			return "L";
		case 'м':
			return "m";
		case 'М':
			return "M";
		case 'н':
			return "n";
		case 'Н':
			return "N";
		case 'о':
			return "o";
		case 'О':
			return "O";
		case 'п':
			return "p";
		case 'П':
			return "P";
		case 'р':
			return "r";
		case 'Р':
			return "R";
		case 'с':
			return "s";
		case 'С':
			return "S";
		case 'т':
			return "t";
		case 'Т':
			return "T";
		case 'у':
			return "u";
		case 'У':
			return "U";
		case 'ф':
			return "f";
		case 'Ф':
			return "F";
		case 'х':
			return "kh";
		case 'Х':
			return "Kh";
		case 'ц':
			return "ts";
		case 'Ц':
			return "Ts";
		case 'ч':
			return "ch";
		case 'Ч':
			return "Ch";
		case 'ш':
			return "sh";
		case 'Ш':
			return "Sh";
		case 'щ':
			return "shch";
		case 'Щ':
			return "Shch";
		// case 'ю': return ""; вимагає особливої ​​обробки
		case 'Ю':
			return "Yu";
		// case 'я': return ""; вимагає особливої ​​обробки
		case 'Я':
			return "Ya";
		case 'ь':
			return "";
		case 'Ь':
			return "";
		case '\'':
			return "";

		default:
			return String.valueOf(symbol);
		}
	}

	public static String transliteration(String s) {
		Pattern ukrPattern = Pattern.compile("а-щА-ЩЬьЮюЯяЇїІіЄєҐґ");
		StringBuilder result = new StringBuilder();
		char[] symbolArray = s.toCharArray();
		for (int i = 0; i < symbolArray.length; i++) {
			if (symbolArray[i] == 'є' || symbolArray[i] == 'ї' || symbolArray[i] == 'й' || symbolArray[i] == 'ю' || symbolArray[i] == 'я') {
				if (i == 0 || !new Character(symbolArray[i - 1]).toString().matches("^[\\u0400-\\u052F\\u2DE0-\\u2DFF\\uA640-\\uA69F']+$")) {
					switch (symbolArray[i]) {
					case 'є':
						result.append("ye");
						break;
					case 'ї':
						result.append("yi");
						break;
					case 'й':
						result.append("y");
						break;
					case 'ю':
						result.append("yu");
						break;
					case 'я':
						result.append("ya");
						break;
					default:
						result.append("");
						break;
					}
				} else {
					switch (symbolArray[i]) {
					case 'є':
						result.append("ie");
						break;
					case 'ї':
						result.append("i");
						break;
					case 'й':
						result.append("i");
						break;
					case 'ю':
						result.append("iu");
						break;
					case 'я':
						result.append("ia");
						break;
					default:
						result.append("");
						break;
					}
				}
			} else if (symbolArray[i] == 'з' && symbolArray[i + 1] == 'г') {
				result.append("zgh");
				i++;

			} else if (symbolArray[i] == 'З' && symbolArray[i + 1] == 'г') {
				result.append("Zgh");
				i++;
			}

			else {
				result.append(transliteration(symbolArray[i]));
			}
		}

		return result.toString();
	}

}
