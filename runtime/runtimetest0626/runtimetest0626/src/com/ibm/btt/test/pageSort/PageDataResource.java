/**
 * 
 */
package com.ibm.btt.test.pageSort;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import com.ibm.btt.base.types.impl.Currency;

/**
 * @author stlv
 */
public class PageDataResource {

	private static Random rand = new Random();
	public static List<HashMap<String, Comparable<?>>> SP01DATA = initSPDATA(1024);
	public static List<HashMap<String, Comparable<?>>> SP02DATA = initSPDATA(512);
	public static List<HashMap<String, Comparable<?>>> SP04NEGLISTNAME = initSPDATA(768);

	private static List<HashMap<String, Comparable<?>>> initSPDATA(int max) {
		int size = rand.nextInt(max);
		while (size < max / 2)
			size = max / 2;
		List<HashMap<String, Comparable<?>>> list = new ArrayList<HashMap<String, Comparable<?>>>(size);
		try {
			for (int i = 0; i < size; i++) {
				HashMap<String, Comparable<?>> hm = new HashMap<String, Comparable<?>>();
				hm.put(TypeDataRowComparator.INDEX, (i + 1));
				hm.put(TypeDataRowComparator.CURRENCY,
						new Currency("USD", new BigDecimal(rand.nextInt(64) * 8 * (rand.nextBoolean() ? 1 : -1))));
				hm.put(TypeDataRowComparator.DATE, geneRandomDate());
				hm.put(TypeDataRowComparator.NUMBER, new BigDecimal(rand.nextInt(32) * 16 * (rand.nextBoolean() ? 1 : -1)));
				hm.put(TypeDataRowComparator.STRING, "STRING" + rand.nextInt(8));
				hm.put(TypeDataRowComparator.PLAIN, "Ivan" + rand.nextInt(128));
				list.add(hm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private static Date geneRandomDate() throws ParseException {
		if (rand.nextInt(10) < 3) {
			return new Date();
		} else {
			String source = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
			int m = rand.nextInt(12);
			if (m < 10) {
				if (m <= 0)
					m = 1;
				source += "0" + m;
			} else
				source += m;
			int d = rand.nextInt(28);
			if (d < 10) {
				if (d <= 0)
					d = 1;
				source += "0" + d;
			} else
				source += d;
			return new SimpleDateFormat("yyyyMMdd").parse(source);
		}
	}

	public static void main(String[] args) {
		System.out.println(SP01DATA);
		System.out.println(SP02DATA);
		System.out.println(SP04NEGLISTNAME);
	}

}
