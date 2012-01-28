package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	
	public class GameWorld extends World
	{
		[Embed(source = "/../src/assets/alleasy.png")]
		private const EASYSHEET:Class;
		
		[Embed(source = "/../src/assets/allmedium.png")]
		private const MEDIUMSHEET:Class;
		
		[Embed(source = "/../src/assets/allhard.png")]
		private const HARDSHEET:Class;
		
		[Embed(source = "/../src/assets/allcredits.png")]
		private const CREDITSHEET:Class;
		
		[Embed(source = "/../src/assets/allexit.png")]
		private const EXITSHEET:Class;
		
		[Embed(source = "/../src/assets/menu_background.png")]
		private const BACKGROUNDSHEET:Class;
		
		private var sheetArray:Array

		//private const IMAGE:Class;
		
		//private var _gameEntity:GameEntity;
		//private var _box:Box;
		private var _easyButton:Button;
		private var _mediumButton:Button;
		private var _hardButton:Button;
		private var _creditButton:Button;
		private var _exitButton:Button;
		
		private var buttonArray:Array;
		private var functionArray:Array;
		private var yPos:int;
		private var xPos:int;
		private var backdrop:Backdrop;
		
		
		
		public function GameWorld() 
		{
			
			//_easyButton = new Button(PlayEasy, null);
			
			//_easyButton.x = 400;
			//_easyButton.y = 200;
			yPos = 200
			xPos = 249
			
			sheetArray = new Array(EASYSHEET, MEDIUMSHEET, HARDSHEET, CREDITSHEET, EXITSHEET);
			buttonArray = new Array(_easyButton, _mediumButton, _hardButton, _creditButton, _exitButton);
			functionArray = new Array(PlayEasy, PlayMedium, PlayHard, PlayCredit, PlayExit);
			
			backdrop = new Backdrop(BACKGROUNDSHEET);
			
			add(new MyBackground(backdrop));
			
			for (var i:int = 0; i < 5; i++ )
			{
				buttonArray[i] = new Button(functionArray[i], null);
				buttonArray[i].setSpritemap(sheetArray[i], 304, 66);
				add(buttonArray[i]);
				buttonArray[i].x = xPos;
				buttonArray[i].y = yPos;
				yPos = yPos + 66
			}
			
			//_gameEntity = new GameEntity();
			//_box = new Box();
			
			//_mediumButton = new Button(PlayMedium, null); 
			//_hardButton = new Button(PlayHard, null);
			//_creditsButton = new Button(playCredits, null);
			//_exitButton = new Button(exit, null);
			
			
			//_easyButton.setSpritemap(sheetArray[0], 304, 66);
			//_mediumButton.setSpritemap(MEDIUMSHEET, 50, 40);
			//_
			
			//add(_gameEntity);
			//add(_box);
			//add(_easyButton);
			//add(_button2);
			
			
			
			//_box.x = 200;
			//_box.y = 150;
			
			/*
			_button2.x = 200;
			_button2.y = 100;*/
			
			//addGraphic(new Image(IMAGE), 0, 50, 50);
			//addGraphic(new Image(BUTTONSHEET), 0, 50, 50)
		}
		
		private function PlayEasy():void
		{
			FP.world = new World1(1);
			/*
			FP.screen.color = Math.random() * 0xFFFFFF;
			
			trace("The button has been clicked!");*/
		}
		private function PlayMedium():void
		{
			FP.world = new World1(2);
		}
		private function PlayHard():void
		{
			FP.world = new World1(3);
		}
		
		private function PlayCredit():void
		{
			//FP.screen.color = Math.random() * 0xFFFFFF;
			
			//trace("The button has been clicked!");
		}
		
		private function PlayExit():void
		{
			//FP.screen.color = Math.random() * 0xFFFFFF;
			
			//trace("The button has been clicked!");
		}
		
		override public function update():void
		{
			super.update();
			
			var entityArray:Array = [];
			
			getType("GameEntity", entityArray);
			
			for each (var entity:Entity in entityArray)
			{
				entity.x = entity.x > 550 ? 550 : entity.x;
				entity.y = entity.y > 400 ? 400 : entity.y;
			}
			/*
			if (_gameEntity.collideWith(_box, _gameEntity.x, _gameEntity.y))
			{
				_gameEntity.x = _gameEntity.y = 0;
			}*/
		}
		
	}

}