//
//  WeatherCard.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherCard: View {
    let weatherViewModel: WeatherViewModel
    private let constants = Constants()
    
    var body: some View {
        HStack {
            ZStack(alignment: .center){
                Image(constants.weatherCardBackground).resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack(alignment:.top){
                    VStack(alignment : .leading){
                        Text(weatherViewModel.formattedTemperature).font(.system(size: 65, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        Text(weatherViewModel.formattedHiLo).foregroundColor(.white)
                            .opacity(0.50)
                            .padding(.bottom , 1)
                        
                        Text(weatherViewModel.location)
                            .foregroundColor(.white)
                    }
                    .padding(.top , 20)
                    .padding(.leading, 10)
                    Spacer()
                    
                    VStack(alignment: .center , spacing: 0){
                        Image(weatherViewModel.getWeatherImage())
                            
                        Text(weatherViewModel.weatherCondition)
                           .foregroundColor(.white)
                           .font(.subheadline)
                           .padding(.bottom , 20)
                            
                    }
                    
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
        VStack{
            WeatherCard(weatherViewModel: weatherViewModel)
            WeatherCard(weatherViewModel: weatherViewModel)
        }
        
    }
}
