//
//  ContentView.swift
//  SwiftUISegmentedControl
//
//  Created by Leandro Alves da Silva on 15/06/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
    }
    
    @State private var selectSide: SideOfTheImage = .dark
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Selecao de Imagem", selection: $selectSide) {
                    ForEach(SideOfTheImage.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenImageView(selectSide: selectSide)
                Spacer()
            }
            .navigationTitle("Seleção de Imagem")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageView: View {
    var imageView: String
    
    var body: some View {
        Image(imageView)
            .resizable()
            .frame(width: 300, height: 400)
            .shadow(color: .white, radius: 100)
    }
}

enum SideOfTheImage: String, CaseIterable {
    case light = "Light"
    case grey = "Grey"
    case dark = "Dark"
}

struct ChosenImageView: View {
    var selectSide: SideOfTheImage
    
    var body: some View {
        switch selectSide {
        case .light:
            ImageView(imageView: "CRF")
        case .grey:
            ImageView(imageView: "Flamengo")
        case .dark:
            ImageView(imageView: "Urubu")
        }
    }
}
