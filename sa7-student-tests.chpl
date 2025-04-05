
config const dir = "ImageDir";

proc assertEqual(actual, expected, testName: string) {
  if actual != expected {
    writeln("FAIL: ", testName, " — got ", actual, ", expected ", expected);
  } else {
    writeln("PASS: ", testName);
  }
}

proc main() {
    testGetArrayOfFiles();
    testEndsWith();
    testImageSize();
    testImageSizeHistogram();
    testRgbToGrayscale();
    testSobelEdgeDetection();
    testConvertPngToBmpInDir();
    writeln("All tests completed.");
}


proc testGetArrayOfFiles() {
    use sa7, BlockDist;

    var files = getArrayOfFiles(dir);
    var expectedFiles = [dir+"/white-flowers.bmp",dir+"/white-flowers.png",dir+"/flower.png",dir+"/alligator.png"];
    for i in 0..<expectedFiles.size {
        assertEqual(files[i], expectedFiles[i], "getArrayOfFiles test");
    }
}

proc testEndsWith() {
    use sa7;

    assertEqual(endsWith("hello.txt", ".txt"), true, "endsWith test 1");
    assertEqual(endsWith("image.png", ".jpg"), false, "endsWith test 2");
    assertEqual(endsWith("document.pdf", ".pdf"), true, "endsWith test 3");
    assertEqual(endsWith("archive.tar.gz", ".gz"), true, "endsWith test 4");
    assertEqual(endsWith("noextension", ".txt"), false, "endsWith test 5");
}

proc testConvertPngToBmpInDir() {
    use sa7;

    // Count the number of .png files in the directory before conversion
    var filesBefore = getArrayOfFiles(dir);

    var pngCountBefore = 0;
    for file in filesBefore {
        if endsWith(file, ".png") {
            pngCountBefore += 1;
        }
    }

    // Perform the conversion
    convertPngToBmpInDir(dir);

    // Count the number of .bmp files in the directory after conversion
    var filesAfter = getArrayOfFiles(dir);
    var bmpCountAfter = 0;
    for file in filesAfter {
        if endsWith(file, ".bmp") {
            bmpCountAfter += 1;
        }
    }

    // Assert that the number of .bmp files matches the number of .png files before conversion
    const expectedBmpCountAfter = 4;
    assertEqual(bmpCountAfter, pngCountBefore, "convertPngToBmpInDir test");
}

proc testImageSize() {
    use sa7, Image;

    var imageArray = readImage(dir+"/white-flowers.png", imageType.png);
    var size = imageSize(imageArray);
    assertEqual(size, 120400, "imageSize test");
}

proc testImageSizeHistogram() {
    use sa7;

    var histogram = imageSizeHistogram(dir,"png",10);
    var expectedHistogram = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    // Assert the size of the image
    assertEqual(histogram.size, expectedHistogram.size, "imageSizeHistogram test - size");
}

//test case for rgbToGrayscale from sa7.chpl
proc testRgbToGrayscale() {
    use sa7, Image;

    var imageArray = readImage(dir+"/white-flowers.png", imageType.png);
    var grayscaleImage = rgbToGrayscale(imageArray);

    // Check the first pixel value (example)
    assertEqual(grayscaleImage[0, 0], 138, "rgbToGrayscale test - pixel value");
}

// test case for the sobel edge detector from sa7.chpl
proc testSobelEdgeDetection() {
    use sa7, Image;

    var imageArray = readImage(dir+"/white-flowers.png", imageType.png);
    var sobelImage = sobelEdgeDetection(imageArray);

    // Check the first pixel value (example)
    assertEqual(sobelImage[0, 0], 0, "sobelEdgeDetection test - pixel value");
}
