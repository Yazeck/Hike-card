//
//  CardView.swift
//  Hike
//
//  Created by Erick Nungaray on 10/04/25.
//

import SwiftUI

struct CardView: View {
    //properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
     
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("action: RandomN Generated\(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Imagen cambiada a: image-\(imageNumber)")
    }
    var body: some View{
        ZStack{
            CustomBackgroundview()
            VStack{
                //Header
                VStack(alignment: .leading){
                    HStack{
                    Text("Hiking")
                        .fontWeight(.black)
                        .font(.system(size: 52))
                        .fixedSize()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGrayLight,.customGrayMedium],
                                startPoint: .top, endPoint: .bottom)
                            
                        )
                        
                        Button{
                            //Action: show a sheet
                            print("the button was pressed")
                            isShowingSheet.toggle()
                            
                           

                            
                        }label:
                        {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                        }
                    }
                    Text("Fun and ejoiable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
            }
                .padding(.horizontal, 30)
                //Main content
                
            ZStack{
                
                CustomCircleView()
                Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber )
                    
            }//ZStack2
                //Footer
                Button{
                    //action: Generate a random button
                    randomImage()
                    print("New image number: \(imageNumber)")
                    print("the button has pressed")
                }label:{
                    Text("Explore More")
                }.buttonStyle(.borderedProminent)
                    .tint(.indigo)
                    .fontWeight(.heavy)
                    .foregroundStyle(LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium
                        ],startPoint: .top,
                        endPoint: .bottom
                    ))
                    .shadow(color: .black.opacity(0.2), radius: 0.25, x: 1, y: 2)
                    .cornerRadius(40)
        }
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ],startPoint: .top,
                    endPoint: .bottom
                )
                
            )
            .buttonStyle(GradientButton())
    }//ZStack1
        .frame(width: 320, height: 570)
        }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
    
}
