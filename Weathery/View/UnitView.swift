//
//  UnitView.swift
//  Weathery
//
//  Created by Mason Drabik on 11/17/23.
//

import SwiftUI

struct UnitView: View {
    @Binding var unit: String
    
    var body: some View {
        Form{
            Section("Select Unit"){
                Picker("Unit", selection: $unit){
                    Text("fahrenheit").tag("fahrenheit")
                    Text("celcius").tag("celcius")
                    Text("kelvin").tag("kelvin")
                    
                }
            }
        }
    }
}

#Preview {
    UnitView(unit: .constant(""))
}
