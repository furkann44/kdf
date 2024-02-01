import 'package:flutter/material.dart';


class Stamp extends StatefulWidget {


  Stamp(this.imageUrl, {this.width = 150.0, this.locked = false, this.onClick});

  final bool withStartAnimation = false;
  final String imageUrl;

  final double width;

  final double aspectRatio = 1.5333333;

  final double relativeHoleRadius = 1.0;

  final bool locked;

  final VoidCallback onClick;

  @override
  State<StatefulWidget> createState() => new _StampState();

}


class _StampState extends State<Stamp> with SingleTickerProviderStateMixin{

//  AnimationController animationController;
  Animation animation;


  @override
  void initState() {
    super.initState();
  //  animationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000));

 //   animation  = new Tween(begin: 0.0, end: 4.0).animate(animationController);

 //   animationController.forward();

  }


  @override
  Widget build(BuildContext context) {


    var width  = 110.0;
    var height = 200.0;
 

    Widget result =  new GestureDetector(
      onTap: widget.onClick,
      child: new Container(
        child: new Center(
          child: new ConstrainedBox(
            constraints: new BoxConstraints.tight(new Size(width, height)),
            child: new Material(
              elevation: 8.0, 
              child: new Center(
                child: _clippedNetwork(context, width, height),
              ),
            ),
          ),
        ),
      ),
    );



    return result;

  }

  Widget _clippedV1(BuildContext context, double card_width, double card_height) {
    return new ClipPath( 
      child: new Image.asset("assets/test_img.jpg",
        width: card_width,
        height: card_height,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _clippedNetwork(BuildContext context, double card_width, double card_height) {
    List<Widget> stackChildren = [];

    stackChildren.add(
        new Image.network(widget.imageUrl,
          width: card_width,
          height: card_height,
          fit: BoxFit.cover,
    ));

    if(widget.locked) {
      stackChildren.add(
          new Container(
            color: const Color(0x000000),
            width: card_width,
            height: card_height,
          ));
    }



    return new ClipPath( 
      child: new Container(
        color: Colors.white,
        child: new Align(
            alignment: Alignment.center,
            child: new Stack(
              children: stackChildren
            )
        ),
      ),
    );
  }

  Widget _clippedNetwork2(BuildContext context, double card_width, double card_height) {
    return new Container(
      color: Colors.white,
      child: new Align(
          alignment: Alignment.topCenter,
          child: new Image.network(widget.imageUrl,
            width: card_width,
            height: card_height,
            fit: BoxFit.cover,
          )
      ),
    );
  }

  Widget _clippedV2(BuildContext context, double card_width, double card_height) {
    return new ClipPath( 
      child: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Align(
                alignment: Alignment.topCenter,
                child: new Image.asset("assets/test_img.jpg",
                  width: card_width,
                  height: card_height- 30.0,
                  fit: BoxFit.cover,
                )
            ),
            new Text("Elon Musk", style: const TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {

    super.dispose();
  }


}
 