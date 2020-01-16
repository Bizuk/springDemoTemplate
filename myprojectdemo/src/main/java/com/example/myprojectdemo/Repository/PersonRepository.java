package com.example.myprojectdemo.Repository;

import com.example.myprojectdemo.Model.PersonModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepository extends CrudRepository<PersonModel, Long> {
    
}
