package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import ru.geekparty.project.hero.Hero;

/**
 * ...
 * @author Null/
 */

class FailHeroState  implements IHeroState
{

	private var hero:Hero; 
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	
	public function StateID():Int
	{
		return Hero.STATE_FAIL;
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
		hero.SetHeroFrame("fail");
	}
	
	public function OnExit():Void
	{
		
	}
}