package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class Wall extends MyEntity 
	{
		[Embed(source = 'assets/tile_solid.jpg')] private const WALL:Class;
		
		public function Wall(posX:int,posY:int) 
		{
			graphic = new Image(WALL);
			setHitbox(32,32);
			type="wall"; 
			x=posX;
			y=posY;	
		}
		
	}

}