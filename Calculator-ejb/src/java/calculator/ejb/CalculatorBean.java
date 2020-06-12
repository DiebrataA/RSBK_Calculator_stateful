/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculator.ejb;

import javax.ejb.Stateful;
import java.text.DecimalFormat;

/**
 *
 * @author Anggara Diebrata
 */
@Stateful
public class CalculatorBean implements CalculatorBeanLocal {
    private DecimalFormat twoDigits = new DecimalFormat("0.00");
    private String calcOld = "",
    answerOld="";
    
    private void add_calcOld(String num){
        calcOld += num + ",";
    }
    private void add_answerOld (String num){
        answerOld += num + ",";
    }
    private String [] getValues(String input){
        String[] answer = getAnswerOld(), res;
        input = input.replace("Hasil", answer[answer.length - 1]);
        res = input.split(" ");
        return res;
    }
    public enum Priority { LOW, NORMAL, HIGH, SEVERE }
    
    @Override
    public String[] getAnswerOld(){
        return answerOld.split(",");
    }
    @Override
     public String[] getCalcOld(){
        return calcOld.split(",");
    }
    @Override
    public String calc(String input){
        String[] values = getValues(input);
        double result;
        switch(values[1]){
            case "+":
                result = (Double.parseDouble(values[0]) + Double.parseDouble(values[2]));
                
                switch(values[3]){
                    case "+":
                        
                        result =(result + Double.parseDouble(values[4]));
                        break;
                    case "-":
                       
                        result = (result - Double.parseDouble(values[4]));
                        break;
                    case "x":
                        
                        result = (result * Double.parseDouble(values[4]));
                        break;
                    case "/":
                        
                        result = (result / Double.parseDouble(values[4]));
                        break;
                    default:
                        result = 0;
                        break;
                }
                
                break;
            case "-":
                result = (Double.parseDouble(values[0]) - Double.parseDouble(values[2]));
                switch(values[3]){
                    case "+":
                        result =(result + Double.parseDouble(values[4]));
                        break;
                    case "-":
                        result = (result - Double.parseDouble(values[4]));
                        break;
                    case "x":
                        result = (result * Double.parseDouble(values[4]));
                        break;
                    case "/":
                        result = (result / Double.parseDouble(values[4]));
                        break;
                    default:
                        result = 0;
                        break;
                }
                break;
            case "x":
                result = (Double.parseDouble(values[0]) * Double.parseDouble(values[2]));
                switch(values[3]){
                    case "+":
                        result =(result + Double.parseDouble(values[4]));
                        break;
                    case "-":
                        result = (result - Double.parseDouble(values[4]));
                        break;
                    case "x":
                        result = (result * Double.parseDouble(values[4]));
                        break;
                    case "/":
                        result = (result / Double.parseDouble(values[4]));
                        break;
                    default:
                        result = 0;
                        break;
                }
                break;
            case "/":
                result = (Double.parseDouble(values[0]) / Double.parseDouble(values[2]));
                switch(values[3]){
                    case "+":
                        result =(result + Double.parseDouble(values[4]));
                        break;
                    case "-":
                        result = (result - Double.parseDouble(values[4]));
                        break;
                    case "x":
                        result = (result * Double.parseDouble(values[4]));
                        break;
                    case "/":
                        result = (result / Double.parseDouble(values[4]));
                        break;
                    default:
                        result = 0;
                        break;
                }
                break;
            default:
                result = 0;
                break;
        }
        
        add_calcOld(input);
        add_answerOld(twoDigits.format(result));
        return twoDigits.format(result);
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
