import SwiftUI

struct Portals: View {

  private let color: Color = [.orange, .purple, .yellow].randomElement()!
  private let hueDegree = Double.random(in: 0...360)
  private let strokeWidth = Double.random(in: 1.5...3)
  private let size = Double.random(in: 200...300)
  private let points = Int.random(in: 6...8)

  var body: some View {
    ZStack {
      Portal(numberOfPoints: points)
        .fill(color.opacity(0.3))
        .overlay(
          Portal(numberOfPoints: points)
            .stroke(color, lineWidth: strokeWidth)
            .colorInvert()
        )

      Portal(numberOfPoints: points)
        .stroke(color, style: .init(lineWidth: strokeWidth/2, dash: [10, 5]))
        .colorInvert()
        .scaleEffect(0.8)

      Portal(numberOfPoints: points)
        .stroke(color, style: .init(lineWidth: strokeWidth/3, dash: [5, 10]))
        .colorInvert()
        .scaleEffect(0.5)
    }
    .hueRotation(Angle(degrees: hueDegree))
    .frame(width: size, height: size)
  }
}

struct Portal: Shape {

  let numberOfPoints: Int

  func path(in rect: CGRect) -> Path {
    let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    var path = Path()
    let adjustment = CGFloat.pi / 2

    for i in 0..<numberOfPoints {
      let angle = (Double(i) * (360.0 / Double(numberOfPoints)) - 90.0 + Double.random(in: -10.0...10.0)).radians
      let p = CGPoint(x: center.x * CGFloat(1.0 + sin(angle - adjustment)), y: center.y * CGFloat(1.0 + cos(angle - adjustment)))
      if i == 0 {
        path.move(to: p)
      } else {
        path.addLine(to: p)
      }
    }
    path.closeSubpath()
    return path
  }
}

extension Double {
  fileprivate var radians: CGFloat {
    return CGFloat(self) * .pi / 180
  }
}

struct Portals_Previews: PreviewProvider {

  static var previews: some View {
    Text("Spiderversify")
      .font(.title)
      .background {
        Portals()
      }
  }
}
