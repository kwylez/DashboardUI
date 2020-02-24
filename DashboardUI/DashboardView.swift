//
//  DashboardView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/22/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("$1,394")
                            .font(.system(.title))
                            .bold()
                        Text("+10% compared to last week")
                            .font(.system(.caption))
                            .foregroundColor(.gray)
                            .frame(width: 150.0)
                    }
                    Spacer()
                    Text("Weekly")
                        .font(.system(.body))
                        .bold()
                }
                .padding([.top, .leading, .trailing], 25)
                    
                    VStack() {
                        GeometryReader {reader in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                Path { path in
                                    
                                    path.move(to: CGPoint(x: 0, y: reader.size.height))
                                    path.addLine(to: CGPoint(x: 0, y: (reader.size.height)))
                                    
                                    var count: CGFloat = 1.0
                                    let dataPoints = data.dropFirst()

                                    dataPoints.forEach{p in
                                    let x = (reader.size.width / CGFloat(data.count)) * count
                                        let y = (reader.size.height - p)

                                        path.addLine(to:
                                            CGPoint(x: x, y: y)
                                        )
                                        
                                        count += 1
                                    }
                                }
                                .stroke(lineWidth: 8)
                                .fill (LinearGradient (
                                    gradient: .init(colors: .init([gradientStart, gradientEnd])),
                                    startPoint: .init(x: 0, y: 0),
                                    endPoint: .init(x: 1.0, y: 0)
                                ))
                            }
                        }
                        HStack {
                            
                            ForEach(chartLabels, id: \.self) {label in
                                Text(label)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .frame(width: 400, height: 400.0)
    }
}
