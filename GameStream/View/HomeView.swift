//
//  HomeView.swift
//  GameStream
//
//  Created by Froy on 8/14/21.
//

import SwiftUI

struct HomeView: View {

    @State var textoBusqueda = ""
    var body: some View{
    
        ZStack {
            //Color de fondo ignorando el safe area
            Color("Marine").ignoresSafeArea()

            VStack {
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding( .horizontal, 11)
                    //.padding(.init(.top, 10))
                
                SubModuleHome()
            }.padding(.horizontal,18)

        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)


    }
}




