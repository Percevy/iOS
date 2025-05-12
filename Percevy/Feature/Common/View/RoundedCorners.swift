import SwiftUI

struct RoundedCorners: Shape {
    var topLeading: CGFloat = 0.0
    var topTrailing: CGFloat = 0.0
    var bottomLeading: CGFloat = 0.0
    var bottomTrailing: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let pi = CGFloat.pi

        path.move(to: CGPoint(x: rect.minX + topLeading, y: rect.minY))

        path.addLine(to: CGPoint(x: rect.maxX - topTrailing, y: rect.minY))

        path.addArc(withCenter: CGPoint(x: rect.maxX - topTrailing, y: rect.minY + topTrailing),
                    radius: topTrailing,
                    startAngle: CGFloat(pi / 2.0),
                    endAngle: 0,
                    clockwise: true)

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomTrailing))

        path.addArc(withCenter: CGPoint(x: rect.maxX - bottomTrailing, y: rect.maxY - bottomTrailing),
                    radius: bottomTrailing,
                    startAngle: 0,
                    endAngle: CGFloat(pi / 2.0),
                    clockwise: true)

        path.addLine(to: CGPoint(x: rect.minX + bottomLeading, y: rect.maxY))

        path.addArc(withCenter: CGPoint(x: rect.minX + bottomLeading, y: rect.maxY - bottomLeading),
                    radius: bottomLeading,
                    startAngle: CGFloat(pi / 2.0),
                    endAngle: CGFloat(pi),
                    clockwise: true)

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeading))

        path.addArc(withCenter: CGPoint(x: rect.minX + topLeading, y: rect.minY + topLeading),
                    radius: topLeading,
                    startAngle: CGFloat(pi),
                    endAngle: CGFloat(3 * pi / 2.0),
                    clockwise: true)
        path.close()
        return Path(path.cgPath)
    }
}
