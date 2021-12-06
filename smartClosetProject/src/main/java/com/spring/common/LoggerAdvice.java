package com.spring.common;

import java.util.Arrays;

//import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

//import com.spring.client.board.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
@Aspect
public class LoggerAdvice {
	@Around("execution(* com.spring..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable {
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("[호출 메서드에 전달된 파라미터 값]" + Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		result = pjp.proceed();
		watch.stop();
		log.info("[Class] " + pjp.getTarget().getClass());
		log.info("[호출 메서드명] " + pjp.getSignature().getName());
		log.info("[소요시간] " + watch.getTotalTimeSeconds() + "ms");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("[리턴 결과] " + result);
		log.info("--------------------------------");
	
		return result;
	}
}
