package com.action.ids;

public class IntrusionDetector {

	public static boolean isSqlInjection(String... inputs) {
		for (String input : inputs) {
			if (input.indexOf("'") > 0) {
				return true;
			}
		}
		return false;
	}

	public static boolean isXSSAttack(String... inputs) {
		System.out.println("asdfasdf");
		
		return JSAttack.checkAttacks(inputs);
	}

}
