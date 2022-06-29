public with sharing class Constructors {
    // Non Parameterized Constructor**********
          String countryName;
          Integer countryPopulation;
    public Constructors(){
          countryName='india';
          countryPopulation=138000000;
    System.debug(countryName);
    System.debug(countryPopulation);
    }

    //Parameterized Constructor**********
    //Constructor that takes a string argument and Integer argument
    public Constructors(String countryName, Integer countryPopulation){
           this.countryName = countryName;
           this.countryPopulation = countryPopulation;
    }

    //* Method to print class variables
    public void printClassVariables(){
    System.debug('Country Name: ' + countryName);
    System.debug('Country Population: ' + countryPopulation);
    }
  }