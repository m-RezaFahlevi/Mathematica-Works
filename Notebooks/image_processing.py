# %%
#Prepare the tools
import cv2
import numpy as np
import random
from matplotlib import pyplot as plt
print("initialize... \nDone.")

#%%
img = cv2.imread("this_is_vignette.jpg")
print(img)
print(f"shape {img.shape}")
print(img[1,1])
plt.imshow(img), plt.title("my_vignetto")

#%%
def monochrome(images):
    row, col = images.shape[0:2]
    imgs = images
    for i in range(1, row):
        for j in range(1, col):
            for k in range(3):
                if images[i, j][k] < 127: imgs[i, j] = 0
                else: imgs[i, j] = 255
    return imgs
monochrome_vignetto = monochrome(img)
plt.imshow(monochrome_vignetto), plt.title("monochrome vignetto")
#%%
def grayscales(images):
    row, col = images.shape[0:2]
    imgs = images
    for i in range(1, row):
        for j in range(1, col):
            imgs[i, j] = round(sum(images[i, j])/3)
    return imgs
gray_vignetto = grayscales(img)
plt.imshow(gray_vignetto), plt.title("gray vignetto dess")

#%%
# Convulution
kern = np.array([
    [0, -1, 0],
    [-1, 5, -1],
    [0, -1, 0]
])

sobel = np.array([
    [-16, 0, 16],
    [-1, 1, 1],
    [-16, 0, 16]
])

prewit = np.array([
    [-1, 0, 1],
    [-1, 0, 1],
    [-1, 0, 1]
])

permatrix = np.array([
    [0, 0, 4],
    [0, -2, 0],
    [-1, 0, 0]
])
sobeltrns = sobel.transpose()
prewits = prewit.transpose()
#conv_vignetto = cv2.filter2D(src= img, ddepth= - 1, kernel= prewit)
#sobels = cv2.filter2D(src = img, ddepth = -1, kernel = sobel)
permimg = cv2.filter2D(src = img, ddepth = -1, kernel = permatrix)
plt.imshow(permimg), plt.title("convulution vignetto")
#plt.show()

# %%
def gauss_noisedessu(image, mu, sigma):
    row, col = image.shape[0:2]
    imgs = image
    for i in range(1, row):
        for j in range(1, col):
            for k in range(3):
                imgs[i, j][k] = image[i, j][k] + np.random.normal(mu, sigma)
    return imgs
gausse_vignetto = gauss_noisedessu(img, mu= 0.5, sigma= 4)
plt.imshow(gausse_vignetto), plt.title("gaussu noisedessu vignetto")

#%%
def spsu_noise(image, prob):
    #imgs = np.zeros(image.shape, dtype= np.uint8)
    imgs = image
    thres = 1 - prob
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            #for k in range(3):
            get_number = random.random()
            if get_number < prob: imgs[i, j] = 0
            elif get_number > thres: imgs[i, j] = 255
            else: imgs[i][j] = imgs[i][j]
    return imgs
#vig = grayscales(img)
spsu_vig = spsu_noise(img, prob= 0.005)
plt.imshow(spsu_vig), plt.title("spsu vignetto")

# %%
def poissonu_noise(image, lambnu):
    #imgs = image
    poissonu = np.random.poisson(lam = lambnu, size= image.shape)
    #poissonu = np.random.normal(0.5, 8, size= image.shape)
    imgs = image + poissonu
    return imgs
poissonu_vignetto = poissonu_noise(img, 50)
plt.imshow(poissonu_vignetto), plt.title("poissonu vignetto")
# %%
def speckle_noise(image, prob):
    imgs = image
    thres = 1 - prob
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            #for k in range(3):
            get_number = random.random()
            if get_number < prob: 
                imgs[i, j] = 128
                for k in range(5): imgs[i - k, j - k] = 128 + 10 * get_number
            else: imgs[i][j] = imgs[i][j]
    return imgs
speckle_vignetto = speckle_noise(img, 0.005)
plt.imshow(speckle_vignetto), plt.title("speckle vignetto")

#%%
#restoration image
median_img = cv2.medianBlur(spsu_vig, ksize= 5)
#plt.imshow(median_img), 

gaussian_kernel = np.random.normal(0.54, 4, size= (3,3))
avarege_kernel = (1/9) * np.matrix([[1, 1, 1], [1, 1, 1], [1, 1, 1]], dtype = float)
convs_vignetto = cv2.filter2D(src= gausse_vignetto, ddepth=-1, kernel = avarege_kernel)
convu_vignetto = cv2.GaussianBlur(gausse_vignetto, (5, 5), 4)
plt.imshow(convs_vignetto)
# %%