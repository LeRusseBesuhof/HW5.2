import UIKit

class PhotoViewController: UIViewController {

    lazy var image : String = ""
    
    private lazy var imageView : UIImageView = {
        $0.image = UIImage(named: image)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        view.addSubview(imageView)
    }
}
