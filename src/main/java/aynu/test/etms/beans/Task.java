package aynu.test.etms.beans;

public class Task {
    private String tid;//任务id；
    private String tname;//任务名；
    private String tstart;//任务开始时间；
    private String tend;//任务结束时间；
    private String tuser;//任务实施人；
    private String ttxt;//任务描述；
    private String tstate;//任务状态；
    private String mid;//任务负责人；

    public String getMid() {
        return mid;
    }
    public void setMid(String mid) {
        this.mid = mid;
    }
    public String getTid() {
        return tid;
    }
    public void setTid(String tid) {
        this.tid = tid;
    }
    public String getTname() {
        return tname;
    }
    public void setTname(String tname) {
        this.tname = tname;
    }
    public String getTstart() {
        return tstart;
    }
    public void setTstart(String tstart) {
        this.tstart = tstart;
    }
    public String getTend() {
        return tend;
    }
    public void setTend(String tend) {
        this.tend = tend;
    }
    public String getTuser() {
        return tuser;
    }
    public void setTuser(String tuser) {
        this.tuser = tuser;
    }
    public String getTtxt() {
        return ttxt;
    }
    public void setTtxt(String ttxt) {
        this.ttxt = ttxt;
    }
    public String getTstate() {
        return tstate;
    }
    public void setTstate(String tstate) {
        this.tstate = tstate;
    }
}
