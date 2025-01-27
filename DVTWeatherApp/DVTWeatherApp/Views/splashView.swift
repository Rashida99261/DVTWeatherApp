//
//  SplashView.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import SwiftUI

// Splash screen view
struct splashView: View {
    
    @State private var isActive = false
    var body: some View {
        ZStack {
            Color("Sunny")
                .edgesIgnoringSafeArea(.all)
            VStack {
                if isActive {
                    dashboardView()
                } else {
                    VStack {
                        Text("DVT Weather App")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    splashView()
}
