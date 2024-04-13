import Foundation
import UIKit

final class AppUI {
    
    static func createLabel(text: String = "", textColor: UIColor, textAlignment: NSTextAlignment, rect: CGRect, font: UIFont, numberOfLines: Int = 1) -> UILabel {
        {
            $0.text = text
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.numberOfLines = numberOfLines
            $0.font = font
            return $0
        }(UILabel(frame: rect))
    }
    
    static func createImageView(withImage img: String) -> UIImageView {
        {
            $0.image = UIImage(named: img)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.contentMode = .scaleAspectFill
            return $0
        }(UIImageView())
    }
}
