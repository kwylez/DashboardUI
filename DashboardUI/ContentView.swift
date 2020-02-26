//
//  ContentView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/18/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

let chartLabels: Array<String> = [
    "Mon",
    "Tue",
    "Wed",
    "Thur",
    "Fri"
]

let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 20.0 / 255)


let minDashboardWidth: CGFloat = 375.0

let maxDashboardWidth: CGFloat = 450.0

struct ContentView: View {
    
    @State var isExpanding: Bool = false
    
    @State var detailOffset: CGFloat = -10.0
    
    @State var detailViewWidth: CGFloat = minDashboardWidth
    
    @State var offset: CGFloat = 0.0
    
    private var detailViewFrameWidth: CGFloat {
        return self.detailViewWidth + self.offset
    }
    
    var body: some View {
        
        GeometryReader {reader in
            
                ZStack {
                    
                    BackgroundView()
                    
                    VStack {
                        HStack {
                            Image("Profile")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.8), radius: 10.0)
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .padding(.leading)
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            
                            MenuView()
                                .padding(.trailing, 70.0)
                                .padding(.top, 90.0)
                            
                            VStack(alignment: .leading) {
                                Text("Dashboard")
                                    .font(.system(.largeTitle)).bold()
                                    .foregroundColor(.white)
                                    .padding(.bottom)
                                HStack(spacing: 20.0) {
                                    Text("Sales")
                                        .foregroundColor(.white)
                                        .font(.system(.body)).bold()
                                    Text("Earnings")
                                        .foregroundColor(.white)
                                        .font(.system(.body)).bold()
                                    Text("Revenue")
                                        .foregroundColor(.white)
                                        .font(.system(.body)).bold()
                                }
                                .padding(.bottom, 50.0)
                                
                                DashboardView()
                                    .frame(width: 400.0, height: 400.0)

                                Text("Stats")
                                    .foregroundColor(.white)
                                    .font(.system(.title)).bold()
                                    .padding(.bottom)
                                    .padding(.top, 45.0)
                                
                                StatsView()
                            }
                            .alignmentGuide(.top) { $0[.top] + 80 }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.top)

                    HStack {

                        Spacer()
                        HandleBarView()
                            .zIndex(2)
                            .offset(x: self.detailOffset, y: 0)
                            .gesture(
                                DragGesture()
                                 .onChanged {gesture in

                                     let width: CGFloat = gesture.translation.width
                                     self.offset = (width * -1)
                                 }
                             )

                        VStack {
                            DetailView()
                            Spacer()
                        }
                        .zIndex(4)
                        .frame(width: self.detailViewWidth + self.offset)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
                        .padding([.top, .bottom])
                        .padding(.trailing, 20.0)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
