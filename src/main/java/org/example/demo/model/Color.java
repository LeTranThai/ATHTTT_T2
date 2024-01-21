package org.example.demo.model;

public class Color extends ModelParent {
    private String code;
    private String name;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Color{" +
                "code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
