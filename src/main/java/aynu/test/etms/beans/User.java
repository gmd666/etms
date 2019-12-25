package aynu.test.etms.beans;

public class User {
    private String id;//用户id;
    private int eid;//员工eid；
    private String username;
    private String password;
    private String identify;//身份；
    private String truename;//真实姓名；
    private String gender;//性别；
    private String borndate;//出生日期；
    private String degree;//学历；
    private String position;//职位；
    private String swt;//入职时间；
    private int    state;//状态；
    private int    facelogin;//人脸识别权限；
    private String works;//工作经历；
    private String bid;//主管id;
    private String bname;//主管姓名；

    public String getBid() {
        return bid;
    }
    public void setBid(String bid) {
        this.bid = bid;
    }
    public String getBname() {
        return bname;
    }
    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public int getEid() {
        return eid;
    }
    public void setEid(int i) {
        this.eid = i;
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
    public String getIdentify() {
        return identify;
    }
    public void setIdentify(String identify) {
        this.identify = identify;
    }
    public String getTruename() {
        return truename;
    }
    public void setTruename(String truename) {
        this.truename = truename;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getBorndate() {
        return borndate;
    }
    public void setBorndate(String borndate) {
        this.borndate = borndate;
    }
    public String getDegree() {
        return degree;
    }
    public void setDegree(String degree) {
        this.degree = degree;
    }
    public String getPosition() {
        return position;
    }
    public void setPosition(String position) {
        this.position = position;
    }
    public String getSwt() {
        return swt;
    }
    public void setSwt(String swt) {
        this.swt = swt;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public int getFacelogin() {
        return facelogin;
    }
    public void setFacelogin(int facelogin) {
        this.facelogin = facelogin;
    }
    public String getWorks() {
        return works;
    }
    public void setWorks(String works) {
        this.works = works;
    }

    public String toString() {
        return "User [id=" + id + ", eid=" + eid + ", username=" + username + ", password=" + password + ", identify="
                + identify + ", truename=" + truename + ", gender=" + gender + ", borndate=" + borndate + ", degree="
                + degree + ", position=" + position + ", swt=" + swt + ", state=" + state + ", facelogin=" + facelogin
                + ", works=" + works + "]";
    }
}
