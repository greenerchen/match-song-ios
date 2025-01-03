//
//  Stubs.swift
//  LyricsPiecesTests
//
//  Created by Greener Chen on 2024/8/30.
//

import Foundation
import ShazamKit
@testable import ChordSync

// MARK: - ShazamKit related

let matchedMediaItemStub: SHMatchedMediaItem =
    SHMatchedMediaItem(properties: [
        SHMediaItemProperty.appleMusicID: 1474230008,
        SHMediaItemProperty.appleMusicURL: "https://music.apple.com/tw/album/way-maker-live/1474229914?i=1474230008&l=en-GB&itscg=30201&itsct=bglsk",
        SHMediaItemProperty.artist: "Leeland",
        SHMediaItemProperty.artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/8a/c0/9c/8ac09cfb-b243-fa27-35e7-0cf49cf49f46/0000768724453.jpg/800x800bb.jpg")!,
        SHMediaItemProperty.creationDate: "2024-08-30 06:59:42 +0000",
        SHMediaItemProperty.explicitContent: 0,
        SHMediaItemProperty.frequencySkew: 0,
        SHMediaItemProperty.genres: [
        ],
        SHMediaItemProperty.ISRC: "US25L1900253",
        SHMediaItemProperty.matchOffset: 222.1854375,
        SHMediaItemProperty.shazamID: 479874710,
        SHMediaItemProperty.subtitle: "Leeland",
        SHMediaItemProperty.title: "Way Maker (Live)",
        SHMediaItemProperty.webURL: "https://www.shazam.com/track/479874710/way-maker-live?co=TW&offsetInMilliseconds=222185&timeSkew=-6.454587E-4&trackLength=503239&startDate=2024-08-30T06:59:42.028Z"
    ])

let matchedMediaItemNoTitleArtistStub: SHMatchedMediaItem =
    SHMatchedMediaItem(properties: [
        SHMediaItemProperty.appleMusicID: 1474230008,
        SHMediaItemProperty.appleMusicURL: "https://music.apple.com/tw/album/way-maker-live/1474229914?i=1474230008&l=en-GB&itscg=30201&itsct=bglsk",
        SHMediaItemProperty.artworkURL: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/8a/c0/9c/8ac09cfb-b243-fa27-35e7-0cf49cf49f46/0000768724453.jpg/800x800bb.jpg",
        SHMediaItemProperty.creationDate: "2024-08-30 06:59:42 +0000",
        SHMediaItemProperty.explicitContent: 0,
        SHMediaItemProperty.frequencySkew: 0,
        SHMediaItemProperty.genres: [
        ],
        SHMediaItemProperty.ISRC: "US25L1900253",
        SHMediaItemProperty.matchOffset: 222.1854375,
        SHMediaItemProperty.shazamID: 479874710,
        SHMediaItemProperty.subtitle: "Leeland",
        SHMediaItemProperty.webURL: "https://www.shazam.com/track/479874710/way-maker-live?co=TW&offsetInMilliseconds=222185&timeSkew=-6.454587E-4&trackLength=503239&startDate=2024-08-30T06:59:42.028Z"
    ])

let matchedMediaItemNoISRCStub: SHMatchedMediaItem =
    SHMatchedMediaItem(properties: [
        SHMediaItemProperty.appleMusicID: 1474230008,
        SHMediaItemProperty.appleMusicURL: "https://music.apple.com/tw/album/way-maker-live/1474229914?i=1474230008&l=en-GB&itscg=30201&itsct=bglsk",
        SHMediaItemProperty.artist: "Leeland",
        SHMediaItemProperty.artworkURL: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/8a/c0/9c/8ac09cfb-b243-fa27-35e7-0cf49cf49f46/0000768724453.jpg/800x800bb.jpg",
        SHMediaItemProperty.creationDate: "2024-08-30 06:59:42 +0000",
        SHMediaItemProperty.explicitContent: 0,
        SHMediaItemProperty.frequencySkew: 0,
        SHMediaItemProperty.genres: [
        ],
        SHMediaItemProperty.matchOffset: 222.1854375,
        SHMediaItemProperty.shazamID: 479874710,
        SHMediaItemProperty.subtitle: "Leeland",
        SHMediaItemProperty.title: "Way Maker (Live)",
        SHMediaItemProperty.webURL: "https://www.shazam.com/track/479874710/way-maker-live?co=TW&offsetInMilliseconds=222185&timeSkew=-6.454587E-4&trackLength=503239&startDate=2024-08-30T06:59:42.028Z"
    ])

let mediaItemsStub: [SHMatchedMediaItem] = [matchedMediaItemStub]

let matchStub = SHMatch(coder: FakeSHMatchCoder())

let dummySignature = SHSignature()

let matchedShazamResultStub = ShazamMatchResult(match: matchStub)
let noMatchedShazamResultStub = ShazamMatchResult(match: nil)

// MARK: MusixmatchAPI related

let responseOKStub = HTTPURLResponse(
    url: URL(string: "https://anyurl.com")!,
    statusCode: 200,
    httpVersion: "1.1",
    headerFields: nil
)!

// MARK: Shared stubs

func anyNSError() -> NSError {
    NSError(domain: "com.any.error", code: 101)
}

func noConnectivityNSError() -> NSError {
    NSError(
        domain: URLError.errorDomain,
        code: URLError.notConnectedToInternet.rawValue
    )
}

let trackGetResponseStringStub = "{\"message\":{\"body\":{\"track\":{\"track_id\":100001,\"commontrack_id\":200001,\"artist_name\":\"Leeland\",\"track_name\":\"Way Maker\",\"explicit\":0,\"subtitle_id\":234567,\"has_lyrics\":1,\"has_subtitles\":1,\"lyrics_id\":123456,\"lyrics_copyright\":\"Copyright\",\"track_share_url\":\"link\",\"lyrics_body\":\"You are here, moving in our midst\",\"restricted\":0}},\"header\":{\"status_code\":200}}}"

let trackSearchResponseStringStub = "{\"message\":{\"header\":{\"status_code\":200},\"body\":{\"track_list\":[{\"track\":{\"has_lyrics\":1,\"lyrics_body\":\"You are here, moving in our midst\",\"subtitle_id\":234567,\"commontrack_id\":200001,\"lyrics_id\":123456,\"has_subtitles\":1,\"explicit\":0,\"track_name\":\"Way Maker\",\"track_id\":100001,\"lyrics_copyright\":\"Copyright\",\"restricted\":0,\"track_share_url\":\"link\",\"artist_name\":\"Leeland\"}}]}}}"

let trackSearchNoTrackResponseStringStub = "{\"message\":{\"header\":{\"status_code\":200},\"body\":{\"track_list\":[]}}}"

let trackLyricsGetResponseStringStub = "{\"message\":{\"header\":{\"status_code\":200},\"body\":{\"lyrics\":{\"lyrics_body\":\"Heart beats fast\",\"lyrics_copyright\":\"Copyright powered by musixmatch\",\"script_tracking_url\":\"http:\\/\\/a.com\",\"lyrics_id\":1001,\"explicit\":0}}}}"
