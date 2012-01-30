package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author giulio
	 */
	public class HealthBar extends Entity 
	{
		/*[Embed(source = 'assets/healthvalues.png')] private const BAR:Class;
		public var sprMapBar:Spritemap = new Spritemap(BAR, 48, 32);*/
		
		var healthtxt:Text;
		
		[Embed(source = 'assets/healthbar_empty.png')] private const EMPTY:Class;
		[Embed(source = 'assets/healthbar_strip.png')] private const STRIP:Class;
		
		public var sprMapBar:Spritemap = new Spritemap(STRIP, 282, 44);
		
		public function HealthBar(x:int,y:int) 
		{
			super();
			 healthtxt = new Text("LIFE: "+String(100));
		
		// step 1 tell flashPunk what size you want the text
			Text.size = 25;
			
			// optional step 3b - position the text somewhere else - here I center it on the screen.
			this.x = (x -  healthtxt.width / 2);
			this.y = (y -  healthtxt.height / 2);
			
			
			
			//graphic = new Text(health);
			graphic = sprMapBar
			graphic.scrollX = graphic.scrollY = 0;
			
			
		sprMapBar.add("zero", [0], 1, false);
		sprMapBar.add("one", [1], 1, false);
		sprMapBar.add("two", [2], 1, false);
		sprMapBar.add("three", [3], 1, false);
		sprMapBar.add("four", [4], 1, false);
		sprMapBar.add("five", [5], 1, false);
		sprMapBar.add("six", [6], 1, false);
		sprMapBar.add("seven", [7], 1, false);
		sprMapBar.add("eight", [8], 1, false);
		
		sprMapBar.play("five");
		
		
		}
		
		 public function update2(health:int):void 
		{
					
					
					
					//this.graphic = new Text(health);
					Text.size = 25;
					graphic = sprMapBar
					graphic.scrollX = graphic.scrollY = 0;
					
					if (health < 10) sprMapBar.play("zero");
					if (health >= 10 && health < 20) sprMapBar.play("one");
					if (health >= 20 && health < 50) sprMapBar.play("two");
					if (health >= 50 && health < 80) sprMapBar.play("three");
					if (health >= 80 && health < 100) sprMapBar.play("four");
					if (health >= 100 && health < 150) sprMapBar.play("five");
					if (health >= 150 && health < 200) sprMapBar.play("six");
					if (health >= 200 && health < 250) sprMapBar.play("seven");
					if (health >= 250) sprMapBar.play("eight");
					
			
		}
		
	}

}