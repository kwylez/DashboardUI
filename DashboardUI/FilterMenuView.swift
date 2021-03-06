//
//  FilterMenuView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/26/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct MyTextPreferenceData: Equatable {
    
    let viewIdx: Int
    
    let rect: CGRect
}

struct MyTextPreferenceKey: PreferenceKey {
    
    typealias Value = [MyTextPreferenceData]

    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData],
                       nextValue: () -> [MyTextPreferenceData]) {
        
        value.append(contentsOf: nextValue())
    }
}

struct MenuItemView: View {
    
    @Binding var activeMonth: Int
    
    let label: String
    
    let idx: Int
    
    var body: some View {
        
        Text(label)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: idx))
            .foregroundColor(.white)
            .font(.system(.body))
            .onTapGesture {
                self.activeMonth = self.idx
            }
    }
}

struct MyPreferenceViewSetter: View {
    
    let idx: Int
    
    var body: some View {
    
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyTextPreferenceKey.self,
                            value: [MyTextPreferenceData(viewIdx: self.idx, rect: geometry.frame(in: .named("filterMenu")))])
        }
    }
}

struct FilterMenuView: View {
    
    @State private var activeIdx: Int = 0
    @State private var rects: Array<CGRect> = Array(repeating: CGRect(),
                                                    count: 3)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20.0) {

            HStack(spacing: 20.0) {
                
                MenuItemView(activeMonth: $activeIdx, label: "Sales", idx: 0)
                MenuItemView(activeMonth: $activeIdx, label: "Earnings", idx: 1)
                MenuItemView(activeMonth: $activeIdx, label: "Revenue", idx: 2)
            }
            .onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                for p in preferences {
                    self.rects[p.viewIdx] = p.rect
                }
            }
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .frame(height: 2.0)
                    .foregroundColor(.white)
                    .opacity(0.15)
                Rectangle()
                    .frame(width: self.rects[self.activeIdx].width, height: 4.0)
                    .foregroundColor(.white)
                    .offset(x: self.rects[activeIdx].minX)
                    .animation(.spring())
            }
        }
    }
}

struct FilterMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenuView()
            .background(Color.red)
            .frame(width: 300.0)
    }
}
