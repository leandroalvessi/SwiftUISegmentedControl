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
    
    @State private var selectSide: SideOfTheImage = .flamengo
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("App Flamengo", selection: $selectSide) {
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
            .navigationTitle("App Flamengo")
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
    case crf = "CRF"
    case flamengo = "Flamengo"
    case urubu = "Urubu"
}

struct ChosenImageView: View {
    var selectSide: SideOfTheImage
    
    var body: some View {
        switch selectSide {
        case .crf:
            ImageView(imageView: "CRF")
        case .flamengo:
            ImageView(imageView: "Flamengo")
        case .urubu:
            ImageView(imageView: "Urubu")
        }
    }
}
