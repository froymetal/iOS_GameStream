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

                HStack{
                    //Buscador
                    Button(action: {
                        //Método de buscar
                        busqueda()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                    })

                    ZStack(alignment: .leading){
                        if textoBusqueda.isEmpty{
                            Text("Buscar video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }

                        TextField("", text: $textoBusqueda)
                            .foregroundColor(.white)
                    }
                }
                .padding([.top, .leading, .bottom], 11)
                .background(Color("Boton1"))
                .clipShape(Capsule())
                SubModuleHome()
            }.padding(.horizontal,18)

        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)


    }


    func busqueda(){
        print("Buscar \(textoBusqueda)")
    }
//    SubModuleHome()
}




