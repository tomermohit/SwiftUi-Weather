//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Mohit Tomer on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: PROPERTIES
    
    @State private var isNightMode: Bool = false
    
    var body: some View {
        
        // MARK: BACKGROUND
        
        ZStack {
            BackgroundView(isNightMode: isNightMode)
            
            // MARK: MAIN BODY
            
            VStack {
                CityTitleView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNightMode ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                .padding(.bottom, 100)
                
                // MARK: BUTTON
                
                Button {
                    self.isNightMode.toggle()
                } label: {
                    BottomButton(title: "Change Day Time", textColor: isNightMode ? Color.black : Color.white, backgroundColor: isNightMode ? Color.white : Color.mint)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}


struct BackgroundView: View {
    
    // MARK: PROPERTIES
    
     var isNightMode: Bool
    
    // MARK: BODY
    
    var body: some View {
//        LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNightMode ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}


struct CityTitleView: View {
    
    // MARK: PROPERTIES
    
    var cityName: String
    
    // MARK: BODY
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    // MARK: PROPERTIES
    
    var imageName: String
    var temperature: Int
    
    // MARK: BODY
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .foregroundStyle(.white)
                .font(.system(size: 70, weight: .medium))
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    
    // MARK: PROPERTIES
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    // MARK: BODY
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .resizable()
                //.renderingMode(.original)
                .symbolRenderingMode(.multicolor)
               // .foregroundColor(.pink)
               // .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .medium, design: .default))
        }
    }
}
