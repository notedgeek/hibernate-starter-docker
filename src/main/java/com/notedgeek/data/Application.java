package com.notedgeek.data;

import com.notedgeek.data.entities.Credential;
import com.notedgeek.data.entities.User;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Slf4j
public class Application {

    public static void main(String[] args) {

        log.debug("App started");

        Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();

        User user = new User();
        user.setFirstName("john");
        user.setSecondName("smith");

        Credential credential = new Credential();
        credential.setUsername("uname");
        credential.setPassword("pword");
        credential.setUser(user);

        session.save(credential);
        long credentialId = credential.getId();

        transaction.commit();
        session.close();

        session = HibernateUtil.openSession();

        credential = (Credential) session.get(Credential.class, credentialId);

        log.debug(credential.getUser().getFirstName());

        session.close();
        HibernateUtil.getSessionFactory().close();
    }

}
