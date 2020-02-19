//
//  ContentView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/18/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient:
                Gradient(
                    colors: [
                        Color("TopGradient"),
                        Color("BottomGradient")
                ]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            
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
                    VStack(spacing: 10.0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(.black).opacity(0.3)
                            Image(systemName: "chart.pie.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        .frame(width: 96, height: 96)
                        .offset(x: -15, y: 0)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(.black).opacity(0.0)
                            Image(systemName: "folder.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        .frame(width: 96, height: 96)
                        .offset(x: -15, y: 0)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(.black).opacity(0.0)
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        .frame(width: 96, height: 96)
                        .offset(x: -15, y: 0)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(.black).opacity(0.0)
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        .frame(width: 96, height: 96)
                        .offset(x: -15, y: 0)
                    }
                    .padding(.trailing, 70.0)
                    .padding(.top, 90.0)
                    VStack(alignment: .leading) {
                        Text("Dashboard")
                            .font(.system(.largeTitle)).bold()
                            .foregroundColor(.white)
                            .padding(.bottom)
                        HStack(spacing: 20.0) {
                            Text("Sales")
                                .foregroundColor(.white)
                                .font(.system(.body)).bold()
                            Text("Earnings")
                                .foregroundColor(.white)
                                .font(.system(.body)).bold()
                            Text("Revenue")
                                .foregroundColor(.white)
                                .font(.system(.body)).bold()
                        }
                        .padding(.bottom, 50.0)
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundColor(.white)
                            .frame(width: 400.0, height: 300.0)
                        Text("Stats")
                            .foregroundColor(.white)
                            .font(.system(.title)).bold()
                            .padding(.bottom)
                            .padding(.top, 45.0)
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
                    Spacer()
                }
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
