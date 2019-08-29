from PIL import Image, ImageDraw, ImageFont
import random

settings = {
    'img_size': (1920, 1080),
    'ratio': 0.1
}

colors = [
    (0, 0, 128, 255),
    (0, 0, 255, 255),
    (0, 128, 0, 255),
    (0, 128, 128, 255),
    (0, 128, 255, 255),
    (0, 255, 0, 255),
    (0, 255, 128, 255),
    (0, 255, 255, 255),
    (128, 0, 0, 255),
    (128, 0, 128, 255),
    (128, 0, 255, 255),
    (128, 128, 0, 255),
    (128, 128, 128, 255),
    (128, 128, 255, 255),
    (128, 255, 0, 255),
    (128, 255, 128, 255),
    (128, 255, 255, 255),
    (255, 0, 0, 255),
    (255, 0, 128, 255),
    (255, 0, 255, 255),
    (255, 128, 0, 255),
    (255, 128, 128, 255),
    (255, 128, 255, 255),
    (255, 255, 0, 255),
    (255, 255, 128, 255),
    (255, 255, 255, 255)
]


class Ball:
    def __init__(self, x, y, r, color, border):
        self.x = x
        self.y = y
        self.r = r
        self.color = color
        self.border = border
        self.dir = [
            ((1 << 15) - random.randint(0, 1<<16)) / float(1 << 15),
            ((1 << 15) - random.randint(0, 1<<16)) / float(1 << 15)
            ]

    def iter(self, speed=1):
        self.x += self.dir[0] * speed
        self.y += self.dir[1] * speed

        self.dir[0] = -self.dir[0] if self.x - self.r <= 0 else self.dir[0]
        self.dir[1] = -self.dir[1] if self.y - self.r <= 0 else self.dir[1]

        self.dir[0] = -self.dir[0] if self.x + self.r >= self.border[0] else self.dir[0]
        self.dir[1] = -self.dir[1] if self.y + self.r >= self.border[1] else self.dir[1]

class Balls:
    def __init__(self, speed=0.1):
        self.balls = [Ball(settings['img_size'][0] / 2, settings['img_size'][1] / 2, min(settings['img_size']) * settings['ratio'], colors[-8], settings['img_size'])]
        self.speed = speed * settings['img_size'][1]
        self.frame_number = 0

    def iter(self):
        self.frame_number += 1
        for b in self.balls:
            b.iter(speed=self.speed)

        return 'image_{:05d}'.format(self.frame_number)

    def render(self, image):
        d = ImageDraw.Draw(image)
        fnt = ImageFont.truetype('LiberationMono-Regular.ttf', 24)
        d.text((10, 10), "{:05d}".format(self.frame_number), font=fnt, fill=(255, 255, 255, 255))
        for b in self.balls:
            d.ellipse([b.x, b.y, b.x + b.r, b.y + b.r], fill=b.color)

def main():
    balls = Balls()

    N = 600

    for i in range(N):
        image = Image.new(mode='RGB', size=settings['img_size'])
        balls.render(image)
        name = balls.iter()
        image.save('src/' + name + '.webp', lossless=1, method=6)
        print ('save: {}'.format(name + '.webp'))

if __name__ == '__main__':
    main()
