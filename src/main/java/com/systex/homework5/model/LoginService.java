package com.systex.homework5.model;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LoginService {

    final PersonRepository personRepository;

    public LoginService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public void loginAuth(String userName, String password, HttpSession session) {
        Person person = personRepository.findByUserName(userName);
        if (person != null && person.getPassword().equals(password)) {
            session.setAttribute("loginAuth", true);
            log.info("登入成功");
            return;
        }

        session.setAttribute("userName", userName);
        session.setAttribute("password", password);
        session.setAttribute("loginError", "帳號或密碼有誤!!");
        session.setAttribute("loginAuth", false);
    }
}
