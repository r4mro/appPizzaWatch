//
//  TipoQuesoController.swift
//  AppPizzaWatch
//
//  Created by Ricardo Roman Landeros on 28/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class TipoQuesoController: WKInterfaceController {
    var pizza = [String]()
    var nombreUsuario:String = ""
    var sizePizza: String = ""
    var tipoPizza: String = ""
    var quesoPizza:String = ""
    
    let quesoArray = ["Selecciona", "Mozarela", "Cheddar", "Parmesano", "Sin Quezo"]

    @IBOutlet var PVTipoQueso: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
       pizza = context as! NSArray as! [String]
        print(pizza)
        var itemsTipoQueso: [WKPickerItem] = []
        for elem in quesoArray {
            // 2
            let item = WKPickerItem()
            item.title = String(elem)
            itemsTipoQueso.append(item)
        }
        PVTipoQueso.setItems(itemsTipoQueso)
        
        
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    @IBAction func seleccionar(value: Int) {
    switch value
        {
    case 0:
        quesoPizza = "no es valido"
    case 1:
        quesoPizza = "Mozarela"
    case 2:
            quesoPizza = "Cheddar"
    case 3:
            quesoPizza = "Parmesano"
    case 4:
            quesoPizza = "Sin Quezo"
    default:
            quesoPizza = "no es valido"
    }
    print(quesoPizza)
    
    }
    
    @IBAction func btnSiguiente() {
        if quesoPizza == "Mozarela" || quesoPizza == "Cheddar" || quesoPizza == "Parmesano" || quesoPizza == "Sin Quezo"
    {
        pizza.append(quesoPizza)
        pushControllerWithName("segueIngredientes", context: pizza)
        print(pizza)
    }
        else
    {
            let ok = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            let continuar = WKAlertAction(title: "Continuar", style: WKAlertActionStyle.Default, handler: { () -> Void in})
            self.presentAlertControllerWithTitle("Alerta", message: "Selecciona el tipo de queso de la pizza", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [ok, continuar])
        }
    }
    
    
    
}
