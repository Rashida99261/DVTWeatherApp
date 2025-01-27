//
//  ItemView.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.

import SwiftUI
// View to display forecast data
struct itemView: View {
    var day: String
    var icon: String
    var temperature: String
    var body: some View {
        HStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text("\(temperature)°")
                .font(.headline)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .frame(height: 40)
    }
}

