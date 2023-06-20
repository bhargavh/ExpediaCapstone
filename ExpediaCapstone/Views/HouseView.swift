//
//  HouseView.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct HouseView: View {
    var forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .top){
            Image("NightSky")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text(forecast.city)
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    
                Text("\(forecast.temperature)°")
                    .font(.system(size: 96, weight: .thin, design: .default))
                    .foregroundColor(.white)
                
                Text(forecast.weatherCondition)
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .opacity(0.50)
                
                Text("H:\(forecast.high)° L:\(forecast.low)°")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    
                Image("House")
                
            }
            .padding(.vertical , 35)
        }
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        let city = "Coimbatore"
        let country = "India"
        let temperature = 19
        let low = 18
        let high = 28
        let weatherCondition = "Showers"
        let forecast = Forecast(id: 1, temperature: temperature, high: high, low: low, city: city, country: country, weatherCondition: weatherCondition)
        HouseView(forecast: forecast)
    }
}
