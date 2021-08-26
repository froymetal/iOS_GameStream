//
//  VideoInfo.swift
//  GameStream
//
//  Created by Froy on 8/21/21.
//

import SwiftUI

struct VideoInfo: View {
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var body: some View {
        VStack(alignment: .leading){
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)

            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)

                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)

                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)

            }

            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)

            HStack{
                ForEach(tags, id:\.self){
                    tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }

        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

//struct VideoInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoInfo()
//    }
//}
