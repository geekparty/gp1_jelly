package ru.geekparty.project.hero;

/**
 * ...
 * @author Null/
 */

class BloodHeroState implements IHeroState
{

	private var hero:Hero; 
	
	public function new(hero:Hero) 
	{
		this.hero = hero;
	}
	
	
	public function StateID():Int
	{
		return Hero.STATE_BLOOD;
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
		hero.SetHeroFrame("blood");
	}
	
	public function OnExit():Void
	{
		
	}
}