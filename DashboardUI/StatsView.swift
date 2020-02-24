//
//  StatsView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/22/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        
        HStack(spacing: 100.0) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Total Earnings")
                    .font(.system(.caption))
                    .opacity(0.6)
                Text("$1245")
                    .font(.system(.body)).bold()
            }
            .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 10) {
                Text("Product Sold")
                    .font(.system(.caption))
                    .opacity(0.6)
                Text("899")
                    .font(.system(.body)).bold()
            }
            .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 10) {
                Text("Ratings")
                    .font(.system(.caption))
                    .opacity(0.6)
                Text("73%")
                    .font(.system(.body)).bold()
            }
            .foregroundColor(.white)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
