package com.lol.java.record;
import org.python.util.PythonInterpreter;

 
public class test {
 
    private static PythonInterpreter interpreter;
 
    public static void main(String[] args) {
        interpreter = new PythonInterpreter();
//        PySystemState sys = Py.getSystemState();
//        sys.path.append(new PyString());
        System.setProperty("python.import.site", "false");
        interpreter.execfile("C:\\Users\\grood\\Desktop\\JGGapProject\\JGGap\\crawling.py");
        
        interpreter.exec("import sys.path.append('C:\\Users\\grood\\AppData\\Local\\Programs\\Python\\Python310\\Lib\\site-packages\\requests\')");
        interpreter.get("import json");
        interpreter.exec("print(crawling('네네스노윙순살'))");
    } 
}
