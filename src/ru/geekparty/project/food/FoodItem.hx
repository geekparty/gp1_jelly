package ru.geekparty.project.food;
import format.swf.MovieClip;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.geom.Point;
import nme.Lib;
import nme.events.Event;

/**
 * ...
 * @author Null/
 */

class FoodItem extends Sprite
{
	private static inline var SPEED:Float = 5.5;
	public var layout:MovieClip;
	private var cbOnStartDrag:Void -> Void;
	private var cbOnDrop:Void -> Void;
	private var isFoodTakeOccure:Bool;
	public var isMouseDown:Bool;
	
	private var startPos:Point;
	
	public function new(layout:MovieClip, cbOnStartDrag:Void->Void, cbOnDrop:Void->Void ) 
	{
		super();
		this.layout = layout;
		this.cbOnStartDrag = cbOnStartDrag;	
		this.cbOnDrop = cbOnDrop;
		this.isFoodTakeOccure = false;
		this.startPos = new Point(layout.x, layout.y);
		this.isMouseDown = false;
		
		layout.addEventListener(MouseEvent.MOUSE_DOWN, HandleTakeFood);
		//layout.addEventListener(MouseEvent.MOUSE_UP, HandlePlaceFood);
	}
	
	public function Reset():Void 
	{
		layout.visible = true;
		layout.removeEventListener(Event.ENTER_FRAME, HandleFallingFood);
		isFoodTakeOccure = false;
		layout.x = startPos.x;
		layout.y = startPos.y;
	}
	
	private function HandleDropFood(e:MouseEvent):Void 
	{
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, HandleDropFood);
		layout.stopDrag();
		cbOnDrop();
		isMouseDown = false;
		layout.addEventListener(Event.ENTER_FRAME, HandleFallingFood);
	}
	
	private function HandleFallingFood(e:Event):Void {
		layout.y += SPEED;
		
	}
	
	private function HandleTakeFood(e:MouseEvent):Void 
	{
		isMouseDown = true;
		if ( isFoodTakeOccure )
		{
			return;
		}
		isFoodTakeOccure = true;
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, HandleDropFood);
		layout.startDrag();
		cbOnStartDrag();		
	}
	
	
}