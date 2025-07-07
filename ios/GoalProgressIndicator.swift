import UIKit
import PureLayout

final class GoalProgressIndicator: UIView {
    let trackHeight: CGFloat = 2.5
    let dotDiameter: CGFloat = 6.5
    let trackGradientColors: [UIColor] = [.brown,
                                          .orange,
                                          .yellow]

    private var inactiveTrack: UIView!
    private var activeTrack: GradientView!
    private var dot: UIView!
    private var dotShadow: UIImageView!

    @Clamped(initialValue: 0.6, 0...1)
    private var progress: CGFloat
    private var activeTrackWidthConstraint: NSLayoutConstraint?

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setup()
    }

    private func setup() {
        inactiveTrack = UIView()
        inactiveTrack.backgroundColor = .white
        inactiveTrack.alpha = 0.3
        inactiveTrack.layer.cornerRadius = trackHeight / 2
        addSubview(inactiveTrack)
        inactiveTrack.autoAlignAxis(toSuperviewAxis: .horizontal)
        inactiveTrack.autoPinEdge(toSuperviewEdge: .leading)
        inactiveTrack.autoPinEdge(toSuperviewEdge: .trailing)
        inactiveTrack.autoSetDimension(.height, toSize: trackHeight)

        activeTrack = GradientView()
        activeTrack.colors = trackGradientColors
        activeTrack.layer.cornerRadius = trackHeight / 2
        addSubview(activeTrack)
        activeTrack.autoAlignAxis(toSuperviewAxis: .horizontal)
        activeTrack.autoPinEdge(toSuperviewEdge: .leading)
        activeTrackWidthConstraint = activeTrack.autoMatch(.width, to: .width, of: self, withMultiplier: progress)
        activeTrack.autoSetDimension(.height, toSize: trackHeight)

        dot = UIView()
        dot.backgroundColor = trackGradientColors.last
        dot.layer.cornerRadius = dotDiameter / 2
        addSubview(dot)
        dot.autoPinEdge(.trailing, to: .trailing, of: activeTrack, withOffset: dotDiameter / 2)
        dot.autoAlignAxis(.horizontal, toSameAxisOf: activeTrack)
        dot.autoSetDimensions(to: CGSize(width: dotDiameter, height: dotDiameter))

        dotShadow = UIImageView()
        dotShadow.image = UIImage(named: "progress_dot_shadow")
        dotShadow.contentMode = .scaleAspectFit
        addSubview(dotShadow)
        dotShadow.autoSetDimension(.width, toSize: 30)
        dotShadow.autoAlignAxis(.vertical, toSameAxisOf: dot)
        dotShadow.autoAlignAxis(.horizontal, toSameAxisOf: dot)
    }

    func setInactiveTrackTintColor(_ color: UIColor) {
        inactiveTrack.backgroundColor = color
    }

    func setProgress(_ progress: Float) {
        guard !progress.isNaN else { return }
        self.progress = CGFloat(progress).clamped(to: 0...1)
        activeTrackWidthConstraint?.autoRemove()
        activeTrackWidthConstraint = activeTrack.autoMatch(.width, to: .width, of: self, withMultiplier: self.progress)
    }
}
