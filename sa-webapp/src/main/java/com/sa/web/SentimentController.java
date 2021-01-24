package com.sa.web;

import com.sa.web.dto.SentenceDto;
import com.sa.web.dto.SentimentDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@CrossOrigin(origins = "*")
@RestController
public class SentimentController {
    //TODO: set CORS properly. what value does this java component add ?

    @Value("${sa.logic.api.url}")
    private String saLogicApiUrl;

    @PostMapping("/sentiment")
    public SentimentDto sentimentAnalysis(@RequestBody SentenceDto sentenceDto) {
        RestTemplate restTemplate = new RestTemplate();
        SentimentDto sentimentDto = null;
        System.out.println("[Mahesh] Passing sentenceDto"+
            sentenceDto
            +" to the saLogicApiUrl :"+saLogicApiUrl);

        sentimentDto = restTemplate.postForEntity(saLogicApiUrl + "/analyse/sentiment",
                sentenceDto, SentimentDto.class)
                .getBody();

        System.out.println("[Mahesh] Returning sentimentDto"+
            sentimentDto
            +" from the saLogicApiUrl :"+saLogicApiUrl);

        return sentimentDto;
    }

    @PostMapping("/translate")
    public SentimentDto translate(@RequestBody SentenceDto sentenceDto) {
        RestTemplate restTemplate = new RestTemplate();
        SentimentDto sentimentDto = null;
        System.out.println("[Mahesh] Passing sentenceDto"+
            sentenceDto
            +" to the saLogicApiUrl :"+saLogicApiUrl);

        sentimentDto = restTemplate.postForEntity(saLogicApiUrl + "/translate",
                sentenceDto, SentimentDto.class)
                .getBody();

        System.out.println("[Mahesh] Returning sentimentDto"+
            sentimentDto
            +" from the saLogicApiUrl :"+saLogicApiUrl);

        return sentimentDto;
    }

    @GetMapping("/testHealth")
    public void testHealth() {
    }
}


