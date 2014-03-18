package{
	import flash.display.Sprite;
	import fl.controls.Slider;
	import fl.controls.SliderDirection;
	import fl.controls.CheckBox;
	import fl.controls.Button;
	import flash.events.*;
	import flash.text.*;
	import flash.display.*;
	import fl.controls.DataGrid;
	import fl.controls.ScrollPolicy;
	import fl.data.DataProvider;
	import fl.controls.NumericStepper;
	import flash.system.System;
	import flash.geom.ColorTransform;
	import flash.text.TextFormat;
	import fl.events.ListEvent;
	import fl.events.DataGridEvent;
	import fl.data.DataProvider;

	public class Main extends MovieClip{
		var sliderArray:Array = new Array(); 
		var sliderTextFieldValueArray:Array = new Array();
		var invItemColorArray:Array = new Array(0x660033, 0x0000EE, 0xFF6600, 0x663300, 0x00FFFF);
		var invItemQuantityArray:Array = new Array(0, 0, 0, 0, 0);
		var averageValueItemArray:Array = new Array(0, 0, 0, 0, 0);
		var tempAverageValueItemArray:Array = new Array(0, 0, 0, 0, 0);
		var buyButton:Button = new Button();
		var startOverButton:Button = new Button();
		var simulateDayButton:Button = new Button();
		var runComputerAnalysisButton:Button = new Button();
		var setInitialConditionsButton:Button = new Button();
		var j:uint = 1; // day number in simulation
		var i:int;
		var k:int;
		var m:int;
		var n:int;
		var r:int;
		var w:int;
		var demandItemCurrent:Array = new Array();
		var demandItemArray:Array = new Array(new Array(), new Array(), new Array(), new Array(), new Array());
		var demandItem1:Array = new Array();
		var demandItem2:Array = new Array();
		var demandItem3:Array = new Array();
		var demandItem4:Array = new Array();
		var demandItem5:Array = new Array();
		var dataProviderArray:Array = new Array(new DataProvider(), new DataProvider(), new DataProvider(), new DataProvider(), new DataProvider());
		var enterPriceDataProviderArray:Array = new Array(new DataProvider(), new DataProvider(), new DataProvider(), new DataProvider(), new DataProvider());
		var credit:Number = 600;
		var profit:Number = 0;
		var gameOverProfit:Number = 0;
		var liquidationValue:Number = 0;
		var costScheduleItem:Number;
		var costItem:Number;
		var moneySpentToday:Array = new Array();
		var daysInSimulation:int = 7;
		var salesPriceItemArray:Array = new Array(15, 20, 30, 12, 18);
		var unitPriceAllItemsArray:Array = new Array(new Array(), new Array(), new Array());
		var unitPriceItemArray_HighQuantity:Array = new Array(8, 10, 15, 7, 10);
		var unitPriceItemArray_MedQuantity:Array = new Array(10, 15, 20, 9, 13);
		var unitPriceItemArray_LowQuantity:Array = new Array(12, 18, 25, 10, 15);
		var creditReplenishmentScheduleArray:Array = new Array();
		var bulk_BuyQuantityHigh_Array:Array = new Array(10, 20, 15, 5, 10);
		var bulk_BuyQuantityMed_Array:Array = new Array(5, 10, 10, 3, 5);
		var bulk_BuyQuantityLow_Array:Array = new Array(0, 0, 0, 0, 0);
		var bulk_BuyQuantityAllItemsArray:Array = new Array(bulk_BuyQuantityHigh_Array, bulk_BuyQuantityMed_Array, bulk_BuyQuantityLow_Array);
		var squareArray:Array = new Array();
		var squareColorFull:Number = 0x0E821E;
		var squareColorPartial:Number = 0xD6F21D;
		var squareColorNotAtAll:Number = 0xEB0918;
		var square1_x:int = 400;
		var square_DayArray:Array = new Array(new Array(), new Array(), new Array(), new Array(), new Array());
		var barChartDemandArray:Array = new Array();
		var barChartSupplyArray:Array = new Array();
		var barChartSupplyAllItemsArray:Array = new Array(new Array(), new Array(), new Array(), new Array(), new Array());
		var barChartX:Number = 450;
		var barChartY:Number = 325;
		var barChartWidth:Number = 300;
		var barChartHeight:Number = 200;
		var barChartScale:Number = 10;
		var BarChart1 = new drawBarChart(barChartX, barChartY, barChartWidth, barChartHeight, barChartScale);
		var barChartCreditX:Number = 125;
		var barChartCreditY:Number = 150;
		var barChartCreditWidth:Number = 200;
		var barChartCreditHeight:Number = 150;
		var barChartCreditScale:Number = credit;
		var barChartCredit = new drawBarChartCredit(barChartCreditX, barChartCreditY, barChartCreditWidth, barChartCreditHeight, barChartCreditScale);
		var barChartProfitX:Number = 550;
		var barChartProfitY:Number = 150;
		var barChartProfitWidth:Number = 200;
		var barChartProfitHeight:Number = 150;
		var barChartProfitScale:Number = 1000;
		var barChartProfit = new drawBarChartProfit(barChartProfitX, barChartProfitY, barChartProfitWidth, barChartProfitHeight, barChartProfitScale);
		var barChartProfitDisplayArray = new Array();
		var creditRemainingArray = new Array();
		var barChartCreditDisplayArray = new Array();
		var creditTotalSpendArray = new Array();
		var forecastedRevenueArray = new Array();
		var counterForecastedDailyProfitArray = new Array();
		var forecastedDailyProfitArray = new Array();
		var tempForecastedDailyProfitArray = new Array();
		var forecastedCumulativeProfitArray = new Array();
		var totalSupply:Array = new Array(0, 0, 0, 0, 0);
		var sliderFocusIndex:int;
		var addBackInArray:Array = new Array();
		var myFormat:TextFormat = new TextFormat();
		var chartSquareFillArrayBackground:Sprite = new Sprite; // initializing the variable named chartBackground
		var sliderBackground:Sprite = new Sprite;
		var purchasePermutationP0Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var purchasePermutationP1Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var purchasePermutationP2Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var purchasePermutationP3Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var purchasePermutationP4Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var purchasePermutationArray = [purchasePermutationP0Array, purchasePermutationP1Array, purchasePermutationP2Array, purchasePermutationP3Array, purchasePermutationP4Array]; 
		var numPermutationsP0:int = 0;
		var numPermutationsP1:int = 0;
		var numPermutationsP2:int = 0;
		var numPermutationsP3:int = 0;
		var numPermutationsP4:int = 0;
		var numPermutationsArray:Array = [numPermutationsP0, numPermutationsP1, numPermutationsP2, numPermutationsP3, numPermutationsP4];
		var permutationCountP0:int = 0;
		var permutationCountP1:int = 0;
		var permutationCountP2:int = 0;
		var permutationCountP3:int = 0;
		var permutationCountP4:int = 0;
		var permutationCountArray:Array = [permutationCountP0, permutationCountP1, permutationCountP2, permutationCountP3, permutationCountP4];
		var creditSpentP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditSpentP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditSpentP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditSpentP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditSpentP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditSpentArray:Array = new Array(creditSpentP0Array, creditSpentP1Array, creditSpentP2Array, creditSpentP3Array, creditSpentP4Array);
		var revenueP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var revenueP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var revenueP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var revenueP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var revenueP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var revenueArray:Array = new Array(revenueP0Array, revenueP1Array, revenueP2Array, revenueP3Array, revenueP4Array)
		var creditOutlayP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditOutlayP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditOutlayP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditOutlayP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditOutlayP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var creditOutlayArray:Array = new Array(creditOutlayP0Array, creditOutlayP1Array, creditOutlayP2Array, creditOutlayP3Array, creditOutlayP4Array);
		var avgPurchasePriceP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var avgPurchasePriceP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var avgPurchasePriceP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var avgPurchasePriceP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var avgPurchasePriceP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var avgPurchasePriceArray:Array = new Array(avgPurchasePriceP0Array, avgPurchasePriceP1Array, avgPurchasePriceP2Array, avgPurchasePriceP3Array, avgPurchasePriceP4Array);
		var profitP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var profitP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var profitP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var profitP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var profitP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var profitArray:Array = new Array(profitP0Array, profitP1Array, profitP2Array, profitP3Array, profitP4Array);
		var unitSalesPriceP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var unitSalesPriceP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var unitSalesPriceP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var unitSalesPriceP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var unitSalesPriceP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var unitSalesPriceArray:Array = new Array(unitSalesPriceP0Array, unitSalesPriceP1Array, unitSalesPriceP2Array, unitSalesPriceP3Array, unitSalesPriceP4Array);
		var totalProfitP0Array:Array = new Array;
		var totalProfitP1Array:Array = new Array;
		var totalProfitP2Array:Array = new Array;
		var totalProfitP3Array:Array = new Array;
		var totalProfitP4Array:Array = new Array;
		var totalProfitArray:Array = new Array(totalProfitP0Array, totalProfitP1Array, totalProfitP2Array, totalProfitP3Array, totalProfitP4Array);
		var avgCreditOutlayP0Array:Array = new Array;
		var avgCreditOutlayP1Array:Array = new Array;
		var avgCreditOutlayP2Array:Array = new Array;
		var avgCreditOutlayP3Array:Array = new Array;
		var avgCreditOutlayP4Array:Array = new Array;
		var avgCreditOutlayArray:Array = new Array(avgCreditOutlayP0Array, avgCreditOutlayP1Array, avgCreditOutlayP2Array, avgCreditOutlayP3Array, avgCreditOutlayP4Array);
		var maxP0ProfitIndex:Number = 0;
		var maxP1ProfitIndex:Number = 0;
		var maxP2ProfitIndex:Number = 0;
		var maxP3ProfitIndex:Number = 0;
		var maxP4ProfitIndex:Number = 0;
		var maxProfitIndexArray:Array = new Array(0, 0, 0, 0, 0) 
		var effRatioP0Array:Array = new Array;
		var effRatioP1Array:Array = new Array;
		var effRatioP2Array:Array = new Array;
		var effRatioP3Array:Array = new Array;
		var effRatioP4Array:Array = new Array;
		var effRatioArray:Array = new Array(effRatioP0Array, effRatioP1Array, effRatioP2Array, effRatioP3Array, effRatioP4Array);
		var normalizedP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var normalizedP1Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var normalizedP2Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var normalizedP3Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var normalizedP4Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var normalizedArray:Array = new Array(normalizedP0Array, normalizedP1Array, normalizedP2Array, normalizedP3Array, normalizedP4Array);
		var sortedNormalizedArray:Array = new Array();
		var sortedNormalizedP0Array:Array = new Array(new Array, new Array, new Array, new Array, new Array, new Array, new Array);
		var maxProfitArray:Array = [0, 0, 0, 0, 0];
		var maxRatioArray:Array = [0, 0, 0, 0, 0];
		var maxProfitAll:Number = 0;
		var maxRatioAll:Number = 0;
		var indexOfBest:Array = [0, 0, 0, 0, 0];
		var creditOutlayRemainingArray:Array = [credit, credit, credit, credit, credit, credit, credit];
		var creditOutlayP0Legal:Array = [true, true, true, true, true, true, true, true];
		var creditOutlayP1Legal:Array = [true, true, true, true, true, true, true, true];
		var creditOutlayP2Legal:Array = [true, true, true, true, true, true, true, true];
		var creditOutlayP3Legal:Array = [true, true, true, true, true, true, true, true];
		var creditOutlayP4Legal:Array = [true, true, true, true, true, true, true, true];
		var creditOutlayLegal:Array = [creditOutlayP0Legal, creditOutlayP1Legal, creditOutlayP2Legal, creditOutlayP3Legal, creditOutlayP4Legal];
		var productUsedArray:Array = [false, false, false, false, false];
		var allProductScore:Array = [];
		var bestIndexOfAllProductScore:int = 0;
		var selectedTimelinesArray:Array = [-1,-1,-1,-1,-1];
		var totalProfitWithSelectedTimelines:Number = 0;
		var profitWeight:Number = 0;
		var bestTotalProfit:Number = 0;
		var bestPurchasePermutation:Array = new Array(new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array,new Array, new Array, new Array, new Array, new Array);
		var forecastGrid:DataGrid = new DataGrid;
		var priceGrid:DataGrid = new DataGrid();
		var forecastData:DataProvider = new DataProvider
		var invOnHandArray:Array = [0,0,0,0,0];
		var avgValueIOH:Array = [0,0,0,0,0];
		var allPermutationScoresArray:Array = new Array();
		
		public function Main()
			{
				/*trace("purchasePermutationArray:" + purchasePermutationArray);*/
			// font size of sliderbar labels
			myFormat.size = 30;
			
			// draws the rectangle background for the sliderbars
			sliderBackground.graphics.beginFill(0xCCCCCC); 
			sliderBackground.graphics.drawRect(125, 15, 260, 120); // (x spacing, y spacing, width, height)
			sliderBackground.graphics.endFill(); 
			addChild(sliderBackground); 
			
			//demand function all items
			for (i = 0; i < daysInSimulation; ++i){
				demandItem1[i] = i + 1;
				demandItem2[i] = 9 - i;
				demandItem3[i] = 2*i + 1;
				demandItem4[i] = 14 - 2*i;
				demandItem5[i] = 7;
			}
			demandItem4[0] = 1;
			demandItem4[1] = 3;
			demandItem4[2] = 5;
			demandItem4[3] = 7;
			demandItem4[4] = 5;
			demandItem4[5] = 3;
			demandItem4[6] = 1;
			
			//constructs 2-dimensional complete item demand array
			demandItemArray[0] = demandItem1;
			demandItemArray[1] = demandItem2;
			demandItemArray[2] = demandItem3;
			demandItemArray[3] = demandItem4;
			demandItemArray[4] = demandItem5;
			
			unitPriceAllItemsArray[0] = unitPriceItemArray_HighQuantity;
			unitPriceAllItemsArray[1] = unitPriceItemArray_MedQuantity;
			unitPriceAllItemsArray[2] = unitPriceItemArray_LowQuantity;
			
			//Create purchase permutations for demandItem5
			for (i=0 ; i < daysInSimulation; i++){
				forecastedRevenueArray[i] = 0;
				moneySpentToday[i] = 0;
				creditTotalSpendArray[i] = 0;
				creditReplenishmentScheduleArray[i] = 0;
				creditRemainingArray[i] = credit;
				addBackInArray[i] = 0;
				forecastedDailyProfitArray[i] = 0;
				counterForecastedDailyProfitArray[i] = 0;
				tempForecastedDailyProfitArray[i] = 0;
				forecastedCumulativeProfitArray[i] = 0;
			}
			
			forecastGrid.move(30,500);
			forecastGrid.setSize(300, 167);
			forecastGrid.columns = ["Day", "P1","P2","P3", "P4", "P5"];
			for(m=0;m<=5;m++){
			forecastGrid.columns[m].width = 50;
			}
		
		
		forecastGrid.getColumnAt(0).editable = false; 
		
		addChild(forecastGrid);
		
		var forecastData:Array = [{Day:1, P1:demandItemArray[0][0], P2:demandItemArray[1][0], P3:demandItemArray[2][0], P4:demandItemArray[3][0], P5:demandItemArray[4][0]},
		{Day:2, P1:demandItemArray[0][1],P2:demandItemArray[1][1],P3:demandItemArray[2][1],P4:demandItemArray[3][1],P5:demandItemArray[4][1]},
		{Day:3, P1:demandItemArray[0][2],P2:demandItemArray[1][2], P3:demandItemArray[2][2], P4:demandItemArray[3][2], P5:demandItemArray[4][2]},
		{Day:4, P1:demandItemArray[0][3], P2:demandItemArray[1][3], P3:demandItemArray[2][3], P4:demandItemArray[3][3], P5:demandItemArray[4][3]},
		{Day:5, P1:demandItemArray[0][4], P2:demandItemArray[1][4], P3:demandItemArray[2][4], P4:demandItemArray[3][4], P5:demandItemArray[4][4]},
		{Day:6, P1:demandItemArray[0][5], P2:demandItemArray[1][5], P3:demandItemArray[2][5], P4:demandItemArray[3][5], P5:demandItemArray[4][5]},
		{Day:7, P1:demandItemArray[0][6], P2:demandItemArray[1][6], P3:demandItemArray[2][6], P4:demandItemArray[3][6], P5:demandItemArray[4][6]}];

		forecastGrid.dataProvider = new DataProvider(forecastData);
		forecastGrid.setStyle("cellRenderer", jobCellRenderer);
		forecastGrid.setStyle("headerRenderer", headerCellRenderer);
		forecastGrid.sortableColumns = false;
		forecastGrid.editable = true;
		forecastGrid.addEventListener(DataGridEvent.ITEM_FOCUS_IN, forecastGridItemEditEnd);
			
			priceGrid.setSize(400, 400);
			priceGrid.x = 650;
			priceGrid.y = 550;
			priceGrid.columns = ["Quantity","Unit Cost", "Sales Price", "Inv. On Hand", "Avg. Value Inv. OH"];
			priceGrid.columns[0].width = 60;
			priceGrid.columns[1].width = 60;
			priceGrid.columns[2].width = 74;
			priceGrid.columns[3].width = 90;
			priceGrid.columns[4].width = 140;
			priceGrid.editable = true;
			for (i = 0; i <= 4; i++){
				enterPriceDataProviderArray[i].addItem({Quantity:bulk_BuyQuantityHigh_Array[i], "Unit Cost":unitPriceItemArray_HighQuantity[i], "Sales Price":salesPriceItemArray[i], "Inv. On Hand":invOnHandArray[i], "Avg. Value Inv. OH":avgValueIOH[i]});
				enterPriceDataProviderArray[i].addItem({Quantity:bulk_BuyQuantityMed_Array[i], "Unit Cost":unitPriceItemArray_MedQuantity[i]}); 
				enterPriceDataProviderArray[i].addItem({Quantity:bulk_BuyQuantityLow_Array[i], "Unit Cost":unitPriceItemArray_LowQuantity[i]}); 
			}
			priceGrid.dataProvider = enterPriceDataProviderArray[0];
			priceGrid.rowCount = priceGrid.length;
			priceGrid.sortableColumns = false;
			priceGrid.setStyle("cellRenderer", jobCellRenderer);
			priceGrid.setStyle("headerRenderer", headerCellRenderer);
			priceGrid.addEventListener(DataGridEvent.ITEM_FOCUS_OUT, priceGridEditEnd);
			addChild(priceGrid);
			
			

			//initialize barChartSupplyAllItemsArray
			for (k = 0; k <= 4; k++){
			for (i = j - 1; i < daysInSimulation; ++i){
			barChartSupplyAllItemsArray[k][i] = 0;
			}
			}
			
			//draws the Bar Chart with Demand indicated and supply shown as tiny stacked boxes.
			addChild(BarChart1);
			for (i = 0; i <= 4; ++i) {
	        var movieClip:Sprite = new Sprite(); // the temporary variable
	        addChild(movieClip);
	        barChartDemandArray[i] = movieClip; // store reference to temporary variable in array
	    	barChartDemandArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			barChartDemandArray[i].graphics.drawRect(barChartX + barChartWidth*(i+1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*demandItemArray[0][i + j - 1]/(7*barChartScale));
			}
			
			//draws the Credit Remaining bars.
			addChild(barChartCredit);
			for (i = 0; i <= 4; ++i) {
	        var creditBar:Sprite = new Sprite(); // the temporary variable
	        addChild(creditBar);
	        barChartCreditDisplayArray[i] = creditBar; // store reference to temporary variable in array
	    	barChartCreditDisplayArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			barChartCreditDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			barChartCreditDisplayArray[i].graphics.drawRect(barChartCreditX + barChartCreditWidth*(i+1.75)/7, barChartCreditY + 6*barChartCreditHeight/7, barChartCreditWidth/7, -5*barChartCreditHeight*creditRemainingArray[i + j - 1]/(7*credit));
			}
			
			addChild(barChartProfit);
			for (i = 0; i <= 4; ++i) {
	        var profitBar:Sprite = new Sprite(); // the temporary variable
	        addChild(profitBar);
			barChartProfitDisplayArray[i] = profitBar; // store reference to temporary variable in array
			barChartProfitDisplayArray[i].graphics.lineStyle(3, invItemColorArray[1]);
			barChartProfitDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			//barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*tempForecastedDailyProfitArray[i + j - 1]/(7*barChartProfitScale));
			barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*forecastedCumulativeProfitArray[i + j - 1]/(7*barChartProfitScale));
			}
			//trace(barChartCreditDisplayArray)
			
			// creates array that supplies information for supply in bar chart
			for (i = 0; i < daysInSimulation; ++i) {
			var sprite:Sprite = new Sprite(); // the temporary variable
	        addChild(sprite);
			barChartSupplyArray[i] = sprite; // store reference to temporary variable in array
			}
			
			// Update barChartSupplyArray
			for (i = 0; i <= 4; ++i) {
	    	barChartSupplyArray[i].graphics.clear();
			if (i + j <= daysInSimulation){
			barChartSupplyArray[i].graphics.lineStyle(3,invItemColorArray[sliderFocusIndex]);
			barChartSupplyArray[i].graphics.beginFill(invItemColorArray[sliderFocusIndex]);
			barChartSupplyArray[i].graphics.drawRect(barChartX + barChartWidth*(i+1.25)/7, barChartY + 6*barChartHeight/7, barChartWidth/14, -5*barChartHeight*barChartSupplyAllItemsArray[0][i + j - 1]/(7*barChartScale));
			barChartSupplyArray[i].graphics.endFill();
			}
			}
import fl.controls.Label;


			
			
			// defines and positions sliders for each item sold in store
			for (i=0; i<=4; ++i){
				sliderArray[i] = new Slider();
			}
			
			for (i=0; i<=4; ++i){
			addChild(sliderArray[i]);
			sliderArray[i].move(150 + 50*i,30);
			sliderArray[i].direction = SliderDirection.VERTICAL;
			sliderArray[i].maximum = 25;
			sliderArray[i].minimum = 0;
			sliderArray[i].tickInterval = 5;
			sliderArray[i].value = 0;
			sliderArray[i].snapInterval = 1;
			sliderArray[i].getChildAt(1).width = 20;
			sliderArray[i].addEventListener(Event.CHANGE, sliderChangeValue, false, 0, true);
			}
			
			stage.focus == sliderArray[0];
			
			//Create data table
			var dg:DataGrid = new DataGrid();
			
			dg.setSize(300, 400);
			dg.x = 30;
			dg.y = 400;
			dg.columns = ["Quantity", "Sales Price", "Unit Cost", "Profit Margin"];
			dg.columns[0].width = 75;
			dg.columns[1].width = 75;
			dg.columns[2].width = 75;
			dg.columns[3].width = 100;
			for (i = 0; i <= 4; i++){
				dataProviderArray[i].addItem({Quantity:bulk_BuyQuantityHigh_Array[i] + "+", "Unit Cost":unitPriceItemArray_HighQuantity[i], "Sales Price":salesPriceItemArray[i], "Profit Margin":(salesPriceItemArray[i] - unitPriceItemArray_HighQuantity[i])});
				dataProviderArray[i].addItem({Quantity:bulk_BuyQuantityMed_Array[i] + "-" + (bulk_BuyQuantityHigh_Array[i] - 1), "Unit Cost":unitPriceItemArray_MedQuantity[i], "Sales Price":salesPriceItemArray[i], "Profit Margin":(salesPriceItemArray[i] - unitPriceItemArray_MedQuantity[i])}); 
				dataProviderArray[i].addItem({Quantity:bulk_BuyQuantityLow_Array[i] + "-" + (bulk_BuyQuantityMed_Array[i] - 1), "Unit Cost":unitPriceItemArray_LowQuantity[i], "Sales Price":salesPriceItemArray[i], "Profit Margin":(salesPriceItemArray[i] - unitPriceItemArray_LowQuantity[i])}); 

			}
			dg.dataProvider = dataProviderArray[0];
			dg.rowCount = dg.length;
			dg.sortableColumns = false;
			dg.setStyle("cellRenderer", jobCellRenderer);
			dg.setStyle("headerRenderer", headerCellRenderer);
			datagridHighlightRow(dg); 
			addChild(dg);
			
			
			
			
			
			// draws the rectangle background for the item fill boxes
			chartSquareFillArrayBackground.graphics.beginFill(0xCCCCCC); 
			chartSquareFillArrayBackground.graphics.drawRect(385, 135, 150, 175); // (x spacing, y spacing, width, height)
			chartSquareFillArrayBackground.graphics.endFill(); 
			addChild(chartSquareFillArrayBackground); 
			
			// Draw the item box identifiers
			for (i=0; i<=4; ++i){
			movieClip = new Sprite();
			addChild(movieClip);
			squareArray[i] = movieClip;
			squareArray[i].graphics.lineStyle(3, invItemColorArray[i]);
			squareArray[i].graphics.beginFill(invItemColorArray[i]);
			squareArray[i].graphics.drawRect(square1_x + 25*i, 275, 20, 20);
			squareArray[i].graphics.endFill();
			}
			
			// Draws the item boxes yes/no
			for (k = 0; k <= 4; k++) {
				for (i = 0; i <= 4; ++i){
	        sprite = new Sprite(); // the temporary variable
	        addChild(sprite);
	        square_DayArray[k][i] = sprite; // store reference to temporary variable in array
	    	square_DayArray[k][i].graphics.lineStyle(3,invItemColorArray[i]);
			assignSquareColor(square_DayArray[k][i], i+1, k);
			square_DayArray[k][i].graphics.drawRect(square1_x + 25*i, 250 - 25*k, 20, 20);
			}
			}
			
			
			// defines textfields to be located next to sliders
			for (i=0; i<=4; ++i){
				var textField:TextField = new TextField;
				
				
				addChild(textField);
				sliderTextFieldValueArray[i] = textField;
				textField.defaultTextFormat = myFormat;
				sliderTextFieldValueArray[i].text = invItemQuantityArray[i];
				sliderTextFieldValueArray[i].x = 150 + 50*i;
				sliderTextFieldValueArray[i].y = 100;
				sliderTextFieldValueArray[i].textColor = invItemColorArray[i];
				
				sliderTextFieldValueArray[i].autoSize = "left";
			}
			
			
			//on hand inventory of item 1
			var label2:TextField = new TextField;
			label2.text = "Inventory Item 1: " + String(invItemQuantityArray[0]);
			label2.width = 150;
			label2.autoSize = "left";
			addChild(label2);
			
			//day # in simulation
			var label3:TextField = new TextField;
			label3.text = "Day " + j + " of " + daysInSimulation;
			label3.y = 20;
			label3.autoSize = "left";
			addChild(label3);
			
			//credit value in simulation
			var label4:TextField = new TextField;
			label4.text = "Credit: " + String(credit);
			label4.y = 40;
			label4.autoSize = "left";
			addChild(label4);
			
			//profit value in simulation
			var label5:TextField = new TextField;
			label5.text = "Profit: " + String(profit);
			label5.y = 60;
			label5.autoSize = "left";
			addChild(label5);
			
			//buy item button
			buyButton.x = 400;
			buyButton.y = 50;
			buyButton.label = "Buy!";
			addChild(buyButton);
			buyButton.addEventListener(MouseEvent.CLICK, clickBuyButton);
			
			//Start Over button
			startOverButton.x = 525;
			startOverButton.y = 100;
			startOverButton.label = "Start Over!";
			addChild(startOverButton);
			startOverButton.enabled = false;
			startOverButton.alpha = .5;
			startOverButton.addEventListener(MouseEvent.CLICK, clickStartOverButton);
			
			runComputerAnalysisButton.x = 525;
			runComputerAnalysisButton.y = 50;
			runComputerAnalysisButton.label = "Computer";
			addChild(runComputerAnalysisButton);
			runComputerAnalysisButton.addEventListener(MouseEvent.CLICK, clickRunComputerAnalysisButton);
			
			//simulate sales in day button
			simulateDayButton.x = 400;
			simulateDayButton.y = 100;
			simulateDayButton.label = "Simulate Day!";
			addChild(simulateDayButton);
			simulateDayButton.addEventListener(MouseEvent.CLICK, simulateDay_clickHandler);
			
			function priceGridEditEnd(e:DataGridEvent):void{
				unitPriceItemArray_HighQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(0));
				unitPriceItemArray_MedQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(1));
				unitPriceItemArray_LowQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(2));
				bulk_BuyQuantityHigh_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(0));
				bulk_BuyQuantityMed_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(1));
				bulk_BuyQuantityLow_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(2));
				salesPriceItemArray[sliderFocusIndex] = priceGrid.columns[2].itemToLabel(priceGrid.getItemAt(0));
				invOnHandArray[sliderFocusIndex] = priceGrid.columns[3].itemToLabel(priceGrid.getItemAt(0));
				avgValueIOH[sliderFocusIndex] = priceGrid.columns[4].itemToLabel(priceGrid.getItemAt(0));
			
				
			
			}
			
			
			function costScheduleItem(quantityBought:Number, itemNumber:Number):Number{
				if (quantityBought < bulk_BuyQuantityMed_Array[itemNumber]){
					costItem = quantityBought*unitPriceItemArray_LowQuantity[itemNumber];
				}
				else if(quantityBought < bulk_BuyQuantityHigh_Array[itemNumber]){
					costItem = quantityBought*unitPriceItemArray_MedQuantity[itemNumber];
				}
				else {
					costItem = quantityBought*unitPriceItemArray_HighQuantity[itemNumber];
				}
				return costItem
			}
			function forecastGridItemEditEnd(e:DataGridEvent):void{
				for(i=0; i<=6; i++){
					for(r=1;r<=5;r++){
						if(forecastGrid.columns[r].itemToLabel(forecastGrid.getItemAt(i)) >= 0){
							demandItemArray[r-1][i] = forecastGrid.columns[r].itemToLabel(forecastGrid.getItemAt(i));
						}
						else{
							forecastData[r][i] = demandItemArray[r-1][i];
							
							
							

							
						}
					}
				}
					}
			
			// This is what happens when slider value changes
			function sliderChangeValue(e:Event):void{
				// Enable/Disable Simulate Day Button
				var sliderSum:Number = 0; 
				for (i = 0; i <= 4; i++){
					sliderSum += sliderArray[i].value;
				}
					if (sliderSum == 0){
						simulateDayButton.enabled = true;
						simulateDayButton.alpha = 1;
					}
					else{
						simulateDayButton.enabled = false;
						simulateDayButton.alpha = .5;
					}
				
				for (i=0; i<=4; ++i){
					sliderTextFieldValueArray[i].text = String(int(sliderArray[i].value));
				}
				
			for (i = 0; i <= 4; ++i) {
				for (k = 0; k <= 4; k++){
				if (stage.focus == sliderArray[k]){
					sliderFocusIndex = k
	        // updates bar chart demand curve with current slider focus value.
			barChartDemandArray[i].graphics.clear();
			if (i + j - 1 < daysInSimulation){
	    	barChartDemandArray[i].graphics.lineStyle(3,invItemColorArray[sliderFocusIndex]);
			barChartDemandArray[i].graphics.drawRect(barChartX + barChartWidth*(i+1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*demandItemArray[k][i + j - 1]/(7*barChartScale));
			}
			}
			}
			}
				
			// Update datagrid table values
			dg.dataProvider = dataProviderArray[sliderFocusIndex];	
			priceGrid.dataProvider = enterPriceDataProviderArray[sliderFocusIndex];
			datagridHighlightRow(dg);
			// Update yes/no colored box supply graphic
			for (k = 0; k <= 4; k++) {
				for (i = 0; i <= 4; ++i){
				Sprite(square_DayArray[k][i]).graphics.clear();			
				Sprite(square_DayArray[k][i]).graphics.lineStyle(3,invItemColorArray[k]);
			assignSquareColor(Sprite(square_DayArray[k][i]), i+1, k)
			Sprite(square_DayArray[k][i]).graphics.drawRect(square1_x + 25*k, 250 - 25*i, 20, 20);
			}
			}
			
			// Update totalSupply Array
			for (k=0; k<=4; k++){
				totalSupply[k] = invItemQuantityArray[k] + sliderArray[k].value; 
			}
			
			//Update barChartSupplyAllItemsArray
			for (k = 0; k <= 4; k++){
			for (i = j - 1; i < daysInSimulation; ++i){
				if (totalSupply[k] >= demandItemArray[k][i]){
					barChartSupplyAllItemsArray[k][i] = demandItemArray[k][i];
					totalSupply[k] -= demandItemArray[k][i];
				}
				else if (totalSupply[k] < demandItemArray[k][i] && totalSupply[k] >= 0){
					barChartSupplyAllItemsArray[k][i] = totalSupply[k];
					totalSupply[k] = 0;
			}
			}
			}
			
			// calculates forecasted revenues for each simulation day
			for (i = j - 1; i < daysInSimulation; i++){
				forecastedRevenueArray[i] = 0;
				forecastedCumulativeProfitArray[i] = 0;
				creditReplenishmentScheduleArray[i] = 0;
			}
			for (i = 0; i < daysInSimulation; i++){
				tempForecastedDailyProfitArray[i] = forecastedDailyProfitArray[i];
			}
			//trace("tempForecastedDailyProfit:" + tempForecastedDailyProfitArray);
			//trace("forecastedDailyProfit:" + forecastedDailyProfitArray);
			for (i=0; i<=4; i++){
				if (invItemQuantityArray[i]+sliderArray[i].value > 0){
				tempAverageValueItemArray[i] = (invItemQuantityArray[i]*averageValueItemArray[i] + costScheduleItem(sliderArray[i].value, i))/(invItemQuantityArray[i]+sliderArray[i].value);
				}
				else{
					tempAverageValueItemArray[i] = averageValueItemArray[i];
				}
			}
			
			for (i = j - 1; i < daysInSimulation; i++){
				counterForecastedDailyProfitArray[i] = 0;
				for (k = 0; k <= 4; k++){
					if ((invItemQuantityArray[k] + sliderArray[k].value) > 0){
						creditReplenishmentScheduleArray[i] += barChartSupplyAllItemsArray[k][i]*(tempAverageValueItemArray[k]);
					}
					else{
						//creditReplenishmentScheduleArray[i] = 0;
					}
					forecastedRevenueArray[i] += barChartSupplyAllItemsArray[k][i]*salesPriceItemArray[k]
					counterForecastedDailyProfitArray[i] += barChartSupplyAllItemsArray[k][i]*(salesPriceItemArray[k] - tempAverageValueItemArray[k])
				}
				tempForecastedDailyProfitArray[i] = counterForecastedDailyProfitArray[i];
				}
			
			
			// Calculates forcasted cumulative profit array
			for (i = j - 1; i < daysInSimulation; i++){
				forecastedCumulativeProfitArray[i] = 0;
			for (k = 0; k <= i; k++){
				 forecastedCumulativeProfitArray[i] += tempForecastedDailyProfitArray[k];
				 }
			}
			
			//trace("Revenue:" + forecastedRevenueArray);
			//trace("tempForecastedDailyProfit:" + tempForecastedDailyProfitArray);
			//trace("forecastedDailyProfit:" + forecastedDailyProfitArray);
			//trace("Cumulative Profit:" + forecastedCumulativeProfitArray);
			
			// calculates money spent on current simulation day to buy items.
				creditTotalSpendArray[j-1] = 0;
				for (k = 0; k <= 4; k++){
				creditTotalSpendArray[j-1] += costScheduleItem(sliderArray[k].value, k); 
				}
				creditTotalSpendArray[j-1] += moneySpentToday[j-1];
			   
				if(j-1==0){
				creditRemainingArray[j-1] = credit - creditTotalSpendArray[j-1];
				}
				else{
					creditRemainingArray[j-1] = creditRemainingArray[j-2] + creditReplenishmentScheduleArray[j-2] - creditTotalSpendArray[j-1];
				}
		
			for(i=j; i<daysInSimulation; i++){
				creditRemainingArray[i] = (creditRemainingArray[i-1] + creditReplenishmentScheduleArray[i-1]);
			}
			
			//Update Credit Bar Chart
			for (i = 0; i <= 4; i++) {
			if(i+j <= daysInSimulation){
			barChartCreditDisplayArray[i].graphics.clear();
	    	barChartCreditDisplayArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			barChartCreditDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			barChartCreditDisplayArray[i].graphics.drawRect(barChartCreditX + barChartCreditWidth*(i+1.75)/7, barChartCreditY + 6*barChartCreditHeight/7, barChartCreditWidth/7, -5*barChartCreditHeight*(creditRemainingArray[i + j - 1])/(7*credit));
			}
			}
			
			for (i = 0; i <= 4; i++) {
			barChartProfitDisplayArray[i].graphics.clear();
	        if(i+j <= daysInSimulation){
			barChartProfitDisplayArray[i].graphics.lineStyle(3, invItemColorArray[1]);
			barChartProfitDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			//barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*tempForecastedDailyProfitArray[i + j - 1]/(7*barChartProfitScale));
			barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*forecastedCumulativeProfitArray[i + j - 1]/(7*barChartProfitScale));
			//trace(5*tempForecastedDailyProfitArray[i]/7);
			}
			}
			//trace(barChartProfitHeight*5/7);
			// Update barChartSupplyArray
			for (i = 0; i <= 4; ++i) {
	    	barChartSupplyArray[i].graphics.clear();
			if (i + j <= daysInSimulation){
			barChartSupplyArray[i].graphics.lineStyle(3,invItemColorArray[sliderFocusIndex]);
			barChartSupplyArray[i].graphics.beginFill(invItemColorArray[sliderFocusIndex]);
			barChartSupplyArray[i].graphics.drawRect(barChartX + barChartWidth*(i + 1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*barChartSupplyAllItemsArray[sliderFocusIndex][i + j - 1]/(7*barChartScale));
			barChartSupplyArray[i].graphics.endFill();
			}
			}
			}
			
			//this is what happens when Buy button is clicked
			function clickBuyButton(e:Event):void{
				
				unitPriceItemArray_HighQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(0));
				unitPriceItemArray_MedQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(1));
				unitPriceItemArray_LowQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(2));
				bulk_BuyQuantityHigh_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(0));
				bulk_BuyQuantityMed_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(1));
				bulk_BuyQuantityLow_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(2));
				salesPriceItemArray[sliderFocusIndex] = priceGrid.columns[2].itemToLabel(priceGrid.getItemAt(0));
				invOnHandArray[sliderFocusIndex] = priceGrid.columns[3].itemToLabel(priceGrid.getItemAt(0));
				avgValueIOH[sliderFocusIndex] = priceGrid.columns[4].itemToLabel(priceGrid.getItemAt(0));
			
				
				//trace(creditRemainingArray);
				for (i=0; i<=4; ++i){
					invItemQuantityArray[i] += sliderArray[i].value;
				}
				
				for (i=0; i<=4; i++){
					if (invItemQuantityArray[i] == 0){
					averageValueItemArray[i] = 0;
					}
					else{
						
					averageValueItemArray[i] = ((invItemQuantityArray[i] - sliderArray[i].value)*averageValueItemArray[i] + costScheduleItem(sliderArray[i].value, i))/(invItemQuantityArray[i]);
					}
					sliderArray[i].value = 0;
					sliderTextFieldValueArray[i].text = String(sliderArray[i].value);
				}
				label2.text = "Inventory Item 1: " + String(invItemQuantityArray[0]);
				datagridHighlightRow(dg);
				simulateDayButton.alpha = 1;
				simulateDayButton.enabled = true;
				label4.text = "Credit: " + String(Math.round(creditRemainingArray[j-1]*100)/100);
				moneySpentToday[j-1] = creditTotalSpendArray[j-1];
			}
			
			//this is what happens when simulate day button is clicked
			function simulateDay_clickHandler(e:Event):void{
				
				unitPriceItemArray_HighQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(0));
				unitPriceItemArray_MedQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(1));
				unitPriceItemArray_LowQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(2));
				bulk_BuyQuantityHigh_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(0));
				bulk_BuyQuantityMed_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(1));
				bulk_BuyQuantityLow_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(2));
				salesPriceItemArray[sliderFocusIndex] = priceGrid.columns[2].itemToLabel(priceGrid.getItemAt(0));
				invOnHandArray[sliderFocusIndex] = priceGrid.columns[3].itemToLabel(priceGrid.getItemAt(0));
				avgValueIOH[sliderFocusIndex] = priceGrid.columns[4].itemToLabel(priceGrid.getItemAt(0));
			
				
				for (i=0; i<=4; i++){
					//credit += averageValueItemArray[i]*Math.min(demandItemArray[i][j-1], invItemQuantityArray[i]);
					profit += (salesPriceItemArray[i] - averageValueItemArray[i])*(Math.min(demandItemArray[i][j-1], invItemQuantityArray[i]));
					invItemQuantityArray[i] = Math.max(invItemQuantityArray[i] - demandItemArray[i][j-1], 0);
					sliderArray[i].value = 0;
				}
				
				
				forecastedDailyProfitArray = tempForecastedDailyProfitArray;
				/*for(i = 0; i< daysInSimulation; i++){
					tempForecastedDailyProfitArray[i] = 0;
				}*/
				/*trace("tempForecastedDailyProfit" + tempForecastedDailyProfitArray);
				trace("forecastedDailyProfit:" + forecastedDailyProfitArray);*/
				label2.text = "Inventory Item 1: " + String(invItemQuantityArray[0]);
				
				label5.text = "Profit: " + String(Math.round(profit*100)/100);
				datagridHighlightRow(dg);
					
					j += 1;
				
				label4.text = "Credit: " + String(Math.round(creditRemainingArray[j-1]*100)/100);
				updateBarChartDayLabel(BarChart1.TextArray, j);
				updateBarChartDayLabel(barChartCredit.TextArray, j);
				updateBarChartDayLabel(barChartProfit.TextArray, j);
				
				label3.text = "Day " + j + " of " + daysInSimulation;
				
				if (j > daysInSimulation){
					gameOver();
				}
				
				//update yes/no supply array boxes
				for (k=0; k <= 4; k++){
				for (i=0; i <= 4; ++i){
				Sprite(square_DayArray[k][i]).graphics.clear();			
				Sprite(square_DayArray[k][i]).graphics.lineStyle(3,invItemColorArray[k]);
				assignSquareColor(Sprite(square_DayArray[k][i]), i+1, k)
				Sprite(square_DayArray[k][i]).graphics.drawRect(square1_x + 25*k, 250 - 25*i, 20, 20);
				}
				}
			
			//Update Credit Bar Chart
			//trace(creditRemainingArray[j-1]);
			for (i = 0; i <= 4; ++i) {
			barChartCreditDisplayArray[i].graphics.clear();
	    	barChartCreditDisplayArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			if(i+j <= daysInSimulation){
			barChartCreditDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			barChartCreditDisplayArray[i].graphics.drawRect(barChartCreditX + barChartCreditWidth*(i+1.75)/7, barChartCreditY + 6*barChartCreditHeight/7, barChartCreditWidth/7, -5*barChartCreditHeight*creditRemainingArray[i+j-1]/(7*credit));
			}
			}
			for (i = 0; i <= 4; i++) {
			barChartProfitDisplayArray[i].graphics.clear();
	        if(i+j <= daysInSimulation){
			barChartProfitDisplayArray[i].graphics.lineStyle(3, invItemColorArray[1]);
			barChartProfitDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			//barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*tempForecastedDailyProfitArray[i + j - 1]/(7*barChartProfitScale));
			barChartProfitDisplayArray[i].graphics.drawRect(barChartProfitX + barChartProfitWidth*(i+1.75)/7, barChartProfitY + 6*barChartProfitHeight/7, barChartProfitWidth/7, -5*barChartProfitHeight*forecastedCumulativeProfitArray[i + j - 1]/(7*barChartProfitScale));
			//trace(5*tempForecastedDailyProfitArray[i]/7);
			}
			}
			
			// Update barChartDemandArray
			stage.focus == sliderArray[sliderFocusIndex];
			for (i = 0; i <= 4; ++i) {
	        barChartDemandArray[i].graphics.clear();
	    	if (i + j - 1 < daysInSimulation){
			barChartDemandArray[i].graphics.lineStyle(3,invItemColorArray[sliderFocusIndex]);
			barChartDemandArray[i].graphics.drawRect(barChartX + barChartWidth*(i+1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*demandItemArray[sliderFocusIndex][i + j - 1]/(7*barChartScale));
			}
			}
			
			// Update totalSupply Array
			for (k=0; k<=4; k++){
				totalSupply[k] = invItemQuantityArray[k] + sliderArray[k].value; 
			}
			
			//Update barChartSupplyAllItemsArray
			for (k = 0; k <= 4; k++){
			for (i = j - 1; i < daysInSimulation; ++i){
				if (totalSupply[k] >= demandItemArray[k][i]){
					barChartSupplyAllItemsArray[k][i] = demandItemArray[k][i];
					totalSupply[k] -= demandItemArray[k][i];
				}
				else if (totalSupply[k] < demandItemArray[k][i] && totalSupply[k] >= 0){
					barChartSupplyAllItemsArray[k][i] = totalSupply[k];
					totalSupply[k] = 0;
			}
			}
			}
			
			// Update barChartSupplyArray
			for (i = 0; i <= 4; ++i) {
	    	barChartSupplyArray[i].graphics.clear();
			barChartSupplyArray[i].graphics.lineStyle(3,invItemColorArray[sliderFocusIndex]);
			if (i + j <= daysInSimulation){
			barChartSupplyArray[i].graphics.beginFill(invItemColorArray[sliderFocusIndex]);
			barChartSupplyArray[i].graphics.drawRect(barChartX + barChartWidth*(i + 1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*barChartSupplyAllItemsArray[sliderFocusIndex][i + j - 1]/(7*barChartScale));
			//barChartSupplyArray[i].graphics.endFill();
			}
			}
			}
		
		// highlights relevant datagrid row
		function datagridHighlightRow(a:DataGrid):void{
			if (sliderArray[sliderFocusIndex].value >= bulk_BuyQuantityHigh_Array[sliderFocusIndex]){
					a.selectedIndex = 0;
				}
				else if (sliderArray[sliderFocusIndex].value >= bulk_BuyQuantityMed_Array[sliderFocusIndex]){
					a.selectedIndex = 1;
						 }
				else if (sliderArray[sliderFocusIndex].value >= bulk_BuyQuantityLow_Array[sliderFocusIndex]){
					a.selectedIndex = 2;
						 }
				}
				
		// This is what happens when the simulation ends
		function gameOver():void{
			simulateDayButton.enabled = false;
			simulateDayButton.alpha = .5;
			startOverButton.enabled = true;
			startOverButton.alpha = 1;
			buyButton.enabled = false;
			buyButton.alpha = .5;
			label3.text = "Game Over!";
			//slider1.enabled = false;
			for (i=0; i<=4; ++i){
			sliderArray[i].enabled = false;
			sliderArray[i].alpha = .5;
			}
			liquidationValue = invItemQuantityArray[0]*averageValueItemArray[0];
			//trace(liquidationValue);
		}
		
		function clickStartOverButton(e:Event):void{
			for (i=0 ; i < daysInSimulation; i++){
				forecastedRevenueArray[i] = 0;
				moneySpentToday[i] = 0;
				creditTotalSpendArray[i] = 0;
				creditReplenishmentScheduleArray[i] = 0;
				creditRemainingArray[i] = credit;
				addBackInArray[i] = 0;
				forecastedDailyProfitArray[i] = 0;
				counterForecastedDailyProfitArray[i] = 0;
				tempForecastedDailyProfitArray[i] = 0;
				forecastedCumulativeProfitArray[i] = 0;
				invItemQuantityArray[i] = 0;
			}
			
			j = 1;
			
			//update yes/no supply array boxes
				for (k=0; k <= 4; k++){
				for (i=0; i <= 4; ++i){
				Sprite(square_DayArray[k][i]).graphics.clear();			
				Sprite(square_DayArray[k][i]).graphics.lineStyle(3,invItemColorArray[k]);
				assignSquareColor(Sprite(square_DayArray[k][i]), i+1, k)
				Sprite(square_DayArray[k][i]).graphics.drawRect(square1_x + 25*k, 250 - 25*i, 20, 20);
				Sprite(square_DayArray[k][i]).visible = true;
				}
				}
			sliderFocusIndex = 0;
			updateBarChartDayLabel(BarChart1.TextArray, j);
			updateBarChartDayLabel(barChartCredit.TextArray, j);
			updateBarChartDayLabel(barChartProfit.TextArray, j);
			profit = 0;
			label2.text = "Inventory Item 1: " + String(invItemQuantityArray[0]);
			label4.text = "Credit: " + String(Math.round(creditRemainingArray[j-1]*100)/100);
			label5.text = "Profit: " + String(profit);
			trace(invItemQuantityArray);
			label3.text = "Day " + j + " of " + daysInSimulation;
			buyButton.enabled = true;
			buyButton.alpha = 1;
			simulateDayButton.enabled = true;
			simulateDayButton.alpha = 1;
			startOverButton.enabled = false;
			startOverButton.alpha = .5;
			//runComputerAnalysisButton.enabled = true;
			//runComputerAnalysisButton.alpha = 1;
			credit = 1000;
			for (i=0; i<=4; ++i){
			sliderArray[i].enabled = true;
			sliderArray[i].alpha = 1;
			barChartCreditDisplayArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			barChartCreditDisplayArray[i].graphics.beginFill(invItemColorArray[2]);
			barChartCreditDisplayArray[i].graphics.drawRect(barChartCreditX + barChartCreditWidth*(i+1.75)/7, barChartCreditY + 6*barChartCreditHeight/7, barChartCreditWidth/7, -5*barChartCreditHeight*creditRemainingArray[i + j - 1]/(7*credit));
			barChartDemandArray[i].graphics.lineStyle(3,invItemColorArray[0]);
			barChartDemandArray[i].graphics.drawRect(barChartX + barChartWidth*(i+1)/7, barChartY + 6*barChartHeight/7, barChartWidth/7, -5*barChartHeight*demandItemArray[0][i + j - 1]/(7*barChartScale));
			}
		}
		
		// Updates timeline text on barChart
		function updateBarChartDayLabel(TextArray:Array, dayNumber:int){
		for (var i = 0; i <= 4; ++i){
			if ((i + j) > daysInSimulation){
				TextArray[i].text = "";
			}
			else{
				TextArray[i].text = String(i + dayNumber);
			} 
			}
			}
			
			// Updates supply color for item boxes
		function assignSquareColor(a:Sprite, daysAhead:int, k:int):void{
			var totalDemand = 0;
			var partialDemand = 0;
			var i:int;
			
			for (i = j - 1; i < j - 1 + daysAhead; ++i){
				totalDemand += demandItemArray[k][i];
				partialDemand = totalDemand - demandItemArray[k][i];
			}
			//trace(totalDemand);
		if (isNaN(totalDemand)){
			a.visible = false;
			}
		else{
			if (invItemQuantityArray[k] + sliderArray[k].value < totalDemand && invItemQuantityArray[k] + sliderArray[k].value > partialDemand){
			a.graphics.beginFill(squareColorPartial);
			}
			else if (invItemQuantityArray[k] + sliderArray[k].value >= totalDemand){
			a.graphics.beginFill(squareColorFull);
			}
			else{
			a.graphics.beginFill(squareColorNotAtAll);
			}
		}
		}
			
		function clickRunComputerAnalysisButton(e:Event):void{
				// Generates all scores for all permutations for all products
				
				unitPriceItemArray_HighQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(0));
				unitPriceItemArray_MedQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(1));
				unitPriceItemArray_LowQuantity[sliderFocusIndex] = priceGrid.columns[1].itemToLabel(priceGrid.getItemAt(2));
				bulk_BuyQuantityHigh_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(0));
				bulk_BuyQuantityMed_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(1));
				bulk_BuyQuantityLow_Array[sliderFocusIndex] = priceGrid.columns[0].itemToLabel(priceGrid.getItemAt(2));
				salesPriceItemArray[sliderFocusIndex] = priceGrid.columns[2].itemToLabel(priceGrid.getItemAt(0));
				invOnHandArray[sliderFocusIndex] = priceGrid.columns[3].itemToLabel(priceGrid.getItemAt(0));
				avgValueIOH[sliderFocusIndex] = priceGrid.columns[4].itemToLabel(priceGrid.getItemAt(0));
			
				
		//for(w=0;w<=10;w++){
			
			totalProfitWithSelectedTimelines = 0;
			permutationCountArray = [0, 0, 0, 0, 0];
			creditOutlayRemainingArray = [credit, credit, credit, credit, credit, credit, credit];
			productUsedArray = [false, false, false, false, false];
			//trace(creditOutlayRemainingArray);
		for(r=0; r<=4; r++){
			purchasePermutationArray[r][0][0] = 0;
			
			for (i = 0 ; i < 28; i = i + 4){
				purchasePermutationArray[r][i+3][0] = demandItemArray[r][i/4];
				numPermutationsArray[r] = permutationCountArray[r];
				//Buying high, med, low bulk qty permutations
				for (k = 0; k <= numPermutationsArray[r]; k++){
					if (purchasePermutationArray[r][i][k] < purchasePermutationArray[r][i+3][0]){
						purchasePermutationArray[r][i+1][k] = bulk_BuyQuantityAllItemsArray[0][r];
						purchasePermutationArray[r][i+1][permutationCountArray[r] + 1] = bulk_BuyQuantityAllItemsArray[1][r];
						purchasePermutationArray[r][i+1][permutationCountArray[r] + 2] = bulk_BuyQuantityAllItemsArray[2][r];
						//purchasePermutationArray[r][i+1][permutationCountArray[r] + 3] = purchasePermutationArray[r][i+3][0] - purchasePermutationArray[r][i][k];
						for (m=0; m<=i; m++){
							purchasePermutationArray[r][m][permutationCountArray[r] + 1] = purchasePermutationArray[r][m][k];
							purchasePermutationArray[r][m][permutationCountArray[r] + 2] = purchasePermutationArray[r][m][k];
							//purchasePermutationArray[r][m][permutationCountArray[r] + 3] = purchasePermutationArray[r][m][k];
						}
						permutationCountArray[r]+=2;
						// if buying the high quantity doesn't meet today's demand, then buy enough to meed today's demand
						if(bulk_BuyQuantityAllItemsArray[0][r] < purchasePermutationArray[r][i+3][0] - purchasePermutationArray[r][i][k]){
							purchasePermutationArray[r][i+1][permutationCountArray[r] + 1] = purchasePermutationArray[r][i+3][0] - purchasePermutationArray[r][i][k];
						
						for(m=0;m<=i;m++){
							purchasePermutationArray[r][m][permutationCountArray[r] + 1] = purchasePermutationArray[r][m][k];
						}
						permutationCountArray[r]+=1;
						}
					}
					else {
					purchasePermutationArray[r][i+1][k] = 0;	
					}
					
					for (m = 0; m<=permutationCountArray[r]; m++){
						purchasePermutationArray[r][i+3][m] = purchasePermutationArray[r][i+3][0];
						purchasePermutationArray[r][i+2][m] = int(purchasePermutationArray[r][i+1][m]) + int(purchasePermutationArray[r][i][m]);
						purchasePermutationArray[r][i+4][m] = Math.max(0, int(purchasePermutationArray[r][i+2][m]) - int(purchasePermutationArray[r][i+3][m]));
					}
				}
			}
			//trace("permutationCountArray[rs]: " + permutationCountArray[r]);
			
			for (i=0; i<=permutationCountArray[r]; i++){
				for (m=0; m<=6; m++){
					if (purchasePermutationArray[r][4*m+1][i] <= bulk_BuyQuantityAllItemsArray[1][r] - 1){
						creditSpentArray[r][m][i] = purchasePermutationArray[r][4*m+1][i]*(unitPriceItemArray_LowQuantity[r]);
					}
					if (purchasePermutationArray[r][4*m+1][i] <= bulk_BuyQuantityAllItemsArray[0][r]-1){
						creditSpentArray[r][m][i] = purchasePermutationArray[r][4*m+1][i]*(unitPriceItemArray_MedQuantity[r]);
					}
					else {
						creditSpentArray[r][m][i] = purchasePermutationArray[r][4*m+1][i]*(unitPriceItemArray_HighQuantity[r]);
					}
				}
			}
			
			for (i=0; i<=permutationCountArray[r]; i++){
				for (m=0; m<=6; m++){
					revenueArray[r][m][i] = int(salesPriceItemArray[r])*Math.min(int(purchasePermutationArray[r][4*m+2][i]), int(purchasePermutationArray[r][4*m+3][i]));  
				}
			}
			
			for (i=0; i<=permutationCountArray[r]; i++){
				for (m=0; m<=6; m++){
					profitArray[r][m][i] = (revenueArray[r][m][i]) - (creditSpentArray[r][m][i])
				}
			}
			
			//calculates credit outlay for each time period
			for(i=0; i<=permutationCountArray[r]; i++){
				avgPurchasePriceArray[r][0][i] = 0;
					for(m=0; m<=6; m++){
					if(purchasePermutationArray[r][4*m+1][i] > 0){
						unitSalesPriceArray[r][m][i] = Number(creditSpentArray[r][m][i])/int(purchasePermutationArray[r][4*m+1][i]);
					}
					if(purchasePermutationArray[r][4*m+1][i] == 0){
						unitSalesPriceArray[r][m][i] = 0;
					}
					}
					for(m=0; m<=6; m++){
					creditOutlayArray[r][m][i] = int(purchasePermutationArray[r][4*m][i])*Number(avgPurchasePriceArray[r][m][i]) + int(purchasePermutationArray[r][4*m+1][i])*unitSalesPriceArray[r][m][i];
					if(purchasePermutationArray[r][4*m+2][i] == 0){
						avgPurchasePriceArray[r][m+1][i] = 0;
					}
					if(purchasePermutationArray[r][4*m+2][i] > 0){
						avgPurchasePriceArray[r][m+1][i] = Number(creditOutlayArray[r][m][i])/int(purchasePermutationArray[r][4*m+2][i]);
					}
				}	
			}
			
			
			
			
			//Calculates total expected timeline profit
			for(i=0; i<=permutationCountArray[r]; i++){
				totalProfitArray[r][i] = 0;
				for(m=0; m<=6; m++){
					totalProfitArray[r][i] += profitArray[r][m][i];
				}
				// at the end you can resell leftover inventory at the lowest bulk price... a little different than the other calculation where it's all running average price.
				totalProfitArray[r][i] += unitPriceAllItemsArray[0][r]*(purchasePermutationArray[r][28][i])
				
				/*for(m=6;m>=0;m--){
					if(avgPurchasePriceArray[r][m][i] > 0){
						totalProfitArray[r][i] += avgPurchasePriceArray[r][m][i]*(purchasePermutationArray[r][28][i])
						break
					}
				}*/
				
			}
			//Calculates avg. daily credit outlay over the 7 days
			for(i=0; i<=permutationCountArray[r]; i++){
				avgCreditOutlayArray[r][i] = 0;
				for(m=0; m<=6; m++){
					avgCreditOutlayArray[r][i] += creditOutlayArray[r][m][i]
				}
				//avgCreditOutlayArray[r][i] += avgPurchasePriceArray[r][6][i]*(purchasePermutationArray[r][28][i]);
				avgCreditOutlayArray[r][i] = avgCreditOutlayArray[r][i]/7;
			}
			
			for(i=0; i<=permutationCountArray[r]; i++){
				if(avgCreditOutlayArray[r][i] > 0){
					effRatioArray[r][i] = totalProfitArray[r][i]/avgCreditOutlayArray[r][i]
				}
				if(avgCreditOutlayArray[r][i] == 0){
					effRatioArray[r][i] = 0
				}
			}
			
			maxProfitArray[r] = Math.max.apply(null, totalProfitArray[r]);
			maxRatioArray[r] = Math.max.apply(null, effRatioArray[r])
			//trace("maxProfitArray[r]:", maxProfitArray[r]);
			
			
			
			for(i=0; i<=permutationCountArray[r]; i++){
				normalizedArray[r][0][i] = i;
				normalizedArray[r][1][i] = effRatioArray[r][i]/maxRatioArray[r];
				normalizedArray[r][2][i] = totalProfitArray[r][i]/maxProfitArray[r];
				//normalizedArray[r][3][i] = (w/10)*normalizedArray[r][1][i] + (1-w/10)*normalizedArray[r][2][i];
				normalizedArray[r][3][i] = normalizedArray[r][1][i] + normalizedArray[r][2][i];
			}
			
			indexOfBest[r] = normalizedArray[r][3].indexOf(Math.max.apply(null, normalizedArray[r][3]));
		}
			maxProfitAll = Math.max.apply(null, maxProfitArray);
			maxRatioAll = Math.max.apply(null, maxRatioArray);
			
			for(w=0; w<=10; w = w+2){
			for(r=0;r<=4; r++){
				for(i=0; i<=permutationCountArray[r]; i++){
					
					normalizedArray[r][4][i] = effRatioArray[r][i]/maxRatioAll;
					normalizedArray[r][5][i] = totalProfitArray[r][i]/maxProfitAll;
					//normalizedArray[r][6][i] = normalizedArray[r][4][i] + normalizedArray[r][5][i];
					normalizedArray[r][6][i] = (w/10)*normalizedArray[r][4][i] + (1-w/10)*normalizedArray[r][5][i];
			}
			}
		
		
			//trace(normalizedArray[0][6]);
			allPermutationScoresArray.length = 0;
			for(r=0;r<=4;r++){
				for(i=0;i<=permutationCountArray[r];i++){
			allPermutationScoresArray.push({score:normalizedArray[r][6][i], indx:i, product:r});
			}
			}
			
			allPermutationScoresArray.sortOn("score", Array.DESCENDING);
			
			
			var productUsedArrayCount:int = 0;
			var creditLegalCount:int = 0
			for(i=0;i<=allPermutationScoresArray.length-1;i++){
				
				
				if(productUsedArray[allPermutationScoresArray[i].product] == false){
					if(purchasePermutationArray[allPermutationScoresArray[i].product][28][allPermutationScoresArray[i].indx] <=5){
				  creditLegalCount = 0;
				  for(m=0;m<=6;m++){
					   if(creditOutlayRemainingArray[m]-creditOutlayArray[allPermutationScoresArray[i].product][m][allPermutationScoresArray[i].indx] >= 0){
						  creditLegalCount += 1; 
						  /*trace(creditLegalCount);
						  trace(creditOutlayArray[allPermutationScoresArray[i].product][m][allPermutationScoresArray[i].indx])*/
					   }
				   }
				   if(creditLegalCount == 7){
				   
				   selectedTimelinesArray[allPermutationScoresArray[i].product] = allPermutationScoresArray[i].indx;
				   for(m=0;m<=6;m++){
				   creditOutlayRemainingArray[m] = creditOutlayRemainingArray[m] - creditOutlayArray[allPermutationScoresArray[i].product][m][allPermutationScoresArray[i].indx];
				   }
				   productUsedArray[allPermutationScoresArray[i].product] = true;
				  
				  
				  trace(selectedTimelinesArray);
				  trace(creditOutlayRemainingArray);
				   }
				   }
				   productUsedArrayCount = 0;
				   for(r=0;r<=4;r++){
					   if(productUsedArray[r] == true){
						   productUsedArrayCount += 1
						   if(productUsedArrayCount = 5){
					   		   break
				   }
					   }
				   }
			}
			}
			
			totalProfitWithSelectedTimelines = 0
			for(r=0;r<=4;r++){
				totalProfitWithSelectedTimelines += totalProfitArray[r][selectedTimelinesArray[r]];
			}
			//trace(totalProfitWithSelectedTimelines);
			if(totalProfitWithSelectedTimelines > bestTotalProfit){
				bestTotalProfit = totalProfitWithSelectedTimelines;
				for(r=0;r<=4;r++){
					bestPurchasePermutation[r] = selectedTimelinesArray[r];
				}
				 
			}
		}
		for(m=0;m<=6;m++){
			trace(profitArray[0][m][selectedTimelinesArray[0]], profitArray[1][m][selectedTimelinesArray[1]], profitArray[2][m][selectedTimelinesArray[2]], profitArray[3][m][selectedTimelinesArray[3]], profitArray[4][m][selectedTimelinesArray[4]]);
		}
		for(m=0;m<=6;m++){
		trace(revenueArray[0][m][selectedTimelinesArray[0]], revenueArray[1][m][selectedTimelinesArray[1]], revenueArray[2][m][selectedTimelinesArray[2]], revenueArray[3][m][selectedTimelinesArray[3]], revenueArray[4][m][selectedTimelinesArray[4]]);
		}
		for(m=0;m<=6;m++){
		trace("creditSpent:" + creditSpentArray[0][m][selectedTimelinesArray[0]], creditSpentArray[1][m][selectedTimelinesArray[1]], creditSpentArray[2][m][selectedTimelinesArray[2]], creditSpentArray[3][m][selectedTimelinesArray[3]], creditSpentArray[4][m][selectedTimelinesArray[4]]);
		}
			
			var myGrid:DataGrid = new DataGrid;
			
		myGrid.move(775,150);
		myGrid.setSize(300, 165);
		myGrid.columns = ["Day", "P1","P2","P3", "P4", "P5"];
		for(m=0;m<=5;m++){
			myGrid.columns[m].width = 50;
		}
		
		addChild(myGrid);

		var myData:Array = [{Day:1, P1: purchasePermutationArray[0][1][bestPurchasePermutation[0]], P2: purchasePermutationArray[1][1][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][1][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][1][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][1][bestPurchasePermutation[4]]},
		{Day:2, P1: purchasePermutationArray[0][5][bestPurchasePermutation[0]], P2: purchasePermutationArray[1][5][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][5][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][5][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][5][bestPurchasePermutation[4]]},
		{Day:3, P1: purchasePermutationArray[0][9][bestPurchasePermutation[0]], P2: purchasePermutationArray[1][9][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][9][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][9][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][9][bestPurchasePermutation[4]]},
		{Day:4, P1: purchasePermutationArray[0][13][bestPurchasePermutation[0]], P2:purchasePermutationArray[1][13][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][13][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][13][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][13][bestPurchasePermutation[4]]},
		{Day:5, P1: purchasePermutationArray[0][17][bestPurchasePermutation[0]], P2:purchasePermutationArray[1][17][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][17][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][17][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][17][bestPurchasePermutation[4]]},
		{Day:6, P1: purchasePermutationArray[0][21][bestPurchasePermutation[0]], P2:purchasePermutationArray[1][21][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][21][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][21][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][21][bestPurchasePermutation[4]]},
		{Day:7, P1: purchasePermutationArray[0][25][bestPurchasePermutation[0]], P2:purchasePermutationArray[1][25][bestPurchasePermutation[1]], P3: purchasePermutationArray[2][25][bestPurchasePermutation[2]], P4: purchasePermutationArray[3][25][bestPurchasePermutation[3]], P5: purchasePermutationArray[4][25][bestPurchasePermutation[4]]}];

		myGrid.dataProvider = new DataProvider(myData);
		myGrid.setStyle("cellRenderer", jobCellRenderer);
		myGrid.setStyle("headerRenderer", headerCellRenderer);
		myGrid.sortableColumns = false;
		
		var label7:TextField = new TextField;
			label7.text = "Computer's Profit Score: " + String(bestTotalProfit);
			label7.y = 325;
			label7.x = 775;
			label7.autoSize = "left";
			addChild(label7);
		}
		
		
		
		}
		
		
			/*trace("best Total Profit: " + bestTotalProfit);
			for(i=1;i<=25;i=i+4){
				trace("best Purchase Permutation:" + bestPurchasePermutation[0][i], bestPurchasePermutation[1][i], bestPurchasePermutation[2][i], bestPurchasePermutation[3][i], bestPurchasePermutation[4][i]);*/
			//}
		
		
		
	}
	
}



//}
