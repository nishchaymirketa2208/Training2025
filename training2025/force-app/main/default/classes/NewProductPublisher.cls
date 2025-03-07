public class NewProductPublisher {
    public static void publishEvent(String category, String productId, String name, Integer price) {
        // Create a new platform event instance
        New_Product_Entry__e eventMessage = new New_Product_Entry__e(
            Product_Category__c = category,
            Product_Id__c = productId,
            Product_Name__c = name,
            Product_Price__c = price
        );
 
        // Publish the event
        Database.SaveResult result = EventBus.publish(eventMessage);
 
        // Check if the event was published successfully
        if (result.isSuccess()) {
            System.debug('Platform Event Published Successfully');
        }
        else {
            for (Database.Error err : result.getErrors()) {
                System.debug('Error publishing event: ' + err.getMessage());
            }
        }
    }
}