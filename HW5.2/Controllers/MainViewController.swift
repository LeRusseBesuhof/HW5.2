import UIKit

class MainVC: UIViewController {

    private lazy var tableData = VehicleGroup.mockData()
    
    private lazy var vehicleTable : UITableView = {
        $0.register(VehicleCell.self, forCellReuseIdentifier: "engine")
        $0.dataSource = self
        $0.delegate = self
        // $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Vehicles"
        
        navigationController?.navigationItem.title = ""
        
        view.addSubview(vehicleTable)
    }
}

extension MainVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "engine", for: indexPath) as? VehicleCell else { return UITableViewCell() }
        
        cell.setData(vehicle: tableData[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width
    }
}
