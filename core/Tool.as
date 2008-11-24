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
	 *	@since  25.09.2008
	 */
	public class Tool extends Object {
		
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
		
    public static function merge( ... arguments ) : * {
      for (var i:int = 1; i<arguments.length; i++){
        if (arguments[i] is Object){
          for (var prop:String in arguments[i]){
            arguments[0][prop] = arguments[i][prop];
          }
        }
      }
      return arguments[0];
    }
    
    //--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
