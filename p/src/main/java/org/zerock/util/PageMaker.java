package org.zerock.util;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

	private boolean prev, next;
	private int page, start, end, total;

	private static int parse(String str) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public PageMaker(String pageStr, int total) {
		this(Integer.parseInt(pageStr), total);
	}

	public PageMaker(int page, int total) {

		this.page = page > 0 ? page : 1;

		int tempLast = (int) (Math.ceil(page / 10.0) * 10);

		this.start = tempLast - 9;

		prev = start != 1;

		if (tempLast * 10 > total) {
			tempLast = (int) (Math.ceil(total / 10.0));
		} else {
			this.next = true;
		}

		this.end = tempLast;

	}
}
