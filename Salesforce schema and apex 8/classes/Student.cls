public class Student{
    public Student(){
    Student__c student1= new Student__c();
        //Student Info
    //A.id='a055i0000014QvBAAU';    
    student1.Name = 'Sahil Sharma';
    student1.Roll_no__c= 123;
    student1.Father_Name__c= 'Rakesh Sharma';
    student1.Mobile_Number__c= '8560949232';
    student1.Father_s_Mobile_Number__c= '9414322809';
    student1.Home_Phone__c= '350487';
    student1.Email__c= 'infectionvirus4@gmail.com';
    student1.Address__c= 'Jeevan vihar 200ftbypass';
        //Class Info
    student1.Overall_Grade__c= 'A+';
    student1.Stream__c= 'Economics';
    student1.Class__c= '2nd year';
    student1.Section__c= 'A';
    student1.Current_Year__c= date.parse('2/07/2022');
    student1.Pending_Fees_Amount__c= 20;
    student1.Pending_Exam_Fees__c= 80;
        //Semester Deatils
    student1.X1st_Sem_Percentage__c= 90;
    student1.Subjects_in_which_back__c= 'Economics';
    student1.X2nd_Sem_Percentage__c= 70;
    student1.Subject_in_which_back__c= 'English';
    student1.X3rd_Sem_Percentage__c= 92;
    student1.Back_in_which_Subjects__c= 'Geography';
    student1.Donation_Amount__c= 56;
    student1.Pending_Overall_Amount__c= 20;
        //Bank Info
    student1.Bank_Name__c= 'HDFC Bank';
    student1.IFSC_Code__c= 3456;
    student1.Account_Number__c= 3242;
    student1.Mob_Number__c= '8560949232';
    student1.Bank_Phone_Number__c= '7444472455';
    student1.City__c= 'Jaipur';
    student1.State__c= 'Rajasthan';   
    student1.Exam_Fees_Submitted__c= True;
    student1.Fees_Submitted__c= True;
    student1.Is_Donation__c= True;    
    insert student1;
        System.Debug('check student data:::'+student1);
    }
}