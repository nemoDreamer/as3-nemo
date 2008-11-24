/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.text {
	
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import flash.text.TextFormat;
  import flash.text.AntiAliasType;
  
  import nemo.core.Tool;
  
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Philip Blyth
	 *	@since  25.09.2008
	 */
	public class ExtendedTextField extends TextField {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function ExtendedTextField( x_:Number = 0, y_:Number = 0, text_:String = '', textformat_:Object = null, options_:Object = null){
		  
			super();
			
      x = x_;
      y = y_;
      
      autoSize = TextFieldAutoSize.LEFT;
      antiAliasType = AntiAliasType.ADVANCED;
      defaultTextFormat = Tool.merge(_defaultTextFormat, textformat_);
      _reset = defaultTextFormat;
      embedFonts = true;
      selectable = false;
      
      text = text_;
      
      feed(options_);
			
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _reset : TextFormat;
		private var _defaultTextFormat : TextFormat = new TextFormat(
		  new RegularFont().fontName, // font
		  12, // size
		  0x000000 // color
		);
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public function changeTextFormat( obj_:Object = null, all_:Boolean = false ) : void {
      var tmp:TextFormat = Tool.merge(new TextFormat(), obj_);
      if (all_){
        setTextFormat(tmp); // change all
      } else {
        defaultTextFormat = tmp; // only new text
      }
		}
		
		public function resetTextFormat() : void {
      setTextFormat(_reset);
      defaultTextFormat = _reset;
		}

		public function feed ( obj_:Object, to_:Object = null ) : Object {
		  var mouth = to_==null ? this : to_
			for ( var variable in obj_ ){
				mouth[variable] = obj_[variable];
			};
      return mouth;
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
