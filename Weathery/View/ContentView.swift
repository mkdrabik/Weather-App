//
//  ContentView.swift
//  Weathery
//
//  Main content view
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @State var city: String = ""
    @State var unit: String = "fahrenheit"
    @State var isPresented = false
    
    var body: some View {
            NavigationStack {
                HStack {
                    Text("Weathery")
                        .font(.system(size: 35, weight: .medium, design: .default))
                    Image(systemName: "sun.max")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 50)
                    Button{
                       isPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    NavigationLink{
                        UnitView(unit: $unit)
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 30)
                Spacer()
                VStack {
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(viewModel.weatherData) { weather in
                                CityWeatherView(viewModel: CityWeatherVM(model: weather, unit: unit))
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                    }
                }
            .environment(\.colorScheme, .dark)
                .sheet(isPresented: $isPresented) {
                    AddView(viewModel: viewModel, city: $city, viewing: $isPresented)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
