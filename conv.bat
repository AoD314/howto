ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -threads 12 -level 3 -pass 1 -passlogfile my_passlog -y -r 30 -f nut NUL
ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -threads 12 -level 3 -pass 2 -passlogfile my_passlog -y -r 30 video_lossless.mkv

rem 264 1pass

rem ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 1000k -preset veryslow -pix_fmt yuv420p sample.1M.h264.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 2000k -preset veryslow -pix_fmt yuv420p sample.2M.h264.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 4000k -preset veryslow -pix_fmt yuv420p sample.4M.h264.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.h264.mkv -lavfi "ssim=ssim.1M.h264.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.h264.mkv -lavfi "ssim=ssim.2M.h264.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.h264.mkv -lavfi "ssim=ssim.4M.h264.log" -f null –

rem 265 1pass

rem ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 1000k -preset veryslow -pix_fmt yuv420p sample.1M.h265.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 2000k -preset veryslow -pix_fmt yuv420p sample.2M.h265.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 4000k -preset veryslow -pix_fmt yuv420p sample.4M.h265.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.h265.mkv -lavfi "ssim=ssim.1M.h265.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.h265.mkv -lavfi "ssim=ssim.2M.h265.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.h265.mkv -lavfi "ssim=ssim.4M.h265.log" -f null –

rem av1 1pass

rem ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 1000k -pix_fmt yuv420p sample.1M.av01.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 2000k -pix_fmt yuv420p sample.2M.av01.mkv
rem ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 4000k -pix_fmt yuv420p sample.4M.av01.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.av01.mkv -lavfi "ssim=ssim.1M.av01.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.av01.mkv -lavfi "ssim=ssim.2M.av01.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.av01.mkv -lavfi "ssim=ssim.4M.av01.log" -f null –


rem 264 2pass

rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 1000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.1M.h264.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 2000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 2000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.2M.h264.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 4000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 4000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.4M.h264.2pass.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.h264.2pass.mkv -lavfi "ssim=ssim.1M.h264.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.h264.2pass.mkv -lavfi "ssim=ssim.2M.h264.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.h264.2pass.mkv -lavfi "ssim=ssim.4M.h264.2pass.log" -f null –

rem 265 2pass

rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 1000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.1M.h265.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 2000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 2000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.2M.h265.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 4000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 4000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.4M.h265.2pass.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.h265.2pass.mkv -lavfi "ssim=ssim.1M.h265.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.h265.2pass.mkv -lavfi "ssim=ssim.2M.h265.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.h265.2pass.mkv -lavfi "ssim=ssim.4M.h265.2pass.log" -f null –

rem av1 2pass

rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 1000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 1000k -pass 2 -pix_fmt yuv420p -y -an sample.1M.av01.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 2000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 2000k -pass 2 -pix_fmt yuv420p -y -an sample.2M.av01.2pass.mkv

rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 4000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
rem ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 4000k -pass 2 -pix_fmt yuv420p -y -an sample.4M.av01.2pass.mkv

rem ffmpeg -i video_lossless.mkv -i sample.1M.av01.2pass.mkv -lavfi "ssim=ssim.1M.av01.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.2M.av01.2pass.mkv -lavfi "ssim=ssim.2M.av01.2pass.log" -f null –
rem ffmpeg -i video_lossless.mkv -i sample.4M.av01.2pass.mkv -lavfi "ssim=ssim.4M.av01.2pass.log" -f null –
