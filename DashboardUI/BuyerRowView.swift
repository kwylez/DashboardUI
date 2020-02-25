//
//  BuyerRowView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/24/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct BuyerRowView: View {
    
    var image: String
    
    var name: String
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(self.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text(self.name)
                .foregroundColor(.gray)
                .font(.system(.headline))
                .bold()
            Spacer()
        }
        .padding()
    }
}

struct BuyerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerRowView(image: "Person2", name: "Cory Wiles")
    }
}
