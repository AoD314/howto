import re
import matplotlib.pyplot as plt


def read_ssim(filename):
    p = re.compile('.*\(([.0-9]*)\)')
    lines = []
    with open(filename, 'rt') as f:
        lines = f.readlines()
    
    ssim = []
    for line in lines:
        m = p.match(line)
        if m:
            ssim.append(float(m.group(1)))
    return ssim

# files = ['ssim.1M.h264.log', 'ssim.2M.h264.log', 'ssim.4M.h264.log']
# files = ['ssim.1M.h265.log', 'ssim.2M.h265.log', 'ssim.4M.h265.log']

#files = ['ssim.4M.h265.log', 'ssim.4M.h264.log']
files = ['ssim.1M.h265.log', 'ssim.4M.h265.log', 'ssim.1M.h264.log', 'ssim.4M.h264.log']

# reading
arrs = [read_ssim(f) for f in files]

# slice
sl = [0, min ([len(a) for a in arrs])]
Y = range(len(arrs[0]))[sl[0]:sl[1]]

for i, f in enumerate(files): 
    plt.plot(Y, arrs[i][sl[0]:sl[1]], label=f)

plt.title("SSIM")
plt.legend()
plt.show()
