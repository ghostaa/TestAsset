dojo.provide("com.ibm.btt.util.GlobalConfigurationUtil");
dojo.getObject("com.ibm.btt.util.GlobalConfigurationUtil", true); 

(function() {
	com.ibm.btt.util.GlobalConfigurationUtil = {
					
					/**
					 * This method is used to get the value string through the inputed key.
					 * 
					 * @key String
					 * @values String
					 */
					getValue: function(key, defaultValue){
						var v = this.values[key];
						v = (v!==undefined?v:defaultValue);
						return v;
					},
					
					/**
					 * This method is used to set the key string and value string .
					 * 
					 * @key String
					 * @values String
					 */
					setValue: function(key,value){
						this.values[key] = value;
					},
					
					
					values: {  

					}
			};
	
})();