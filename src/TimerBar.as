package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	
		import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	
	import flash.events.EventDispatcher;
    import flash.events.Event;

	
	/**
	 * ...
	 * @author dancourse
	 */
	public class TimerBar extends Entity 
	{
		/*[Embed(source = 'assets/healthvalues.png')] private const BAR:Class;
		public var sprMapBar:Spritemap = new Spritemap(BAR, 48, 32);*/
		
		var timertxt:Text;
		var countDownFrom:int = 0;
		var countDownAt:int = 0;

		
		var theTimer:Timer;
		
		public function TimerBar(x:int,y:int) 
		{
			super();
			timertxt = new Text(String(100));
			
			if (this.theTimer != null) this.theTimer.stop();
			
		
		// step 1 tell flashPunk what size you want the text
			Text.size = 10;
			
			// optional step 3b - position the text somewhere else - here I center it on the screen.
			this.x = (x -  timertxt.width / 2);
			this.y = (y -  timertxt.height / 2);
			
			
			
			/*
			sprMapBar.add("zero", [0], 1, false);
			sprMapBar.add("one", [1], 1, false);
			sprMapBar.add("two", [2], 1, false);
			sprMapBar.add("three", [3], 1, false);
			sprMapBar.add("four", [4], 1, false);
			sprMapBar.add("five", [5], 1, false);
			sprMapBar.add("six", [6], 1, false);
			sprMapBar.add("seven", [7], 1, false);
			sprMapBar.add("eight", [8], 1, false);
			*/
		
			//graphic.scrollX = graphic.scrollY = 0;
		
		}
		
		public function startCounting (time:int):void
		{			
			this.countDownFrom = time;
			this.countDownAt = time;
			
			this.updateClock()
			
		}
		
		public function updateClock (e:TimerEvent=null):void
		{
			if (this.theTimer) this.theTimer.stop();
			
			this.countDownAt --;
			
			trace('updateClock::' + this.countDownAt)
			
			// is the timer complete
			if (this.countDownAt <= 0) 
			{	
				return;
			}
			
			this.theTimer = new Timer(1000, 1);
			this.theTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.updateClock);
			this.theTimer.start();
		}
		
		public function update2(timer:String):void 
		{
			//sprMapBar.pay(health);
			super.update();
			this.graphic = new Text(timer);
			
		}
		
	}

}