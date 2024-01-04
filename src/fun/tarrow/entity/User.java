package fun.tarrow.entity;

/**
 * Blog实体类
 */
public class User {
    // 用户id
    private Integer id;
    // 用户名
    private String username;
    // 用户密码
    private String password;
    // 用户邮箱
    private String email;
    // 用户电话
    private String telephone;
    // 用户性别
    private String gender;

    public User() {

    }

    public User(String username, String password, String email, String telephone, String gender) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.telephone = telephone;
        this.gender = gender;
    }

    public User(Integer id, String username, String password, String email, String telephone, String gender) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.telephone = telephone;
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}