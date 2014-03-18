package{
	
import flash.display.*;
import flash.text.*;
import flash.geom.*;
import flash.events.Event;
import flash.events.MouseEvent;
	
	public class drawBarChartCredit extends MovieClip{
		public var TextArray:Array = new Array();
		
		public function drawBarChartCredit(recX:Number, recY:Number, recWidth:Number, recHeight:Number, recScaleY:int){

var labelYAdjust:Number = 0;
var labelXAdjust:Number = 0;
var day:Array = new Array;
var invLevel:Array = new Array;

var chartBackground:Sprite = new Sprite; // initializing the variable named chartBackground
chartBackground.graphics.beginFill(0xCCCCCC); // choosing the colour for the fill, here it is red
chartBackground.graphics.drawRect(recX, recY, recWidth, recHeight + 10); // (x spacing, y spacing, width, height)
chartBackground.graphics.endFill(); // not always needed but I like to put it in to end the fill

addChild(chartBackground); // adds the rectangle to the stage

var recGridLines:Sprite = new Sprite;
recGridLines.graphics.lineStyle(1,0x000000);	
recGridLines.graphics.moveTo(recX + recWidth*1.75/7, recY + recHeight/7);
recGridLines.graphics.lineTo(recX + recWidth*1.75/7, recY + recHeight*6/7);
recGridLines.graphics.lineTo(recX + recWidth*6.75/7, recY + recHeight*6/7);


// Adds the scale values on the vertical axis
var j:int;
for (j = 1; j < 7; j++){
var txt:TextField = new TextField();
txt.text = String(recScaleY - (j-1)*recScaleY/5);
txt.x = recX - recWidth*2/7;
txt.y = recY + j*recHeight/7 - 9;
//txt.border = true;
txt.autoSize = "right";
chartBackground.addChild(txt);
}

// Adds the scale values on the horizontal axis.  Hardcoded for 5 day simulations only.
for (i = 0; i <= 4; i++){
var txt2:TextField = new TextField;
TextArray[i] = txt2;
TextArray[i].text = String(i + 1);
TextArray[i].x = recX + recWidth*(i + 2.25)/7 - 5;
TextArray[i].y = recY + recHeight*6.1/7;
TextArray[i].autoSize = "left";
chartBackground.addChild(TextArray[i]);
}
//trace(TextArray);

// rotated y-label for chart  
var myFont:Font = new TimesNewRoman(); /* Create a new TextFormat object, and set the font property to the myFont object's fontName property. */ 
var myFormat:TextFormat = new TextFormat(); 
myFormat.font = myFont.fontName; 
myFormat.size = 12; 
/* Create a new TextField object, assign the text format using the defaultTextFormat property, set the embedFonts property to true, set the antiAliasType property to "advanced", and rotate the text field. */ 
var myTextField:TextField = new TextField(); 
myTextField.autoSize = TextFieldAutoSize.LEFT; 
myTextField.embedFonts = true; 
myTextField.antiAliasType = AntiAliasType.ADVANCED; 
myTextField.defaultTextFormat = myFormat; 
myTextField.text = "Available Credit"; 
if (myTextField.width > recHeight*5/7){
	labelYAdjust = 0;
	}
	else{
		labelYAdjust = (recHeight*5/7 - myTextField.width)/2;
	}
//myTextField.border = true; 
myTextField.x = recX + recWidth*.05/7; 
myTextField.y = recY + recHeight*6/7 - labelYAdjust; 
myTextField.rotation = -90; 
chartBackground.addChild(myTextField);

var txt4:TextField = new TextField();
txt4.text = String("Day");
txt4.autoSize = "left";
if (txt4.width > recWidth*5/7){
	labelXAdjust = 0;
}
	else{
		
		labelXAdjust = (recWidth*5/7 - txt4.width)/2;
	}

	
txt4.x = recX + recWidth*1.75/7 + labelXAdjust;
txt4.y = recY + recHeight*6.5/7;

chartBackground.addChild(txt4);


var i:int;
for (i=6; i > 0; i--){
recGridLines.graphics.moveTo(recX + recWidth*(i+.75)/7, recY + recHeight*5.9/7); // horizontal tick lines
recGridLines.graphics.lineTo(recX + recWidth*(i+.75)/7, recY + recHeight*6.1/7);

recGridLines.graphics.moveTo(recX + recWidth*1.75*.9/7, recY + recHeight*i/7);  // vertical tick lines
recGridLines.graphics.lineTo(recX + recWidth*1.75*1.1/7, recY + recHeight*i/7);
	 }
chartBackground.addChild(recGridLines); 

	  
	  
	  var lineSeries:Sprite = new Sprite;
	  lineSeries.graphics.lineStyle(3, 0xCC0000);
	  lineSeries.graphics.moveTo(recX + recWidth/7 + recWidth*.5/7, recY + recHeight*6/7);
	  for (j = 0; j < day.length; j++){
	  lineSeries.graphics.lineTo(recX + recWidth*day[j]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[j]/recScaleY)*(5/7)*recHeight);  
	  }
	  /*lineSeries.graphics.moveTo(recX + recWidth/7 + recWidth*.5/7, recY + recHeight*6/7);
	  lineSeries.graphics.lineTo(recX + recWidth*day[0]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[0]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[1]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[1]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[2]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[2]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[3]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[3]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[4]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[4]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[5]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[5]/recScaleY)*(5/7)*recHeight);
	  lineSeries.graphics.lineTo(recX + recWidth*day[6]/7 + recWidth*.5/7, recY + recHeight*(6/7)-(invLevel[6]/recScaleY)*(5/7)*recHeight);*/
	  
	 // lineSeries.scrollRect = new Rectangle(-(recX + recWidth*1.5/7), 0, 300, 300);
	  chartBackground.addChild(lineSeries);
		}
	}
}