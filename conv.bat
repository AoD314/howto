ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -threads 12 -level 3 -pass 1 -passlogfile my_passlog -y -r 30 -f nut NUL
ffmpeg -i "src/image_%%05d.webp" -r 30 -vcodec ffv1 -threads 12 -level 3 -pass 2 -passlogfile my_passlog -y -r 30 video_lossless.mkv

rem 264 1pass

ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 1000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.1M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 2000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.2M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 4000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.4M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx264 -b:v 8000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.8M.h264.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.h264.mkv -lavfi "ssim=ssim.cpu.1M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.h264.mkv -lavfi "ssim=ssim.cpu.2M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.h264.mkv -lavfi "ssim=ssim.cpu.4M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.h264.mkv -lavfi "ssim=ssim.cpu.8M.h264.log" -f null –

rem 265 1pass

ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 1000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.1M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 2000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.2M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 4000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.4M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v libx265 -b:v 8000k -preset veryslow -pix_fmt yuv420p -y sample.cpu.8M.h265.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.h265.mkv -lavfi "ssim=ssim.cpu.1M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.h265.mkv -lavfi "ssim=ssim.cpu.2M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.h265.mkv -lavfi "ssim=ssim.cpu.4M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.h265.mkv -lavfi "ssim=ssim.cpu.8M.h265.log" -f null –


rem 264 1pass

ffmpeg -i video_lossless.mkv -an -c:v h264_nvenc -b:v 1000k -pix_fmt yuv420p -y sample.gpu.1M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v h264_nvenc -b:v 2000k -pix_fmt yuv420p -y sample.gpu.2M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v h264_nvenc -b:v 4000k -pix_fmt yuv420p -y sample.gpu.4M.h264.mkv
ffmpeg -i video_lossless.mkv -an -c:v h264_nvenc -b:v 8000k -pix_fmt yuv420p -y sample.gpu.8M.h264.mkv

ffmpeg -i video_lossless.mkv -i sample.gpu.1M.h264.mkv -lavfi "ssim=ssim.gpu.1M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.2M.h264.mkv -lavfi "ssim=ssim.gpu.2M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.4M.h264.mkv -lavfi "ssim=ssim.gpu.4M.h264.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.8M.h264.mkv -lavfi "ssim=ssim.gpu.8M.h264.log" -f null –

rem 265 1pass

ffmpeg -i video_lossless.mkv -an -c:v hevc_nvenc -b:v 1000k -pix_fmt yuv420p -y sample.gpu.1M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v hevc_nvenc -b:v 2000k -pix_fmt yuv420p -y sample.gpu.2M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v hevc_nvenc -b:v 4000k -pix_fmt yuv420p -y sample.gpu.4M.h265.mkv
ffmpeg -i video_lossless.mkv -an -c:v hevc_nvenc -b:v 8000k -pix_fmt yuv420p -y sample.gpu.8M.h265.mkv

ffmpeg -i video_lossless.mkv -i sample.gpu.1M.h265.mkv -lavfi "ssim=ssim.gpu.1M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.2M.h265.mkv -lavfi "ssim=ssim.gpu.2M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.4M.h265.mkv -lavfi "ssim=ssim.gpu.4M.h265.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.gpu.8M.h265.mkv -lavfi "ssim=ssim.gpu.8M.h265.log" -f null –

rem av1 1pass

ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 1000k -pix_fmt yuv420p -y sample.cpu.1M.av01.mkv
ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 2000k -pix_fmt yuv420p -y sample.cpu.2M.av01.mkv
ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 4000k -pix_fmt yuv420p -y sample.cpu.4M.av01.mkv
ffmpeg -i video_lossless.mkv -an -c:v libaom-av1 -strict experimental -b:v 8000k -pix_fmt yuv420p -y sample.cpu.8M.av01.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.av01.mkv -lavfi "ssim=ssim.cpu.1M.av01.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.av01.mkv -lavfi "ssim=ssim.cpu.2M.av01.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.av01.mkv -lavfi "ssim=ssim.cpu.4M.av01.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.av01.mkv -lavfi "ssim=ssim.cpu.8M.av01.log" -f null –











rem 264 2pass

ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 1000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.1M.h264.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 2000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 2000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.2M.h264.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 4000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 4000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.4M.h264.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 8000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx264 -b:v 8000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.8M.h264.2pass.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.h264.2pass.mkv -lavfi "ssim=ssim.cpu.1M.h264.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.h264.2pass.mkv -lavfi "ssim=ssim.cpu.2M.h264.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.h264.2pass.mkv -lavfi "ssim=ssim.cpu.4M.h264.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.h264.2pass.mkv -lavfi "ssim=ssim.cpu.8M.h264.2pass.log" -f null –

rem 265 2pass

ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 1000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.1M.h265.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 2000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 2000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.2M.h265.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 4000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 4000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.4M.h265.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 8000k -pass 1 -preset veryslow -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libx265 -b:v 8000k -pass 2 -preset veryslow -pix_fmt yuv420p -y -an sample.cpu.8M.h265.2pass.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.h265.2pass.mkv -lavfi "ssim=ssim.cpu.1M.h265.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.h265.2pass.mkv -lavfi "ssim=ssim.cpu.2M.h265.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.h265.2pass.mkv -lavfi "ssim=ssim.cpu.4M.h265.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.h265.2pass.mkv -lavfi "ssim=ssim.cpu.8M.h265.2pass.log" -f null –

rem av1 2pass

ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 1000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 1000k -pass 2 -pix_fmt yuv420p -y -an sample.cpu.1M.av01.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 2000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 2000k -pass 2 -pix_fmt yuv420p -y -an sample.cpu.2M.av01.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 4000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 4000k -pass 2 -pix_fmt yuv420p -y -an sample.cpu.4M.av01.2pass.mkv

ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 8000k -pass 1 -pix_fmt yuv420p -y -an -f matroska  NUL
ffmpeg -i video_lossless.mkv -c:v libaom-av1 -strict experimental -b:v 8000k -pass 2 -pix_fmt yuv420p -y -an sample.cpu.8M.av01.2pass.mkv

ffmpeg -i video_lossless.mkv -i sample.cpu.1M.av01.2pass.mkv -lavfi "ssim=ssim.cpu.1M.av01.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.2M.av01.2pass.mkv -lavfi "ssim=ssim.cpu.2M.av01.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.4M.av01.2pass.mkv -lavfi "ssim=ssim.cpu.4M.av01.2pass.log" -f null –
ffmpeg -i video_lossless.mkv -i sample.cpu.8M.av01.2pass.mkv -lavfi "ssim=ssim.cpu.8M.av01.2pass.log" -f null –

