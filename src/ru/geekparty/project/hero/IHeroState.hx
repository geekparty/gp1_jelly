package ru.geekparty.project.hero;

/**
 * ...
 * @author Null/
 */

interface IHeroState 
{
	function StateID():Int;
	
	function WaikUp():Void;
	function Eat():Void;
	function Joke():Void;
	
	function OnEnter():Void;
	function OnExit():Void;
	
	
}