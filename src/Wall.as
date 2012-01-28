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
			setHitbox(30,30);
			type="wall"; 
			x=posX;
			y=posY;	
		}
		
	}

}