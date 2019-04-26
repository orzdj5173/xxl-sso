package com.xxl.sso.server.service.impl;

import com.xxl.sso.server.core.model.UserInfo;
import com.xxl.sso.server.core.result.ReturnT;
import com.xxl.sso.server.service.UserService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public ReturnT<UserInfo> findUser(String username, String password) {

        if (username==null || username.trim().length()==0) {
            return new ReturnT<UserInfo>(ReturnT.FAIL_CODE, "请输入用户名.");
        }
        if (password==null || password.trim().length()==0) {
            return new ReturnT<UserInfo>(ReturnT.FAIL_CODE, "请输入密码.");
        }
        String sql = "select * from t_game_admin_user where username = ? and password = ?";
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new RowMapper<UserInfo>() {
            @Override
            public UserInfo mapRow(ResultSet resultSet, int i) throws SQLException {
                UserInfo userInfo = new UserInfo();
                userInfo.setUserid(resultSet.getInt("user_id"));
                userInfo.setUsername(resultSet.getString("username"));
                userInfo.setPassword(resultSet.getString("password"));
                userInfo.setEnabled(resultSet.getInt("enable"));
                return userInfo;
            }
        }, username, password);
        if (!userInfoList.isEmpty()) {
            return new ReturnT<UserInfo>(userInfoList.get(0));
        }
        return new ReturnT<UserInfo>(ReturnT.FAIL_CODE, "用户名或密码不正确.");
    }


}
