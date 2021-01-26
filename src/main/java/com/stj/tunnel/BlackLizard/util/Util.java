package com.stj.tunnel.BlackLizard.util;

import java.math.BigInteger;

public class Util {
	public static int getAsInt(Object object) {
		if (object instanceof BigInteger) {
			return ((BigInteger) object).intValue();
		}
		else if (object instanceof Integer) {
			return (int)object;
		}
		else if (object instanceof Long) {
			return (int)((long) object);
		}
		
		return -1;
	}
}
