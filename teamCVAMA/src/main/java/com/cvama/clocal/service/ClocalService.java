package com.cvama.clocal.service;

import java.util.List;

import com.cvama.clocal.dto.ClocalDTO;
import com.cvama.clocal.dto.WorldDTO;

public interface ClocalService {
	

	public List<ClocalDTO> list();
	public List<WorldDTO> worldlist();

}
