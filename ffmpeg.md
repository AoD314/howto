# Links

## General

https://habr.com/ru/post/171213/

https://www.ostechnix.com/20-ffmpeg-commands-beginners/

https://github.com/stoyanovgeorge/ffmpeg/wiki/How-to-Compare-Video

## Video

https://trac.ffmpeg.org/wiki/Encode/H.264

https://trac.ffmpeg.org/wiki/Encode/H.265

https://trac.ffmpeg.org/wiki/Encode/VP9

https://trac.ffmpeg.org/wiki/Encode/AV1

## Audio

https://trac.ffmpeg.org/wiki/Encode/MP3

https://trac.ffmpeg.org/wiki/Encode/AAC

https://trac.ffmpeg.org/wiki/Encode/HighQualityAudio

# Examples

```
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libopus -c:v libaom-av1 -crf 34 -b:v 0 -pix_fmt yuv420p -movflags +faststart -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -strict experimental video.av1.mp4
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libfdk_aac -c:v libx264 -crf 24 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.h264.mp4
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libfdk_aac -c:v libx265 -crf 24 -preset veryslow -pix_fmt yuv420p -movflags +faststart -tag:v hvc1 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.hevc.mp4
```
