//
//  centerTemperatureView.swift
//  DVTWeatherApp
//  Created by Rashida on 26/01/25.
//

import SwiftUI
// Temperature View to display min , max and current values fetch from Api
struct centerTemperatureView: View {
    var minTemperature: String
    var curTemperature: String
    var maxTemperature: String

    var body: some View {
        HStack {
            VStack {
                Text(minTemperature)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Min")
                    .font(.system(size: 14, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            VStack {
                Text(curTemperature)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text("Current")
                    .font(.system(size: 14, weight: .light, design: .default))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            VStack {
                Text(maxTemperature)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("Max")
                    .font(.system(size: 14, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .frame(height: 60)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
                .padding(.top, 60)
        )
    }
}

