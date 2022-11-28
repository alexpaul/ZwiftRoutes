//
//  EventOverlay.swift
//  ZwiftRoutes
//
//  Created by Alex Paul on 11/27/22.
//

import SwiftUI

struct CustomRoundedRect: View {
    let width: CGFloat
    let height: CGFloat
    let radius: CGFloat
    let color: Color

    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        GeometryReader { geometry in
            let startPoint = CGPoint(
                x: radius,
                y: 0
            )
            let endPoint = CGPoint(
                x: (startPoint.x - radius),
                y: radius
            )
            Path { path in
                // 1
                path.move(to: startPoint)
                // 2
                // top right point
                path.addLine(to: CGPoint(x: width,
                                         y: 0))
                // 3
                // bottom right point
                path.addLine(to: CGPoint(x: width,
                                         y: height))
                // 4
                // bottom left point
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: height))
                // 5
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: radius))
                // 6
                // rounded corner at top left
                path.addCurve(to: startPoint,
                              control1: CGPoint(x: endPoint.x,
                                                y: endPoint.y),
                              control2: CGPoint(x: startPoint.x - radius,
                                                y: startPoint.y))

                // 7
                // optional
                path.closeSubpath()
            }
            .fill(color)
        }
    }
}

struct EventOverlay: View {
    let event: Event

    var body: some View {
        VStack {
            HStack {
                Text(event.elevation)
                Spacer()
            }
            .padding(.vertical, 10)
            Divider()
            HStack {
                Text(event.distance)
                Spacer()
                RaceGroupView()
            }
            .padding(.vertical, 10)
        }
        .font(.title3)
        .bold()
        .padding(.horizontal, 20)
        .foregroundColor(.black)
        .background(
            CustomRoundedRect(
                width: 400,
                height: 110,
                radius: 20,
                color: .appWhite
            )
        )
    }
}

struct EventOverlay_Previews: PreviewProvider {
    static var previews: some View {
        EventOverlay(event: Event.mockEvent())
    }
}
