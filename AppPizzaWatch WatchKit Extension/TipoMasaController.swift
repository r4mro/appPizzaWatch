//
//  TipoMasaController.swift
//  AppPizzaWatch
//
//  Created by Ricardo Roman Landeros on 28/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class TipoMasaController: WKInterfaceController {
    var pizza = [String]()
    let tipoArray = ["Selecciona", "Delgada", "Crujiente", "Gruesa"]
    var tipoPizza: String = ""

    @IBOutlet var PVTipoPizza: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let sizePizza = context
        print(sizePizza)
        pizza.append(String(sizePizza!))
        // Configure interface objects here.
        var itemsTipoPizza: [WKPickerItem] = []
        for elem in tipoArray {
            // 2
            let item = WKPickerItem()
            item.title = String(elem)
            itemsTipoPizza.append(item)
        }
        PVTipoPizza.setItems(itemsTipoPizza)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seleccion(value: Int) {
        switch value
            {
        case 0:
            tipoPizza = "no es valido"
        case 1:
            tipoPizza = "Delgada"
        case 2:
            tipoPizza = "Crujiente"
        case 3:
            tipoPizza = "Gruesa"
        default:
            tipoPizza = "no es valido"
        }
        print(tipoPizza)
        
    }
    
    
    @IBAction func btnSiguiente() {
            
            if tipoPizza == "Delgada" || tipoPizza == "Crujiente" || tipoPizza == "Gruesa"
    {
        pizza.append(tipoPizza)
        pushControllerWithName("segueTipoQueso", context: pizza)
    }
        else
    {
                let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in})
                let continuar = WKAlertAction(title: "Continuar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
                self.presentAlertControllerWithTitle("Alerta", message: "Selecciona el tipo de masa de la pizza", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
            }
    }
}
