//
//  Extensions.swift
//  DashboardUI
//
//  Created by Cory D. Wiles on 2/23/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension CGPoint {
    
    static func getMidPoint(point1: CGPoint, point2: CGPoint) -> CGPoint {
        
        return CGPoint(
            x: point1.x + (point2.x - point1.x) / 2,
            y: point1.y + (point2.y - point1.y) / 2
        )
    }
    
    func dist(to: CGPoint) -> CGFloat {
        return sqrt((pow(self.x - to.x, 2) + pow(self.y - to.y, 2)))
    }
    
    static func midPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2,y: (p1.y + p2.y) / 2)
    }
    
    static func controlPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        
        var controlPoint = CGPoint.midPointForPoints(p1:p1, p2:p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if p1.y < p2.y {
            controlPoint.y += diffY
        } else if p1.y > p2.y {
            controlPoint.y -= diffY
        }
        
        return controlPoint
    }
    
    func adding(x: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y)
    }
    
    func adding(y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: self.y + y)
    }
}

extension CGPath {

    var points: Array<CGPoint> {

        var arrPoints: Array<CGPoint> = []

        /// applyWithBlock lets us examine each element of the CGPath, and decide what to do
         
        self.applyWithBlock { element in

            switch element.pointee.type {
            
            case .moveToPoint, .addLineToPoint:
                arrPoints.append(element.pointee.points.pointee)

            case .addQuadCurveToPoint:
              
                arrPoints.append(element.pointee.points.pointee)
                arrPoints.append(element.pointee.points.advanced(by: 1).pointee)

            case .addCurveToPoint:
                
                arrPoints.append(element.pointee.points.pointee)
                arrPoints.append(element.pointee.points.advanced(by: 1).pointee)
                arrPoints.append(element.pointee.points.advanced(by: 2).pointee)

            default:
                break
            }
         }
            
        return arrPoints
    }
}

extension Path {
    
    static func quadCurvedPathWithPoints(points: Array<Double>, step: CGPoint) -> Path {
    
        var path = Path()
        
        if points.count < 2 {
            return path
        }
        
        guard let offset = points.min() else {
            return path
        }

        var p1 = CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y + 8)
        path.move(to: p1)
        
        for pointIndex in 1..<points.count {
        
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y*CGFloat(points[pointIndex]-offset))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            
            p1 = p2
        }
        return path
    }
    
    static func quadClosedCurvedPathWithPoints(points: Array<Double>, step: CGPoint) -> Path {
        
        var path = Path()
        
        if points.count < 2 {
            return path
        }
        
        guard let offset = points.min() else {
            return path
        }

        path.move(to: .zero)
        
        var p1 = CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y + 8)
        path.addLine(to: p1)
        
        for pointIndex in 1..<points.count {
        
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y*CGFloat(points[pointIndex]-offset))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            
            p1 = p2
        }
        
        path.addLine(to: CGPoint(x: p1.x, y: 0))
        path.closeSubpath()
        
        return path
    }
}
