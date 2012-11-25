package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import haxe.Timer;
import nme.events.Event;
import ru.geekparty.project.hero.Hero;
import ru.geekparty.project.hero.IHeroState;

/**
 * ...
 * @author Null/
 */

class EatHeroState implements IHeroState
{

	private var hero:Hero; 
	private var eatAnimation:MovieClip;
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	
	public function StateID():Int
	{
		return Hero.STATE_EAT;
	}
	
	public function WaikUp():Void
	{
		
	}
	
	public function Eat():Void
	{
		
	}
	
	public function Joke():Void
	{
		
	}
	
	public function OnEnter():Void
	{
		hero.SetHeroFrame("eat");
		//Timer.delay(TryEat, 400);
		eatAnimation = cast hero.heroLayout.getChildByName('eat');
		eatAnimation.addEventListener(Event.ENTER_FRAME, HandleEnterFrame);
	}
	
	private function HandleEnterFrame(e:Event):Void {
		if (eatAnimation.currentFrame >= 9) 
		{
			eatAnimation.removeEventListener(Event.ENTER_FRAME, HandleEnterFrame);
			TryEat();
		}
	}
	
	private function TryEat()
	{
		if ( hero.IsFoodInMouth() )
		{
			hero.food.layout.visible = false;
			if ( hero.food.isMouseDown ) {
				hero.Blood();
			}
			else {
				hero.Win();
				}
			
		}
		else
		{
			hero.Fail();			
		}
	}
	
	public function OnExit():Void
	{
		
	}
}