package com.example.myprojectdemo.Service;

import com.example.myprojectdemo.Model.PersonModel;
import com.example.myprojectdemo.Repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonService {
    private PersonRepository personRepository;

    @Autowired
    public PersonService(PersonRepository someThingIDK) {
        this.personRepository = someThingIDK;
    }

    public Iterable<PersonModel> findAll() {
        return personRepository.findAll();

    }

    public PersonModel create(PersonModel person) {
        return personRepository.save(person);
    }

    public PersonModel findyByID(Long id) {
        return personRepository.findById(id).get();
    }

    public PersonModel delete(Long id) {
        PersonModel personModelToBeDeleted = this.findyByID(id);
        personRepository.delete((personModelToBeDeleted));
        return personModelToBeDeleted;
    }

    public PersonModel update(Long id, PersonModel person) {
        PersonModel personInDatabase = personRepository.findById(id).get();
        personInDatabase.setFirstName(person.getFirstName());
        personInDatabase.setLastName(person.getLastName());
        personRepository.save(personInDatabase);
        return personInDatabase;
    }

//    public  PersonModel update(Long id, PersonModel person) {
//        PersonModel personInDataBase = personRepository.findById(id).get();
//        String newFirstName =person.getFirstName();
//        String newLastName = person.getLastName();
//
//        personInDataBase.setFirstName(newFirstName);
//        personInDataBase.setLastName(newLastName);
//        personRepository.save(personInDataBase);
//        return personInDataBase;
//    }



}
