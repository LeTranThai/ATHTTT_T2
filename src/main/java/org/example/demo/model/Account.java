package org.example.demo.model;

import org.example.demo.Services.AccountServices;
import org.example.demo.Services.OrderServices;
import org.example.demo.Services.SignService;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.ParseException;

public class Account extends ModelParent implements Serializable {

    private String reLoginToken;
    private String validateToken;
    private String lastName;
    private String firstName;
    private String phone;
    private String email;
    private String address;
    private String username;
    private String password;
    private Role role;
    private Status status;

    public String getReLoginToken() {
        return reLoginToken;
    }

    public void setReLoginToken(String reLoginToken) {
        this.reLoginToken = reLoginToken;
    }

    public String getValidateToken() {
        return validateToken;
    }

    public void setValidateToken(String validateToken) {
        this.validateToken = validateToken;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +
                "reLoginToken='" + reLoginToken + '\'' +
                ", validateToken='" + validateToken + '\'' +
                ", lastName='" + lastName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", status=" + status +
                '}';
    }
    public static Sign getKeyByOrder(Order order) throws ParseException {
        Sign sign = null;
        Timestamp day_order = new Timestamp(order.getCreatedDate().getTime());
        for (Sign s : SignService.getSigns(order.getAccount())) {
            Timestamp day_create = new Timestamp(s.getCreatedDate().getTime());
            if (s.getModifiedDate() == null) {
                return null;
            }
            Timestamp day_expired = new Timestamp(s.getModifiedDate().getTime());
            if (day_order.after(day_create) && day_order.before(day_expired)) {
                sign = s;
                break;
            }
        }

        return sign;
    }
    public static void main(String[] args) throws Exception {
        Order order = OrderServices.getOrder(29);
        Account account = AccountServices.getUser(order.getAccount().getId());
        RSA rsa = new RSA();
        Sign signFind = getKeyByOrder(order);
        Sign sign = SignService.getSignWithAccountAndIsActive(account, true);

        System.out.println(sign);
        System.out.println(signFind);
//        String decrypt = rsa.decryptFromBase64(mess, keyString);
//        System.out.println(decrypt);
    }
}
