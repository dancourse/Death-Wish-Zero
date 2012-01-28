package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	
	public class MyBackground extends Entity
	{
		[Embed(source = "/../img/menu_background.png")]
		private const BACKGROUNDSHEET:Class;
		
		public function MyBackground() 
		{
			graphic = new Backdrop(BACKGROUNDSHEET, true, true);
		}
	}
}