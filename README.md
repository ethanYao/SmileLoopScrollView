# SmileLoopScrollView
The Framework can help you implementation loop scroll the view what you want. It used the collectionView to make this framework.
##Installation
Drag the source files under floder `LoopScrollView` to your project. Just import the file: `LoopScrollView.h`.
##Features
* It can `loop scroll` the image in the view.
* It also can `automatic` scroll when you don't touch the image on the screen.
* It can `manual` scroll when you want.
* This framework was used `collectionView` to be implemented, then you can't care about the `reuse` situation.

##Example & Use

###Creat a loopScrollView in your custom view or controller:


```objective-c
    // create a view and set the size of the view you need.
    LoopScrollView *loopView = [[LoopScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    // this loops array is set the title at center view when you want, you can ignore this array and set nil if you don't want it 
    loopView.loops = [NSArray arrayWithObjects:@"1", @"2", @"3",  @"4", @"5", @"6", @"7", @"8", @"^.^", nil];
    // make your images array assign to this property
    loopView.images = [self setupImageArrayCount:loopView.loops.count];
    // set speed scroll what you want, this property is assigned double type
    loopView.scrollTime = 1.0f;
    // it can set the color of  the pageControl,the one is all the pages color,the other one is currentPage color
    loopView.pageTintColor = [UIColor blueColor];
    loopView.currentPageTintColor = [UIColor redColor];
```
##Wishes
I consider this little framework can't do more things, but it can help us to complete some same view such as loop scroll  or automatic scroll view etc. This version also exist many inconvenient situation when you using it, and I hope you can come up with your idea to make this framework changes the better. Finally, the best wishes for you.
