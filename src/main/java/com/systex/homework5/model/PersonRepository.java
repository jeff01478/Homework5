package com.systex.homework5.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;



@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
	Person findByUserName(String userName);
}
