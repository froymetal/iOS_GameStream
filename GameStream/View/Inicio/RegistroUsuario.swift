//
//  RegistroUsuario.swift
//  GameStream
//
//  Created by Field Employee on 8/11/21.
//

import SwiftUI

struct RegistroView: View{

    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var confirmaContraseña: String = ""

    var body: some View{
        ScrollView {

            VStack(alignment: .center){
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Puedes modificarla o elegirla después")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .padding(.bottom)

                Button(action: { tomarFoto() }, label: {
                    ZStack {
                        Image("perfilEjm")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)

                        Image(systemName: "camera")
                            .foregroundColor(.white)


                    }
                }).padding(.bottom, 10.0)
            }


            VStack(alignment: .leading) {
                Text("Correo Electrónico *")
                    .foregroundColor(Color("Dark-Cian"))
                    .frame(width: 300, alignment: .leading)

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

                Text("Contraseña *")
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


                Text("Confirme Contraseña *")
                    .foregroundColor(.white)

                ZStack(alignment: .leading){
                    if contraseña.isEmpty{
                        Text("confirma tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("aca", text: $confirmaContraseña)
                        .foregroundColor(.white)
                }


                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)



                Button(action: {registrate()}, label: {
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("Dark-Cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                        .padding()
                })
            }.padding(.horizontal,40.0)

            VStack{
                Text("Regístrate con redes sociales")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 20))

                HStack{
                    Button(action: {registroFacebook()}, label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Boton1")))
                    })

                    Button(action: {registroTweeter()}, label: {
                        Text("Tweeter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Boton1")))
                    })
                }
            }
        }
    }
}


func tomarFoto(){
print("Toma foto")

}

func registrate(){
    print("Te registraste")

}

func registroFacebook(){
    print("fb")
}

func registroTweeter(){
    print("tw")
}
