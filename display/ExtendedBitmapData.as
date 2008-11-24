/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.display {
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	/**
	 *	Adds functionality to BitmapData.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  03.04.2008
	 */
	public class ExtendedBitmapData extends BitmapData {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function ExtendedBitmapData(width:uint, height:uint, transparent:Boolean = true, fillColor:uint = 0xFFFFFFFF){
			super(width, height, transparent, fillColor);
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
		
		public function copyRectangle(sourceBitmapData:BitmapData, rect_x:uint, rect_y:uint, rect_width:uint, rect_height:uint, point_x:uint, point_y:uint) : void {
			copyPixels(
				sourceBitmapData,
				new Rectangle(rect_x, rect_y, rect_width, rect_height),
				new Point(point_x, point_x)
			);
		}

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
