//
//  AddView.swift
//  Weathery
//
//  Created by Mason Drabik on 11/16/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var viewModel: WeatherDataViewModel
    @Binding var city: String
    @Binding var viewing: Bool
    @State var txt = ""
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Add a City"){
                    TextField("Enter a City Name", text: $txt)
                        .onSubmit {
                            viewing = false
                            city = txt
                            viewModel.getWeather(cityString: city)
                            txt = ""
                        }
                }
            }
            .toolbar{
                Button("Close"){
                    viewing = false
                    city = txt
                    viewModel.getWeather(cityString: city)
                    txt = ""
                }
        }
        }
    }
}

