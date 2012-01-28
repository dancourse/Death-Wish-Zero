package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class MyEntity extends Entity 
	{
		[Embed(source = 'assets/player.png')] private const PLAYER:Class;
		
		
		
		
		public function MyEntity() 
		{
			graphic = new Image(PLAYER);
		}
		
		
		public function setPosition(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function getPosition():Point
		{
			return new Point(this.x, this.y);
		}
		
		override public function update():void
		{
			
		}
		
		
	}

}