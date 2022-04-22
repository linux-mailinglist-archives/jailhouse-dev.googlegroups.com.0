Return-Path: <jailhouse-dev+bncBDC7NWPLREORBYMBRGJQMGQEURXIEDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616350AFB2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Apr 2022 07:45:06 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id m10-20020adfc58a000000b0020ac7ba78b8sf155608wrg.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Apr 2022 22:45:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1650606306; cv=pass;
        d=google.com; s=arc-20160816;
        b=v7rME3WZtDskJW0BJqOgyk9jibXdjxo0gpgM8EXfgGVgYihMzMfeq3PeCqgATcg7aK
         +EDh+kF/TUNj5gL5Uaa+6oHkZfxhkSJVV3sDxVgtjbfk281rgkox1VM9u54gzfPV8zFi
         o9mtqoYA9PFD9q7j8/RTq2Mgos2TlJH/p8NLTGLMRyqkvDM1eHWGH1BR3OWno0Dpt7jZ
         9cTeqwE0VRGh19sQrG7zjfX9yd4lERtPwmLzgLS4pDyU1PABRG83kCya7XjgJdpkyuIJ
         9YUM7EN0lAyZS7u0ubz26PcjSUIRuQQYdLIniFXInuJhJdg6EzxDFrALIZKyOBUHv8E4
         IkHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:subject:message-id:date:from
         :list-unsubscribe:list-unsubscribe-post:mime-version:sender
         :dkim-signature;
        bh=KI5mt7YkkuRqtX4K+p0OSn02w29ipPobVh4TGb86ZLM=;
        b=BfMHrTCw/JzW+k/I+FD31kel4ICIABhLjTPoInhkyciJip/P8fJ7ca55XkdZsCU3o4
         FMHdSY0yWGulq1YAwxFtiQRjaARLHfs8/NqqI5bsNLsIWLT1b7cXxCzLQwhTQRjw6ubY
         mB8B/HbOXmuws0wx9EcjZCSRuE8yJ2YzJ6XS0XBkhUpU/aC8W+JlNE8iy4Q16EX++Ut4
         jUSBlpmc+hy1kabX1iI21lM06t86WLGFmA5UR+1l6K/9vQ6rQl+SjN9YftPARyhmX8Dy
         6GtB/GUYgxZ0LhovuEgHbcd/6AL9INKPnY7O4J0cH75RrcMMBJb9wFnyDHpE2DLWPf7j
         bahQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112 header.b=UScwtEGB;
       spf=neutral (google.com: 2a00:1450:4864:20::136 is neither permitted nor denied by best guess record for domain of conf5@rtu.ac.in) smtp.mailfrom=conf5@rtu.ac.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:list-unsubscribe-post:list-unsubscribe:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=KI5mt7YkkuRqtX4K+p0OSn02w29ipPobVh4TGb86ZLM=;
        b=Ir/pBJw7dvpAN6EbclavKJqXE+7VcSnGM4X1Lma9fY/480DbrTOPjw0pYdvc38Yo6I
         eDDV20YAZJACsKGq/Fni2dAT2HNgihFzsC2j73XygimVbKxFSCMq5QjZRoTRA/ZTuZeH
         4rai5AHwt/DKwhjGRUnRQ5RWtd5fpV614fDgVg6BtvVad9dusTkRXyvgd2aSz+6Uh3no
         Fn6UewwYFjkCX5DelNVJWqyUW4S2NLhVkOL1u8roz9dTsjaIEZVjv5Paz6Q7F4eRHQBN
         Yuqrb0Qx39mr64q9iEZYtsmt2Yg8Oz7Vg4og6ZT0ahQt9FWOxZZ6Tmvu618Wy5QFJ0Xr
         ViMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:list-unsubscribe-post
         :list-unsubscribe:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=KI5mt7YkkuRqtX4K+p0OSn02w29ipPobVh4TGb86ZLM=;
        b=3W1GTNspAvfAxrKZlbjx4TdDjZZTxzFO+4FPyB/M277ik0bdSnJivAwzczLNZOQ4NK
         ViT8/JrvbVJqnoxrIsOlxiLBAVGLOHuf+QTNc0XgjdQcQ3QZ0OYB2qlutOlYc3snA8aL
         Tb0N5EecRMne9xFPx/Ysu7H2eR3ZKegtxo3F10odICFPoYrZ8CDLVJtUfnNm2/6yNRRA
         Iqe7vYVAitPO5Avx0IZP0vZR29bRU4pATRXEDUl1z3PgLbFdLdU1Msq5OlCPpBcBLLR2
         r5ZaTdJAn0Ij/ruHxantQb9jVBirJzDb9YqiNVD+50KFEB47VdDOLRt9DriT/QfyznKc
         ayWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328fqRzsJByqhxTl1bGUDmdJ6WyOFZNmnxDPIv9gDmIjVc1jvVo
	uY5kHLz5Navk2HkUYSHoESQ=
X-Google-Smtp-Source: ABdhPJzip313xo+l5HWSXsko1sTd5UzHIpHdGQpniux8DcmHlo7bST3eQqd2FTRqKbaQPg72hp5/UA==
X-Received: by 2002:a5d:5983:0:b0:20a:8801:597b with SMTP id n3-20020a5d5983000000b0020a8801597bmr2248262wri.287.1650606306205;
        Thu, 21 Apr 2022 22:45:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:47a7:0:b0:20a:a30e:f9ec with SMTP id 7-20020a5d47a7000000b0020aa30ef9ecls9259495wrb.3.gmail;
 Thu, 21 Apr 2022 22:45:04 -0700 (PDT)
X-Received: by 2002:adf:f6c1:0:b0:20a:c408:4aeb with SMTP id y1-20020adff6c1000000b0020ac4084aebmr2208098wrp.74.1650606304714;
        Thu, 21 Apr 2022 22:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650606304; cv=none;
        d=google.com; s=arc-20160816;
        b=ic+5MPE17cN+ww4AqVeeT8MqZ1PKcgSZEQ0fyCNamWtLAQv6UPA5L+h73WuoqUlI8I
         pXhzwknd3zEV0PTY13+6wKUdNULATVJ5K8T9IoO2xBa149UFZgK6iuXydO+Z9muGBF32
         foOeef2L07dvEqRUMVSaZdqN+kc/bQQtaOzF6v1WLvPtKJ0jT5WMH9WMmy4Njz92Vjos
         PWQD+Bzy50KkkOVehgmhY/3RqagQ7Z4TBUNDPPlCF8yFE04px0nsJAwmQlZhh2fKFxT9
         8U9zScZ4JCv6LfbeKlrazBuWO7mICaRcaa6QRtSdAwtYZCzfvfABkakG1QW8+sp9oHgK
         Mf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:list-unsubscribe
         :list-unsubscribe-post:mime-version:dkim-signature;
        bh=Dtw6+ycx+X5v4esu7kYBYXMKcKqfl2bz+zwI41KHlXc=;
        b=T6ei060dn9fd1dwy1O5RCdxrGqWQ+A28Xwd7oBj7rUBa77cio3gGZgZnZflaMEIk/K
         tXutSojsF7U5b1r+SgdCigbgcDYR5QxnGVy9khL4QRUvLF1y7ql2mtl/I2373zpzGlhu
         StTDIcQgkFGG/I6n96SQQtog4a7kmEONlES3lpBQtcIgW6ksUvlCjjn5VXU5eVDaU590
         7mf/4oLleajAdjAAubhuiWcYNRb99xdvET5I2QuNTUUcD1IjJVALwUr5AL9gbAKBO1QD
         SzaxwkvWB5sZZgg17kgr1VvvmtQZByeibxIP0om0vw+Y3oNSm59GGhPjJ3eUYc4UcyXQ
         oWNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112 header.b=UScwtEGB;
       spf=neutral (google.com: 2a00:1450:4864:20::136 is neither permitted nor denied by best guess record for domain of conf5@rtu.ac.in) smtp.mailfrom=conf5@rtu.ac.in
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com. [2a00:1450:4864:20::136])
        by gmr-mx.google.com with ESMTPS id d23-20020a1c7317000000b0038ebc691b17si266436wmb.2.2022.04.21.22.45.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 22:45:04 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::136 is neither permitted nor denied by best guess record for domain of conf5@rtu.ac.in) client-ip=2a00:1450:4864:20::136;
Received: by mail-lf1-x136.google.com with SMTP id p12so6834690lfs.5
        for <jailhouse-dev@googlegroups.com>; Thu, 21 Apr 2022 22:45:04 -0700 (PDT)
X-Received: by 2002:ac2:4c4a:0:b0:471:cb8a:8c97 with SMTP id
 o10-20020ac24c4a000000b00471cb8a8c97mr1938983lfk.678.1650606304210; Thu, 21
 Apr 2022 22:45:04 -0700 (PDT)
Received: from 1008170693301 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 05:45:03 +0000
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
From: General Chair PCCDS 2022 <conf5@rtu.ac.in>
Date: Fri, 22 Apr 2022 05:45:03 +0000
Message-ID: <CAN2ndJCDwpfM=Gsmuw6iyGOs8sz_E=fysAXLc0yjb_ZUeriVfw@mail.gmail.com>
Subject: Call For Papers: PCCDS 2022 | Springer conference | MNIT Jaipur
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000006d46c705dd37ba10"
X-Original-Sender: conf5@rtu.ac.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112
 header.b=UScwtEGB;       spf=neutral (google.com: 2a00:1450:4864:20::136 is
 neither permitted nor denied by best guess record for domain of
 conf5@rtu.ac.in) smtp.mailfrom=conf5@rtu.ac.in
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--0000000000006d46c705dd37ba10
Content-Type: text/plain; charset="UTF-8"

Dear Professor,


Greetings from Malaviya National Institute of Technology Jaipur and Soft
Computing Research Society!


We are pleased to share that Malaviya National Institute of Technology
Jaipur, India, is organizing the 3rd International Conference on Paradigms
of Communication, Computing and Data Sciences (PCCDS 2022) in association
with the Soft Computing Research Society (SCRS) New Delhi. The conference
will be organized in Virtual Format during July 05-07, 2022. The
after-conference proceedings of the PCCDS 2022 will be published in the
Springer Book Series' *Algorithms for Intelligent Systems*'. All books
published in the series "Algorithms for Intelligent Systems" are submitted
for consideration in the Web of Science. For more details, please visit the
conference website: PCCDS2022
<https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccxXL9xQfF9gDFCp0?url=https%3A%2F%2Fwww.pccds22.scrs.in%2F&key=f45813a42ce34bbe2bec40fde2bed47255101e2a>


The topics covered (but are not limited to) at the conference are as
follows:

1. Soft Computing & Artificial Intelligence

2. Data Science

3. Signal & Image Processing

4. Communication


Submission Deadline: April 30, 2022

Submission Link: https://easychair.org/conferences/?conf=pccds2022
<https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccxXL9xQfF9gDFCp0?url=https%3A%2F%2Feasychair.org%2Fconferences%2F%3Fconf%3Dpccds2022&key=a42ce76be91228fc8daf5529eec981b4814714e1>

------------------------------------------------------------
--------------------------------------

CONTACT US: pccds.scrs@gmail.com


Thanks & Regards
Team PCCDS 2022

To leave this group and stop getting email from it, Click here
<https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccxXL9xQfF9gDFCp0/unsubscribe?hash=NDlhZGQ2MmY1NGRmMTEwZmM3OWE1MDMxZDBkMTllZmVhMzc2ZTYwYjpqYWlsaG91c2UtZGV2QGdvb2dsZWdyb3Vwcy5jb20=&>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAN2ndJCDwpfM%3DGsmuw6iyGOs8sz_E%3DfysAXLc0yjb_ZUeriVfw%40mail.gmail.com.

--0000000000006d46c705dd37ba10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<p style=3D"color:rgb(34,34,34);background-color:rgb(255,255,255);margin:0c=
m;text-align:justify;line-height:16.8667px;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial"><span style=3D"line-height:1=
5.3333px"><font face=3D"arial, sans-serif">Dear Professor,</font></span></p=
><p style=3D"color:rgb(34,34,34);background-color:rgb(255,255,255);margin:0=
cm;text-align:justify;line-height:16.8667px;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial"><span style=3D"line-height:=
15.3333px"><font face=3D"arial, sans-serif"><br></font></span></p><p style=
=3D"background-color:rgb(255,255,255);background-image:initial;background-p=
osition:initial;background-size:initial;background-repeat:initial;backgroun=
d-origin:initial;background-clip:initial;color:rgb(14,16,26);margin-top:0pt=
;margin-bottom:0pt"><span style=3D"background-image:initial;background-posi=
tion:initial;background-size:initial;background-repeat:initial;background-o=
rigin:initial;background-clip:initial;margin-top:0pt;margin-bottom:0pt">Gre=
etings from=C2=A0</span>Malaviya National Institute of Technology Jaipur an=
d=C2=A0Soft Computing Research Society!</p><p style=3D"background-color:rgb=
(255,255,255);background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial;color:rgb(14,16,26);margin-top:0pt;margin-bottom:0pt"><br>=
</p><p style=3D"background-color:rgb(255,255,255);background-image:initial;=
background-position:initial;background-size:initial;background-repeat:initi=
al;background-origin:initial;background-clip:initial;color:rgb(14,16,26);ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"background-image:initial;bac=
kground-position:initial;background-size:initial;background-repeat:initial;=
background-origin:initial;background-clip:initial;margin-top:0pt;margin-bot=
tom:0pt">We are pleased to share that Malaviya National Institute of Techno=
logy Jaipur, India, is organizing the 3rd International Conference on Parad=
igms of Communication, Computing and Data Sciences (PCCDS 2022) in associat=
ion with the Soft Computing Research Society (SCRS) New Delhi. The conferen=
ce will be organized in Virtual Format during July 05-07, 2022. The after-c=
onference proceedings of the PCCDS 2022 will be published in the Springer B=
ook Series&#39;=C2=A0</span><strong style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin-top:0pt;margin-botto=
m:0pt">Algorithms for Intelligent Systems</strong><span style=3D"background=
-image:initial;background-position:initial;background-size:initial;backgrou=
nd-repeat:initial;background-origin:initial;background-clip:initial;margin-=
top:0pt;margin-bottom:0pt">&#39;. All books published in the series &quot;A=
lgorithms for Intelligent Systems&quot; are submitted for consideration in =
the Web of Science. For more details, please visit the conference website:=
=C2=A0<a href=3D"https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccx=
XL9xQfF9gDFCp0?url=3Dhttps%3A%2F%2Fwww.pccds22.scrs.in%2F&amp;key=3Df45813a=
42ce34bbe2bec40fde2bed47255101e2a">PCCDS2022</a></span></p><p style=3D"back=
ground-color:rgb(255,255,255);background-image:initial;background-position:=
initial;background-size:initial;background-repeat:initial;background-origin=
:initial;background-clip:initial;color:rgb(14,16,26);margin-top:0pt;margin-=
bottom:0pt"><br></p><p style=3D"background-color:rgb(255,255,255);backgroun=
d-image:initial;background-position:initial;background-size:initial;backgro=
und-repeat:initial;background-origin:initial;background-clip:initial;color:=
rgb(14,16,26);margin-top:0pt;margin-bottom:0pt"><span style=3D"background-i=
mage:initial;background-position:initial;background-size:initial;background=
-repeat:initial;background-origin:initial;background-clip:initial;margin-to=
p:0pt;margin-bottom:0pt">The topics covered (but are not limited to) at the=
 conference are as follows:</span></p><p style=3D"background-color:rgb(255,=
255,255);background-image:initial;background-position:initial;background-si=
ze:initial;background-repeat:initial;background-origin:initial;background-c=
lip:initial;color:rgb(14,16,26);margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"background-image:initial;background-position:initial;background-size:=
initial;background-repeat:initial;background-origin:initial;background-clip=
:initial;margin-top:0pt;margin-bottom:0pt">1.</span><span style=3D"backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;margi=
n-top:0pt;margin-bottom:0pt">=C2=A0Soft Computing &amp; Artificial Intellig=
ence</span></p><p style=3D"background-color:rgb(255,255,255);background-ima=
ge:initial;background-position:initial;background-size:initial;background-r=
epeat:initial;background-origin:initial;background-clip:initial;color:rgb(1=
4,16,26);margin-top:0pt;margin-bottom:0pt"><span style=3D"background-image:=
initial;background-position:initial;background-size:initial;background-repe=
at:initial;background-origin:initial;background-clip:initial;margin-top:0pt=
;margin-bottom:0pt">2.</span><span style=3D"background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial;margin-top:0pt;margin-bottom=
:0pt">=C2=A0Data Science</span></p><p style=3D"background-color:rgb(255,255=
,255);background-image:initial;background-position:initial;background-size:=
initial;background-repeat:initial;background-origin:initial;background-clip=
:initial;color:rgb(14,16,26);margin-top:0pt;margin-bottom:0pt"><span style=
=3D"background-image:initial;background-position:initial;background-size:in=
itial;background-repeat:initial;background-origin:initial;background-clip:i=
nitial;margin-top:0pt;margin-bottom:0pt">3. Signal &amp; Image Processing=
=C2=A0</span></p><p style=3D"background-color:rgb(255,255,255);background-i=
mage:initial;background-position:initial;background-size:initial;background=
-repeat:initial;background-origin:initial;background-clip:initial;color:rgb=
(14,16,26);margin-top:0pt;margin-bottom:0pt"><span style=3D"background-imag=
e:initial;background-position:initial;background-size:initial;background-re=
peat:initial;background-origin:initial;background-clip:initial;margin-top:0=
pt;margin-bottom:0pt">4. Communication</span></p><p style=3D"background-col=
or:rgb(255,255,255);background-image:initial;background-position:initial;ba=
ckground-size:initial;background-repeat:initial;background-origin:initial;b=
ackground-clip:initial;color:rgb(14,16,26);margin-top:0pt;margin-bottom:0pt=
"><br></p><p style=3D"background-color:rgb(255,255,255);background-image:in=
itial;background-position:initial;background-size:initial;background-repeat=
:initial;background-origin:initial;background-clip:initial;color:rgb(14,16,=
26);margin-top:0pt;margin-bottom:0pt"><span style=3D"background-image:initi=
al;background-position:initial;background-size:initial;background-repeat:in=
itial;background-origin:initial;background-clip:initial;margin-top:0pt;marg=
in-bottom:0pt">Submission Deadline: April 30, 2022</span></p><p style=3D"ba=
ckground-color:rgb(255,255,255);background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;color:rgb(14,16,26);margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"background-image:initial;background-position:i=
nitial;background-size:initial;background-repeat:initial;background-origin:=
initial;background-clip:initial;margin-top:0pt;margin-bottom:0pt">Submissio=
n Link:=C2=A0</span><a href=3D"https://conf5rtuacin-dot-mmanalytics.appspot=
.com/em_PK8ccxXL9xQfF9gDFCp0?url=3Dhttps%3A%2F%2Feasychair.org%2Fconference=
s%2F%3Fconf%3Dpccds2022&amp;key=3Da42ce76be91228fc8daf5529eec981b4814714e1"=
 target=3D"_blank" style=3D"font-family:&quot;Open Sans&quot;;font-size:13p=
x;font-weight:700;text-align:justify;box-sizing:border-box;padding:0px;marg=
in:0px;background-color:transparent;color:rgb(51,122,183);text-decoration-l=
ine:none;outline:none">https://easychair.org/conferences/?conf=3Dpccds2022<=
/a></p><p style=3D"background-color:rgb(255,255,255);background-image:initi=
al;background-position:initial;background-size:initial;background-repeat:in=
itial;background-origin:initial;background-clip:initial;color:rgb(14,16,26)=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"background-image:initial;=
background-position:initial;background-size:initial;background-repeat:initi=
al;background-origin:initial;background-clip:initial;margin-top:0pt;margin-=
bottom:0pt">------------------------------<wbr>----------------------------=
--<wbr>------------------------------<wbr>--------</span></p><p style=3D"ba=
ckground-color:rgb(255,255,255);background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;color:rgb(14,16,26);margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"background-image:initial;background-position:i=
nitial;background-size:initial;background-repeat:initial;background-origin:=
initial;background-clip:initial;margin-top:0pt;margin-bottom:0pt">CONTACT U=
S:=C2=A0<a href=3D"mailto:pccds.scrs@gmail.com">pccds.scrs@gmail.com</a></s=
pan></p><p style=3D"background-color:rgb(255,255,255);background-image:init=
ial;background-position:initial;background-size:initial;background-repeat:i=
nitial;background-origin:initial;background-clip:initial;color:rgb(14,16,26=
);margin-top:0pt;margin-bottom:0pt"><span style=3D"background-image:initial=
;background-position:initial;background-size:initial;background-repeat:init=
ial;background-origin:initial;background-clip:initial;margin-top:0pt;margin=
-bottom:0pt"><br></span></p><div style=3D"color:rgb(34,34,34);background-co=
lor:rgb(255,255,255)"><div dir=3D"ltr"><div dir=3D"ltr"><div>Thanks &amp; R=
egards</div><div>Team=C2=A0PCCDS 2022</div></div></div></div><p style=3D"co=
lor:rgb(34,34,34);background-color:rgb(255,255,255);margin:0cm;text-align:j=
ustify;line-height:16.8667px"><font face=3D"arial, sans-serif"><span style=
=3D"line-height:15.3333px;background-image:initial;background-position:init=
ial;background-size:initial;background-repeat:initial;background-origin:ini=
tial;background-clip:initial"><span style=3D"white-space:pre-wrap">To leave=
 this group and stop getting email from it</span><span style=3D"white-space=
:pre-wrap">, </span></span><span style=3D"white-space:pre-wrap"><a href=3D"=
https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccxXL9xQfF9gDFCp0/un=
subscribe?hash=3DNDlhZGQ2MmY1NGRmMTEwZmM3OWE1MDMxZDBkMTllZmVhMzc2ZTYwYjpqYW=
lsaG91c2UtZGV2QGdvb2dsZWdyb3Vwcy5jb20=3D&amp;">Click here</a></span></font>=
</p><img src=3D"https://conf5rtuacin-dot-mmanalytics.appspot.com/em_PK8ccxX=
L9xQfF9gDFCp0/asteroid.gif" style=3D"display:none !important;">

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAN2ndJCDwpfM%3DGsmuw6iyGOs8sz_E%3DfysAXLc0yjb_ZUe=
riVfw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAN2ndJCDwpfM%3DGsmuw6iyGOs8sz_E%3DfysA=
XLc0yjb_ZUeriVfw%40mail.gmail.com</a>.<br />

--0000000000006d46c705dd37ba10--
