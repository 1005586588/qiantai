package entity;

public class Orders {
	
	public static String[] sstatus = { "0未支付","1已支付","2已发货","3已收货","4已退货","5已取消" };
	public static String[] assessstatusa = { "未评价","已评价" };
	
	int id ;
	String date;
	double amount;
	String code;
	double nowamount;
	int address_id;
	int user_id;
	int  assessstatus;
	int status;
	String tel;
	String aaddr;
	String comments;
	String aname;
	String uname;
	String ids;
	String atel;
	String sids;
	int pid;
	int type_id;
	int salecount;
	int collectcount;
	int priority;
	double price;
	double nowprice;
	String fullname;
	String activity;
	String tip;
	String sale;
	String info;
	String pics;
	String tname;
	int parentid;
	String parent_name;
	String name ;
	int scount;
	int sid;
	int count;

	double nowprice2;
	double price2;
	int count2;
	int productid;
	
	
	double allcount;
	
	public String  getSa() {
		return sstatus[status];
	}
	public String  getAssessstatusa() {
		return assessstatusa[assessstatus];
	}
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public static String[] getSstatus() {
		return sstatus;
	}
	public static void setSstatus(String[] sstatus) {
		Orders.sstatus = sstatus;
	}
	
	
	
	
	
	
	public double getNowprice2() {
		return nowprice2;
	}
	public void setNowprice2(double nowprice2) {
		this.nowprice2 = nowprice2;
	}
	public double getPrice2() {
		return price2;
	}
	public void setPrice2(double price2) {
		this.price2 = price2;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getCollectcount() {
		return collectcount;
	}
	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getNowprice() {
		return nowprice;
	}
	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSids() {
		return sids;
	}
	public void setSids(String sids) {
		this.sids = sids;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAaddr() {
		return aaddr;
	}
	public void setAaddr(String aaddr) {
		this.aaddr = aaddr;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public double getAllcount() {
		return allcount;
	}
	public void setAllcount(double allcount) {
		this.allcount = allcount;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getAssessstatus() {
		return assessstatus;
	}
	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
}
