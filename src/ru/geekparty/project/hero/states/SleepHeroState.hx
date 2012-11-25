package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import ru.geekparty.project.hero.Hero;
import ru.geekparty.project.hero.IHeroState;

/**
 * ...
 * @author Null/
 */

class SleepHeroState implements IHeroState
{

	private var hero:Hero; 
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	public function StateID():Int
	{
		return Hero.STATE_SLEEP;
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
		hero.SetHeroFrame("sleep");
	}
	
	public function OnExit():Void
	{
		
	}
}