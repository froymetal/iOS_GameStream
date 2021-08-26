//
//  FavoritesView.swift
//  GameStream
//
//  Created by Field Employee on 8/26/21.
//

import SwiftUI
import AVKit

struct FavoritesView: View {

    @ObservedObject var todosLosVideojuegos = ViewModel()
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()

            VStack {

                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,9.0)

                ScrollView{
                    ForEach(todosLosVideojuegos.gamesInfo, id: \.self){ juego in
                        VStack(spacing:0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)

                            Text("\(juego.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .background(Color("Boton1"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }



                    }

                }.padding(.bottom,8)

            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
