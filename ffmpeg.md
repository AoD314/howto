# Links

## General

https://habr.com/ru/post/171213/

https://www.ostechnix.com/20-ffmpeg-commands-beginners/

## Compare images or video

http://www.compression.ru/video/quality_measure/video_measurement_tool.html

https://ffmpeg.org/ffmpeg-all.html#ssim

https://github.com/stoyanovgeorge/ffmpeg/wiki/How-to-Compare-Video

```
ffmpeg -i main.mpg -i ref.mpg -lavfi  "ssim;[0:v][1:v]psnr" -f null -
```

## Video

https://trac.ffmpeg.org/wiki/Encode/H.264

https://trac.ffmpeg.org/wiki/Encode/H.265

https://trac.ffmpeg.org/wiki/Encode/VP9

https://trac.ffmpeg.org/wiki/Encode/AV1

https://trac.ffmpeg.org/wiki/Encode/FFV1

## Audio

https://trac.ffmpeg.org/wiki/Encode/MP3

https://trac.ffmpeg.org/wiki/Encode/AAC

https://trac.ffmpeg.org/wiki/Encode/HighQualityAudio

# Examples

http://ffmpeg.org/ffmpeg-all.html

```
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libopus -c:v libaom-av1 -crf 34 -b:v 0 -pix_fmt yuv420p -movflags +faststart -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -strict experimental video.av1.mp4
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libfdk_aac -c:v libx264 -crf 24 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.h264.mp4
ffmpeg -i SOURCE.mov -map_metadata -1 -c:a libfdk_aac -c:v libx265 -crf 24 -preset veryslow -pix_fmt yuv420p -movflags +faststart -tag:v hvc1 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.hevc.mp4
```

## Two pass

```
ffmpeg -i input.mp4 -c:v libaom-av1 -strict experimental -b:v 2M -pass 1 -an -f matroska /dev/null && \
ffmpeg -i input.mp4 -c:v libaom-av1 -strict experimental -b:v 2M -pass 2 -c:a libopus output.mkv
```

## Lossless video from images

```
ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -r 30 -threads 12 -level 3 -pass 1 -passlogfile my_passlog -y -f nut NUL
ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -r 30 -threads 12 -level 3 -pass 2 -passlogfile my_passlog -y video_lossless.avi
```

## m2ts to mkv

```
ffmpeg -i 00019.m2ts -map_metadata -1 -map 0:0 -map 0:12 -c:v h264_nvenc -b:v 10M -pix_fmt yuv420p -c:a aac -b:a 256k -vf scale=1920:-1 -preset slow -y output.1080.10M.rus.mkv
```
