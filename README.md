# kodi-url-hook for mpv
[mpv](https://mpv.io/) works well as an [External Player](https://kodi.wiki/view/External_players) for [Kodi](https://kodi.tv/), combining Kodi's content management and mpv's advanced capabilities. However, this setup breaks when using streaming addons since Kodi uses a [custom URL format](https://kodi.wiki/view/HTTP) to embed 'protocol options' into URLs.

This mpv script parses Kodi streaming URLs with 'protocol options' into properties that mpv can work with.

DONE:
- [x] URL
- [x] User-Agent
- [x] Referer
- [x] Origin

TODO:
- [ ] Cookies
