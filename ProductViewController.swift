import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var pImage: UIButton!
    @IBOutlet weak var pID: UILabel!
    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var pPrice: UILabel!
    @IBOutlet weak var pQuantity: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var newQuantity: UILabel!
    @IBOutlet weak var pDescr: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var product:Products!
    var pList:[Products]=[]
    var price:Int=0
    var quantity:Int=0
    var currentPrice:Int=0
    
    @IBAction func moreImages(_ sender: Any) {
        let productVC=storyboard?.instantiateViewController(withIdentifier: "images") as! CollectionViewController
        productVC.products=product
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    @IBAction func removeItem(_ sender: UIButton) {
        quantity=(Int)(pQuantity.text!)!
        currentPrice=(Int)(pPrice.text!)!
        //Last Item price to 0
        if(pQuantity.text=="1"){
            pQuantity.text="0"
            newQuantity.text=pQuantity.text
            price=currentPrice
            pPrice.text="0"
            removeButton.isEnabled=false
            addButton.isEnabled=false
        } else {
            pQuantity.text=String(quantity-1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice-price)
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        quantity=(Int)(pQuantity.text!)!
        currentPrice=(Int)(pPrice.text!)!
        if(price==0){
            price=(Int)(pPrice.text!)!
        }
        if((Int)(pQuantity.text!)!==0){
            removeButton.isEnabled=true
            addButton.isEnabled=true
            pQuantity.text=String(quantity+1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice+price)
        } else {
            pQuantity.text=String(quantity+1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice+price)
        }
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        product.pPrice=(Int)(pPrice.text!)!
        product.pQuantity=(Int)(pQuantity.text!)!
        pList.append(product)
        let productVC=storyboard?.instantiateViewController(withIdentifier: "cart") as! CartTableViewController
        productVC.cartList=pList
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pImage.setImage(UIImage.init(named: (product.imageList[0])), for: UIControlState.normal)
        pImage.setImage(UIImage.init(named: (product.imageList[0])), for: UIControlState.selected)
        pID.text=product.pID
        pName.text=product.pName
        pDescr.text=product.pDescriton
        pPrice.text=String(product.pPrice)
        pQuantity.text=String(product.pQuantity)
        newQuantity.text=String(product.pQuantity)
        if(pQuantity.text=="0"){
            removeButton.isEnabled=false
            addButton.isEnabled=false
        }
    }
}
