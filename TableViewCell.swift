import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var pId: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var pPrice: UILabel!
    @IBOutlet weak var pQuantity: UILabel!
    @IBOutlet weak var newQuantity: UILabel!
    
    //To save price when quantity is 0
    var price:Int=0
    var quantity:Int=1
    var currentPrice:Int=0
    
    // Remove Item
    @IBAction func removeQuantity(_ sender: UIButton) {
        //Last Item price to 0
        quantity=(Int)(pQuantity.text!)!
        currentPrice=(Int)(pPrice.text!)!
        if(pQuantity.text=="1"){
            pQuantity.text="0"
            newQuantity.text="0"
            price=(Int)(pPrice.text!)!
            pPrice.text="0"
            removeButton.isEnabled=false
        } else {
            pQuantity.text=String(quantity-1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice-price)
        }
    }
    
    //Add Item
    @IBAction func addQuantity(_ sender: UIButton) {
        //First Item to be inserted
        quantity=(Int)(pQuantity.text!)!
        currentPrice=(Int)(pPrice.text!)!
        if(price==0){
            price=(Int)(pPrice.text!)!
        }
        if((Int)(pQuantity.text!)!==0){
            removeButton.isEnabled=true
            pQuantity.text=String(quantity+1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice+price)
        } else {
            pQuantity.text=String(quantity+1)
            newQuantity.text=pQuantity.text
            pPrice.text=String(currentPrice+price)
        }
    }
}
