Drawing Rounded Corners
=======================

Examples of drawing various shapes with code

Drawing shapes with code is useful when the shapes require different colors, rounded 
corners or placement of details in the drawing. These examples show how various shapes 
can be drawn in code including a quote bubble which works well for callout views with a 
map.

Another benefit of drawing shapes is image management for various PNG files is not 
necessary and images are automatically scaled for the device. The latest iPhone screen 
will automatically render with the right scale without any changes to the code.

Below are examples of shapes drawn with the included sample code.

<img src="https://raw.githubusercontent.com/brennanMKE/DrawingRoundedCorners/master/DrawingRoundedCorners.png" width="600px" />

For the quote bubble, the drawing is done around 4 points with rounded corners. In the 
diagram below the letters represent where the rounded corners start and end. Drawing 
rounded corners is done with `CGContextAddArcToPoint` which uses 2 points to draw the 
rounded corner. The first value is where the corner would be if there were not rounded 
corner and the next point is where the curve should end. The last parameter is the 
border radius. By reviewing the code you will see the first point uses the numbered 
corner points with the second point being the point marked with a letter on the other
side of the rounded corner.

If the position value is not zero a point will be drawn. This is done when drawing the 
lines for each point between F and G. Once the line reaches F it will optionally draw
lines to the right side of the base, down to the point and back up to the left side of
the base before continuing to G. The method which draws this bubble view allows for the
size, position, border radius and stroke width to be set. The stroke and background
colors could be passed in as method arguments to provide further customization.

<img src="https://raw.githubusercontent.com/brennanMKE/DrawingRoundedCorners/master/DrawingGrid.png" width="600px" />

## License

Drawing Rounded Corners is available under the MIT license. See the LICENSE file for more info.

## Contact

Brennan Stehling  
[SmallSharpTools](http://www.smallsharptools.com/)  
[@smallsharptools](https://twitter.com/smallsharptools) (Twitter)
