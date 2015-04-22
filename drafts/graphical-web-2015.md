
###Choosing the right tool: Combining manual and programmatic manipulation of SVG

The acceleration of client side javascript and the development of D3 over the last few years has enabled the creation of interactive visualizations. While generating SVGs programmatically from data makes many previously difficult tasks trivia, text positioning, layout and illustration are much harder in D3 than they are in tools for manually manipulating SVGs like Illustrator or Inkscape. This talk will discuss different techniques Bloomberg Graphics uses to combine the two approaches. 

####Adding Animation
By strategically placing illustrated elements in groups and loading an SVG in a browser, it is possible to add rudimentary animations with d3.timer and d3.transition. Smoothly changing transform translate and/or rotate over time creates the illusion of movement. Toggling the opacity of an arm drawn in two different positions   

####Adding Interaction
Beyond creating gif like loops (with vectors and a full color palette), SVG animations can be trigged by user interaction. Changing the stroke-dashoffset while scrolling down the page can looks quite nice while being simple to implement. Bar charts are also easy to add a flourish to - just save the drawn heights, set the heights 0 on load and use a staggered transition to move them back to their original positions.


####There and back again


####Work Flow


####Responsive Considerations


####Alternatives Approaches 
