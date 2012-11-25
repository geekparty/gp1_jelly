package ru.geekparty.project.tests;
import format.swf.MovieClip;
import nme.display.SimpleButton;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.text.TextField;
import ru.geekparty.project.food.FoodItem;
import ru.geekparty.project.hero.Hero;
import nme.Lib;
import nme.events.Event;

/**
 * ...
 * @author Null/
 */

class Game extends Sprite {
	
	private var layout:GUI_game;
	private var hero:Hero; 
	private var clickCount:Int;
	private var food:FoodItem;
	private var resetBtn:SimpleButton;
	
	private var pointsView:TextField;
	private var points:Int;
	
	public function new() 
	{
		super();
		layout = new GUI_game();
		addChild(layout);
		points = 0;
		food = new FoodItem(cast layout.getChildByName('foodStorage1'), HandleTakeFood, HandleDropFood);
		hero = new Hero( cast layout.getChildByName('hero'), food );
		pointsView = cast layout.getChildByName('points');
		pointsView.selectable = false;
		resetBtn = cast layout.getChildByName('reset');
		//layout.scaleX = layout.scaleY = 0.5;
		resetBtn.addEventListener(MouseEvent.CLICK, OnResetClick);
		updateTextField();
	}
	
	
	private function OnResetClick(e:MouseEvent):Void {
		//HandleDropFood();
		Reset();
	}
	
	private function updateTextField() {
		pointsView.text = 'x' + points;		
	}
	
	private function Reset():Void 
	{
		food.Reset();
		hero.Reset();
	}
	
	private function HandleDropFood():Void {
		hero.OnFoodDrop();		
	}
	
	private function HandleTakeFood():Void {
		
		hero.OnFoodTake(HandleFeedSucess, HandleFeedFail );
		
	}	
	
	private function HandleFeedFail():Void
	{
		trace("FAIL");
		//Reset();
		points--;
		updateTextField();
	}
	
	private function HandleFeedSucess():Void 
	{
		trace("WIN");
		points++;
		updateTextField();
		
		
	}
	
	
	
}