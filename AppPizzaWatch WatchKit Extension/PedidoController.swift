//
//  PedidoController.swift
//  AppPizzaWatch
//
//  Created by Ricardo Roman Landeros on 29/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class PedidoController: WKInterfaceController {
     var pizza = [String]()
     var tipos = [String]()
    var confirmar = true

    @IBOutlet var PVIngredientes: WKInterfacePicker!
    
    @IBOutlet var sizePizza: WKInterfaceLabel!
    
    @IBOutlet var tipoMaza: WKInterfaceLabel!
    
    @IBOutlet var tipoQueso: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pizza = context as! NSArray as! [String]
        print(pizza)
        tipos.append(pizza[0])
        tipos.append(pizza[1])
        tipos.append(pizza[2])
        print(tipos)
        pizza.removeAtIndex(0)
        pizza.removeAtIndex(0)
        pizza.removeFirst()
        print(pizza)
        
        sizePizza.setText(tipos[0])
        tipoMaza.setText(tipos[1])
        tipoQueso.setText(tipos[2])
        
        var itemsIngredientes: [WKPickerItem] = []
        for elem in pizza {
            // 2
            let item = WKPickerItem()
            item.title = String(elem)
            itemsIngredientes.append(item)
        }
        PVIngredientes.setItems(itemsIngredientes)
        
        
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

    @IBAction func btnConfirmar() {
        let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in
                self.pushControllerWithName("segueInicio", context: self.confirmar)
            })
        let continuar = WKAlertAction(title: "Corregir", style: WKAlertActionStyle.Default, handler: { () -> Void in})
        self.presentAlertControllerWithTitle("Alerta", message: "Es correcto tu pedido?", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
        
    }
}
