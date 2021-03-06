package  
{
	
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import Spikes;
	import StickyWall;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class Player extends Entity 
	{
		/**
		 * PLAYER TILES
		 */
		[Embed(source = 'assets/dude_standing_left.png')]
		private const STD_LEFT:Class;
		[Embed(source = 'assets/dude_standing_right.png')]
		private const STD_RIGHT:Class;
		
		[Embed(source = 'assets/dude_jumping_left.png')]
		private const JMP_LEFT:Class;
		[Embed(source = 'assets/dude_jumping_right.png')]
		private const JMP_RIGHT:Class;
		
		[Embed(source = 'assets/dude_running_left.png')]
		private const RUN_LEFT:Class;
		[Embed(source = 'assets/dude_running_right.png')]
		private const RUN_RIGHT:Class;

		public var std_left:Spritemap = new Spritemap(STD_LEFT, 64, 64);
		public var std_right:Spritemap = new Spritemap(STD_RIGHT, 64, 64);
		
		public var jmp_left:Spritemap = new Spritemap(JMP_LEFT, 64, 64);
		public var jmp_right:Spritemap = new Spritemap(JMP_RIGHT, 64, 64);
		
		public var run_left:Spritemap = new Spritemap(RUN_LEFT, 64, 64);
		public var run_right:Spritemap = new Spritemap(RUN_RIGHT, 64, 64);
		 
		
		
		/*
		 * Privates Vars
		 */
	
		public var power:Number=7;
		private var jumpPower:Number = 20;
		
		private var hFriction:Number=0.95;
		private var vFriction:Number=0.99;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var gravity:Number = 0.9;
		var dir:Boolean = false;
		private var health:int = 100;
		private var playerSize:int = 32;
		
		private var jumpSound:Sound = new Sound(new URLRequest("../src/assets/jump.mp3"));
		private var deathSound:Sound = new Sound(new URLRequest("../src/assets/death.mp3"));
		private var damageSound:Sound = new Sound(new URLRequest("../src/assets/damage.mp3"));
		
		// PLAYER_STATE
		private var STATE:int = 0; // 0=WALKING , 1= AIR, 2= STANDING
		
		// HEALTY BAR in a wrong place but works
		public var healthBar:HealthBar = new HealthBar(200,50); 
		
		public var timerBar:TimerBar = new TimerBar(650,50); 
		
		// sets the level time
		public function setTime (time:int):void
		{			
			// TIMER
			timerBar.startCounting(time);
		}
		
		public function Player(x:int, y:int) 
		{
			
			
			// sets starting point
			//setHitbox(graphic.x,graphic.y);
			setHitbox(playerSize, playerSize);
			this.x = x;
			this.y = y;
			
			this.width = 64;
			this.height = 64;
			
			
			Input.define("Jump", Key.Z, Key.UP,Key.W);
			Input.define("Shoot", Key.SPACE, Key.X, Key.C);
			Input.define("moveLeft", Key.LEFT, Key.A);
			Input.define("moveRight", Key.RIGHT, Key.D);
			
			Text.size = 20;
			//healthBar.graphic = new Text("LIFE: "+String(health), 650, 50, 100, 50);
			healthBar = new HealthBar(550, 50);
			healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
			
			
			
			timerBar.graphic  = new Text("IM _HERE");
			timerBar.graphic.scrollX = timerBar.graphic.scrollY = 0;

			
			// ANIMATIONS
			
			std_left.add("std_left", [0], 1, false);
			std_right.add("std_right", [0], 1, false);
			
			jmp_left.add("jmp_left", [0,1,2,3,4,5,6], 20, true);
			jmp_right.add("jmp_right", [0,1,2,3,4,5,6], 20, true);
			
			run_left.add("run_left", [0,1,2,3,4], 20, true);
			run_right.add("run_right", [0,1,2,3,4], 20, true);
			
		
		
			
			graphic = std_right;
			
			
		}
		
		
		
		
		public function checkObjectCollisions():void
		{
			
			
			var sp:Spikes = collide("spikes", this.x, this.y) as Spikes
			
			if ( sp && sp.getState()==1) {
				
					damageSound.play();
					this.setHealth(health - 10);
					//healthBar.graphic = new Text("LIFE: "+String(health), 650, 50, 100, 50);
					//healthBar = new HealthBar(550, 50);
					healthBar.update2(health);
					healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
					sp.changeState(1);
					trace("Spike collinding" + STATE);
			}
			
			
			var hi:HealthItem = collide("health_item", this.x, this.y) as HealthItem
			
			if (hi) {
				 this.setHealth(health + 50);
				damageSound.play();
				
				//healthBar.update();
				//healthBar.graphic = new Text("LIFE: "+String(health), 650, 50, 100, 50);
				//healthBar = new HealthBar(550, 50);
				healthBar.update2(health);
				healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
				hi.remove();
			}
			
			
		}
		
		
		protected function stateMachine(nextState:int,dir:Boolean):void
		{
			
			//trace("Next:"+nextState+"  State:" + STATE + "  dir:" + dir);
			
			// TO running
			if (nextState == 0)
			{	
				
				if (STATE == 1 && dir == true) 
				{
					graphic = std_left;
					std_left.play("std_left");
					STATE = 1;
				}
				if (STATE == 2 && dir == true || STATE == 0 && dir == true)
				{
					graphic = run_left;
					run_left.play("run_left");
					STATE = 0;
				}
				if (STATE == 1 && dir == false ) 
				{
					graphic = std_right;
					std_right.play("std_right");
					STATE = 1;
				}
				if (STATE == 2 && dir == false || STATE == 0 && dir == false)
				{
					graphic = run_right;
					run_right.play("run_right");
					STATE = 0;
				}
				
			}
			
			// TO JUMPING
			if (nextState == 1)
			{	
				if (STATE == 0 && dir == true || STATE == 2 && dir == true)
				{
					graphic = jmp_left;
					jmp_left.play("jmp_left");
					jumpSound.play();
				}
				if (STATE == 0 && dir == false || STATE == 2 && dir == false)
				{
					graphic = jmp_right;
					jmp_right.play("jmp_right");
					jumpSound.play();
				}
				if (STATE == 1 && dir == true)
				{
					graphic = std_left;
					std_left.play("std_left");
				}
				if (STATE == 1 && dir == false)
				{
					graphic = std_right;
					std_right.play("std_right");
				}
				STATE = 1;
			}
			
			// TO STANDING
			if (nextState == 2)
			{	
				if (STATE == 0 && dir == true)
				{
					graphic = std_left;
					std_left.play("std_left");
					STATE = 2;
				}
				if (STATE == 1 && dir == true)
				{
					graphic = std_left;
					std_left.play("std_left");
					STATE = 2;
				}
				if (STATE == 0 && dir == false || STATE == 1 && dir == false)
				{
					graphic = std_right;
					std_right.play("std_right");
					STATE = 2;
				}
				if (STATE == 1 && dir == false)
				{
					graphic = std_right;
					std_right.play("std_right");
					STATE = 2;
				}
				
			}
			
			
		}
		
		
		override public function update():void
		{
			// record if any input
			
			
			if (Input.check("moveLeft")) 
			{
				xSpeed = -power;
				dir = true;
				stateMachine(0,dir);
				
			}
			
			if (Input.check("moveRight")) 
			{
				xSpeed = power;
				dir = false;
				stateMachine(0,dir);
			}
				
				
			if (collide("wall", x, y + 1) || collide("stickywall", x, y + 1) ) 
			{
				ySpeed = 0;
				if (Input.check("Jump") && STATE != 1) 
					{
					ySpeed -= jumpPower;
					stateMachine(1,dir);
					}
				else
				{
					if (STATE == 1 ) 
						stateMachine(2, dir);
				}
				if (STATE == 0 && !Input.check("moveLeft") && !Input.check("moveRight")) stateMachine(2, dir);
			}
			else 
			{
				ySpeed += gravity;
			}
				
				
				if (collide("stickywall", x,y+1))
				{
					
					xSpeed = xSpeed * StickyWall.friction;
				}
				
			if (Math.abs(xSpeed)<1&& STATE==0) {
				xSpeed=0;
			}
			
			
			
			// Check collision with other objects.
			checkObjectCollisions();
			
			// timer update
			timerBar.graphic = new Text(String(this.timerBar.countDownAt), 650, 140, 100, 50);
			timerBar.graphic.scrollX = timerBar.graphic.scrollY = 0;
			
			// Change Position
			if (Input.check("moveRight") || Input.check("moveLeft")) setXPosition();
			setYPosition();
			
			
			//Respawn the player on the top if it falls.
			
			if (this.y > 5000) {
				this.y = -1050;
				ySpeed = 0;
			}
			
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
		
		private function setXPosition():void {
			for (var i:int=0; i<Math.abs(xSpeed); i++) {
				if (! collide("wall",x+FP.sign(xSpeed),y) && !collide("stickywall", x+FP.sign(xSpeed),y)) {
					x += FP.sign(xSpeed);
				} else {
					trace("CANT MOVE");
					xSpeed=0;
					break;
				}
			}
		}
		private function setYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) {
				if (! collide("wall",x,y+FP.sign(ySpeed)) && !collide("stickywall",x,y+FP.sign(ySpeed))) {
					y+=FP.sign(ySpeed);
				} else {
					ySpeed=0;
					break;
				}
			}
		}
		
		
		
		
		public function getState():int
		{
			return STATE;
		}
		
		public function getHealth():int
		{
			return health;
		}
		public function setHealth(x:int):void
		{
			health = x;
		}
		
		
	}

}