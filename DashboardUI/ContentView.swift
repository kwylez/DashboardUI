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

enum DetailViewState {
    
    case opened
    case closed
}

enum DragState {
    
    case inactive
    case pressing
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct ContentView: View {
    
    @State private var positionOffset: CGFloat = 0.0
    
    @State private var viewState: DetailViewState = .closed
    
    @GestureState private var dragState: DragState = .inactive
    
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
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .topLeading)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top)

                DetailProductBuyerView(viewState: self.$viewState)
                    .frame(width: minDashboardWidth)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
                    .padding([.top, .bottom])
                    .padding(.trailing, 20.0)
                    .offset(x:
                        (reader.size.width - minDashboardWidth) + self.positionOffset
                    )
                    .animation(.spring(
                        response: 0.6, dampingFraction: 0.6, blendDuration: 0)
                    )
                    .gesture(
                        DragGesture().onChanged { value in
                            self.positionOffset = value.translation.width
                        }
                        .onEnded { value in
                            
                            switch self.viewState {

                            case .closed:
                                
                                let threshold: CGFloat = -(minDashboardWidth - 100)

                                if value.translation.width < threshold {
                                    
                                    self.positionOffset = -minDashboardWidth
                                    self.viewState = .opened

                                } else {
                                    
                                    self.positionOffset = 0.0
                                }

                                break
                            case .opened:
                                    self.viewState = .closed
                                break
                            }
                        }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
