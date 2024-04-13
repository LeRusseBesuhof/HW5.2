import UIKit

class MainViewController: UIViewController {

    private lazy var tableData = VehicleGroup.mockData()
    
    private lazy var vehicleTable : UITableView = {
        $0.register(VehiclePageCell.self, forCellReuseIdentifier: "engine")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Vehicles"
        
        navigationItem.backButtonTitle = ""
        
        view.addSubview(vehicleTable)
    }
}

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "engine", for: indexPath) as? VehiclePageCell else { return UITableViewCell() }
        
        cell.setData(vehicle: tableData[indexPath.row])
        cell.selectionStyle = .none
        
        cell.completion = { [weak self] in
            guard let self = self else { return }
            
            let vehicleVC = VehicleViewController()
            vehicleVC.vehicleData = tableData[indexPath.row]
            
            navigationController?.pushViewController(vehicleVC, animated: true)
        }
        return cell
    }
}

extension MainViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width - 24
    }
}
