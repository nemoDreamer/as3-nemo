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
	public class StretcherSprite extends ExtendedSprite {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function StretcherSprite(){
			super();
      init_onResize();
		}
		
		//--------------------------------------
		//  ON RESIZE
		//--------------------------------------
		
		override public function onResize() : void {
			
			// halt rendering
      Global.stage.invalidate();
			
			// width
      width = Global.stage.stageWidth;
			
		}
		
	}
	
}
