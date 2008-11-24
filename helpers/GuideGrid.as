/* AS3
	Copyright 2008 nemoDreaming.com.
*/
package nemo.helpers {
	
	import flash.display.Sprite;
	import flash.display.LineScaleMode;
	import flash.geom.ColorTransform;
	import flash.events.MouseEvent;
	import fl.controls.CheckBox;
	
	/**
	 *	Class description.
	 *	Usage:
	 *		guidegrid:GuideGrid = new GuideGrid();
	 *		guidegrid.initGrid();
	 *		guidegrid.initButton();
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *	@author Philip Blyth
	 *	@since  23.03.2008
	 */
	public class GuideGrid extends Sprite {
		
		//--------------------------------------
		//  PUBLIC VARIABLES
		//--------------------------------------
		
		public var guides:Sprite = new Sprite();
		public static var reference:Object;
		
		//--------------------------------------
		// PRIVATE VARIABLES
		//--------------------------------------
		
		private var _gridX:int;
		private var _gridY:int;
		private var _gridColor:uint;
		private var _gridAlpha:Number;
		
		private var _gridSizeX:uint;
		private var _gridSizeY:uint;
		private var _cellSizeX:uint;
		private var _cellSizeY:uint;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function GuideGrid( grid_x:int=0, grid_y:int=0, grid_color:uint=0xE5E5E5, grid_alpha:Number=0.5 ){
			super();
			
			// Sace static reference
			GuideGrid.reference = this;
			
			// Set variables
			_gridX = grid_x;
			_gridY = grid_y;
			_gridColor = grid_color;
			_gridAlpha = grid_alpha;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public function initGrid( grid_size_x:uint=50, grid_size_y:uint=50, cell_size_x:uint=16, cell_size_y:uint=12 ) : void {
			
			// Guides
			var real_sizeX:uint = grid_size_x * cell_size_x;
			var real_sizeY:uint = grid_size_y * cell_size_y;
			guides.graphics.lineStyle(0);//, 0, 1, true, LineScaleMode.NONE);
			for (var i:uint = 0; i<grid_size_y; i++){
				var real_i = i * cell_size_y;
				guides.graphics.moveTo(0, real_i);
				guides.graphics.lineTo(real_sizeX, real_i);
				for (var j:uint = 0; j<grid_size_x; j++){
					var real_j = j * cell_size_x;
					guides.graphics.moveTo(real_j, 0);
					guides.graphics.lineTo(real_j, real_sizeY);
				}
			}
			
			// Position
			guides.x = _gridX;
			guides.y = _gridY;
			
			// Color
			var cT = new ColorTransform();
			cT.color = _gridColor;
			guides.transform.colorTransform = cT;
			
			// Alpha
			guides.alpha = _gridAlpha;
			
			// hide
			hide();
			
			// Add
			addChild(guides);
			
			// set variables
			_gridSizeX = grid_size_x;
			_gridSizeY = grid_size_y;
			_cellSizeX = cell_size_x;
			_cellSizeY = cell_size_y;
		}
		
		public function initButton( btn_label:String='show/hide Grid', btn_width:uint=112 ) : void {
			var btn = new CheckBox();
			btn.width = btn_width;
			btn.label = btn_label;
			btn.move(width-btn.width,10);
			btn.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
				GuideGrid.reference.showHide(event.target.selected);
			});
			addChild(btn);
		}
		
		public function show() : void {
			showHide(true);
		}

		public function hide() : void {
			showHide(false);
		}
		
		public function showHide( onOff:Object = null ) : void {
			if (onOff == null){
				onOff = !guides.visible;
			}
			guides.visible = onOff;
		}

	}
	
}
