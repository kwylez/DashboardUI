//
//  ProductView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/24/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    var image: String
    
    var productName: String
    
    var unitsSold: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(self.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                .shadow(radius: 10)
                .padding([.top, .bottom])
                .padding(.leading, 5)
            Text(self.productName)
                .foregroundColor(Color("DarkBlue"))
                .font(.title)
                .bold()
                .cornerRadius(15.0)
                .padding(.bottom)
            Text(self.unitsSold)
                .foregroundColor(.gray)
                .font(.headline)
                .bold()
                .cornerRadius(15.0)
            Spacer()
        }
        .frame(width: 200, height: 330.0)
        .background(Color("LightBlue"))
        .cornerRadius(25.0)
    }
}

struct ProductView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductView(image: "OutdoorLight", productName: "Outdoor Lighting", unitsSold: "545 Units sold")
    }
}
