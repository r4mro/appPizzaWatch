//
//  SizePizzaController.swift
//  AppPizzaWatch
//
//  Created by Ricardo Roman Landeros on 28/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class SizePizzaController: WKInterfaceController {

    @IBOutlet var PVSizePizza: WKInterfacePicker!
    let sizeArray = ["Selecciona", "Chica", "Mediana", "Grande"]
    var sizePizza: String = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // 1
        var itemsSizePizza: [WKPickerItem] = []
        for elem in sizeArray {
            // 2
            let item = WKPickerItem()
            item.title = String(elem)
            itemsSizePizza.append(item)
        }
        
        PVSizePizza.setItems(itemsSizePizza)
        // 4
        //PVSizePizza.setSelectedItemIndex(5)
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

    @IBAction func seleccion(value: Int) {
            
            switch value
            {
            case 0:
                sizePizza = "no es valido"
            case 1:
                sizePizza = "Chica"
            case 2:
                sizePizza = "Mediana"
            case 3:
                sizePizza = "Grande"
            default:
                sizePizza = "no es valido"
            }
            print(sizePizza)
    }
    
    @IBAction func btnSiguiente() {
                
                if sizePizza == "Chica" || sizePizza == "Mediana" || sizePizza == "Grande"
                {
                    pushControllerWithName("segueTipoMasa", context: sizePizza)
                }
                else
                {
                    let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in})
                    let continuar = WKAlertAction(title: "Continuar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
                    self.presentAlertControllerWithTitle("Alerta", message: "Selecciona el tamaño de pizza", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
                }
    
    }
    
    
    
}
