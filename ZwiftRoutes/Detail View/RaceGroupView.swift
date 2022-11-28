//
//  RaceGroupView.swift
//  ZwiftRoutes
//
//  Created by Alex Paul on 11/27/22.
//

import SwiftUI

struct RaceGroupView: View {
    private let diameter: Double = 20

    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(RaceGroup.allGroups, id:\.self) { item in
                ZStack {
                    Circle()
                        .frame(width: diameter, height: diameter)
                        .foregroundColor(item.color)
                    Text(item.group)
                        .font(.caption)
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

struct RaceGroupView_Previews: PreviewProvider {
    static var previews: some View {
        RaceGroupView()
    }
}
