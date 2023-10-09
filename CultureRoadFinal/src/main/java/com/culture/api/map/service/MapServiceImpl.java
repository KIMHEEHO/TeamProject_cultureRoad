package com.culture.api.map.service;

import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService {

    @Override
    public StringBuffer mapList() throws Exception {
        StringBuffer sb = new StringBuffer();
       // sb.append("<maps>");
        
       // sb.append("<map>");
        sb.append("<id>1</id>");
        sb.append("<name>Map 1</name>");
        sb.append("</map>");
        sb.append("<map>");
        sb.append("<id>2</id>");
        sb.append("<name>Map 2</name>");
        sb.append("</map>");
        sb.append("</maps>");

        return sb;
    }
}
