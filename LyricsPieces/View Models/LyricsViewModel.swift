//
//  LyricsViewModel.swift
//  LyricsPieces
//
//  Created by Greener Chen on 2024/9/11.
//

import Foundation

struct LyricsViewModel {
    var trackName: String
    var artistName: String
    var hasLyrics: Bool
    var lyricsBody: String?
    var lyricsCopyright: String?
    var backlinkUrl: String?
    var scriptTrackingUrl: String?
    
    func makeHtmlString() -> String {
        let lyricsBodyHtml = lyricsBody?.replacingOccurrences(of: "\n", with: "<br/>") ?? ""
        let html = lyricsHtmlTemplate
            .replacingOccurrences(of: "{{script_tracking_url}}", with: scriptTrackingUrl ?? "")
            .replacingOccurrences(of: "{{track_name}}", with: trackName)
            .replacingOccurrences(of: "{{track_artist}}", with: artistName)
            .replacingOccurrences(of: "{{lyrics_body}}", with: lyricsBodyHtml)
            .replacingOccurrences(of: "{{track_copyright}}", with: lyricsCopyright ?? "")
            .replacingOccurrences(of: "{{backlink_url}}", with: backlinkUrl ?? "")
        return html
    }
}

private let lyricsHtmlTemplate: String = """
<!DOCTYPE html>
<html>
<head>
<title>Lyrics</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="{{script_tracking_url}}"></script>
<style>
body {font-family: "Times New Roman", Georgia, Serif;}
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 5px;
}
</style>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
    <a href="#home" class="w3-bar-item w3-button">Lyrics</a>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#lyrics" class="w3-bar-item w3-button">{{track_name}}</a>
      <a href="#copyright" class="w3-bar-item w3-button">Copyright</a>
    </div>
  </div>
</div>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

  <!-- Lyrics Section -->
  <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col m6 w3-padding-large">
      <h1 class="w3-center">{{track_name}}</h1><br>
      <h5 class="w3-center">{{track_artist}}</h5>
      <p class="w3-large">{{lyrics_body}}</p>
    </div>
  </div>
  
  <hr>
  
  <!-- Copyright Section -->
  <div class="w3-container w3-padding-64" id="copyright">
    <h1>Copyright</h1><br>
    <p>{{track_copyright}}</p>
  </div>
  
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p>Powered by <a href="{{backlink_url}}" title="W3.CSS" target="_blank" class="w3-hover-text-green">Musixmatch</a></p>
</footer>

</body>
</html>
"""

