
#Choosing the right tool: Combining manual and programmatic manipulation of SVG

The acceleration of client side javascript and the development of D3 over the last few years has enabled the creation of interactive visualizations. While generating SVGs programmatically from data makes many previously difficult tasks trivia, text positioning, layout and illustration are much harder in D3 than they are in tools for manually manipulating SVGs like Illustrator or Inkscape. This talk will discuss different techniques Bloomberg Graphics uses to combine the two approaches. 

####Adding Animation
By strategically placing illustrated elements in groups and loading an SVG in a browser, it is possible to add rudimentary animations with d3.timer and d3.transition. Smoothly changing transform translate and/or rotate over time creates the illusion of movement. Toggling the opacity of an arm drawn in two different positions   

####Adding Interaction
Beyond creating gif like loops (with vectors and a full color palette), SVG animations can be trigged by user interaction. Changing the stroke-dashoffset while scrolling down the page can looks quite nice while being simple to implement. Bar charts are also easy to add a flourish to - just save the drawn heights, set the heights 0 on load and use a staggered transition to move them back to their original positions.

####There and back again
In addition to creating SVGs from scratch in illustrator and animating them with D3, we've also used D3 to transform data to an SVG, saving the SVG and opening it with illustrator to clean up positioning. This technique is particularly useful for tidying force layouts. 
			
####Work Flow
SVGs can be saved from the browser with SVG crowbar or copying and pasting 'Edit as HTML'. Loading SVGs in the browser is a bit trickier. d3.xml can load and append an SVG to the page, but it doesn't work with IE9 and adds a network so a build step might be necessary.  

If you just need to position things, d3.drag is a solid alternative to Illustrator. For a few elements console.log the coordinates and copy/paste to a config file; for a lot save the positions to an array of objects and save to a csv with copy(d3.csv.format(positions)).

Don't be afraid to experiment creating your own tools to improve your workflow - shrinking the feedback loop pays off in unexpected ways.

####Responsiveness
We use viewport resizing or css transform scale works until the text gets too small and then switch to fall back images. ai2html has a more robust solution, converting text elements to absolutely positioned divs. 