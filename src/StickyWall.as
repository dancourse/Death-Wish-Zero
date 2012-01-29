package  
{
	import net.flashpunk.graphics.Image;
		import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class StickyWall extends MyEntity 
	{
		public static var friction:Number = 0.5;
		
		[Embed(source ='assets/tile_health.jpg')] private const STICKYWALL:Class;
		
		public function StickyWall(posX:int,posY:int) 
		{
			graphic = new Image( STICKYWALL);
			setHitbox(32,32);
			type="stickywall"; 
			x=posX;
			y=posY;	
			
		}
		
	}

}