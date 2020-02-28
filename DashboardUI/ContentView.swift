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
let minDashboardWidth: CGFloat = 450.0

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
                            
                            FilterMenuView()
                                .frame(width: 300.0)
                                .padding(.bottom, 50.0)
                                .coordinateSpace(name: "myVstack")
                            
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

                DetailProductBuyerView(viewState: self.$viewState,
                                       positionOffset: self.$positionOffset)
                    .frame(width: minDashboardWidth)
                    .padding([.top, .bottom])
                    .offset(x:
                        (reader.size.width - minDashboardWidth) + self.positionOffset
                    )
                    .animation(.spring())
                    .onTapGesture { }
                    .gesture(
                        DragGesture().onChanged { value in

                            if self.viewState == .closed &&
                                value.translation.width > -200 {
                                
                                self.positionOffset = value.translation.width
                            }
                        }
                        .onEnded { value in

                            switch self.viewState {

                            case .closed:
                                
                                let threshold: CGFloat = -50.0

                                if value.translation.width < threshold {

                                    self.positionOffset = -(minDashboardWidth - 50.0)
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
