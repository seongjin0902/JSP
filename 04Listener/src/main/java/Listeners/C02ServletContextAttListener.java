package Listeners;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

public class C02ServletContextAttListener implements ServletContextAttributeListener{

	
	
	@Override
	public void attributeAdded(ServletContextAttributeEvent scae) {
//		속성 추가시 감지
		System.out.println("C02ServletContextAttListener attributeAdded call ^_^");
		
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent scae) {
//		속성 제거시 감지
		System.out.println("C02ServletContextAttListener attributeRemoved call ^_^");

	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent scae) {
//		속성 변경시 감지
		System.out.println("C02ServletContextAttListener attributeReplaced call ^_^");

	}

}
