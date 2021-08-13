//
//  InicioSesion.swift
//  GameStream
//
//  Created by Froy on 8/11/21.
//

import SwiftUI

struct InicioSesionView: View{
    @State var correo = ""
    @State var contraseña = ""
    @State var isPantallaHomeActive: Bool = false
    var body: some View{
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico")
                    .foregroundColor(Color("Dark-Cian"))

                ZStack(alignment: .leading){
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)

                Text("Contraseña")
                    .foregroundColor(.white)

                ZStack(alignment: .leading){
                    if contraseña.isEmpty{
                        Text("escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("aca", text: $contraseña)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)

                Text("Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)

                Button(action: {iniciarSesion()}, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("Dark-Cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                })
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 20))

                HStack{
                    Button(action: {loginFacebook()}, label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Boton1")))
                    })

                    Button(action: {loginTweeter()}, label: {
                        Text("Tweeter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Boton1")))
                    })
                }

            }.padding(.horizontal,77.0)
        }

        NavigationLink(
            destination: Home(),
            isActive: $isPantallaHomeActive,
            label: {
                EmptyView()
            })
    }

    // Función para Iniciar sesión
    func iniciarSesion(){
        isPantallaHomeActive = true
    }

}



func loginFacebook(){
    print("fb")
}

func loginTweeter(){
    print("tw")
}
