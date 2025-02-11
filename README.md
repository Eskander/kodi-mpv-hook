# **kodi-url-hook for mpv**  

[mpv](https://mpv.io/) is an excellent choice as an [External Player](https://kodi.wiki/view/External_players) for [Kodi](https://kodi.tv/), combining Kodi’s content management with mpv’s advanced playback features. However, when using streaming add-ons, this setup can break because Kodi embeds **protocol options** into its URLs using a [custom format](https://kodi.wiki/view/HTTP).  

This mpv script resolves that issue by parsing Kodi's streaming URLs and extracting the necessary options so that mpv can handle them correctly.  

### **Implemented Features**  
- [x] **URL** extraction  
- [x] **User-Agent** support  
- [x] **Referer** handling  
- [x] **Origin** header parsing  

### **To-Do**  
- [ ] Support for **Cookies**  
