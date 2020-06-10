/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculator.ejb;

import javax.ejb.Stateless;

/**
 *
 * @author Anggara Diebrata
 */
@Stateless
public class ClaculatorStatelessBean implements ClaculatorStatelessBeanLocal {
    @Override
    public double add(double a, double b){
        return a+b;
    }
    @Override
    public double substract(double a, double b){
        return a-b;
    }
    @Override
    public double multiply(double a, double b){
        return a*b;
    }
    @Override
    public double divide(double a, double b){
        if (b == 0.0){
            throw new javax.ejb.EJBException("Divide By zero Error!");
        }
        return a/b;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
