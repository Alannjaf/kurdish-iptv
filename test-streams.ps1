$urls = @(
    @("Rudaw TV", "https://svs.itworkscdn.net/rudawlive/rudawlive.smil/playlist.m3u8"),
    @("Kurdistan 24", "https://d1x82nydcxndze.cloudfront.net/live/index.m3u8"),
    @("Kurdsat News", "https://hlspackager.akamaized.net/live/DB/KURDSAT_NEWS/HLS/KURDSAT_NEWS.m3u8"),
    @("NRT TV", "https://media.streambrothers.com:1936/8226/8226/playlist.m3u8"),
    @("iNEWS TV", "https://live.i-news.tv/hls/stream.m3u8"),
    @("Kurdistan TV", "https://5a3ed7a72ed4b.streamlock.net/live/SMIL:myStream.smil/playlist.m3u8"),
    @("Kurdsat", "https://iko-live.akamaized.net/KurdsatTV/master.m3u8"),
    @("Kurdsat Backup", "http://trn03.bozztv.com/gin-kurdsat/index.m3u8"),
    @("Waar TV", "https://live.kwikmotion.com/waarmedialive/waarmedia.smil/waarmediapublish/waarmedia_source/chunks.m3u8"),
    @("Zagros TV", "https://5a3ed7a72ed4b.streamlock.net/zagrostv/SMIL:myStream.smil/playlist.m3u8"),
    @("Channel 8 Kurdish", "https://live.channel8.com/Channel8-Kurdish/index.fmp4.m3u8"),
    @("Payam TV", "https://media2.streambrothers.com:1936/8218/8218/playlist.m3u8"),
    @("KurdMax Sorani", "https://6476e46b58f91.streamlock.net/liveTrans/KURDS2211/playlist.m3u8"),
    @("KurdMax Show", "https://6476e46b58f91.streamlock.net/liveTrans/SHOWS123/playlist.m3u8"),
    @("KurdMax Music", "https://6476e46b58f91.streamlock.net/music/MUSIC2402/playlist.m3u8"),
    @("Mixkurdy", "https://avr.host247.net/live/Mix-kurdy/playlist.m3u8"),
    @("Afarin Baxcha", "https://5dcabf026b188.streamlock.net/afarinTV/livestream/playlist.m3u8"),
    @("Afarin TV", "https://65f16f0fdfc51.streamlock.net/afarinTV/livestream/playlist.m3u8"),
    @("Zarok TV Sorani", "https://zindisorani.zaroktv.com.tr/hls/stream.m3u8"),
    @("Zarok TV Kurmanci", "https://zindikurmanci.zaroktv.com.tr/hls/stream.m3u8"),
    @("FarmodaTV", "https://avr.host247.net/live/FarmodaTV/playlist.m3u8"),
    @("Avar TV", "https://avr.host247.net/live/AvarTv/playlist.m3u8"),
    @("EmanTv", "https://avr.host247.net/live/emantv/playlist.m3u8"),
    @("NUBAR Plus", "http://stream.nubar.tv:1935/private/NUBARPlus/playlist.m3u8"),
    @("Shams TV", "https://stream.shams.tv/hls/stream.m3u8"),
    @("UTV", "https://mn-nl.mncdn.com/utviraqi2/64c80359/index.m3u8"),
    @("Dijlah TV", "https://ghaasiflu.online/Dijlah/index.m3u8"),
    @("MBC Iraq", "https://shd-gcp-live.edgenextcdn.net/live/bitmovin-mbc-iraq/e38c44b1b43474e1c39cb5b90203691e/index.m3u8"),
    @("Al-Sharqiya", "https://5d94523502c2d.streamlock.net/home/mystream/playlist.m3u8"),
    @("Al-Sharqiya News", "https://5d94523502c2d.streamlock.net/alsharqiyalive/mystream/playlist.m3u8"),
    @("Al Iraqia", "https://cdn.catiacast.video/abr/8d2ffb0aba244e8d9101a9488a7daa05/playlist.m3u8"),
    @("Al Iraqia News", "https://cdn.catiacast.video/abr/78054972db7708422595bc96c6e024ac/playlist.m3u8")
)

foreach ($item in $urls) {
    $name = $item[0]
    $url = $item[1]
    try {
        $resp = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 8 -UseBasicParsing -ErrorAction Stop
        $status = $resp.StatusCode
        if ($status -eq 200) { Write-Host "OK  $name" -ForegroundColor Green }
        else { Write-Host "??  $name ($status)" -ForegroundColor Yellow }
    } catch {
        try {
            $resp2 = Invoke-WebRequest -Uri $url -Method Get -TimeoutSec 8 -UseBasicParsing -MaximumRedirection 3 -ErrorAction Stop
            if ($resp2.StatusCode -eq 200) { Write-Host "OK  $name" -ForegroundColor Green }
            else { Write-Host "??  $name ($($resp2.StatusCode))" -ForegroundColor Yellow }
        } catch {
            Write-Host "DEAD $name" -ForegroundColor Red
        }
    }
}
