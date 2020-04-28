//
//  ViewController.swift
//  Cart
//
//

import UIKit

class ViewController: UIViewController {
    var product=[String:String]()
    var productList=[[String:String]]()

    @IBOutlet weak var pID: UITextField!
    @IBOutlet weak var pName: UITextField!
    @IBOutlet weak var pPrice: UITextField!
    @IBOutlet weak var pQuantity: UITextField!
    @IBAction func addQuantity(_ sender: UIButton) {
        product["quantity"]=String((Int)(product["quantity"]!)!+1)
         pQuantity.text=product["quantity"]
        if((Int)(product["quantity"]!)!>=1){
            decrementQuantity.isEnabled=true
        }
    }
    @IBOutlet weak var decrementQuantity: UIButton!
    
    @IBAction func removeQuantity(_ sender: UIButton) {
        if((Int)(product["quantity"]!)!==1){
            product["quantity"]=String((Int)(product["quantity"]!)!-1)
            decrementQuantity.isEnabled=false
        }else{
            product["quantity"]=String((Int)(product["quantity"]!)!-1)
        }
        pQuantity.text=product["quantity"]
        
    }
    @IBAction func addToCart(_ sender: UIButton) {
        if((pID.text?.isEmpty)!||(pName.text?.isEmpty)!||(pPrice.text?.isEmpty)!){
            let vC=UIAlertController()
            vC.title="Message"
            vC.message="Product Name,Product Price,Product ID should contain values"
            let wrong=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            vC.addAction(wrong)
            self.present(vC, animated: true, completion: nil)
        }
        if (Int)(product["quantity"]!)!>0{
            let tableVC=CartViewController()
            product["pID"]=String(describing: pID.text)
            product["pName"]=String(describing: pName.text)
            product["pPrice"]=String(describing: pPrice.text)
            productList=[product]
            self.storyboard?.instantiateViewController(withIdentifier: "Table")
            tableVC.productsAdded=productList
            navigationController?.pushViewController(tableVC, animated: true)
        }else{
            let vC=UIAlertController()
            vC.title="Message"
            vC.message="Enter valid quantity"
            let wrong=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            vC.addAction(wrong)
            self.present(vC, animated: true, completion: nil)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        product["quantity"]="0"
        pID.text="0"
        if(pID.text=="0"){
            decrementQuantity.isEnabled=false
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

