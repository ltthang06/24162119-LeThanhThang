package vn.iotstar.model;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.*;

@Entity
@Table(name = "Users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "email", columnDefinition = "NVARCHAR(255)")
    private String email;

    @Column(name = "username", columnDefinition = "NVARCHAR(255) NOT NULL")
    private String userName;

    @Column(name = "fullname", columnDefinition = "NVARCHAR(255)")
    private String fullName;

    @Column(name = "password", columnDefinition = "NVARCHAR(255) NOT NULL")
    private String passWord;

    @Column(name = "avatar", columnDefinition = "NVARCHAR(255)")
    private String avatar;

    @Column(name = "roleid")
    private int roleid;

    @Column(name = "phone", columnDefinition = "NVARCHAR(50)")
    private String phone;

    @Column(name = "createdDate")
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @Column(name = "code", columnDefinition = "NVARCHAR(50)")
    private String code;

    @Column(name = "status")
    private int status;

    public User() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getPassWord() { return passWord; }
    public void setPassWord(String passWord) { this.passWord = passWord; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public int getRoleid() { return roleid; }
    public void setRoleid(int roleid) { this.roleid = roleid; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
}