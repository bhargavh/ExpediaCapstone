//
//  HouseView.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct HouseView: View {
    var city: String
    var temperature: Int
    var weatherCondition: String
    var high: Int
    var low: Int
    
    var body: some View {
        ZStack(alignment: .top){
            Image("NightSky")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text(city)
                    .font(.system(size: 34, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    
                Text("\(temperature)°")
                    .font(.system(size: 96, weight: .thin, design: .default))
                    .foregroundColor(.white)
                
                Text(weatherCondition)
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .opacity(0.50)
                
                Text("H:\(high)° L:\(low)°")
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
        let temperature = 19
        let low = 18
        let high = 28
        let weatherCondition = "Mostly Clear"
        HouseView(city: city, temperature: temperature, weatherCondition: weatherCondition, high: high, low: low)
    }
}
