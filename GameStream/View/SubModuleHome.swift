//
//  SubModuleHome.swift
//  GameStream
//
//  Created by Field Employee on 8/19/21.
//

import SwiftUI
import AVKit

struct SubModuleHome: View{
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]

    var body: some View{


        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)

            ZStack{

                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    VStack(spacing: 0){
                        Image("thewitcher")
                            .resizable()
                            .scaledToFill()
                        Text("Witcher3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("Button1"))
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
                        url = urlVideos[1]
                        isPlayerActive = true
                    },
                    label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })

                    Button(action: {
                        url = urlVideos[2]
                        isPlayerActive = true
                    },
                    label: {
                        Image("Crash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })

                    Button(action: {
                        url = urlVideos[2]
                        isPlayerActive = true
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
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300)
            ,
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            })

        
        
}

}

