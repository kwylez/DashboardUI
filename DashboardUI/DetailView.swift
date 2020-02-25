//
//  DetailView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/24/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Popular Products")
                .font(.system(.title))
                .bold()
                .foregroundColor(.black)
                .padding()
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Image("Couch")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                        Text("3 Tier Cake Stand")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.title)
                            .bold()
                            .cornerRadius(15.0)
                            .padding(.bottom)
                        Text("334 Units sold")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .cornerRadius(15.0)
                        Spacer()
                    }
                    .frame(width: 200, height: 360.0)
                    .background(Color("LightBlue"))
                    
                    VStack(alignment: .leading) {
                        Image("Cookware")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                        Text("10 pc Cookware")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.title)
                            .bold()
                            .cornerRadius(15.0)
                            .padding(.bottom)
                        Text("1,204 Units sold")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .cornerRadius(15.0)
                        Spacer()
                    }
                    .frame(width: 200, height: 360.0)
                    .background(Color("LightBlue"))
                    
                    VStack(alignment: .leading) {
                        Image("OutdoorLight")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                        Text("Outdoor Lighting")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.title)
                            .bold()
                            .cornerRadius(15.0)
                            .padding(.bottom)
                        Text("545 Units sold")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .cornerRadius(15.0)
                        Spacer()
                    }
                    .frame(width: 200, height: 360.0)
                    .background(Color("LightBlue"))
                    
                    VStack(alignment: .leading) {
                        Image("CakeStand")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                        Text("3 Tier Cake Stand")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.title)
                            .bold()
                            .cornerRadius(15.0)
                            .padding(.bottom)
                        Text("334 Units sold")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .cornerRadius(15.0)
                        Spacer()
                    }
                    .frame(width: 200, height: 360.0)
                    .background(Color("LightBlue"))
                }
            }
            .padding([.trailing, .leading])
            
            Text("Loyal Buyers")
                .font(.system(.title))
                .bold()
                .foregroundColor(.black)
                .padding()
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
