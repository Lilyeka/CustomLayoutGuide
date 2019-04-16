# CustomLayoutGuide
Suppose I have four views that are to remain equally distributed vertically. I constrain their left and right edges, their heights, and the top of the first view and the bottom of the last view. This leaves open the question of how we will determine the vertical position of the two middle views; they must move in such a way that they are always equidistant from their vertical neighbors.

![Equal Destribution](https://github.com/Lilyeka/CustomLayoutGuide/blob/master/CustomLayoutGuide/EqualDestribution.png "Equal Destribution")

To solve the problem, I introduce three UILayoutGuide objects between my real views. A custom UILayoutGuide object is added to a UIView, so I’ll add mine to the superview of my four real views.

I then involve my three layout guides in the layout.

(In that code, I clearly could generate each group of constraints as a loop, thus making this approach suitable for any number of distributed views; but I have deliberately unrolled those loops for the sake of the example.)

In real life, however, you are unlikely to use this technique directly, because you will use a UIStackView instead, and let the UIStackView generate all of that code for you

