//
//  DetailProductBuyerView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/25/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct DetailProductBuyerView: View {
    
    @Binding var viewState: DetailViewState
    
    @Binding var positionOffset: CGFloat
    
    var body: some View {
        
        HStack {

            Spacer()
            HandleBarView()
                .padding(.trailing, 10.0)

            VStack {
                DetailView(viewState: self.$viewState,
                           positionOffset: self.$positionOffset)
                Spacer()
            }
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
        }
    }
}

struct DetailProductBuyerView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductBuyerView(viewState: .constant(.closed), positionOffset: .constant(0.0))
    }
}
