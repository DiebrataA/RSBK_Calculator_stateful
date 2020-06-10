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
public interface ClaculatorStatelessBeanLocal {
    public double add(double a, double b);
    public double substract(double a, double b);
    public double multiply(double a, double b);
    public double divide(double a, double b);
}
