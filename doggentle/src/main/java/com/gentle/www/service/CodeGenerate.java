package com.gentle.www.service;
import java.util.concurrent.ThreadLocalRandom;

public class CodeGenerate {
    /**
     * 6자리 인증키 생성, int 반환
     * @return
     */
    public static int codeOne() {
        return ThreadLocalRandom.current().nextInt(100000, 1000000);
    }
    
    /**
     * 6자리 인증키 생성, int 반환
     * @return
     */
    public static int codeTwo() {
        java.util.Random generator = new java.util.Random();
        generator.setSeed(System.currentTimeMillis());
        return generator.nextInt(1000000) % 1000000;
    }
    //둘 중 아무거나 상관없음
}
