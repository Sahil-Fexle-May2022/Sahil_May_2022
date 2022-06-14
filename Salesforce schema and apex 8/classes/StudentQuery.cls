public class StudentQuery {
    public  StudentQuery(){        
    List<Student__c> studentList=[select id, name, Roll_no__c from Student__c order by createdDate  limit 5];
        for(Student__c student: studentList){          
            System.Debug('check student data:::'+student);
        }            
    }
}