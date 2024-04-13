import UIKit

class PhotoViewController: UIViewController {

    lazy var image : String = ""
    
    private lazy var imageView : UIImageView = {
        $0.image = UIImage(named: image)
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: view.frame.height / 3, width: view.frame.width, height: view.frame.height / 3)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        view.addSubview(imageView)
    }
}
