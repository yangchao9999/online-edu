package com.education.framework.baseModule.domain ; 

import java.io.Serializable; 

/* 
 *  
 * Tue Mar 06 09:23:12 CST 2018 
 */  

public class SysRoleMenu implements Serializable {  

  private static final long serialVersionUID = 2L; 
  private Integer id;
    // datebase colume is create_time 
    private String createTime; 

    // datebase colume is create_user 
    private int createUser; 

    // datebase colume is menu_id 
    private int menuId; 

    // datebase colume is role_id 
    private int roleId; 

    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreateTime(){ 
        return this.createTime; 
    } 

    public void setCreateTime(String createTime){ 
        this.createTime=createTime; 
    } 


    public int getCreateUser(){ 
        return this.createUser; 
    } 

    public void setCreateUser(int createUser){ 
        this.createUser=createUser; 
    } 


    public int getMenuId(){ 
        return this.menuId; 
    } 

    public void setMenuId(int menuId){ 
        this.menuId=menuId; 
    } 


    public int getRoleId(){ 
        return this.roleId; 
    } 

    public void setRoleId(int roleId){ 
        this.roleId=roleId; 
    } 


}