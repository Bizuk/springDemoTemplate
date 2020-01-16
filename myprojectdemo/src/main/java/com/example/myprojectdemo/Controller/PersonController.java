package com.example.myprojectdemo.Controller;

import com.example.myprojectdemo.Model.PersonModel;
import com.example.myprojectdemo.Service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Bizu")
public class PersonController {
    private PersonService service;

    @Autowired
    public PersonController(PersonService service) {
        this.service = service;
    }

    @RequestMapping(value = "/findall", method = RequestMethod.GET)
    public ResponseEntity<?> findALL(){
        Iterable<PersonModel> allPeople = service.findAll();
        ResponseEntity<?> response =  new ResponseEntity<>(allPeople, HttpStatus.OK);
        return response;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ResponseEntity<?> create(@RequestBody PersonModel person){
       person = service.create(person);
       ResponseEntity<?> response = new ResponseEntity<>(person,HttpStatus.CREATED);
               return response;
    }
}


