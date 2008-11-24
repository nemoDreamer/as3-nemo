/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.events {
  
  import flash.events.Event;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  26.09.2008
	 */
	public class ValueEvent extends Event {
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function ValueEvent( type_:String, obj_:Object, bubbles_:Boolean = false, cancelable_:Boolean = false ){
			super(type_, bubbles_, cancelable_);
			
			variables = obj_;
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _variables : Object = new Object();

		//--------------------------------------
		// GETTER / SETTERS
		//--------------------------------------
		
		public function get variables() : Object { 
		  return _variables; 
		}

		public function set variables( value_:Object ) : void {
		  if (value_ !== _variables){
		    _variables = value_;
		  }
		}
		
		public function addVariable( variable_:Object, value_:Object = null ) : void {
      _variables[variable_] = value_;
		}
		
	}
	
}
