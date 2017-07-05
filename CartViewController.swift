import UIKit

class CartViewController: UITableViewController {
    var listOfProduct=[Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToStore()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfProduct.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"TableCell")as! TableViewCell
        cell.pImage.image=UIImage(named: (listOfProduct[indexPath.row].imageList[0]))
        cell.pId.text=listOfProduct[indexPath.row].pID
        cell.pName.text=listOfProduct[indexPath.row].pName
        cell.pPrice.text=String(listOfProduct[indexPath.row].pPrice)
        cell.pQuantity.text=String(listOfProduct[indexPath.row].pQuantity)
        cell.newQuantity.text=cell.pQuantity.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC=storyboard?.instantiateViewController(withIdentifier: "Detail") as! ProductViewController
        productVC.product=listOfProduct[indexPath.row]
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    func addToStore(){
        let p1=Products()//Contain full details
        p1.pID="P01"
        p1.pName="Fruits"
        p1.pPrice=100
        p1.imageList=["w1","w2","w3","w4"]
        p1.pQuantity=1
        p1.pDescriton="Good for Health! \n Available in different colors"
        
        let p2=Products()//Quantity missing
        p2.pID="P02"
        p2.pName="Vegetables"
        p2.pPrice=50
        p2.imageList=["q1","q2","q4"]
        p2.pDescriton="Contains Vitamins"
        
        let p3=Products()//Name and image missing
        p3.pID="P03"
        p3.pPrice=50
        p3.pDescriton="Used for special occassions"
        
        let p4=Products()//Description missing
        p4.pID="P04"
        p4.pName="Juice"
        p4.pPrice=120
        p4.imageList=["e1","e2","e3"]
        p4.pQuantity=1
        
        listOfProduct.append(p1)
        listOfProduct.append(p2)
        listOfProduct.append(p3)
        listOfProduct.append(p4)
    }
}
