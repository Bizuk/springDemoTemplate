package com.example.myprojectdemo.Controller;

import com.example.myprojectdemo.Model.PersonModel;
import com.example.myprojectdemo.Service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value="/Bizu")
public class PersonController {
    private PersonService service;

    @Autowired
    public PersonController(PersonService service) {
        this.service = service;
    }

    @RequestMapping(value = "/person")
    public ResponseEntity<?> findALL() {
        Iterable<PersonModel> allPeople = service.findAll();
        ResponseEntity<?> response = new ResponseEntity<>(allPeople, HttpStatus.OK);
        return response;
    }

    @RequestMapping(value = "/person/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> findById(@PathVariable Long id) {
        PersonModel person = service.findyByID(id);
        ResponseEntity<?> response = new ResponseEntity<>(person, HttpStatus.OK);
        return response;

    }

    @RequestMapping(value = "/person", method = RequestMethod.POST)
    public ResponseEntity<?> create(@RequestBody PersonModel person) {
        person = service.create(person);
        ResponseEntity<?> response = new ResponseEntity<>(person, HttpStatus.CREATED);
        return response;
    }

    @RequestMapping(value = "/person/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> delete(@PathVariable Long id) {
        PersonModel person = service.delete(id);
        ResponseEntity<?> response = new ResponseEntity<>(person, HttpStatus.OK);
        return response;
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
    public ResponseEntity update(@PathVariable Long id, @RequestBody PersonModel person) {
        PersonModel responseBody = service.update(id, person);
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }
}


