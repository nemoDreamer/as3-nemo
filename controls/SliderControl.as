/* AS3
  Copyright 2008 nemoDreaming.com.
  */
package nemo.controls {

  import flash.display.MovieClip;
  import flash.display.Sprite;
  import flash.display.SimpleButton;

  import flash.events.MouseEvent;
  import nemo.events.ValueEvent;

  import flash.geom.Rectangle;

  /**
    *	Class description.
    *
    *	@langversion ActionScript 3.0
    *	@playerversion Flash 9.0
    *	@author Philip Blyth
    *	@since  26.09.2008
    */
  public class SliderControl extends MovieClip {

    //--------------------------------------
    // CLASS CONSTANTS
    //--------------------------------------

    public static const MOVING : String = 'SliderControlMoving';
    public static const MOVING_APPEND : String = 'ControlMoving'; // _slider_prefix + MOVING_APPEND == MOVING !!!
    
    public static const MOVED : String = 'SliderControlMoved';
    public static const MOVED_APPEND : String = 'ControlMoved'; // _slider_prefix + MOVING_APPEND == MOVING !!!
    
    public static const DRAGGED : String = 'SliderControlDragged';
    public static const DRAGGED_APPEND : String = 'ControlDragged'; // _slider_prefix + MOVING_APPEND == MOVING !!!
    
    //--------------------------------------
    // PROTECTED VARIABLES
    //--------------------------------------
    
    protected var _slider_width : int;
    protected var _slider_prefix : String;
    
    protected var _allow : Number;
    
    protected var _handle_mc;
    protected var _bgr_mc;
    
    protected var _dragging : Boolean = false;
    protected var _position : Number;

    //--------------------------------------
    //  CONSTRUCTOR
    //--------------------------------------

    /**
      *	@Constructor
      */
    public function SliderControl(width_:int = 50, allow_:Number = 1, prefix_:String = 'Slider'){

      super();
      
      // defaults
      _slider_width = width_;
      _slider_prefix = prefix_;
      _allow = allow_;
      
      // build
      _bgr_mc = getChildByName(_slider_prefix.toLowerCase() + "_bgr_mc");
      _handle_mc = addChild(new Sprite());
      _handle_mc.addChild(getChildByName(_slider_prefix.toLowerCase() + "_handle_btn"));

      // listeners
      _handle_mc.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler);
      _handle_mc.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
      _handle_mc.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveHandler);

    }
    
    //--------------------------------------
    // GETTER / SETTERS
    //--------------------------------------

    public function get position() : Number { 
      return _position = _handle_mc.x / _slider_width;
    }

    public function set position( value:Number ) : void {
      if (value !== _position){
        // save
        _position = value;
        // move
        _handle_mc.x = _position * _slider_width;
        // event
        dispatchEvent(new ValueEvent(_slider_prefix + MOVED_APPEND, {position: position}, true));
      }
    }
    
    public function get dragging() : Object { 
      return _dragging; 
    }

    //--------------------------------------
    // PRIVATE METHODS
    //--------------------------------------
    
    //--------------------------------------
    //  EVENT HANDLERS
    //--------------------------------------

    private function _mouseDownHandler( event:MouseEvent ) : void {
      // start constrained drag
      _handle_mc.startDrag(true, new Rectangle(0, 0, _slider_width * _allow, 0));
      _dragging = true;
      // for releaseOutside
      stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
    }

    private function _mouseUpHandler( event:MouseEvent ) : void {
      // stop drag
      _handle_mc.stopDrag();
      _dragging = false;
      // for releaseOutside
      stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
      // event
      dispatchEvent(new ValueEvent(_slider_prefix + DRAGGED_APPEND, {position: position}, true));
    }

    private function _mouseMoveHandler( event:MouseEvent ) : void {
      // dragging?
      if (_dragging){
        // event
        dispatchEvent(new ValueEvent(_slider_prefix + MOVING_APPEND, {position: position}, true));
      }
    }

  }

}
