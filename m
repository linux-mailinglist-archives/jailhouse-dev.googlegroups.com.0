Return-Path: <jailhouse-dev+bncBDSKHYNC6UGBB4XX72YAMGQEUQGUVSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2A8A82D6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 14:09:25 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-61ae9ff0322sf40534237b3.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713355763; x=1713960563; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akaRs9EkWeh3dRloKJMcOgtDYJ0qLniRBDftnn8vY4g=;
        b=AxC9lL2NePvfwtHNA2sJqMJ4KJdeb1vCfEg6NfzlT13joVgOW7FJl3DwpIA2QBkZGs
         40T7PaOPmN4UMxoGIesIEo+cfkvvxmJtyRfAWUNLyHowuZLmXFzX2FnteKKDzvIMpvDr
         xCAFLixZVMgHnw87zfAbNgAsCxkgEXyzHic6Sxj2OR0ZECBbJXr9+YVsf1SBTmjc7KLM
         0BoAQFs1QfHZE4hXQl4cGjbf6uTD2tDFXjcUKpEn8u2afErFdf0FEFM78aa3zvUBV7nA
         PfyA8Lge/ucB+hSGbo62xcp8ClM5kYM4WyP74EsAH7MAxThBNY4AbIjROGlR54pC7iXG
         7D1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355763; x=1713960563; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akaRs9EkWeh3dRloKJMcOgtDYJ0qLniRBDftnn8vY4g=;
        b=dV1kuH5yKfd6AdXkClQckPHP1jaUPOTXoZBShL0/f0fiP95phZgavzPMPX5EEB/z9H
         //Fbz5krKE3T63NJFW5z7dnAKuPh+S9tdN2p0LGJBLww8I16TjIdRcOEcnAlOMi6rFa6
         YQeg8TgvODFSEajv8QOW9aTnDGBtqrL42ANnnKxwMmu9gHtQJCEth6O5n40Y/R6IMJAh
         vtOgweBkpUFMNPjGUKHUk9oo8WWgy0afCT+PhwWiJWnm/BbK0MVR/0svd37bRtJrnYHQ
         q+W3i3CEVzsZjU3E37i1iOC7nuI935nDb/MlfeQxy51yY/K5EFgiGeOPykar8D1qUNFp
         3X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355763; x=1713960563;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akaRs9EkWeh3dRloKJMcOgtDYJ0qLniRBDftnn8vY4g=;
        b=MOMk00OAJcbv94WX9rssMSLCLpgAXk+Mjev+aTjMsAS0EnMmx3sD9VrfSTjQOcXotR
         sJYjKu0azLtXP2t4B+HGj0SSkwuOQjP57pqXvhzexgxZ57Kng16sfW97HzHsn5CbaQPf
         eV0ipD4fdz0lVhU8LtlOVYmyWqcpjhayOe8V4FdAl8u0nC4qIYIfWjweCRqb/CyW4FqU
         oAkEZdo2Jg6STcxSCN7J2Ce/q/Gsec4XuBjKpNEUtGrhIzX9hbZzKXuk0TCsdyB2UavW
         gyEC0Qf0xAoEsVlnbofpnOzw6Z4fKm23l343GE0tA1+zZlE3OuaNVCJUMyX7ybYXFMOI
         u6zw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUofMs69xcpJKPZI6WfAKYS/IccVQdWlurW3EUyUINcBgdL556DPNYS6gtQorMsxN1HP0p0cIWetZ4YLvmIzf4YCjEgC5hiSFWL0qw=
X-Gm-Message-State: AOJu0Yxv8UgR/yStHXawQFjaoXD4rOEI8J3sTgGmdafpGVcLhpXQcwva
	4lO8kylfsWowK8ajD6H0kB5tPOOE0m69m4FSbLUbOFItJSOLIz3m
X-Google-Smtp-Source: AGHT+IE9b8I4HN6TMtjLN2hU7VcumSl1IRhzoHzb3MFEbXwczWf+Fnf9/Jh7U00QQ/CYIQcw13EOig==
X-Received: by 2002:a25:2d07:0:b0:dcc:ae3:d8a0 with SMTP id t7-20020a252d07000000b00dcc0ae3d8a0mr18164612ybt.48.1713355762957;
        Wed, 17 Apr 2024 05:09:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d8d0:0:b0:dc7:4417:ec4e with SMTP id p199-20020a25d8d0000000b00dc74417ec4els6530479ybg.1.-pod-prod-04-us;
 Wed, 17 Apr 2024 05:09:21 -0700 (PDT)
X-Received: by 2002:a05:6902:114c:b0:dcc:8be2:7cb0 with SMTP id p12-20020a056902114c00b00dcc8be27cb0mr1828253ybu.0.1713355761000;
        Wed, 17 Apr 2024 05:09:21 -0700 (PDT)
Date: Wed, 17 Apr 2024 05:09:20 -0700 (PDT)
From: Jamel Ihbrahim <legit.prodoc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7cfb1783-9aa6-45c8-95e5-d62d9b95e413n@googlegroups.com>
Subject: k2 spray / Sheets Order now.  Telegram: @Street_key  Whatsapp: +1
 (662) 626-1163
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_140238_255682917.1713355760457"
X-Original-Sender: legit.prodoc@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_140238_255682917.1713355760457
Content-Type: multipart/alternative; 
	boundary="----=_Part_140239_1419348844.1713355760457"

------=_Part_140239_1419348844.1713355760457
Content-Type: text/plain; charset="UTF-8"

Very strong quality K2 liquid to be infused on A4sheets .
Order now K2 liquid wholesale and retail  
Very affordable prices
WhatsApp: +1 (662) 626-1163
K2 Spray and Sheets available.
Each A4 sheet is infused with 25 ml=0.845351 fluid oz of liquid K2. You can 
buy the infused A4 plain paper and write a letter to send to your buddy in 
prison. This paper is odorless and colorless. 
Telegram : @Street_key

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7cfb1783-9aa6-45c8-95e5-d62d9b95e413n%40googlegroups.com.

------=_Part_140239_1419348844.1713355760457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Very strong quality K2 liquid to be infused on A4sheets .<br />Order now K2=
 liquid wholesale and retail=C2=A0 <br />Very affordable prices<br />WhatsA=
pp: +1 (662) 626-1163<br />K2 Spray and Sheets available.<br />Each A4 shee=
t is infused with 25 ml=3D0.845351 fluid oz of liquid K2. You can buy the i=
nfused A4 plain paper and write a letter to send to your buddy in prison. T=
his paper is odorless and colorless. <br />Telegram : @Street_key<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7cfb1783-9aa6-45c8-95e5-d62d9b95e413n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7cfb1783-9aa6-45c8-95e5-d62d9b95e413n%40googlegroups.co=
m</a>.<br />

------=_Part_140239_1419348844.1713355760457--

------=_Part_140238_255682917.1713355760457--
