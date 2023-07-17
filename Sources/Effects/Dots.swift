import SwiftUI

struct Dots: View {

  private let color: Color = [.orange, .blue, .red].randomElement()!
  private let hueDegree = Double.random(in: 0...360)
  private let rotationDegree = Double.random(in: 0...360)
  private let circleSize = Double.random(in: 6...20)

  var body: some View {
    Ellipse()
      .fill(color)
      .scaleEffect(Double.random(in: 4...8))
      .rotationEffect(Angle(degrees: rotationDegree))
      .hueRotation(Angle(degrees: hueDegree))
      .mask {
        dots
      }
  }

  private var dots: some View {
    VStack(spacing: Double.random(in: 2...8)) {
      ForEach(0..<20, id: \.self) { _ in
        HStack(spacing: 10) {
          ForEach(0..<20, id: \.self) { _ in
            Circle()
              .frame(width: circleSize, height: circleSize)
            Spacer()
          }
        }
        Spacer()
      }
    }
  }
}

struct Dots_Previews: PreviewProvider {

  static var previews: some View {
    Text("Spiderversify")
      .font(.title)
      .background {
        Dots()
      }
  }
}
