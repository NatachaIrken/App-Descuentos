//
//  ViewController.swift
//  contrains
//
//  Created by Natacha on 28-02-22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var descuento: UILabel!
    
    @IBOutlet weak var cantidadText: UITextField!
    
    @IBOutlet weak var porcentajeText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pantalla()
        
        NotificationCenter.default.addObserver(self, selector:#selector(teclado(notificacion:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:) ), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    func pantalla(){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height{
            case 1136:
                print("Iphone 5 o SE")
            case 1334:
                print("Iphone 6 6S 7 8")
            case 1920:
                print("Plus")
            case 2436:
                print("Iphone X XS")
                self.bottomConstrain.constant = 300
            case 1792:
                print("Iphone XR")
            case 2688:
                print("Iphone XS MAX")
            default:
                print("Cualquier otro tamaño")
                
                
                
            }
        }
    }
    
    @objc func teclado(notificacion: Notification){
        guard let tecladoUp = (notificacion.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notificacion.name == UIResponder.keyboardWillShowNotification {
            if UIScreen.main.nativeBounds.height == 2436 {
                self.view.frame.origin.y =  -tecladoUp.height
                
            }
        } else{
            self.view.frame.origin.y = 0
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}





