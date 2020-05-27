require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

require("packs/lightBox")


require("css/application.scss")

curl -F 'client_id=2914674878612372' \
    -F 'client_secret=6a60e7b84cd52af294427d09b6c1f7d5' \
    -F 'grant_type=authorization_code' \
    -F 'redirect_uri=https://safe-ravine-43900.herokuapp.com/moodboard/' \
    -F 'code=AQAymGVXLNUxg-M1XRXTLyhoTCdbxUd2AtbB_uGEWHqgRCvBDb0bBV2-kQj-87O3KDbAT9mL0nZF6oevoreuruBB3o0vW8buoKaj25AwtkBvRoEkDZ2fl8ozNUoa5EN9XWQ5f8WsdjCiplroxc0bRKZTSnl629X9-yqbTAbyiJlpf_zJJbHh53-fep0lww0a45gwO7vzFDIh1vMREAqzRWrv3zNZA5VYYLlFLnXSwk2paQ' \
    https://api.instagram.com/oauth/access_token
