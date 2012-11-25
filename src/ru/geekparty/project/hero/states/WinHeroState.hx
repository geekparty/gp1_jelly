package ru.geekparty.project.hero.states;
import format.swf.MovieClip;
import ru.geekparty.project.hero.Hero;

/**
 * ...
 * @author Null/
 */

class WinHeroState  implements IHeroState
{

	private var hero:Hero; 
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	
	public function StateID():Int
	{
		return Hero.STATE_WIN;
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
		hero.SetHeroFrame("win");
	}
	
	public function OnExit():Void
	{
		
	}
}