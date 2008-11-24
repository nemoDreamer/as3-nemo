/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.display {
	
  import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  11.04.2008
	 */
	public class ExtendedSprite extends Sprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function ExtendedSprite(){
			super();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _width : Number = width;
		private var _height : Number = height;
		private var _scale : Number;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function set scale( arg:Number ) : void { 
			_scale = scaleX = scaleY = arg; 
		}
		
		//--------------------------------------
		//  ON RESIZE
		//--------------------------------------
		
		private function onResizeHandler( event:Event ) : void {
			onResize();
		}
		
		public function init_onResize() : void {
		  onResize();
			Global.stage.addEventListener(Event.RESIZE, onResizeHandler);
		}
		
		public function onResize() : void {}
		
	}
	
}
