package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author giulio
	 */
	public class HealthBar extends Entity 
	{
		/*[Embed(source = 'assets/healthvalues.png')] private const BAR:Class;
		public var sprMapBar:Spritemap = new Spritemap(BAR, 48, 32);*/
		
		var healthtxt:Text;
		
		public function HealthBar(x:int,y:int) 
		{
			super();
			 healthtxt = new Text(String(100));
		
		// step 1 tell flashPunk what size you want the text
			Text.size = 10;
			
			// optional step 3b - position the text somewhere else - here I center it on the screen.
			this.x = (x -  healthtxt.width / 2);
			this.y = (y -  healthtxt.height / 2);
			
			
			
			/*
		sprMapBar.add("zero", [0], 1, false);
		sprMapBar.add("one", [1], 1, false);
		sprMapBar.add("two", [2], 1, false);
		sprMapBar.add("three", [3], 1, false);
		sprMapBar.add("four", [4], 1, false);
		sprMapBar.add("five", [5], 1, false);
		sprMapBar.add("six", [6], 1, false);
		sprMapBar.add("seven", [7], 1, false);
		sprMapBar.add("eight", [8], 1, false);
		*/
		
		graphic.scrollX = graphic.scrollY = 0;
		
		}
		
		public function update2(health:String):void 
		{
			
					//sprMapBar.pay(health);
					super.update();
					this.graphic = new Text(health);
			
		}
		
	}

}