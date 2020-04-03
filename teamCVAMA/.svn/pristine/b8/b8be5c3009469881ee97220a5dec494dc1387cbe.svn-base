package com.cvama.clocal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cvama.clocal.dto.ClocalDTO;
import com.cvama.clocal.dto.WorldDTO;
import com.cvama.clocal.mapper.ClocalMapper;

import lombok.AllArgsConstructor;

@Service
@Qualifier("cl")
@AllArgsConstructor
public class ClocalServiceImpl implements ClocalService{
	
		private ClocalMapper clocalMapper;
		
		public List<ClocalDTO> list() {
			
			return clocalMapper.list();
		}
		
		public List<WorldDTO> worldlist() {
			
			return clocalMapper.worldlist();
		}
	
}
