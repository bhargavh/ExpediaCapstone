//
//  WeatherList.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherList: View {
    @ObservedObject var forecastsViewModel: ForecastsViewModel
    @State private var searchText = ""
    @State var editMode: EditMode = .inactive
    @State var selection = Set<Int>()
    @State private var delDisabled: Bool = false
    //@State var isEditing = false
    
    var searchResults : [Forecast] {
        return forecastsViewModel.search(searchText)
    }
    
    var body: some View {
        
        NavigationStack {
            List(selection: $selection) {
                ForEach(searchResults) { forecast in
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
                .onDelete(perform: deleteForecasts)
                .deleteDisabled(delDisabled)
                
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
                    //
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            delDisabled.toggle()
                            editMode = editMode == .active ? .inactive : .active
                        }, label: {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.white)
                        })
                        Menu {
                            Button("Delete"){
                                withAnimation{
                                    deleteForecasts()
                                    editMode = .inactive
                                    delDisabled = false
                                }
                            }
                            Button("Refresh"){
                                withAnimation{
                                    forecastsViewModel.refresh()
                                    editMode = .inactive
                                    delDisabled = false
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
        .searchable(text: $searchText , prompt: "search for a city or country")
        
        
        
        
    }
    private func deleteForecasts() {
        for id in selection {
            if let index = forecastsViewModel.forecasts.lastIndex(where: { $0.id == id }) {
                forecastsViewModel.forecasts.remove(at: index)
            }
        }
        selection = Set<Int>()
    }
    
    private func deleteForecasts(offsets: IndexSet) {
        withAnimation {
            forecastsViewModel.forecasts.remove(atOffsets: offsets)
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
    @ObservedObject static var temp: ForecastsViewModel = ForecastsViewModel()
    static var previews: some View {
        WeatherList(forecastsViewModel: temp).preferredColorScheme(.dark)
        
    }
}
