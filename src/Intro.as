package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
		import net.flashpunk.graphics.Backdrop;

	
	/**
	 * ...
	 * @author giulio
	 */
	public class Intro extends World 
	{
		[Embed(source = "/../src/assets/intro.png")]
		private const BACKGROUNDSHEET:Class;
		
		private var backdrop:Backdrop;
		private var difficulty;
		
		public function Intro() 
		{
			backdrop = new Backdrop(BACKGROUNDSHEET);
			add(new MyBackground(backdrop));
			
			
			Input.define("Ok", Key.Z, Key.UP,Key.W,Key.ENTER);
			
		}
		
		override public function update():void
		{
			super.update();
			if (Input.check("Ok") || Input.mouseReleased) FP.world = new GameWorld();
			
		}
		
		
	}

}