package com.lol.java.record;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import org.python.jline.internal.InputStreamReader;
import org.python.util.PythonInterpreter;

 
public class test {
 
    public static void main(String[] args) throws IOException, InterruptedException {
    	String command = "C:\\Users\\grood\\anaconda3\\envs\\flask\\python.exe";  // 명령어
    	String arg1 = "C:\\Users\\grood\\Desktop\\JGGapProject\\JGGap\\crawling.py"; // 인자
    	System.out.println("1");
    	ProcessBuilder builder = new ProcessBuilder(command, arg1, "네네스노윙순살");
    	builder.redirectOutput(Redirect.INHERIT);
    	builder.redirectError(Redirect.INHERIT);
    	
    	builder.redirectErrorStream(true);
    	System.out.println("2");
    	Process process = builder.start();
    	System.out.println("3");
    	int exitVal = process.waitFor();  // 자식 프로세스가 종료될 때까지 기다림
    	System.out.println("4 " + exitVal);
    	BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream())); // 서브 프로세스가 출력하는 내용을 받기 위해
    	System.out.println("5");
    	String line;
    	System.out.println("여기까지 진행됨");
    	System.out.println("6" + br);
    	System.out.println("6" + br.readLine());
    	while ((line = br.readLine()) != null) {
    	     System.out.println(">>>  " + line); // 표준출력에 쓴다
    	}
    	System.out.println("끝까지 돌았다");
    	if(exitVal != 0) {
    	  // 비정상 종료
    	  System.out.println("서브 프로세스가 비정상 종료되었다.");
    	}
    } 
}
