public with sharing class OpportunityTriggerHandler  extends TriggerHandler{
    private List<Opportunity> newList;
    private List<Opportunity> oldList;
    private Map<Id, Opportunity> newMap;
    private Map<Id, Opportunity> oldMap;


    public OpportunityTriggerHandler() {
        this.newList = (List<Opportunity>) Trigger.new;
        this.oldList = (List<Opportunity>) Trigger.old;
        this.newMap = (Map<Id, Opportunity>) Trigger.newMap;
    }

    public override void beforeInsert() {
        try {
            //call helper method
            OpportunityHelper.doSomethingWithOpportunities(this.newList);
        } catch (Exception e) {
            throw new OpportunityTriggerHandlerException(e.getMessage());
        }
    }

    public class OpportunityTriggerHandlerException extends Exception {}
}