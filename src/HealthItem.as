package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author giulio
	 */
	public class HealthItem extends MyEntity 
	{
		[Embed(source = 'assets/health.png')] private const TILE:Class;
		
		public function HealthItem(x:int, y:int) 
		{
			graphic = new Image(TILE);
			setHitbox(graphic.x,graphic.y);
			type="health_item"; 
			this.x=x;
			this.y = y;	
		}
		
		public function remove():void
		{
			
		}
		
	}

}