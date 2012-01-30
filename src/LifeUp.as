package  
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author dancourse
	 */
	public class LifeUp extends MyEntity 
	{
		[Embed(source = 'assets/levelup_message.png')] 
		private const LIFEUP:Class;

		private var isShowing:Boolean;
		private var theTimer:Timer;

		public function LifeUp(x:int, y:int) 
		{

			graphic = new Image(LIFEUP);
			
			this.x = FP.camera.x+ FP.width;
			this.y = FP.camera.y+ FP.height;

		}

		public function showMe (x:int, y:int):void
		{
			if (this.isShowing == true)
			{
				return ;
			}

		this.x = x;
		this.y = y;
		

			trace('***SHOW LIFE UP');



		}

		public function timer_done(e:TimerEvent):void
		{
			trace("HIDE LIFE UP")

			this.theTimer.stop();

			this.hideMe();
		}

		public function hideMe ():void
		{
			this.remove()
			this.isShowing = false;

			this.visible = false;
		}
		public function remove():void
		{
			if (this) 
			{
				world.remove(this);
			}

			graphic = null;


		}

	}

}