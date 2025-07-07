import ExpoModulesCore

public class ExpoAnyConfettiModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoAnyConfetti")
    
    View(ConfettiView.self) {
      
      Prop("confettiColors") { (view: ConfettiView, colors: [String]) in
        view.colors = colors.compactMap { UIColor(hex: $0) }
        view.restartConfettiIfActive()
      }
      
      Prop("size") { (view: ConfettiView, size: String) in
        view.size = size == "small" ? .small : .large
        view.restartConfettiIfActive()
      }
      
      Prop("intensity") { (view: ConfettiView, intensity: Float) in
        view.intensity = intensity
        view.restartConfettiIfActive()
      }
      
      Prop("isStarted") { (view: ConfettiView, isStarted: Bool) in
        view.isStarted = isStarted
        if isStarted {
          view.startConfetti(beginAtTimeZero: view.beginAtTimeZero)
        } else {
          view.stopConfetti()
        }
      }
      
      Prop("beginAtTimeZero") { (view: ConfettiView, beginAtTimeZero: Bool) in
        view.beginAtTimeZero = beginAtTimeZero
      }
    }
  }
}

// Helper extension to convert hex strings to UIColor
extension UIColor {
  convenience init?(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      return nil
    }
    self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, alpha: Double(a) / 255)
  }
}
