public virtual class MethodOverriding {
    public virtual class Parent{
        private Integer pvt;
        protected Integer ptd;
        public Integer pub;
        public virtual void getvalues (){
            system.debug ('Sahil' +pvt);
            system.debug('Steven ' +ptd);
            system.debug ('Harry '+ pub);
        }
    }
    public virtual class Child extends Parent {
        private Integer pvt;
        public override void getvalues() {
            system.debug ('Extented' + pvt);
        }
    }
    public class Test {
        public void main() {
            Parent p1= new Parent ();
            p1.getvalues ();
            Child c1= new Child();    
            c1.getvalues ();
        }
    }        
}