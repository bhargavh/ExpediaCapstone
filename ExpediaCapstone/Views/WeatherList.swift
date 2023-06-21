//
//  WeatherList.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherList: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    @State private var searchText = ""
    @State var editMode: EditMode = .inactive
    //@State var isEditing = false
    
    var searchResults : [Forecast] {
        return forecastViewModel.search(searchText)
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults) { forecast in
                    NavigationLink(
                        destination: HouseView(forecast: forecast)
                            .navigationBarHidden(false)
                            .navigationBarBackButtonHidden(false)
                        ,
                        label: {
                            WeatherCard(forecast: forecast)
                                .frame(height: 170)
                            
                        }
                    ).listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    
                }
                .onDelete(perform: deleteForecasts)
            }
            .background{
                BackgroundView()
            }
            .environment(\.editMode, $editMode)
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Weather").font(.system(size: 26, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Delete"){
                            editMode = .active
                        }
                        Button("Refresh"){
                            withAnimation{
                                forecastViewModel.refresh()
                            }
                        }
                        
                    } label: {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(.white)
                        })
                    }
                    
                }
            }
        }
        .searchable(text: $searchText , prompt: "search for a city or country")
        
        
        
        
    }
    
    func deleteForecasts(offsets: IndexSet) {
        withAnimation {
            forecastViewModel.forecasts.remove(atOffsets: offsets)
            editMode = .inactive
        }
    }
}

struct BackgroundView : View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    Gradient.Stop(color: Color("GradientColor1"), location: 0.0268),
                    Gradient.Stop(color: Color("GradientColor2"), location: 0.9898)
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.98)
        .ignoresSafeArea()
    }
}


struct WeatherList_Previews: PreviewProvider {
    @ObservedObject static var temp: ForecastViewModel = ForecastViewModel()
    static var previews: some View {
        WeatherList(forecastViewModel: temp).preferredColorScheme(.dark)
        
    }
}
