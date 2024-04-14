import UIKit

final class VehiclePageCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var cellView : UIView = {
        return $0
    }(UIView(frame: bounds))
    
    private lazy var groupView : UIView = {
        $0.backgroundColor = .cellWhite
        $0.layer.cornerRadius = 30
        return $0
    }(UIView(frame: CGRect(x: 30, y: 30, width: cellView.bounds.width - 60, height: cellView.bounds.width - 60)))
    
    private lazy var mainImageView : UIImageView = {
        $0.layer.cornerRadius = 30
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 25, y: 15, width: groupView.bounds.width - 50, height: groupView.bounds.height / 2 - 22)))
    
    private lazy var vehicleName : UILabel = AppUI.createLabel(
        textColor: .white,
        textAlignment: .left,
        rect: CGRect(x: 20, y: mainImageView.bounds.height / 5 * 2, width: mainImageView.bounds.width - 40, height: 24),
        font: UIFont.systemFont(ofSize:30, weight: .heavy))
        
    private lazy var vehicleDescription : UILabel = AppUI.createLabel(
        textColor: .white,
        textAlignment: .left,
        rect: CGRect(x: 20, y: vehicleName.frame.maxY, width: mainImageView.bounds.width - 40, height: 60),
        font: UIFont.systemFont(ofSize: 12),
        numberOfLines: 3)
    
    private lazy var imageStack : UIStackView = {
        $0.layer.cornerRadius = 20
        $0.axis = .horizontal
        $0.spacing = 11
        $0.alignment = .center
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(frame: CGRect(x: 25, y: mainImageView.frame.maxY + 10, width: groupView.bounds.width - 50, height: (mainImageView.bounds.width - 24) / 3)))
    
    private lazy var showButton : UIButton = {
        $0.setTitle("show details", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .black
        return $0
    }(UIButton(
        frame: CGRect(x: 25, y: imageStack.frame.maxY + 10, width: groupView.bounds.width - 50, height: 49),
        primaryAction: UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.completion?()
        })))
    
    var completion : ( () -> Void )?
    
    override func prepareForReuse() {
        mainImageView.image = nil
        vehicleName.text = nil
        vehicleDescription.text = nil
    }
    
    func setData(vehicle v: VehicleGroup) -> Void {
        
        mainImageView.image = UIImage(named: v.mainImage)
        vehicleName.text = v.title
        vehicleDescription.text = v.info
        v.subImages.forEach {
            imageStack.addArrangedSubview(AppUI.createImageView(withImage: $0))
        }
        
        [vehicleName, vehicleDescription].forEach { mainImageView.addSubview($0) }
        [mainImageView, imageStack, showButton].forEach { groupView.addSubview($0) }

        cellView.addSubview(groupView)
        addSubview(cellView)
    }
}
