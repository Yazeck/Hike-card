//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Erick Nungaray on 01/05/25.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating:  Bool = false
    
    
    func randomCorinate() -> CGFloat {
        //first step: Random Coordinate
        return CGFloat.random(in: 0...256)
    }
    //2 random size
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 8...80))
    }
    //3 random scale
    func randomScale() -> CGFloat{
        return CGFloat(Float.random(in: 0.1...2.0))
    }
    //4 random speed
    func randomSpeed() -> CGFloat{
        return CGFloat(Float.random(in: 0.05...1.0))
    }
    // 5 random delay
    func randomDelay() -> Double{
        return Double(Double.random(in: 0...2))
    }
    var body: some View {
        ZStack{
            ForEach (0...randomCircle, id: \.self) {
                item in
            Circle( )
                
            .foregroundColor(.white)
            .opacity(0.25)
            .frame(width: randomSize())
            .position(x: randomCorinate(),
                      y: randomCorinate())
            .scaleEffect(isAnimating ? randomScale() : 1)
            .onAppear(perform: {
                withAnimation(
                    .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                    .repeatForever()
                    .speed(randomSpeed())
                    .delay(randomDelay())
                )
                {isAnimating = true}
            })
        }
            
        }//: ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    
    MotionAnimationView()
}
