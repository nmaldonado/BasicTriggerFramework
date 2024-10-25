public virtual class TriggerHandler {
    protected TriggerContext context;

    public TriggerHandler() {
        this.setcontext();
    }

    protected virtual void setContext() {
        switch on trigger.operationType {
            when BEFORE_INSERT{
                this.context = TriggerContext.BEFORE_INSERT;
            }
        }
    }

    public virtual void run() {
        switch on this.context {
            when BEFORE_INSERT {
                this.beforeInsert();
            }
        }
    }

    protected virtual void beforeInsert() {}

    private enum TriggerContext {
        BEFORE_INSERT
    }
}