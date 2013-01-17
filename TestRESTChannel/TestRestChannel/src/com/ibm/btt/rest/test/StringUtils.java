package com.ibm.btt.rest.test;

import java.util.Collection;

public class StringUtils {

	public static String join(Collection c, String separator) {
		StringBuilder sb = new StringBuilder();
		Object arr[] = {};
		arr = c.toArray(arr);
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i].toString());
			if (i != arr.length - 1) {
				sb.append(separator);
			}
		}
		return sb.toString();
	}
}
