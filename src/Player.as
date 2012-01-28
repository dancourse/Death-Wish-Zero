package  
{
	
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	import Spikes;

	
	/**
	 * ...
	 * @author giulio
	 */
	public class Player extends Entity 
	{
		[Embed(source = 'assets/player.png')] private const PLAYER:Class;
		
		/*
		 * Privates Vars
		 */
	
		public var power:Number=5;
		private var jumpPower:Number=15;
		private var hFriction:Number=0.95;
		private var vFriction:Number=0.99;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var gravity:Number = 0.9;
		
		private var health:int = 100;
		private var playerSize:int = 30;
		
		// PLAYER_STATE
		private var STATE:int = 0; // 0=WALKING , 1= JUMPING
		
		// HEALTY BAR in a wrong place but works
		public var healthBar:Entity = new Entity(); 
		
		public function Player(x:int, y:int) 
		{
			graphic = new Image(PLAYER);
			
			// sets starting point
			//setHitbox(graphic.x,graphic.y);
			setHitbox(playerSize, playerSize);
			this.x = x;
			this.y = y;
			
			Input.define("Jump", Key.Z, Key.UP,Key.W);
			Input.define("Shoot", Key.SPACE, Key.X, Key.C);
			Input.define("moveLeft", Key.LEFT, Key.A);
			Input.define("moveRight", Key.RIGHT, Key.D);
			
			Text.size = 20;
			healthBar.graphic = new Text(String(health), 700, 50, 100, 50);
			healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
			
			
		}
		
		public function checkObjectCollisions():void
		{
			
			var sp:Spikes =  collide("spikes", this.x, this.y) as Spikes;
			
			if (sp && sp.getState()==1) {
				
					this.setHealth(health - 10);
					healthBar.graphic = new Text(String(health), 700, 50, 100, 50);
					healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
			}
			
			
			var hi:HealthItem = collide("health_item", this.x, this.y) as HealthItem
			
			if (hi) {
				trace("HEALTH");
				if (health < 50) this.setHealth(health + 50);
				else this.setHealth(100);
				
				healthBar.graphic = new Text(String(health), 700, 50, 100, 50);
				healthBar.graphic.scrollX = healthBar.graphic.scrollY = 0;
				
				hi.remove();
			}
			
			
		}
		
		
		override public function update():void
		{
			// record if any input
			var pressed:Boolean = false;
			
			if (Input.check("moveLeft")) {
				xSpeed = -power;
				pressed = true;
			}
			if (Input.check("moveRight")) {
				xSpeed = power;
				pressed=true;
			}
			if (collide("wall",x,y+1)) {
				ySpeed = 0;
				STATE = 0;
				if (Input.check("Jump")) {
					ySpeed -= jumpPower;
					STATE = 1;
				}
			} else {
				ySpeed+=gravity;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			
			
			// Check collision with other objects.
			checkObjectCollisions();
			
			// Friction 
			//xSpeed*=hFriction;
			ySpeed *= vFriction;
			
			// Change Position
			if (Input.check("moveRight") || Input.check("moveLeft")) setXPosition();
			setYPosition();
			
			
			//Respawn the player on the top if it falls.
			
			if (this.y > 10000) this.y = -250;
			
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
				if (! collide("wall",x+FP.sign(xSpeed),y)) {
					x += FP.sign(xSpeed);
				} else {
					xSpeed=0;
					break;
				}
			}
		}
		private function setYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) {
				if (! collide("wall",x,y+FP.sign(ySpeed))) {
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