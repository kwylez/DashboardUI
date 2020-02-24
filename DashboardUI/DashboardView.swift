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
        
        GeometryReader{ reader in
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
                                    LineView(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: reader.size.width,
                                                           height: reader.size.height))
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
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .frame(width: 400, height: 400.0)
    }
}
