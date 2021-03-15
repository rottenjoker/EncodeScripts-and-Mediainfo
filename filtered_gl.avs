FFVideoSource("D:\BD\The Wild Goose Lake\video.mkv")
Crop(0, 32, -0, -32).FillMargins(0, 1, 0, 1)

# lines/borders
b1 = Fixer(1, 6, 1, 6, chroma = true)
b2 = FillBorders(0, 2, 0, 2).bbmod(cleft = 2, ctop = 3, cright = 1, cbottom = 3, thresh = 128, blur = 999)
b3 = FillBorders(0, 5, 0, 2).bbmod(cleft = 2, ctop = 6, cright = 1, cbottom = 3, thresh = 128, blur = 999)
b4 = FillBorders(0, 2, 0, 5).bbmod(cleft = 2, ctop = 3, cright = 1, cbottom = 6, thresh = 128, blur = 999)

trim(0,854)+trim(b1, 855, 974)+trim(975, 3385)+trim(b2, 3386, 34043)+trim(b3, 34044, 34093)+trim(b2, 34094, 78685)+trim(b4, 78686, 78986)+trim(b2, 78987, 0)

z_Spline36Resize(1280, 676, 0, 1, 0, -1, dither="error_diffusion")

# deband/deblock
db1 = f3kdb(dither_algo = 3, range = 15, grainY = 60, grainC = 60, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true)
db2 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(40, true), luma = true)
db3 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(48, true), luma = true)
db4 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(36, true), luma = true)
db5 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(28, true), luma = true)
db6 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(56, true), luma = true)
db7 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(80, true), luma = true)
db8 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(188, false), luma = true)
db9 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(132, false), luma = true)
db10 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(124, false), luma = true)
db11 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(92, false), luma = true)
db12 = mt_merge(last, f3kdb(dither_algo = 3, range = 15, grainY = 80, grainC = 80, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true), mt_binarize(160, false), luma = true)
db13 = f3kdb(dither_algo = 3, range = 31, grainY = 60, grainC = 60, Y = 100, Cb = 100, Cr = 100, dynamic_grain = true)

ConditionalFilter(db1, last, "ST", "=", "1")
ConditionalFilter(db2, last, "ST", "=", "2")
ConditionalFilter(db3, last, "ST", "=", "3")
ConditionalFilter(db4, last, "ST", "=", "4")
ConditionalFilter(db5, last, "ST", "=", "5")
ConditionalFilter(db6, last, "ST", "=", "6")
ConditionalFilter(db7, last, "ST", "=", "7")
ConditionalFilter(db8, last, "ST", "=", "8")
ConditionalFilter(db9, last, "ST", "=", "9")
ConditionalFilter(db10, last, "ST", "=", "10")
ConditionalFilter(db11, last, "ST", "=", "11")
ConditionalFilter(db12, last, "ST", "=", "12")
ConditionalFilter(db13, last, "ST", "=", "13")

ConditionalReader("filter_gl.txt", "ST", show = False)

#myFFInfo("Filtered")