package ru.geekparty.project.hero;
import format.swf.MovieClip;
import ru.geekparty.project.food.FoodItem;
import ru.geekparty.project.hero.states.EatHeroState;
import ru.geekparty.project.hero.states.FailHeroState;
import ru.geekparty.project.hero.states.IdleHeroState;
import ru.geekparty.project.hero.states.JokeHeroState;
import ru.geekparty.project.hero.states.ReadyHeroState;
import ru.geekparty.project.hero.states.SleepHeroState;
import ru.geekparty.project.hero.states.WinHeroState;
import nme.events.MouseEvent;

/**
 * ...
 * @author Null/
 */

class Hero 
{
	public static inline var STATE_SLEEP:Int = 0;
	public static inline var STATE_IDLE:Int = 1;
	public static inline var STATE_READY:Int = 2;
	public static inline var STATE_EAT:Int = 3;
	public static inline var STATE_JOKE:Int = 4;
	
	public static inline var STATE_FAIL:Int = 5;
	public static inline var STATE_WIN:Int = 6;
	public static inline var STATE_BLOOD:Int = 7;
	
	public var states:Array<IHeroState>;
	
	private var curState:IHeroState; 
	
	public var heroLayout:MovieClip; // Hero 
	private var activeZone:MovieClip;
	
	public static inline var ZONE_INVALID:Int = 1; // Food still is on Mouse	
	public static inline var ZONE_MOUTH:Int = 2; 
	public static inline var ZONE_BODY:Int = 3; 
	public static inline var ZONE_OUT_OF_BODY:Int = 4; 
	
	private var curMouseZone:Int;
	private var foodDropZone:Int;
	private var cbWin:Void -> Void;
	private var cbFail:Void -> Void;
	public var food:FoodItem;
	
	public function new(heroLayout:MovieClip, food:FoodItem) 
	{
		this.heroLayout = heroLayout;
		this.foodDropZone = ZONE_INVALID;
		this.curMouseZone = ZONE_OUT_OF_BODY;
		this.food = food;
		
		states = 
		[
			new SleepHeroState(this),
			new IdleHeroState(this),
			new ReadyHeroState(this),
			new EatHeroState(this),
			new JokeHeroState(this),
			new FailHeroState(this),
			new WinHeroState(this),
			new BloodHeroState(this)
		];		
		
		activeZone = cast heroLayout.getChildByName('activeZone');
		
		Reset();
	}
	
	public function OnFoodTake(cbWin:Void->Void, cbFail:Void->Void):Void 
	{
		this.cbWin = cbWin;
		this.cbFail = cbFail;
		
		ChangeState(STATE_IDLE);
	}
	
	public function Reset():Void {
		//heroLayout.removeEventListener(MouseEvent.ROLL_OVER, OnRollOver);
		//activeZone.removeEventListener(MouseEvent.ROLL_OVER, OnRollOverActiveZone);		
		//activeZone.removeEventListener(MouseEvent.ROLL_OUT, OnRollOutActiveZone);
		ChangeState(STATE_SLEEP);
	}
	
	private function ActivateListeners():Void 
	{		
		//heroLayout.addEventListener(MouseEvent.ROLL_OVER, OnRollOver);
		//activeZone.addEventListener(MouseEvent.ROLL_OVER, OnRollOverActiveZone);		
		//activeZone.addEventListener(MouseEvent.ROLL_OUT, OnRollOutActiveZone);
	}
	
	public function HandleDropFood():Void 
	{
		
	}
	
	private function OnRollOutActiveZone(e:MouseEvent):Void {
		
	}
	
	private function OnRollOverActiveZone(e:MouseEvent):Void {
		
	}
	
	private function OnRollOver(e:MouseEvent):Void {
				
	}
	
	public function SetHeroFrame(label:String):Void 
	{
		heroLayout.gotoAndStop(label);
	}
	
	
	
	public function OnFoodDrop():Void
	{
		
	}
	
	public function OnOverBody():Void 
	{
		ChangeState(STATE_IDLE);
	}
	
	public function OnOverMouth():Void 
	{
		ChangeState(STATE_READY);
	}
	
	public function OnOutMouth():Void 
	{
		
	}
	
	public function OnMouseUp():Void 
	{
		
	}
	
	public function ChangeState(state:Int):Void
	{
		if (curState != null)
		{
			curState.OnExit();
		}
			
		curState = states[state];
		curState.OnEnter();
	}
	
	public function IsFoodInMouth() :Bool
	{
		return activeZone.hitTestObject(food.layout);
	}
	
	public function Win() :Void
	{
		ChangeState(STATE_WIN);
		cbWin();
	}
	
	public function Fail() :Void
	{
		ChangeState(STATE_FAIL);
		cbFail();
	}
	
	public function Blood() 
	{
		ChangeState(STATE_BLOOD);
		cbFail();
	}
	
}