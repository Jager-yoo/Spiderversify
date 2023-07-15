import SwiftUI
import Combine

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public struct Spiderversify: ViewModifier {

  @Binding var on: Bool

  @State private var offset = CGSize(width: 0, height: 0)

  private let colors: [Color] = [.red, .green, .blue, .pink, .yellow, .cyan, .indigo, .mint, .orange, .purple]
  private let fonts: [Font.Design] = [.default, .serif, .monospaced, .rounded]
  private let weights: [Font.Weight] = [.black, .bold, .heavy, .light, .medium, .regular, .semibold, .thin, .ultraLight]
  private let maxGlitchOffset: CGFloat = 6
  private let glitchTimer = Timer.publish(every: 0.12, on: .main, in: .common).autoconnect()
  private let endTimer: Publishers.Autoconnect<Timer.TimerPublisher>

  init(_ on: Binding<Bool>, interval: TimeInterval) {
    self._on = on
    endTimer = Timer.publish(every: interval, on: .main, in: .common).autoconnect()
  }

  public func body(content: Content) -> some View {
    if on {
      ZStack {
        content
          .font(.system(size: Double.random(in: 20...36), weight: weights.randomElement()!, design: fonts.randomElement()!))
          .foregroundColor(colors.randomElement()!)
          .offset(self.offset)
      }
      .background(
        Group {
          if Bool.random() {
            Dots()
          } else {
            Stripes()
          }
        }
      )
      .onReceive(glitchTimer) { _ in
        self.offset = CGSize(width: Double.random(in: -maxGlitchOffset...maxGlitchOffset), height: Double.random(in: -maxGlitchOffset...maxGlitchOffset))
      }
      .onReceive(endTimer) { _ in
        on = false
      }
    } else {
      content
    }
  }
}

extension View {

  public func spiderversify(_ on: Binding<Bool>, interval: TimeInterval) -> some View {
    self.modifier(Spiderversify(on, interval: interval))
  }
}
