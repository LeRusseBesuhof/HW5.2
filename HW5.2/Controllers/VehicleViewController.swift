import UIKit

class VehicleViewController: UIViewController {

    lazy var vehicleData : VehicleGroup? = nil
    
    private lazy var vehicleTitleLabel : UILabel = AppUI.createLabel(
        text: vehicleData!.title,
        textColor: .black,
        textAlignment: .center,
        rect: CGRect(x: 30, y: 74, width: view.frame.width - 60, height: 44),
        font: UIFont.systemFont(ofSize: 36, weight: .bold))
    
    private lazy var vehicleMainImage : UIImageView = {
        $0.image = UIImage(named: vehicleData!.mainImage)
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: vehicleTitleLabel.frame.maxY + 25, width: view.frame.width - 60, height: 189)))
    
    private lazy var vehicleDescription : UILabel = AppUI.createLabel(
        text: vehicleData!.info,
        textColor: .black,
        textAlignment: .center,
        rect: CGRect(x: 30, y: vehicleMainImage.frame.maxY + 25, width: view.frame.width - 60, height: 60),
        font: UIFont.systemFont(ofSize: 16),
        numberOfLines: 3)
    
    private lazy var vehicleTable : UITableView = {
        $0.register(VehicleCell.self, forCellReuseIdentifier: "vehicle")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: CGRect(x: 0, y: vehicleDescription.frame.maxY + 20, width: view.frame.width, height: view.frame.height / 2)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = ""
        
        [vehicleTitleLabel, vehicleMainImage, vehicleDescription, vehicleTable].forEach { view.addSubview($0) }
    }
}

extension VehicleViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicle", for: indexPath) as? VehicleCell else { return UITableViewCell() }
        
        cell.setMyData(image: vehicleData!.subImages[indexPath.row])
        return cell
    }
}

extension VehicleViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 231 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let photoVC = PhotoViewController()
        photoVC.image = vehicleData!.subImages[indexPath.row]
        
        navigationController?.pushViewController(photoVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        {
            $0.text = "Photos"
            $0.font = UIFont.systemFont(ofSize: 24)
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
            $0.leftViewMode = .always
            return $0
        }(UITextField())
    }
}

