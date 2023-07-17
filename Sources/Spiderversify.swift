import SwiftUI
import Combine

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public struct Spiderversify: ViewModifier {

  @Binding var on: Bool

  @State private var offset = CGSize(width: 0, height: 0)
  @State private var effectType: EffectType = .glitch

  private let colors: [Color] = [.red, .green, .blue, .pink, .yellow, .cyan, .indigo, .mint, .orange, .purple]
  private let fonts: [Font.Design] = [.default, .serif, .monospaced, .rounded]
  private let weights: [Font.Weight] = [.black, .bold, .heavy, .light, .medium, .regular, .semibold, .thin, .ultraLight]
  private let maxGlitchOffset: CGFloat = 6
  private let glitchIntervalTimer: Publishers.Autoconnect<Timer.TimerPublisher>
  private let durationTimer: Publishers.Autoconnect<Timer.TimerPublisher>

  init(_ on: Binding<Bool>, duration: TimeInterval, glitchInterval: TimeInterval) {
    self._on = on
    glitchIntervalTimer = Timer.publish(every: glitchInterval, on: .main, in: .common).autoconnect()
    durationTimer = Timer.publish(every: duration, on: .main, in: .common).autoconnect()
  }

  enum EffectType: CaseIterable {
    case glitch
    case portal
  }

  public func body(content: Content) -> some View {
    Group {
      if on {
        ZStack {
          content
            .font(.system(size: Double.random(in: 20...36), weight: weights.randomElement()!, design: fonts.randomElement()!))
            .foregroundColor(colors.randomElement()!)
            .offset(self.offset)
            .rotationEffect(.degrees(Double.random(in: -5...5)))
        }
        .background(
          backgroundEffect
        )
        .onReceive(glitchIntervalTimer) { _ in
          self.offset = CGSize(width: Double.random(in: -maxGlitchOffset...maxGlitchOffset), height: Double.random(in: -maxGlitchOffset...maxGlitchOffset))
        }
        .onReceive(durationTimer) { _ in
          on = false
        }
      } else {
        content
      }
    }
    .onChange(of: on) { newValue in
      if newValue {
        effectType = Bool.random() ? .glitch : .portal
      }
    }
  }

  private var backgroundEffect: AnyView {
    switch effectType {
    case .glitch:
      return [AnyView(Dots()), AnyView(Stripes())].randomElement()!
    case .portal:
      return AnyView(Portals())
    }
  }
}

extension View {

  public func spiderversify(_ on: Binding<Bool>, duration: TimeInterval, glitchInterval: TimeInterval = 0.12) -> some View {
    self.modifier(Spiderversify(on, duration: duration, glitchInterval: glitchInterval))
  }
}
