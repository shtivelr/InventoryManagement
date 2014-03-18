package 
{

import fl.controls.listClasses.CellRenderer;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class jobCellRenderer extends CellRenderer
{
private var tf:TextFormat;

public function jobCellRenderer()
{
tf = new TextFormat();
tf.align = TextFormatAlign.CENTER;
}

override protected function drawLayout():void
{
textField.setTextFormat(tf);
super.drawLayout();
}
}
}