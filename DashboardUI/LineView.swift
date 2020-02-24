//
//  LineView.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/23/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

let data: Array<Double> = [
    56.0,
    100.0,
    86.0,
    119.0,
    141.0,
    122.0,
    65.0,
    79.0,
    100.0
]

struct LineView: View {
    
    var frame: CGRect
    
    var padding: CGFloat = 10.0
    
    @State private var showFull: Bool = false
    
    private var stepWidth: CGFloat {
        
        if data.count < 2 {
            return 0
        }
        
        return frame.size.width / CGFloat(data.count-1)
    }
    
    private var stepHeight: CGFloat {
        
        let points: Array<Double> = data
        
        if let min = points.min(), let max = points.max(), min != max {
            
            if min <= 0 {
                return (frame.size.height - padding) / CGFloat(points.max()! - points.min()!)
            } else {
                return (frame.size.height - padding) / CGFloat(points.max()! + points.min()!)
            }
        }
        
        return 0
    }
    
    private var fullPath: Path {
        
        let points: Array<Double> = data
        return Path.quadCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    private var dataPath: Path {
        
        let points: Array<Double> = Array(data.dropLast())
        return Path.quadCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    private var lastPoint: CGPoint {
        return self.dataPath.cgPath.points.last!
    }
    
    private var circleStartLastPoint: CGPoint {
        return self.fullPath.cgPath.points.last!
    }
    
    var body: some View {
        
        return GeometryReader {reader in

            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                
                self.fullPath
                    .stroke(lineWidth: 8.0)
                    .foregroundColor(.black).opacity(0.1)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .drawingGroup()
                
                self.dataPath
                    .trim(from: 0, to: self.showFull ? 1.0 : 0)
                    .stroke(Color("Orange"), lineWidth: 6)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(.easeOut(duration: 1.2))
                    .onAppear {
                        self.showFull = true
                    }
                    .onDisappear {
                        self.showFull = false
                    }
                    .drawingGroup()
                
                Circle()
                    .trim(from: 0, to: self.showFull ? 1.0 : 0)
                    .fill(Color.white)
                    .opacity(self.showFull ? 1 : 0)
                    .overlay(
                        Circle().stroke(Color("Orange"), lineWidth: 6)
                        .opacity(self.showFull ? 1 : 0)
                    )
                    .frame(width: 20.0, height: 20.0)
                    .position(self.showFull ? self.lastPoint : self.circleStartLastPoint)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(Animation.easeInOut(duration: 1.2).delay(0.0))
            }
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    }
}
