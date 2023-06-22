//
//  WeatherList.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherList: View {
    @ObservedObject var forecastsViewModel: ForecastsViewModel
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        
        NavigationStack {
            List(selection: $forecastsViewModel.selection) {
                ForEach(forecastsViewModel.searchResults) { forecast in
                    NavigationLink(
                        destination: HouseView(weatherViewModel: WeatherViewModel(forecast : forecast))
                            .navigationBarHidden(false)
                            .navigationBarBackButtonHidden(false)
                        ,
                        label: {
                            WeatherCard(weatherViewModel: WeatherViewModel(forecast : forecast))
                                .frame(height: 170)
                            
                        }
                    ).listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        
                    
                }
                .onDelete(perform: {
                    (offset) in
                    withAnimation {
                        forecastsViewModel.deleteSingle(offset)
                    }
                })
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
                    HStack {
                        Button(action: {
                            forecastsViewModel.selection = []
                            editMode = editMode == .active ? .inactive : .active
                        }, label: {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.white)
                        })
                        Menu {
                            Button("Delete"){
                                withAnimation{
                                    forecastsViewModel.deleteMultiple()
                                    editMode = .inactive
                                }
                            }
                            Button("Refresh"){
                                withAnimation{
                                    forecastsViewModel.refresh()
                                    editMode = .inactive
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
        }
        .searchable(text: $forecastsViewModel.searchText , prompt: "search for a city or country")
        
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
    @ObservedObject static var temp: ForecastsViewModel = ForecastsViewModel()
    static var previews: some View {
        WeatherList(forecastsViewModel: temp).preferredColorScheme(.dark)
        
    }
}
