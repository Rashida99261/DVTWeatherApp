//
//  TempHeaderView.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import SwiftUI

// Header View with image and temperature value fetch from Api
struct tempHeaderView: View {
    var imageName: String
    var temperature: String
    var description: String
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .top)
            VStack {
                VStack(spacing: 0) {
                    Text(temperature)
                        .font(.system(size: 64, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Text(description)
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 64)
            }
            .padding()

        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}
