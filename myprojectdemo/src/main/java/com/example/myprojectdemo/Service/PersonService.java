package com.example.myprojectdemo.Service;

import com.example.myprojectdemo.Model.PersonModel;
import com.example.myprojectdemo.Repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonService {
        private PersonRepository personRepository;

    @Autowired
    public PersonService (PersonRepository someThingIDK){
        this.personRepository = someThingIDK;
    }

        public  Iterable<PersonModel> findAll(){
        return personRepository.findAll();

    }

    public PersonModel create(PersonModel person) {
        return personRepository.save(person);
    }
}
