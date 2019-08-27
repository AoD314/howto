ffmpeg -i sample.mkv -ss 00:01:00 -t 180 -map_metadata -1 -c:a copy -c:v copy sample.copy.h264.mkv

ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx264 -b:v 1000k -preset veryslow -pix_fmt yuv420p sample.1M.h264.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx264 -b:v 2000k -preset veryslow -pix_fmt yuv420p sample.2M.h264.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx264 -b:v 4000k -preset veryslow -pix_fmt yuv420p sample.4M.h264.mkv

ffmpeg -i sample.copy.h264.mkv -i sample.1M.h264.mkv -lavfi "ssim=ssim.1M.h264.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.2M.h264.mkv -lavfi "ssim=ssim.2M.h264.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.4M.h264.mkv -lavfi "ssim=ssim.4M.h264.log" -f null –

ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx265 -b:v 1000k -preset veryslow -pix_fmt yuv420p sample.1M.h265.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx265 -b:v 2000k -preset veryslow -pix_fmt yuv420p sample.2M.h265.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libx265 -b:v 4000k -preset veryslow -pix_fmt yuv420p sample.4M.h265.mkv

ffmpeg -i sample.copy.h264.mkv -i sample.1M.h265.mkv -lavfi "ssim=ssim.1M.h265.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.2M.h265.mkv -lavfi "ssim=ssim.2M.h265.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.4M.h265.mkv -lavfi "ssim=ssim.4M.h265.log" -f null –

ffmpeg -y -i sample.copy.h264.mkv -c:v libx264 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -an -f mp4 NUL
ffmpeg -i sample.copy.h264.mkv -c:v libx264 -b:v 1000k -pass 2 -c:a libmp3lame -b:a 192k -preset veryslow -pix_fmt yuv420p sample.1M.h264.2pass.mkv

ffmpeg -y -i sample.copy.h264.mkv -c:v libx265 -b:v 1000k -pass 1 -preset veryslow -pix_fmt yuv420p -an -f mp4 NUL
ffmpeg -i sample.copy.h264.mkv -c:v libx265 -b:v 1000k -pass 2 -c:a libmp3lame -b:a 192k -preset veryslow -pix_fmt yuv420p sample.1M.h265.2pass.mkv

ffmpeg -y -i sample.copy.h264.mkv -c:v libaom-av1 -b:v 1000k -pass 1 -preset veryslow -strict -2 -pix_fmt yuv420p -an -f mp4 NUL
ffmpeg -i sample.copy.h264.mkv -c:v libaom-av1 -b:v 1000k -pass 2 -c:a libmp3lame -b:a 192k -preset veryslow -strict -2 -pix_fmt yuv420p sample.1M.av1.2pass.mkv

ffmpeg -i sample.copy.h264.mkv -i sample.1M.h264.2pass.mkv -lavfi "ssim=ssim.1M.h264.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.1M.h265.2pass.mkv -lavfi "ssim=ssim.1M.h265.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.1M.av1.2pass.mkv -lavfi "ssim=ssim.1M.av1.log" -f null –

ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libaom-av1 -b:v 1000k -preset veryslow -strict -2 -pix_fmt yuv420p sample.1M.av1.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libaom-av1 -b:v 2000k -preset veryslow -strict -2 -pix_fmt yuv420p sample.2M.av1.mkv
ffmpeg -i sample.copy.h264.mkv -map_metadata -1 -c:a libmp3lame -b:a 192k -c:v libaom-av1 -b:v 4000k -preset veryslow -strict -2 -pix_fmt yuv420p sample.4M.av1.mkv

ffmpeg -i sample.copy.h264.mkv -i sample.1M.h265.mkv -lavfi "ssim=ssim.1M.av1.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.2M.h265.mkv -lavfi "ssim=ssim.2M.av1.log" -f null –
ffmpeg -i sample.copy.h264.mkv -i sample.4M.h265.mkv -lavfi "ssim=ssim.4M.av1.log" -f null –
