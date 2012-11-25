package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import haxe.Timer;
import ru.geekparty.project.hero.Hero;

/**
 * ...
 * @author Null/
 */

class ReadyHeroState  implements IHeroState
{

	private var hero:Hero; 
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	public function StateID():Int
	{
		return Hero.STATE_READY;
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
		hero.SetHeroFrame("ready");
		Timer.delay(ChangeStateByTO, cast Math.random() * 2000 + 100);
	}
	
	private function ChangeStateByTO():Void 
	{
		hero.ChangeState(Hero.STATE_EAT);
	}
	
	public function OnExit():Void
	{
		
	}
}