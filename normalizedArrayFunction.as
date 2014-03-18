package  {
	
public class normalizedArrayFunction {
    private var score: Number;
    private var indx:int;
	private var product:int;

    public function normalizedArrayFunction(score:Number, indx:int, product:int) {
        this.score = score;
        this.indx = indx;
		this.product = product;
    }

    public function toString():String {
        return " " + score + ":" + indx + ":" + product;
    }
}
}
