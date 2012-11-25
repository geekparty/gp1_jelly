package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import haxe.io.Error;
import haxe.Timer;
import ru.geekparty.project.hero.Hero;
import ru.geekparty.project.hero.IHeroState;

/**
 * ...
 * @author Null/
 */

class IdleHeroState implements IHeroState
{

	private var hero:Hero; 
	private var timer:Timer;
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	
	public function StateID():Int
	{
		return Hero.STATE_IDLE;
	}
	
	public function WaikUp():Void
	{
		
	}
	
	public function Eat():Void
	{
		trace("Invalid calll from IdleHeroState");
	}
	
	public function Joke():Void
	{
		trace("Invalid calll from IdleHeroState");
	}
	
	public function OnEnter():Void
	{
		hero.SetHeroFrame("idle");
		
		Timer.delay(ChangeStateByTO, cast Math.random() * 500 + 1000);
	}
	
	private function ChangeStateByTO():Void 
	{
		hero.ChangeState(Hero.STATE_READY);
	}
	
	public function OnExit():Void
	{
		
	}
}