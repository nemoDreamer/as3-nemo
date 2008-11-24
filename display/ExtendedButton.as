/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.display {
  
  import flash.display.SimpleButton;
  import flash.events.MouseEvent;
  
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  24.09.2008
	 */
	public class ExtendedButton extends SimpleButton {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function ExtendedButton( obj_:Object = null ){
			super();
			
			// feed
      feed(obj_);
      
      // register events
      addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
      addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
      addEventListener(MouseEvent.MOUSE_UP,   mouseUpHandler);
      addEventListener(MouseEvent.MOUSE_OUT,  mouseOutHandler);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		public function feed ( obj_:Object = null ) : void {
			for ( var variable in obj_ ){
				this[variable] = obj_[variable];
			};
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		public function mouseOverHandler( event:MouseEvent ) : void {
		  etrace(2, event);
		}
		public function mouseDownHandler( event:MouseEvent ) : void {
		  etrace(2, event);
		}
		public function mouseUpHandler( event:MouseEvent ) : void {
		  etrace(2, event);
		}
		public function mouseOutHandler( event:MouseEvent ) : void {
		  etrace(2, event);
		}
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
		//--------------------------------------
		// EXTENSIONS
		//--------------------------------------
		
    include '../../extends/Debug.as';
		
	}
	
}
