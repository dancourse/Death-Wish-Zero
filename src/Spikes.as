package  
{
		import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author giulio
	 */
	public class Spikes extends MyEntity 
	{
		[Embed(source = 'assets/spikes.png')] private const TILE:Class;
		
		
		private var STATE:int = 0;
		private var timecycle:int = 3; //just a placeholder
		private var cycle:int = timecycle;
		
		
		public function Spikes(posX:int,posY:int,time:int = 3) 
		{
			graphic = new Image(TILE);
			setHitbox(graphic.x,graphic.y);
			type="spikes"; 
			x=posX;
			y = posY;	
			timecycle = time;
			cycle = 3;
		}
		
		override public function update():void
		{
			super.update();
			
			cycle -= 1; // TO CHANGE WITH TIME_SINCE_LAST_FRAME
			
			if (cycle < 0)
			{
				cycle = timecycle;
				changeState();
			}
			
			
		}
		
		
		public function getState():int
		{
			return STATE;
		}
		
		protected function changeState():void
		{
			if (STATE == 0)
			{
				
				STATE = 1;
			}
			else
			{
				
				STATE = 0;
			}
		}
		
		
		
		
	}

}