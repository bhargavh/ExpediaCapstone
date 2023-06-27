//
//  WeatherList.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct WeatherList: View {
    @StateObject var forecastsViewModel: ForecastsViewModel
    @State private var editMode: EditMode = .inactive
    private let constants = Constants()
    
    var body: some View {
        NavigationStack {
            List(selection: $forecastsViewModel.selection) {
                ForEach(forecastsViewModel.searchResults) { forecast in
                    let weatherViewModel = WeatherViewModel(forecast: forecast)
                    WeatherRow(weatherViewModel: weatherViewModel).deleteDisabled(editMode == .active)
                }
                .onDelete(perform: { offsets in
                    withAnimation {
                        forecastsViewModel.deleteSingle(offsets)
                    }
                })
            }
            .id(editMode == .active)
            .environment(\.editMode, $editMode)
            .listStyle(.plain)
            .background{
                BackgroundView()
            }
            .toolbar {
                WeatherToolbar(forecastsViewModel: forecastsViewModel, editMode: $editMode)
            }
        }
        .searchable(text: $forecastsViewModel.searchText , prompt: constants.searchPrompt)
        
    }
}

struct WeatherToolbar: ToolbarContent{
    @ObservedObject var forecastsViewModel: ForecastsViewModel
    @Binding var editMode: EditMode
    let constants = Constants()
    
    var body: some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            Text(constants.title).font(.system(size: 26, weight: .regular, design: .default))
                .foregroundColor(.white)
            
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            WeatherMenu(forecastsViewModel: forecastsViewModel, editMode: $editMode)
        }
    }
}

struct BackgroundView : View {
    private let constants = Constants()
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    Gradient.Stop(color: Color(constants.gradientColor1), location: 0.0268),
                    Gradient.Stop(color: Color(constants.gradientColor2), location: 0.9898)
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.98)
        .ignoresSafeArea()
    }
}

struct WeatherRow: View{
    let weatherViewModel: WeatherViewModel
    var body: some View{
        WeatherCard(weatherViewModel: weatherViewModel).background{
            NavigationLink(
                destination: HouseView(weatherViewModel: weatherViewModel)
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(false)
                ,
                label: {}
            )
            .opacity(0)
            .buttonStyle(PlainButtonStyle())
        }.listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        //.frame(maxHeight: 170)  (No need of this anymore)
    }
}

struct WeatherMenu: View {
    private let constants = Constants()
    @ObservedObject var forecastsViewModel: ForecastsViewModel
    @Binding var editMode: EditMode
    var body: some View {
        HStack {
            Button(action: {
                forecastsViewModel.selection = []
                editMode = editMode == .active ? .inactive : .active
            }, label: {
                Image(systemName: constants.checkmarkCircle)
                    .foregroundColor(.white)
            })
            Menu {
                Button(constants.menuDeleteText){
                    withAnimation{
                        forecastsViewModel.deleteMultiple()
                        editMode = .inactive
                    }
                }
                Button(constants.menuRefreshText){
                    withAnimation{
                        forecastsViewModel.refresh()
                        editMode = .inactive
                    }
                }
                
            } label: {
                Button(action: {
                }, label: {
                    Image(systemName: constants.ellipsisCircle)
                        .foregroundColor(.white)
                })
            }
        }
    }
}





struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper("forecastData.json")
        let temp: ForecastsViewModel = ForecastsViewModel(forecasts: helper.load())
        WeatherList(forecastsViewModel: temp).preferredColorScheme(.dark)
        
    }
}


