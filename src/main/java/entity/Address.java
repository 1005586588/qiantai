package entity;

public class Address {

	public static String[] sstatus = { "可用", "不可用" };

	int status;
	int id;
	int user_id;
	String zone;
	String addr;
	String name;
	String tel;
	int s;
	String sheng;
	String cheng;
	String qu;
	String zone1;
	String zone2;
	String zone3;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getZone1() {
		return zone1;
	}

	public void setZone1(String zone1) {
		this.zone1 = zone1;
	}

	public String getZone2() {
		return zone2;
	}

	public void setZone2(String zone2) {
		this.zone2 = zone2;
	}

	public String getZone3() {
		return zone3;
	}

	public void setZone3(String zone3) {
		this.zone3 = zone3;
	}

	public String getSa() {
		return sstatus[s];
	}

	public String getSheng() {
		return sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public String getCheng() {
		return cheng;
	}

	public void setCheng(String cheng) {
		this.cheng = cheng;
	}

	public String getQu() {
		return qu;
	}

	public void setQu(String qu) {
		this.qu = qu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getZone() {
		if(zone==null) {
			zone=zone1+"-"+zone2+"-"+zone3;
		}
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getS() {
		return s;
	}

	public void setS(int s) {
		this.s = s;
	}

}
