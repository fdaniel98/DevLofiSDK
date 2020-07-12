//
//  Ring.swift
//  DanielDevLofi
//
//  Created by Daniel Licien Estevez  on 7/12/20.
//  Copyright © 2020 Daniel Licien Estevez . All rights reserved.
//

import SwiftUI

struct Ring: View {
    
    @State var percent : CGFloat = 50
    @State var show = true
    var width : CGFloat = 100
    var height : CGFloat = 100
    
    var color1 = Color(#colorLiteral(red: 1, green: 0.02803195454, blue: 0.7414394021, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.7395326495, green: 0.1289254427, blue: 1, alpha: 1))
    
    var body: some View {
        
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return VStack {
            
            Button(action: {
                self.percent = 100
            }){
                HStack {
                    
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading)
                            .frame(width: 250, height: 50)
                            .cornerRadius(25)
                        Text("Press me")
                            .foregroundColor(Color.white)
                    }
                }
                .padding()
                .shadow(color: color2.opacity(0.5), radius: 3 * multiplier, x : 0, y: 3 * multiplier)
            }
            
            ZStack {
                Circle().stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                    .frame(width: width, height: height)
                
                
                Circle()
                    .trim(from: self.show ? progress : 1, to : 1)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
                )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                    .shadow(color: color2.opacity(0.6), radius: 3 * multiplier, x : 0, y: 3 * multiplier)
                
                Text("\(Int(percent))%")
                    .font(.system(size: 14 * multiplier))
                    .fontWeight(.bold)
            }.animation(.spring())
        }
        
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring()
    }
}
