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
                .padding(.leading, 20)
                .padding(.top, 20)
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 20) {
                    
                    VStack(alignment: .leading) {
                        Image("Couch")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                            .padding(.leading, 25)
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
                    .frame(width: 200, height: 330.0)
                    .background(Color("LightBlue"))
                    .cornerRadius(25.0)
                    
                    VStack(alignment: .leading) {
                        Image("Cookware")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                            .padding(.leading, 25)
                        Text("10 pc Cookware")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.title)
                            .bold()
                            .cornerRadius(15.0)
                            .padding(.bottom)
                            .padding(.leading, 25)
                        Text("1,204 Units sold")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .cornerRadius(15.0)
                        Spacer()
                    }
                    .cornerRadius(20.0)
                    .frame(width: 200, height: 330.0)
                    .background(Color("LightBlue"))
                    .cornerRadius(25.0)
                    
                    VStack(alignment: .leading) {
                        Image("OutdoorLight")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                            .padding(.leading, 5)
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
                    .frame(width: 200, height: 330.0)
                    .background(Color("LightBlue"))
                    .cornerRadius(25.0)
                    
                    VStack(alignment: .leading) {
                        Image("CakeStand")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding([.top, .bottom])
                            .padding(.leading, 25)
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
                    .frame(width: 200, height: 330.0)
                    .background(Color("LightBlue"))
                    .cornerRadius(25.0)
                }
            }
            .padding([.trailing, .leading])
            
            Text("Loyal Buyers")
                .font(.system(.title))
                .bold()
                .foregroundColor(.black)
                .padding(.top)
                .padding(.leading, 20)
            
            ScrollView {
                BuyerRowView(image: "Person1", name: "Erin Wiles")
                BuyerRowView(image: "Person2", name: "McKinna Wiles")
                BuyerRowView(image: "Person3", name: "Cory Wiles")
            }
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
