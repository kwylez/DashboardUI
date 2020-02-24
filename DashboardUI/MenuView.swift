//
//  MenuView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/22/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
    
        VStack(spacing: 10.0) {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.black).opacity(0.3)
                Image(systemName: "chart.pie.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            .frame(width: 96, height: 96)
            .offset(x: -15, y: 0)
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.black).opacity(0.0)
                Image(systemName: "folder.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            .frame(width: 96, height: 96)
            .offset(x: -15, y: 0)
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.black).opacity(0.0)
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            .frame(width: 96, height: 96)
            .offset(x: -15, y: 0)
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.black).opacity(0.0)
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            .frame(width: 96, height: 96)
            .offset(x: -15, y: 0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
