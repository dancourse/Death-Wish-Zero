package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import flash.text.TextField;
		import net.flashpunk.graphics.Backdrop;
	
	public class LevelGameWorld extends World
	{

		//private const IMAGE:Class;
	
		private var text:Entity;
		private var okButton:Button;
		private var upButton:Button;
		private var downButton:Button;
		private var dif:int;
		private var t:TextField;
		private var levelNumber:int = 1;
		private var levelText:Entity;

		// NUMBER OF LEVELS
		public var numberOfLevels = 4;
		
		
		[Embed(source = "/assets/ok.png")]
		private const OKBUTTON:Class;
		
		[Embed(source = "/assets/up_arrow.png")]
		private const UPBUTTON:Class;
		
		[Embed(source = "/assets/down_arrow.png")]
		private const DOWNBUTTON:Class;
		
			private var backdrop:Backdrop;
		[Embed(source = "/../src/assets/backdrop.png")]
		private const BACKGROUNDSHEET:Class;
		
		public function LevelGameWorld(difficulty:int)
		{
		
			
			backdrop = new Backdrop(BACKGROUNDSHEET, true, true);
			add(new MyBackground(backdrop));
			text = new CreateText("Enter a number to choose a level, min 1 max 20");
			
			dif = difficulty;
			//graphic = new Text("Enter a number to choose a level, min 1 max 20")
			add(text);
			text.x = 200;
			text.y = 100;
			
			levelText = new CreateText(levelNumber.toString());
			
			levelText.x = 400;
			levelText.y = 300;
			
			add(levelText);
			
			okButton = new Button(okClicked, null);
			upButton = new Button(upClicked, null);
			downButton = new Button(downClicked, null);
			
			okButton.setSprite(OKBUTTON, 256, 117);
			add(okButton);
			okButton.x = 300;
			okButton.y = 450;
			
			upButton.setSprite(UPBUTTON, 129, 69);
			add(upButton);
			upButton.x = 350;
			upButton.y = 150;
			
			downButton.setSprite(DOWNBUTTON, 129, 69);
			add(downButton);
			downButton.x = 350;
			downButton.y = 400;
			
			
			
			FP.screen.color = 0xFFFFFF;

		}
		
		public function okClicked():void
		{
			FP.world = new World1(dif, levelNumber);
		}
		
		private function upClicked():void
		{
			if (levelNumber > 1)
			{
			levelNumber--;
			remove(levelText);
			levelText = new CreateText(levelNumber.toString());
			levelText.x = 400;
			levelText.y = 300;
			add(levelText);
			}
		}
		
		private function downClicked():void
		{
			if (levelNumber < numberOfLevels)
			{levelNumber++;
			remove(levelText);
			levelText = new CreateText(levelNumber.toString());
			levelText.x = 400;
			levelText.y = 300;
			add(levelText);
			}
			}
		
		override public function update():void
		{
			super.update();
		}
	}
}