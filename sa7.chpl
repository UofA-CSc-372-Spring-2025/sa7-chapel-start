use Image;
use FileSystem, BlockDist;

/* Some example code to get a feel for how this works
config const dir = "ImageDir";              
var fList = findFiles(dir);

// read in the first image in the directory and write out the
// color values for the first 10x10 pixel region for debugging.
var f = fList[0];
var imageArray = readImage(f, imageType.png);
const fmt = (rgbColor.red, rgbColor.green, rgbColor.blue);
// var colors = pixelToColor(imageArray, format=fmt);
//writeln("colors = ", colors);

writeImage(f+".bmp", imageType.bmp, imageArray);
*/

/***** Problem A *****/
// Stubbed out so you can see how testing works.
proc getArrayOfFiles(dirPath: string): [] string {
    var filenames = ["file1.png", "file2.png", "file3.png", "file4.png"];
    return filenames;
}

/***** Problem B *****/
// Stubbed out so you can see how testing works.
proc endsWith(s: string, suffix: string): bool {
    return false;
}

/***** Problem C *****/
// Stubbed out so you can see how testing works.
proc convertPngToBmpInDir(dirPath: string): void {

}

/***** Problem D *****/
// Stubbed out so you can see how testing works.
proc imageSize(imageArray : [] pixelType): int {
    return 0;
}

/***** Problem E *****/
// Stubbed out so you can see how testing works.
proc imageSizeHistogram(dirPath: string, fileExtension: string, numBuckets: int): [0..#numBuckets] int {
    var histogram: [0..#numBuckets] int;
    histogram[0] = 0;
    histogram[1] = 0;
    histogram[2] = 0;
    histogram[3] = 0;
    histogram[4] = 0;
    histogram[5] = 0;
    histogram[6] = 0;
    histogram[7] = 0;
    histogram[8] = 0;
    histogram[9] = 0;
    return histogram;
}

/***** Problem F *****/
// Stubbed out so you can see how testing works.
proc rgbToGrayscale(rgbImage : [?d] pixelType) : [d] int
    where d.isRectangular() && d.rank == 2 {
    var grayScale: [rgbImage.domain] int;
    return grayScale;
}

/***** Problem G *****/
// Stubbed out so you can see how testing works.
proc sobelEdgeDetection(grayScale : [?d] int) : [] int
  where d.isRectangular() && d.rank == 2 {
    var edgeImage: [grayScale.domain] int;
    return edgeImage;
}
