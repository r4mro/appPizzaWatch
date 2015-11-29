//
//  IngredientesController.swift
//  AppPizzaWatch
//
//  Created by Ricardo Roman Landeros on 28/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {
    var pizza = [String]()
    var ingredientes = [String]()
    var  jamon = false, pepperoni = false, pavo = false, salchicha = false, aceituna = false, cebolla = false, pimiento = false, pina = false, anchoa = false

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pizza = context as! NSArray as! [String]
        print(pizza)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func onJamonChanged(value: Bool) {
        jamon = true
        ingredientes.append("Jamon")
    }
    @IBAction func onPepperoniChanged(value: Bool) {
        pepperoni = true
         ingredientes.append("Pepperoni")
    }
    
    @IBAction func onPavoChanged(value: Bool) {
        pavo = true
        ingredientes.append("Pavo")
    }
    
    @IBAction func onSalchichaChanged(value: Bool) {
        salchicha = true
         ingredientes.append("Sanchicha")
    }
    
    @IBAction func onAceitunaChanged(value: Bool) {
        aceituna = true
         ingredientes.append("Aceituna")
    }
    
    @IBAction func onCebollaChanged(value: Bool) {
        cebolla = true
         ingredientes.append("Cebolla")
    }
    
    @IBAction func onPimientoChanged(value: Bool) {
        pimiento = true
         ingredientes.append("Pimiento")
    }
    
    @IBAction func onPinaChanged(value: Bool) {
        pina = true
         ingredientes.append("Piña")
    }
    
    @IBAction func btnSiguiente() {
        if ingredientes.isEmpty
        {
            let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            let continuar = WKAlertAction(title: "Continuar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Alerta", message: "Selecciona Por lo menos un igrediente", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
        }
        else
        {
            let seleccion = pizza + ingredientes
            print(seleccion)
            pushControllerWithName("seguePedido", context: seleccion)
//            let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in})
//            let continuar = WKAlertAction(title: "Continuar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
//            self.presentAlertControllerWithTitle("Alerta", message: "Bien seleccionaste todo", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
        }
    }
    
}
