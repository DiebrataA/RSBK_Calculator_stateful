/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculator.ejb;

import javax.ejb.Local;

/**
 *
 * @author Anggara Diebrata
 */
@Local
public interface CalculatorBeanLocal {
    public String[] getAnswerOld();
    public String[] getCalcOld();
    public String calc(String input);
    
}
