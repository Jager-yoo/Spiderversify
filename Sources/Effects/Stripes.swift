import SwiftUI

struct Stripes: View {

  private let color: Color = [.cyan, .green, .pink].randomElement()!
  private let hueDegree = Double.random(in: 0...360)
  private let rotationDegree: Double = {
    let ranges = [-60.0...(-20.0), 20.0...60.0]
    let range = ranges.randomElement()!
    return Double.random(in: range)
  }()
  private let lineWidth = Double.random(in: 6...24)
  private let lineHeight = Double.random(in: 250...500)

  var body: some View {
    Rectangle()
      .fill(color)
      .scaleEffect(10)
      .rotationEffect(Angle(degrees: rotationDegree))
      .mask {
        HStack(spacing: 30) {
          ForEach(1..<20, id: \.self) { _ in
            Rectangle()
              .fill(Color.yellow)
              .colorInvert()
              .opacity(0.6)
              .frame(width: lineWidth, height: lineHeight)
              .rotationEffect(Angle(degrees: rotationDegree))
          }
        }
      }
      .hueRotation(Angle(degrees: hueDegree))
  }
}

struct Stripes_Previews: PreviewProvider {

  static var previews: some View {
    Text("Spiderversify")
      .font(.largeTitle)
      .background {
        Stripes()
      }
  }
}
