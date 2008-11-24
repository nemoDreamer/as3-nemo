/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.core {
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Philip Blyth
	 *	@since  17.03.2008
	 */
	public class xMath extends Object {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public static function rrange (min:Number, max:Number) : Number {
			return ( Math.random() * (max - min) ) + min;
		}

		public static function rrange_int (min:int, max:int) : int {
			return Math.round( rrange(min, max) );
		}
		
		public static function to_range(num:int, min:int, max:int) : int {
			return Math.max(Math.min(num, max), min);
		}
		
		public static function bool() : uint {
			return Math.round(Math.random());
		}
		
		public static function radToDeg(rad_:Number) : Number {
			return rad_*180/Math.PI;
		}
		
		public static function degToRad(deg_:Number) : Number {
			return deg_*Math.PI/180;
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
