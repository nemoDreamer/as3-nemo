/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.core {
	
	import Config;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  10.04.2008
	 */
	public class MultiDim extends Object {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		private static const OOB:String = 'Out_of_Bounds';
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function MultiDim(xLength_:int, yLength_:int, default_:Object=null, xOffset_:int=0, yOffset_:int=0){
			super();
			
			// save internals
			_xOffset = xOffset_;
			_yOffset = yOffset_;
			_xLength = xLength_;
			_yLength = yLength_;
			_default = default_;
			
			// not needed, since get/set
			/*_grid = new Array();
			for ( var y:int=_yOffset; y<_yLength; y++ ) {
				_grid[y] = new Array();
				for ( var x:int=_xOffset; x<_xLength; x++ ) {
					_grid[y][x] = _default;
				};
			};*/
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _grid:Array = new Array();
		
		private var _default:Object;
		
		private var _xOffset:int;
		private var _yOffset:int;
		
		private var _xLength:int;
		private var _yLength:int;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function grid(x:int, y:int, value=undefined) : Object {
			// between min & max?
			if (y<_yOffset || y>=_yLength+_yOffset || x<_xOffset || x>=_xLength+_xOffset) { // || faster, because doesn't have to test all if one is true
				if (Config.DEBUG){
					trace('(x:'+x+',y:'+y+') out of bounds for '+this+'!');
				}
				return OOB;
			} else {
				if (value===undefined){
					// GET
					// defined?
					if (_grid[y]==undefined || _grid[y][x]==undefined) {
						return _default;
					} else {
						return _grid[y][x];
					}
				} else {
					// SET
					if (_grid[y]==undefined){
						_grid[y] = new Array();
					}
					_grid[y][x] = value;
					return value;
				}
			}
		}
		
		public function get def() : Object { 
			return _default;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public function feed(input_:Array, xOffset_:int=0, yOffset_:int=0) : void {
			
			for ( var y:int=0; y<input_.length; y++ ) {
				for ( var x:int=0; x<input_[y].length; x++ ) {
					grid(x+xOffset_, y+yOffset_, input_[y][x]);
				};
			};
			
		}

		public function extract(xLength_:uint, yLength_:uint, xOffset_:int=0, yOffset_:int=0, default_:*=undefined, toString_:Boolean=false) : Object {
			
			var value_:Object;
			var output_:MultiDim = new MultiDim(xLength_, yLength_);
			var output_str_:String = '';
			
			for ( var y:int=0; y<yLength_; y++ ) {
				for ( var x:int=0; x<xLength_; x++ ) {
					value_ = grid(x+xOffset_,y+yOffset_);
					if (value_!=OOB || (value_==OOB && default_!=undefined)){
						if (value_==OOB){
							value_ = default_;
						}
						output_.grid(x, y, value_);
						output_str_ += value_;
					}
				};
			};
			
			return toString_ ? output_str_ : output_;
		}
		
		public function extract_str(xLength_:uint=0, yLength_:uint=0, xOffset_:int=0, yOffset_:int=0, default_:*=undefined) : String {
			
			// no params?: output complete grid
			if (xLength_==0 || yLength_==0){
				xLength_ = _xLength;
				yLength_ = _yLength;
				xOffset_ = _xOffset;
				yOffset_ = _yOffset;
			}
			
			return extract(xLength_, yLength_, xOffset_, yOffset_, default_, true) as String;
		}
		
		public function forEach(callback:Function, thisObject:*=null) : void {
			
			if (thisObject==null){
				thisObject = this;
			}
			
			for ( var y_:int=_yOffset; y_<_yLength+_yOffset; y_++ ) {
				for ( var x_:int=_xOffset; x_<_xLength+_xOffset; x_++ ) {
					callback.call(thisObject, grid(x_, y_), x_, y_, this);
				};
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
