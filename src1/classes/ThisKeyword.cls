public with sharing class ThisKeyword{
        String  countryName;
        Integer countryPopulation;
    public ThisKeyword(String countryName, Integer countryPopulation){
        this.countryName = countryName;
        this.countryPopulation = countryPopulation;
    }

    // Method to print class variables
    public void printClassVariables(){
        System.debug('Country Name: ' + countryName);
        System.debug('Country Population: ' + countryPopulation);
    }
}