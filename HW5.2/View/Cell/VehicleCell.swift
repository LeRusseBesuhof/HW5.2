import UIKit

final class VehicleCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var vehicleImage : UIImageView = {
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: 15, width: frame.width - 60, height: 201)))
    
    override func prepareForReuse() {
        vehicleImage.image = nil
    }
    
    func setMyData(image: String) -> Void {
        backgroundColor = .cellWhite
        clipsToBounds = true
        vehicleImage.image = UIImage(named: image)
        
        addSubview(vehicleImage)
    }
}
