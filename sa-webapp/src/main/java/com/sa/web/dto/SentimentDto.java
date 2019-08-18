package com.sa.web.dto;

public class SentimentDto {

    private String sentence;
    private String spanishTranslation;
    private float polarity;

    public SentimentDto() {
    }

    public SentimentDto(String sentence,String spanishTranslation, float polarity) {
        this.sentence = sentence;
        this.polarity = polarity;
        this.spanishTranslation = spanishTranslation;
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }

    public String getSpanishTranslation() {
        return spanishTranslation;
    }

    public void setSpanishTranslation(String spanishTranslation) {
        this.spanishTranslation = spanishTranslation;
    }

    public float getPolarity() {
        return polarity;
    }

    public void setPolarity(float polarity) {
        this.polarity = polarity;
    }

    @Override
    public String toString() {
        return "SentimentDto{" +
                "sentence='" + sentence + '\'' +
                "spanishTranslation='" + spanishTranslation + '\'' +
                ", polarity=" + polarity +
                '}';
    }
}
