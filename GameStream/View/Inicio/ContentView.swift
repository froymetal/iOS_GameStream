//
//  ContentView.swift
//  GameStream
//
//  Created by Froy on 8/9/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        //Image("Pantalla1").resizable()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {


            ZStack {
                // Color de fondo
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    . ignoresSafeArea()

                VStack{
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding( .bottom, 60)

                    InicioYRegistroView()


                }

            }.navigationBarHidden(true)
        }
    }
}



//Vista del Inicio y Registro
struct InicioYRegistroView: View{
    @State var tipoInicioSesion: Bool = true

    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()

                Button("REGÍSTRATE"){
                    tipoInicioSesion = false
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()

            }

            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
            }
        }
    }

}






