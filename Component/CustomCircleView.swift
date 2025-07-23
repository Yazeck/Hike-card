//
//  CustomCircleView.swift
//  Hike
//
//  Created by Erick Nungaray on 01/05/25.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium, .customSalmonLight],
                        startPoint: isAnimateGradient ? .topLeading :.bottomLeading , endPoint: isAnimateGradient ? .bottomLeading :.topTrailing
                    )
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
