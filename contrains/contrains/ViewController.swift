//
//  ViewController.swift
//  contrains
//
//  Created by Natacha on 28-02-22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pantalla()
        
        NotificationCenter.default.addObserver(self, selector:#selector(teclado(notificacion:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:) ), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
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
        
    }
    
}

