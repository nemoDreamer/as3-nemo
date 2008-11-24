/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.display {
	
	import nemo.display.ExtendedSprite;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  11.04.2008
	 */
	public class AnchoredSprite extends ExtendedSprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function AnchoredSprite( align_:String = 'TL', offset_x_:Number = 0, offset_y_:Number = 0 ){
      
      // save
      align = align_;
      offset_x = offset_x_;
      offset_y = offset_y_;
      
			super();
			
			// init
			init_onResize();
		}
		
		//--------------------------------------
		//  PUBLIC VARIABLES
		//--------------------------------------
		
		public var align:String = 'CC';
		public var offset_x:Number = 0;
		public var offset_y:Number = 0;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
		override public function onResize() : void {
		  
			// halt rendering
			Global.stage.invalidate();
			
			// Y
			switch ( align.substr(0,1) ) {
				case 'C' :
					y = Global.stage.stageHeight / 2;
				break;
				case 'T' :
          y = 0;
				break;
				case 'B' :
          y = Global.stage.stageHeight;
				break;
			}
			
			// X
			switch ( align.substr(1,1) ) {
				case 'C' :
					x = Global.stage.stageWidth / 2;
				break;
				case 'L' :
				  x = 0;
				break;
				case 'R' :
				  x = Global.stage.stageWidth;
				break;
			}
			
      x += offset_x;
      y += offset_y;
			
		}
		
	}
	
}
