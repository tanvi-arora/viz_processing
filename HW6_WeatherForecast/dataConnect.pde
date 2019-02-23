//Initial data upload
/*******************************************************************
Metadata for forecast API is available at https://darksky.net/dev/docs#api-request-types
Forecast API returns forecast currently, minutely, hourly, daily and alerts data.
For this assignment currently and daily data was fetched
********************************************************************/
void initialData(){
    Font1 = createFont("Tahoma Bold", 18);
    
    //Houston Wheather forecast data upload from API sourse in jSON format
    myObject = loadJSONObject("https://api.darksky.net/forecast/<<APPID>/29.7,-95.47");
    // provide as input to URL , latitude and longitude of interest . Above position represents Houston,TX
    
    // Get current temperature and conditions(summary)   
    JSONObject currently = myObject.getJSONObject("currently");  
    int temperature = currently.getInt("temperature");  
    sum = currently.getString("summary");
    temp = temperature;
    
    // Get day-wise forecast data for the upcoming week 
    JSONObject daily = myObject.getJSONObject("daily");  
    JSONArray data = daily.getJSONArray("data");
    tempsHigh = new int[data.size()];
    tempsLow = new int[data.size()];
    temps = new int[data.size()];
    times = new String[data.size()];
    summary = new String[data.size()];
  
    for(int i = 0; i < data.size() ; i++)  {
      JSONObject we = data.getJSONObject(i); 
      
      //Get summary
      summary[i] = we.getString("summary");
      //println(summary[i]);
      
      //Get time
      int time = we.getInt("time"); 
      times[i] = new java.text.SimpleDateFormat("dd/MM/yyyy , EEE").format(time*1000L); 
        
      //Get High temp
      float temperatureHigh = we.getFloat("temperatureMax");        
       tempsHigh[i] = int(temperatureHigh);
       
       //Get Low temp
       float temperatureLow = we.getFloat("temperatureMin");        
       tempsLow[i] = int(temperatureLow);
       
       //Calc AveTemp
       temps[i]=int((temperatureHigh+temperatureLow)/2);
      
     }
    
    // Boundary calculations needed for graphs
    
      minHigh = min(tempsHigh);
      maxHigh = max(tempsHigh);
      
      minLow= min(tempsLow);
      maxLow = max(tempsLow);
      
      minTemp = min(temps);
      maxTemp = max(temps);
      
      min = min(minHigh, minLow, minTemp);
      max = max(maxHigh, maxLow, maxTemp);
     
      isHoveringUp = false;
      isHoveringLow = false;
}
