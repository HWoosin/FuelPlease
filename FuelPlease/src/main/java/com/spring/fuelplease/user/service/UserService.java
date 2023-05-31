package com.spring.fuelplease.user.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.fuelplease.user.mapper.IUserMapper;
import com.spring.fuelplease.voCenter.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements IUserService {
	@Autowired
	private IUserMapper mp;
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public void userJoin(UserVO vo) {
		log.info("암호화 하기 전 비번: "+ vo.getUserPw());
		//비밀번호를 암호화 해서 vo객체에 다시 저장하기.
		String securePw = encoder.encode(vo.getUserPw());
		log.info("암호화 후 비번: " + securePw);
		vo.setUserPw(securePw);
		mp.userJoin(vo);

	}

	@Override
	public String userLogin(String id, String pw) {
		String dbPw = mp.userLogin(id);
		if(dbPw != null) {
			if(encoder.matches(pw, dbPw)) {
				return id;
			}
		}
		return null;
	}

	@Override
	public int idCheck(String id) {
		return mp.idCheck(id);
	}

	@Override
	public UserVO getInfo(String id) {
		return mp.getInfo(id);
	}

	@Override
	public void updateUser(UserVO vo) {
		log.info("전 DB저장 비밀번호: " + vo.getUserPw());
		String updatePw = encoder.encode(vo.getUserPw());
		vo.setUserPw(updatePw);
		mp.updateUser(vo);
	}

	@Override
    public int deleteUser(String id, String userPw) {
        log.info("사용자 세션 아이디: "+ id);
        String dbPw = mp.userLogin(id);
        log.info("DB저장 비번:"+ dbPw);
        log.info("결과: {}",encoder.matches(userPw, dbPw));
        if(dbPw != null) {
            if(encoder.matches(userPw, dbPw)) {
                mp.deleteUser(id,dbPw);
                return 1;
            }
            return 0;
        }
        return -2;

    }

}
