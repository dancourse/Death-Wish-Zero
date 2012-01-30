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
		public static var friction:Number = 1;
		
		[Embed(source = 'assets/tile_solid.png')] private const WALL:Class;
		[Embed(source = 'assets/ground_block.png')] private const GROUND:Class;
		
		public function Wall(posX:int,posY:int,mode:int =0) 
		{
			if (mode == 0) graphic = new Image(WALL);
			else graphic = new Image(GROUND);
			setHitbox(32,32);
			type="wall"; 
			x=posX;
			y=posY;	
		}
		
	}

}