from PIL import Image, ImageDraw, ImageFont

IMAGE_SIZE = (1920, 1080)

image = Image.new(mode='RGBA', size=IMAGE_SIZE)

d = ImageDraw.Draw(image)
fnt = ImageFont.truetype('LiberationMono-Regular.ttf', 36)
d.text((10, 10), "0000", font=fnt, fill=(255,255,255, 255))
d.ellipse([200, 200, 400, 400], fill=(255, 0, 0, 255), )

image.save('image.webp', lossless=1, method=6)
