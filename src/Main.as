package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
		
			super(800, 600, 60, false);
			FP.world = new Intro;//new World1;
		}
		
		//function used to initialise the game. Called once at the beginning
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}

		
	}
	
}