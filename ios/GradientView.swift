import UIKit

final class GradientView: UIView {

    var colors: [UIColor] = [] {
        didSet {
            if colors != oldValue {
                layoutSubviews()
            }
        }
    }

    var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        didSet {
            gradientLayer?.startPoint = startPoint
        }
    }

    var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        didSet {
            gradientLayer?.endPoint = endPoint
        }
    }

    var gradientLayer: CAGradientLayer? = nil

    override func layoutSubviews() {
        if let gradient = gradientLayer {
            gradient.colors = colors.map { $0.cgColor }
            gradient.locations = (0..<colors.count).map { ($0 / (colors.count - 1)) as NSNumber }
        } else {
            gradientLayer = newGradientLayer()
            layer.insertSublayer(gradientLayer!, at: 0)
        }
        gradientLayer?.frame = bounds
        gradientLayer?.cornerRadius = layer.cornerRadius
        gradientLayer?.startPoint = startPoint
        gradientLayer?.endPoint = endPoint

        super.layoutSubviews()
    }

    func newGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = (0..<colors.count).map { ($0 / (colors.count - 1)) as NSNumber }
        return gradient
    }
}
