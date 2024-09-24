//
//  TrackActionsView.swift
//  LyricsPieces
//
//  Created by Greener Chen on 2024/9/13.
//

import SwiftUI
import ShazamKit
import MusixmatchAPI

struct TrackActionsView: View {
    @Environment(\.openURL) var openURL
    
    @State var isPresented: Bool = false
    let vm: LyricsViewModel
    
    let song: SHMatchedMediaItem
    
    init(song: SHMatchedMediaItem) {
        self.song = song
        self.vm = LyricsViewModel(song: song)
    }
    
    var body: some View {
        HStack {
            // MARK: Action: Read Lyrics
            Button(action: {
                Task {
                    await fetchLyrics()
                }
            }, label: {
                Label("Read Lyrics", systemImage: "music.note.list")
            })
            .frame(height: 44)
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $isPresented,
                   content: {
                if vm.hasLyrics, !vm.restricted {
                    WebView(url: nil, htmlString: vm.getMessage())
                        .presentationDetents([.medium, .large])
                } else {
                    Text(vm.getMessage())
                        .presentationDetents([.medium, .large])
                }
                
            })
            
            // MARK: Action: Listen on Apple Music
            Image("apple.music.badge")
                .resizable()
                .frame(width: 140, height: 44)
                .onTapGesture {
                    guard let appleMusicURL = song.appleMusicURL else {
                        return
                    }
                    openURL(appleMusicURL)
                }
        }
    }
    
    func fetchLyrics() async {
        await vm.fetchTrack()
        await vm.fetchLyrics()
        self.isPresented.toggle()
    }
}

//#Preview {
//    TrackActionsView(song: songStub)
//}
