from PIL import Image, ImageDraw, ImageFont
import random

settings = {
    'img_size': (1920, 1080),
    'ratio': 0.015
}

def get_color():
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

    i = random.randint(0, len(colors) - 1)
    return colors[i]



class Ball:
    def __init__(self, x, y, r, color, border):
        self.x = float(x)
        self.y = float(y)
        self.r = r
        self.color = color
        self.border = border
        self.dir = [
            ((1 << 15) - random.randint(0, 1<<16)) / float(1 << 15),
            ((1 << 15) - random.randint(0, 1<<16)) / float(1 << 15)
            ]

    def iter(self, speed=1):
        for _ in range(speed):
            self.x += self.dir[0]
            self.y += self.dir[1]

            self.dir[0] = -self.dir[0] if self.x - self.r <= 0 else self.dir[0]
            self.dir[1] = -self.dir[1] if self.y - self.r <= 0 else self.dir[1]

            self.dir[0] = -self.dir[0] if self.x + self.r >= self.border[0] else self.dir[0]
            self.dir[1] = -self.dir[1] if self.y + self.r >= self.border[1] else self.dir[1]


class Balls:
    def __init__(self, nb=10, speed=0.01):
        self.balls = []
        r = int(min(settings['img_size']) * settings['ratio'])
        for _ in range(nb):
            self.balls.append(Ball(random.randint(2 * r, settings['img_size'][0] - 2 * r), random.randint(2 * r, settings['img_size'][1] - 2 * r), r, get_color(), settings['img_size']))

        self.speed = int(speed * settings['img_size'][1])
        self.frame_number = 0

    def iter(self):
        self.frame_number += 1
        for b in self.balls:
            b.iter(speed=self.speed)

        return 'image_{:05d}'.format(self.frame_number)

    def render(self, image):
        d = ImageDraw.Draw(image)
        fnt = ImageFont.truetype('LiberationMono-Regular.ttf', 24)
        for b in self.balls:
            d.ellipse([b.x - b.r, b.y - b.r, b.x + b.r, b.y + b.r], fill=b.color)
        d.text((10, 10), "{:05d}".format(self.frame_number), font=fnt, fill=(255, 255, 255, 255))

def main():
    balls = Balls(nb=800, speed=0.01)

    N = 300

    for i in range(N):
        image = Image.new(mode='RGB', size=settings['img_size'])
        balls.render(image)
        name = balls.iter()
        image.save('src/' + name + '.webp', lossless=1, method=6)
        print ('save: {}'.format(name + '.webp'))

if __name__ == '__main__':
    main()
