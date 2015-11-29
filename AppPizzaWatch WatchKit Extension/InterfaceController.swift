//
//  InterfaceController.swift
//  AppPizzaWatch WatchKit Extension
//
//  Created by Ricardo Roman Landeros on 28/11/15.
//  Copyright © 2015 lagunahack. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var pedidoSi: WKInterfaceLabel!
     var confirmar = false
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if (context != nil){
        
       confirmar = context as! Bool
            
        }
        if confirmar
        {
            pedidoSi.setHidden(false)
        }
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

}
