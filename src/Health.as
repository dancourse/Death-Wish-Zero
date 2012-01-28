package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class Health extends MyEntity 
	{
		[Embed(source = 'assets/player.png')] private const HEALTH:Class;
		
		public function Health(posX:int,posY:int) 
		{
			graphic = new Image(HEALTH);
			setHitbox(32,32);
			type="wall"; 
			x=posX;
			y=posY;	
		}
		
	}

}