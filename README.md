# mpv-kodi-stream
[MPV](https://mpv.io/) works well as an [External Player](https://kodi.wiki/view/External_players) for [Kodi](https://kodi.tv/), combining Kodi's content management and MPV's advanced capabilities. However, this setup breaks when using streaming addons since Kodi uses a [custom URL format](https://kodi.wiki/view/HTTP) to embed 'protocol options' into URLs.

This MPV script parses Kodi streaming URLs with 'protocol options' into properties that MPV can work with.

DONE:
- URL
- User-Agent
- Referer
- Origin

TODO:
- Cookies
