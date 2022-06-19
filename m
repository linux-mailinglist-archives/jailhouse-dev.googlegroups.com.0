Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBTH3XKKQMGQE7GN6EEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8675508D3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jun 2022 08:10:22 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id m7-20020ad45dc7000000b0047042480dbfsf158539qvh.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 18 Jun 2022 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tg6j8ufvRKSRiFklfUyXa+2pXq/a5MDg3dPRk30umLU=;
        b=B/D8flvOe13xOcj+WXip5PMtPwsD4It2hqzm3Xv7Fe7fYUGGaUClLm2w3xITT4N10u
         pNO2ZxsZ2syYOJ7gPkWBuTuDZxPx/Y1mfzCYgz13FDvT9X7lXp+lefM7j2/498P6dW0F
         0VASQYgz0aik+Ip75GSmoHz5+/LTIuyhDcuRrpHOvua4V1XlRX0llTmgIPOR9btsZAvJ
         Eyey+VJZq43JtnWk0RIRfQb+Zjqf6B2IgROMw3tUcYjfowrnwWjTfV+7iebBkY3mS5O1
         9Y+N4E+a137OVh7BvMEVGy9/hWx4lV4H5un6y7kTNctenj/MWcrua0TPyQVuepjn6g5T
         GiHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tg6j8ufvRKSRiFklfUyXa+2pXq/a5MDg3dPRk30umLU=;
        b=i1wYh3SwTvy3vrupZiL/H33LorWcybL9qANmB+Vf2Uy+uxFZBBRORUvtS9rHpaFqs2
         qG28mxplBwsQe+Wv6ccFiI2CST2vt6z67y8FU4hPiSBxziQLXDxWUGgBYuuQGsCE+NIx
         yee7MvFOm+sebF0CKzWElz3XGMjeK6Kyu4RXoCidPf/db+fG2JUTF1A1dExHgmuhqy5D
         MVct/BNzg/4ol05w9kUigUxw1FTnS8cCP4PSjFDfY1tL4N94DDVBjD9vdvr+0Yz3K1wU
         z+ispt+tlkRz71Z32+mNcTQ6mF+hwXE3aFGHpflKdTiW6PE2KSRTEqcGLb8tRecD35cw
         Ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tg6j8ufvRKSRiFklfUyXa+2pXq/a5MDg3dPRk30umLU=;
        b=OPPMpSux5KGvcbe+5h1dEK9WtNznJM8S/JfUJ4wyy5/IEZI+bobViQv6EztdKHalw0
         G/+QT7dsafmAW+G9EW65pIoHGwtiz2+fKLTVWGU9kb50JMQU3+XhhSLQkzD/x0Aa9UP/
         m/32W6Z1iMFqOHCW2rdvjHr14JA9cbfgQUrofUkAVThkRVv2DM3/EkXWpjYeRwNdotUa
         sTCfCDahlLpl6XH4dMt3BunQF2sv7DL1/LItdWaRBbKDL9+cBJJrNvGX03qoY24Tagqe
         LNYt+reQ4ayQPe2c5LSCkUJFctHptt59p2MPsWO658E6UOnste9q4Csz9hCy9xwA6VWG
         xbHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8E9Hmrg4IcbJz4Fet7i5IjFdLjQhATlo/kdf12SLPquzfJCPCG
	U+/8meBAUUjwnFMqim33ZYU=
X-Google-Smtp-Source: AGRyM1sTKhG6oK45EYyNB6SvW8qHjDexwlcBLSE5zEkl+HTV8eqI77jdrTBXKd0ztWftYKX53X83wQ==
X-Received: by 2002:ad4:42ce:0:b0:466:c14d:5713 with SMTP id f14-20020ad442ce000000b00466c14d5713mr14718985qvr.38.1655619020992;
        Sat, 18 Jun 2022 23:10:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:3721:b0:6a7:591f:2ced with SMTP id
 de33-20020a05620a372100b006a7591f2cedls5249925qkb.4.gmail; Sat, 18 Jun 2022
 23:10:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:6a7:2fec:dd74 with SMTP id l5-20020a05620a28c500b006a72fecdd74mr12256170qkp.118.1655619020274;
        Sat, 18 Jun 2022 23:10:20 -0700 (PDT)
Date: Sat, 18 Jun 2022 23:10:19 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7f75df9e-6baf-471e-9170-25b0c3e4bcf4n@googlegroups.com>
Subject: jailhouse img  ---ask for help
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4286_1798391387.1655619019610"
X-Original-Sender: sunxing960116@gmail.com
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

------=_Part_4286_1798391387.1655619019610
Content-Type: multipart/alternative; 
	boundary="----=_Part_4287_561686254.1655619019610"

------=_Part_4287_561686254.1655619019610
Content-Type: text/plain; charset="UTF-8"


I tried a lot of things, but they didn't work  
thanks for your help~


2.6.2: Pulling from siemens/kas/kas-isar
b380bbd43752: Pull complete
d1bed1a2c34e: Pull complete
560c30a1ba9b: Downloading [==>                                             
   ]  8.622MB/181MB
d50a6cc4bf45: Download complete
34feb3868092: Download complete
6815c7d4b9d8: Download complete
3481406e04ed: Download complete
2c8c2fa9ca93: Download complete
7065e04db92d: Download complete
26adc2492566: Downloading 
[==================================================>]  12.65MB/12.65MB
a060224959b1: Download complete
docker: unexpected EOF.
See 'docker run --help'.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7f75df9e-6baf-471e-9170-25b0c3e4bcf4n%40googlegroups.com.

------=_Part_4287_561686254.1655619019610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div><br></div></div>I tried a lot of things, but they didn't wor=
k&nbsp;&nbsp;<br></div><div>thanks for your help~</div><div><br></div><div>=
<br></div>2.6.2: Pulling from siemens/kas/kas-isar<br>b380bbd43752: Pull co=
mplete<br>d1bed1a2c34e: Pull complete<br>560c30a1ba9b: Downloading [=3D=3D&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;] &nbsp;8.622MB/181MB<br>d50a6cc4bf45: Download comple=
te<br>34feb3868092: Download complete<br>6815c7d4b9d8: Download complete<br=
>3481406e04ed: Download complete<br>2c8c2fa9ca93: Download complete<br>7065=
e04db92d: Download complete<br>26adc2492566: Downloading [=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;] &nbsp;12.=
65MB/12.65MB<br>a060224959b1: Download complete<br>docker: unexpected EOF.<=
br>See 'docker run --help'.<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7f75df9e-6baf-471e-9170-25b0c3e4bcf4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7f75df9e-6baf-471e-9170-25b0c3e4bcf4n%40googlegroups.co=
m</a>.<br />

------=_Part_4287_561686254.1655619019610--

------=_Part_4286_1798391387.1655619019610--
