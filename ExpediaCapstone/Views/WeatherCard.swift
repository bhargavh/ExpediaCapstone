//
//  WeatherCard.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherCard: View {
    var temperature: Int
    var high: Int
    var low: Int
    var city: String
    var country: String
    var weatherCondition: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Image("Trapezium")
            
            HStack{
                VStack(alignment : .leading){
                    Text("\(temperature)°").font(.system(size: 72, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    Text("H:\(high)° L:\(low)°").foregroundColor(.white)
                        .opacity(0.50)
                        .padding(.bottom , 1)
                    
                    Text("\(city), \(country)")
                        .foregroundColor(.white)
                }.padding(.horizontal , 15)
                VStack(alignment: .trailing , spacing: 0){
                    Image(Utils.getWeatherImage(weatherCondition: weatherCondition))
                    Text(weatherCondition)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.trailing , 20)
                }
                .padding(.bottom , 30)
                
            }
            
        }
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        let city = "Coimbatore"
        let temperature = 19
        let low = 18
        let high = 28
        let weatherCondition = "Tornado"
        let country = "India"
        VStack(spacing:0){
            WeatherCard(temperature: temperature, high: high, low: low, city: city, country: country, weatherCondition: weatherCondition)
            WeatherCard(temperature: temperature, high: high, low: low, city: city, country: country, weatherCondition: weatherCondition)
        }
        
    }
}
