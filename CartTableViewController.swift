import UIKit

class CartTableViewController: UITableViewController {
    var cartList:[Products]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden=false
        
    }
    
    @IBAction func addMore(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath) as! CartTableViewCell
        cell.price.text = String(cartList[indexPath.row].pPrice)
        cell.images.image=UIImage(named: (cartList[indexPath.row].imageList[0]))
        return cell
    }
}
