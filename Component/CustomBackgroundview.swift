//
//  CustomBackgroundview.swift
//  Hike
//
//  Created by Erick Nungaray on 10/04/25.
//

import SwiftUI

struct CustomBackgroundview: View {
    var body: some View {
        ZStack{
            //3 Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            //2 light
            Color.customGrayLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.8)
            //1 surface
            LinearGradient(colors: [.customGreenLight,.customGrayMedium], startPoint: .top,
                       endPoint: .bottom
        )
        .cornerRadius(40)
    }
        
    }
       
}

#Preview {
    CustomBackgroundview()
        .padding()
}
