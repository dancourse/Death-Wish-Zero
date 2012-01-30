package  
{
		import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author giulio
	 */
	public class Spikes extends MyEntity 
	{
		[Embed(source = 'assets/spikes_out.png')] private const TILE_OFF:Class;
		[Embed(source = 'assets/spikes_in.png')] private const TILE_ON:Class;
		
		private var STATE:int = 0; // 0=CLOSE  1=OPEN
		private var timecycle:int = 3; //just a placeholder
		private var cycle:int = timecycle;
		private var framerate:int = 60;
		
		
		public function Spikes(posX:int,posY:int,time:int = 3) 
		{
			graphic = new Image(TILE_OFF);
			graphic.y += 32;
			
			setHitbox(32,32);
			type="spikes"; 
			x=posX;
			y = posY;	
			timecycle = time*framerate;
			cycle = time*framerate;
		}
		
		override public function update():void
		{
			super.update();
			
			cycle -= 1; // TO CHANGE WITH TIME_SINCE_LAST_FRAME
			
			if (cycle < 0)
			{
				
				changeState(STATE);
			}
			
			
		}
		
		
		public function getState():int
		{
			return STATE;
		}
		
		public function changeState(STATE:int):void
		{
			
			if (STATE == 0)
			{
				cycle = timecycle;
				graphic = new Image(TILE_ON)
				graphic.y += 32;
				this.STATE = 1;
			}
			else 
			{
				cycle = timecycle;
				graphic = new Image(TILE_OFF)
				graphic.y += 32;
				this.STATE = 0;
			}
		}
		
		
		
		
	}

}