//
//  Home.swift
//  GameStream
//
//  Created by Field Employee on 8/13/21.
//

import SwiftUI
import UIKit

struct Home: View {
    @State var tabSeleccionado: Int = 2

    var body: some View {


        TabView(selection: $tabSeleccionado){
            Text("Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)

            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            HomeView().tabItem  {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)

            Text(" Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)

    }


    init(){
        UITabBar.appearance().barTintColor = UIColor(Color("tabBarColor"))
        UITabBar.appearance().isTranslucent = true

        print("Iniciando vistas de Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
