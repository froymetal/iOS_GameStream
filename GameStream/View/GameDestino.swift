//
//  GameDestino.swift
//  GameStream
//
//  Created by Froy on 8/21/21.
//

import SwiftUI
import Kingfisher

struct GameDestino: View {
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var imgUrl: [String]
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()

            VStack {

                Video(url: url)
                    .frame(height: 300)

                ScrollView{
                    //Informacion Video
                    VideoInfo(titulo: titulo,
                              studio: studio,
                              calificacion: calificacion,
                              anoPublicacion: anoPublicacion,
                              descripcion: descripcion,
                              tags: tags)

                    Gallery(imgsUrl: imgUrl)

                }.frame(maxWidth: .infinity)


            }

        }
    }
}

struct GameDestino_Previews: PreviewProvider {
    static var previews: some View {

        GameDestino(url: "ejemplo",titulo:"Sonic The Hedgehog"
                    ,studio:"Sega"
                    ,calificacion:"E+"
                    ,anoPublicacion:"1991"
                    ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
                    ,tags:["plataformas","mascota"]
                    ,imgUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}


struct Gallery: View{
    var imgsUrl: [String]
    let formaGrid = [
        GridItem(.flexible())
    ]

    var body: some View{
        VStack(alignment: .leading){
            Text("GALERIA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)

            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrid, spacing: 8){
                    ForEach(imgsUrl, id: \.self){
                        imgUrl in
                        //Desplegar imagenes del servidor por URL
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.frame( height: 180)
        }.frame(maxWidth: .infinity, alignment: .leading)


    }
}
