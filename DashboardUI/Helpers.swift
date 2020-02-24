//
//  Helpers.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/23/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import Foundation
import UIKit

func midPointForPoints(_ p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: (p1.x + p2.x) / 2, y: (p2.x + p2.y) / 2)
}

func controlPointForPoints(_ p1: CGPoint, p2: CGPoint) -> CGPoint {
    
    var controlPoint: CGPoint = midPointForPoints(p1, p2: p2)
    let diffY: CGFloat = abs(p2.y - controlPoint.y)
    
    if p1.y < p2.y {
        controlPoint.y += diffY
    } else if p1.y > p2.y {
        controlPoint.y -= diffY
    }
    
    return controlPoint
}

func quadCurvePathwithPoints(_ points: Array<CGPoint>) -> UIBezierPath {
    
    let path: UIBezierPath = UIBezierPath()
    var firstPoint: CGPoint = points.first!
    
    path.move(to: firstPoint)
    
    if points.count == 2 {
        
        let p2: CGPoint = points[1]
        path.addLine(to: p2)
        
        return path
    }
    
    for point in points.dropFirst() {
        
        let p2: CGPoint = point
        
        let midPoint: CGPoint = midPointForPoints(firstPoint, p2: p2)
        
        path.addQuadCurve(to: midPoint, controlPoint: firstPoint)
        path.addQuadCurve(to: p2, controlPoint: controlPointForPoints(midPoint, p2: p2))
        
        firstPoint = p2
    }
    
    return path
}

