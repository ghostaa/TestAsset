/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.resource;

import java.util.Comparator;

import org.apache.wink.json4j.JSONObject;

public class JSONObjectComparator implements Comparator<JSONObject> {
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = "Licensed Materials - Property of IBM " + //$NON-NLS-1$
			"Restricted Materials of IBM "
			+ //$NON-NLS-1$
			"5724-H82 "
			+ //$NON-NLS-1$
			"(C) Copyright IBM Corp. 2012 All Rights Reserved. "
			+ //$NON-NLS-1$
			"US Government Users Restricted Rights - Use, duplication or disclosure "
			+ //$NON-NLS-1$
			"restricted by GSA ADP Schedule Contract with IBM Corp ";//$NON-NLS-1$
	private String[] options;
	private JSONObject obj1;
	private JSONObject obj2;
	private int currentOptionIndex;

	public JSONObjectComparator(String params) {
		if (params == null || params.length() <= 0) {
			return;
		}
		options = params.split(",");
		currentOptionIndex = 0;
	}

	@Override
	public int compare(JSONObject json1, JSONObject json2) {
		obj1 = new JSONObject(json1);
		obj2 = new JSONObject(json2);

		String index;
		String option;
		if (options.length > 0) {
			option = options[0];
			index = option;
			currentOptionIndex = 0;
		} else {
			return 0;
		}
		boolean sortA = true;
		if (option.startsWith("-")) {
			sortA = false;
			index = option.substring(1);
		} else if (option.startsWith("+")) {
			sortA = true;
			index = option.substring(1);
		} else {
			sortA = true;
		}

		try {
			if (json1.containsKey(index) && json2.containsKey(index)) {
				Object v1 = json1.get(index);
				Object v2 = json2.get(index);
				return getCompareResult(v1, v2, sortA);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	private int getCompareResult(Object v1, Object v2, boolean sortA)
			throws Exception {

		if (v1.getClass().isAssignableFrom(int.class)
				|| v1.getClass().isAssignableFrom(Integer.class)) {
			// int
			int delta = Integer.parseInt(v1.toString())
					- Integer.parseInt(v2.toString());
			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}

		} else if (v1.getClass().isAssignableFrom(short.class)
				|| v1.getClass().isAssignableFrom(Short.class)) {
			int delta = Short.parseShort(v1.toString())
					- Short.parseShort(v2.toString());
			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}
		} else if (v1.getClass().isAssignableFrom(long.class)
				|| v1.getClass().isAssignableFrom(Long.class)) {
			long delta = Long.parseLong(v1.toString())
					- Long.parseLong(v2.toString());
			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}
		} else if (v1.getClass().isAssignableFrom(double.class)
				|| v1.getClass().isAssignableFrom(Double.class)) {
			double delta = Double.parseDouble(v1.toString())
					- Double.parseDouble(v2.toString());
			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}
		} else if (v1.getClass().isAssignableFrom(boolean.class)
				|| v1.getClass().isAssignableFrom(Boolean.class)) {
			Boolean b1 = Boolean.parseBoolean(v1.toString());
			Boolean b2 = Boolean.parseBoolean(v2.toString());

			int delta = b1.compareTo(b2);
			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}
		} else if (v1.getClass().isAssignableFrom(String.class)) {
			int delta = v1.toString().compareTo(v2.toString());

			if (sortA) {
				if (delta > 0) {
					return 1;
				} else if (delta < 0) {
					return -1;
				} else {
					return getNextCompareResult();
				}
			} else {
				if (delta > 0) {
					return -1;
				} else if (delta < 0) {
					return 1;
				} else {
					return getNextCompareResult();
				}
			}
		} else {
			throw new Exception(
					"This type of data compare is not supported yet : "
							+ v1.getClass());
		}

	}

	private int getNextCompareResult() throws Exception {
		if (options.length > currentOptionIndex + 1) {
			currentOptionIndex++;
			String option = options[currentOptionIndex];
			String index = option;
			boolean sorta = true;
			if (option.startsWith("-")) {
				sorta = false;
				index = option.substring(1);
			} else if (option.startsWith("+")) {
				sorta = true;
				index = option.substring(1);
			} else {
				sorta = true;
			}

			if (obj1.containsKey(index) && obj2.containsKey(index)) {
				Object x1 = obj1.get(index);
				Object x2 = obj2.get(index);
				return getCompareResult(x1, x2, sorta);
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}
}
