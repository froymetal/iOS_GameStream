//
//  SubModuleHome.swift
//  GameStream
//
//  Created by Field Employee on 8/19/21.
//

import SwiftUI
import AVKit

struct SubModuleHome: View{
    @State var textoBusqueda = ""
    @State var isGameInfoEmpty = false


    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]



//    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
//        @State var isPlayerActive = false
//        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]

    var body: some View{


        VStack {
            ////////////////////////
            HStack{
                //Buscador
                Button(action: {
                    //Método de buscar
                    //busqueda()
                    watchGame(name: textoBusqueda)
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                }

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

            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)

            ZStack{

                Button(action: {
                    watchGame(name: "The Witcher 3")
                }, label: {
                    VStack(spacing: 0){
                        Image("thewitcher")
                            .resizable()
                            .scaledToFill()
                        Text("Witcher3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("Boton1"))
                    }
                })

                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)

            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)

            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Boton1"))
                                .frame(width: 160, height: 90)

                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)

                        }
                    })

                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Boton1"))
                                .frame(width: 160, height: 90)

                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)

                        }
                    })

                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Boton1"))
                                .frame(width: 160, height: 90)

                            Image("OpenWorld")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)

                        }
                    })
                }
            }

            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        watchGame(name: "Abzu")
                    },
                    label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })

                    Button(action: {
                        watchGame(name: "Crash")
                    },
                    label: {
                        Image("Crash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })

                    Button(action: {
                        watchGame(name: "DeathStranding")
                    },
                    label: {
                        Image("DeathStranding")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                }
            }

        }

        NavigationLink(
            destination: GameDestino(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgUrl: imgsUrl)
            ,
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })

        
        
}
    func watchGame(name: String ){
        juegoEncontrado.search(gameName: name)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){

            print("Cantidad  Elementos encontrados: \(juegoEncontrado.gameInfo.count) ")

            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages

                isGameViewActive = true


            }

        }
    }

}

