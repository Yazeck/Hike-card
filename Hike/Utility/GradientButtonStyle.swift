//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Erick Nungaray on 01/05/25.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional Statement
                // A: whan user pressed the button
                //B :when button is not pressed
                configuration.isPressed ?
    
                LinearGradient(colors:[.customGrayLight,.customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                    
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ],startPoint: .top,
                    endPoint: .bottom
                )
                
            )
            .cornerRadius(40)
    }
}
