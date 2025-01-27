//
//  dashboardView.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import SwiftUI

struct dashboardView: View {
    
    @StateObject private var viewModel = WeatherViewModel(
        weatherService: WeatherServices(),
        locationService: LocationService()
    )

    @State private var isLoading = true
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .padding()
            }
            else {
                Color(viewModel.backgroundColor)
                .ignoresSafeArea()
                VStack(spacing: 20) {
                    tempHeaderView(
                        imageName: viewModel.backgroundImage,
                        temperature: viewModel.currentTemperature,
                        description: viewModel.weatherCondition
                    )
                    .frame(height: 300)
                    ScrollView(.vertical, showsIndicators: false) {
                        centerTemperatureView(minTemperature:
                                                viewModel.minimumTemperature,
                                              curTemperature: viewModel.currentTemperature,
                                              maxTemperature: viewModel.maximumTemperature)
                        .background(Color(viewModel.backgroundColor))
                        VStack(spacing: 4) {
                            ForEach(viewModel.forecastList, id: \.day) { forecast in
                                itemView(
                                    day: forecast.day, icon: viewModel.itemImage,
                                    temperature: "\(forecast.temperature)"
                                )
                                .background(Color(viewModel.backgroundColor))
                            }
                        }
                        .padding(.horizontal)
                    }
                    .disabled(true)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    dashboardView()
}
