package com.pvmm.domains.domain;

import com.pvmm.emails.email.Email;
import com.pvmm.utils.cruds.CrudEntityInterface;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "virtual_domains")
public class Domain implements CrudEntityInterface {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO )
    @Column(insertable = false, updatable = false)
    private int id = 0;

    @Size(min=1, max=50)
    private String name;

    @NotNull
    private boolean active;


    @OneToMany(mappedBy = "domain", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    public List<Email> emails;


    @Override
    public String toString() {
        return String.format(
            "Domain[id=%d, name='%s', active: %b]",
            id, name, active);
    }


    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
