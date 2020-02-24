//
//  BackgroundView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/22/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient:
            Gradient(
                colors: [
                    Color("TopGradient"),
                    Color("BottomGradient")
            ]),
            startPoint: .top,
            endPoint: .bottom
        ).edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
