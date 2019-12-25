package aynu.test.etms.beans;

public class Plan {

	private String pid;//计划id；
	private String pname;//计划名；
	private String ptxt;//计划描述；
	private String pstart;//计划开始时间；
	private String pend;//计划结束时间；
	private int    pstate;//计划的状态；
	private int    rstate;//是否反馈；
	private String rinfo;//反馈信息；
	private String tid;//任务的id;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPtxt() {
		return ptxt;
	}
	public void setPtxt(String ptxt) {
		this.ptxt = ptxt;
	}
	public String getPstart() {
		return pstart;
	}
	public void setPstart(String pstart) {
		this.pstart = pstart;
	}
	public String getPend() {
		return pend;
	}
	public void setPend(String pend) {
		this.pend = pend;
	}
	public int getPstate() {
		return pstate;
	}
	public void setPstate(int pstate) {
		this.pstate = pstate;
	}
	public int getRstate() {
		return rstate;
	}
	public void setRstate(int rstate) {
		this.rstate = rstate;
	}
	public String getRinfo() {
		return rinfo;
	}
	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}

	@Override
	public String toString() {
		return "Plan{" +
				"pid='" + pid + '\'' +
				", pname='" + pname + '\'' +
				", ptxt='" + ptxt + '\'' +
				", pstart='" + pstart + '\'' +
				", pend='" + pend + '\'' +
				", pstate=" + pstate +
				", rstate=" + rstate +
				", rinfo='" + rinfo + '\'' +
				", tid='" + tid + '\'' +
				'}';
	}
}
