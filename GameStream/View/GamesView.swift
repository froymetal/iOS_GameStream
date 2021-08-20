//
//  GamesView.swift
//  GameStream
//
//  Created by Field Employee on 8/19/21.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var descripcion: String = ""
    @State var anoPublicacion: String = ""
    @State var tags: [String] = [""]
    @State var imgUrl: [String] = [""]
    //Forma del Lazy grid
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {


        ZStack{
            Color("Marine").ignoresSafeArea()

            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 6, bottom: 64, trailing: 0))

                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                            juego in

                            Button(action: {
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imgUrl = juego.galleryImages

                                print("Pulse el juego: \(titulo)")
                            }, label: {
                                Text("juego: \(juego.title)")

                                
                            })
                            
                        }
                    }

                }
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer elemento del JSON: \(todosLosVideojuegos.gamesInfo[0])")
                    print("TItulo del primer videojuego del JSON: \(todosLosVideojuegos.gamesInfo[0].title)")
                }

            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
