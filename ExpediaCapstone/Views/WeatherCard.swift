//
//  WeatherCard.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherCard: View {
    var weatherViewModel: WeatherViewModel
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading){
                Image("Trapezium")
                
                HStack{
                    VStack(alignment : .leading){
                        Text("\(weatherViewModel.temperature)°").font(.system(size: 72, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        Text("H:\(weatherViewModel.high)° L:\(weatherViewModel.low)°").foregroundColor(.white)
                            .opacity(0.50)
                            .padding(.bottom , 1)
                        
                        Text("\(weatherViewModel.city), \(weatherViewModel.country)")
                            .foregroundColor(.white)
                    }.padding(.horizontal , 15)
                    VStack(alignment: .trailing , spacing: 0){
                        Image(weatherViewModel.getWeatherImage())
                        Text(weatherViewModel.weatherCondition)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.trailing , 20)
                    }
                    .padding(.bottom , 30)
                    
                }
                
            }
        }
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        let city = "Coimbatore"
        let country = "India"
        let temperature = 19
        let low = 18
        let high = 28
        let weatherCondition = "Showers"
        let forecast = Forecast(id: 1, temperature: temperature, high: high, low: low, city: city, country: country, weatherCondition: weatherCondition)
        let weatherViewModel = WeatherViewModel(forecast: forecast)
        VStack(spacing:0){
            WeatherCard(weatherViewModel: weatherViewModel)
            WeatherCard(weatherViewModel: weatherViewModel)
        }
        
    }
}
