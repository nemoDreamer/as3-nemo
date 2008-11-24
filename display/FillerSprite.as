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
	public class FillerSprite extends ExtendedSprite {
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function FillerSprite(){
			super();
			init_onResize();
		}
		
		//--------------------------------------
		//  ON RESIZE
		//--------------------------------------
		
		private function onResize() : void {
			
			// stage dimensions
			var stageWidth:Number = Global.stage.stageWidth;
			var stageHeight:Number = Global.stage.stageHeight;
			
			/*// get ratios
			var thisRatio:Number = _width / _height;
			var stageRatio:Number = stageWidth / stageHeight;*/
			
			// halt rendering
			Global.stage.invalidate();
			
			// scale height
			scale = stageHeight / _height;
			
			// scaled enough?
			if (width < stageWidth){ // no?
				// scale width
				scale = stageWidth / _width;
			}
			
			// place
			x = (Global.stage.stageWidth - width) / 2;
			y = (Global.stage.stageHeight - height) / 2;
			
		}
		
	}
	
}
