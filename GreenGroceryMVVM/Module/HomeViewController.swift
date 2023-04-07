import UIKit
import SnapKit

protocol HomeView: AnyObject {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresentation?
    
    var list: [GroceryItemViewModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(GroceryItemCell.self, forCellReuseIdentifier: "cell")
        tableView.layer.cornerRadius = 20
        tableView.clipsToBounds = true
        return tableView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        
        //setupUI()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HomeViewController: HomeView, UITableViewDelegate, UITableViewDataSource  {
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        self.list = groceriesList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("Grocery list: \(groceriesList)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GroceryItemCell else {
            return UITableViewCell()
        }
        let newViewModel = list[indexPath.row]
        cell.configure(using: newViewModel) { result in
            print("Cart item added with sku = \(result.skuId) and quantity = \(result.stepValue)")
            let skuItem: SkuItem = (skuId: result.skuId, quantity: result.stepValue)
            self.presenter?.onAddToCart(skuItem: skuItem)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

