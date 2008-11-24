/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.core {
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  25.03.2008
	 */
	public class Color extends Object {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function xuint( num:Object = 0 ){
			value = new uint(num);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _value:uint// = new uint();
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get value() : Object { 
			return _value; 
		}
		
		public function set value( arg:Object ) : void { 
			_value = arg; 
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/*public static function mixColors (_color1:uint, _color2:uint) : uint {
			// !!!
			return _color1;
		}*/
		
		/*public static function changeBrightness (_color:uint, multiplier:int) : uint {
			var colTrans:ColorTransform = new ColorTransform()
			colTrans.color = _color;
			colTrans.redMultiplier = colTrans.greenMultiplier = colTrans.blueMultiplier = multiplier;
			return colTrans.color;
		};*/

		public static function getRGBValues () : Object {
			
			var colorTransformObj:ColorTransform = new ColorTransform()
			colorTransformObj.color = value;
			
			var rValue = colorTransformObj.redOffset;
			var gValue = colorTransformObj.greenOffset;
			var bValue = colorTransformObj.blueOffset;
			
			return {
				'red': rValue,
				'green': gValue,
				'blue': bValue
			};
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
