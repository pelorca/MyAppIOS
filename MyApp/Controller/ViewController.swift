//
//  ViewController.swift
//  MyApp
//
//  Created by Aloc SP08161 on 21/11/2017.
//  Copyright © 2017 Scopus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblValor.text = "0"
        self.listaBtn =  [self.btnDivide,self.btnMultiplica,self.btnSoma,self.btnMenos]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBOutlet weak var btnDivide: UIButton!
   @IBOutlet weak var btnMultiplica: UIButton!
    @IBOutlet weak var btnSoma: UIButton!
    @IBOutlet weak var lblValor: UILabel!
     @IBOutlet weak var btnMenos: UIButton!
    
    var listaBtn:[UIButton] = []
    
    var userIsTyping: Bool = false
    var operador: String = ""
    var divide: Bool = false
    var soma: Bool = false
    var menos: Bool = false
    var multip: Bool = false
    var valor1: String = ""
    var valor2: String = ""
    var isOper: Bool = false
    @IBOutlet weak var btnAC: UIButton!
    
    
    @IBAction func btnButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        for item in listaBtn {
            item.backgroundColor = #colorLiteral(red: 0.9456363342, green: 0.5481138466, blue: 0.09612094657, alpha: 1)
            item.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        
        
        if operador != "" && isOper {
            lblValor.text = ""
            //userIsTyping = false
            isOper = false
        }
        
        if userIsTyping {
            let textDisplay = lblValor.text ?? ""
            lblValor.text = textDisplay + digit
        } else {
            lblValor.text =  digit
            userIsTyping = true
            
        }
        self.btnAC.setTitle("C" ,for: .normal)
        
    }
    
    
    @IBAction func btnOperation(_ sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "÷"  :
            valor1 = lblValor.text!
            operador = "÷"
            divide = changeColor(button: btnDivide, operador: divide)
            isOper = true
            break
        case "×" :
            valor1 = lblValor.text!
            operador = "×"
            multip = changeColor(button: btnMultiplica, operador: multip)
             isOper = true
            break
        case "+"  :
            valor1 = lblValor.text!
            operador = "+"
            soma = changeColor(button: btnSoma, operador: soma)
             isOper = true
            break
        case "−"  :
            valor1 = lblValor.text!
            operador = "−"
            menos = changeColor(button: btnMenos, operador: menos)
             isOper = true
            break
        case "="  :
            calculo()
            break
        case "+∕−"  :
            let value: Int = Int(lblValor.text!)!
            lblValor!.text = String(value * -1)
            break
        case "%"  :
            break

        default:
            break
        }
        
        
    }
  
func changeColor(button: UIButton, operador: Bool) -> Bool {
        if operador {
            button.backgroundColor = #colorLiteral(red: 0.9456363342, green: 0.5481138466, blue: 0.09612094657, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            return false
        } else {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0.9456363342, green: 0.5481138466, blue: 0.09612094657, alpha: 1), for: .normal)
            return true
        }
    }
    
    func calculo(){
        for item in listaBtn {
            item.backgroundColor = #colorLiteral(red: 0.9456363342, green: 0.5481138466, blue: 0.09612094657, alpha: 1)
            item.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        let value: Double = Double(valor1.replacingOccurrences(of: ",", with: "."))!
        let value2: Double = Double(lblValor.text!.replacingOccurrences(of: ",", with: "."))!
        switch operador {
        case "÷"  :
            let valor = (String(value/value2).components(separatedBy: ".")[1] != "0" ? String(format:"%.2f", value/value2) : String(format:"%.0f", value/value2))
            lblValor.text = valor.replacingOccurrences(of: ".", with: ",")
            break
        case "×" :
            let valor = (String(value*value2).components(separatedBy: ".")[1] != "0" ? String(format:"%.2f", value*value2) : String(format:"%.0f", value*value2))
            lblValor.text = valor.replacingOccurrences(of: ".", with: ",")
            break
    
        case "+"  :
           let valor = (String(value+value2).components(separatedBy: ".")[1] != "0" ? String(format:"%.2f", value+value2) : String(format:"%.0f", value+value2))
            lblValor.text = valor.replacingOccurrences(of: ".", with: ",")
            break
        case "−"  :
           let valor = (String(value-value2).components(separatedBy: ".")[1] != "0"  ? String(format:"%.2f", value-value2) : String(format:"%.0f", value-value2))
            lblValor.text = valor.replacingOccurrences(of: ".", with: ",")
            break
        default:
            break
        }
    }
    
    @IBAction func btnAC(_ sender: UIButton) {
        lblValor.text = "0"
        self.btnAC.setTitle("AC" ,for: .normal)
        userIsTyping = false
        operador = ""
        valor1 = ""
    }
    
}

