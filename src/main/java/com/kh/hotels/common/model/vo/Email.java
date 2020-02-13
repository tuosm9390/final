package com.kh.hotels.common.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Email extends Authenticator{

   @Override
   protected PasswordAuthentication getPasswordAuthentication() {

      return new PasswordAuthentication("tuosm123@gmail.com", "rlatkdcks1!");
   }
}