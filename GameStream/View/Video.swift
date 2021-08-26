//
//  Video.swift
//  GameStream
//
//  Created by Field Employee on 8/21/21.
//

import SwiftUI
import AVKit

struct Video: View{
    var url: String
    var body: some View{

        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()

    }
}
