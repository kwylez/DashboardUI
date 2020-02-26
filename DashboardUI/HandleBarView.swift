//
//  HandleBarView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/25/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct HandleBarView: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 5, height: 50)
            .foregroundColor(Color(.systemGray2))
            .cornerRadius(10)
    }
}

struct HandleBarView_Previews: PreviewProvider {
    static var previews: some View {
        HandleBarView()
    }
}
