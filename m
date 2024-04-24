Return-Path: <jailhouse-dev+bncBCMZLOEWZYNBBTFJUOYQMGQEAZ7XOYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0158B064D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Apr 2024 11:45:50 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-de45daf49desf14363056276.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Apr 2024 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713951949; x=1714556749; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODURQpcf5mZPZmlyVscGo3SS0K0sK6FUUP0n9EUjEQk=;
        b=i+qW0NjAS68+tgNvtGNUtS593VlsRHYm+1F1x4P2nCGwheu6jbCGVXWgRPVez/sZTo
         AI2Nn6iH/+Xd4TvgjqLUufX93U0PpBHzW67LZrvX0KYC/JKoLuPWIBELkpXJbau8Ua7R
         Pu+l0sIDS+bIqQiulwarh3rO7jRjNb4odVVjpSPz40hBRoORe1Re7zJ3HoRSOG1hdicm
         aOTHOc5/df2+AI3u0oonJxLueE7BOpp9XTZfnHzC7xtvEMDSn3G1xyxS7iTFDvdGNoLK
         9W5bNcm4PMb+N0HEs8sDZs3ceGhPOjiQHyWiprqptUiOxcMeBOgyEZQgQDqMcpK0i1Ga
         gMNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713951949; x=1714556749; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODURQpcf5mZPZmlyVscGo3SS0K0sK6FUUP0n9EUjEQk=;
        b=bJgS4gmsn8S5L8KON8RqFmR9aqMBq9Cw8WEAEFwBSMlfKDJ0ndQOj3Wg0n1grK56Zx
         i3pwdOYey2v8DBXa4QplBPlGjkyE0LT3F0wjSqxSzHbdR/6mkoOu+IpzPEX9BWj8vRH+
         W6MuEVmobjRZEL3m5Ei2Mn2RwNarrJjUZXNTdIYJ7lSGcjNTrOdwZDjVL7VMiTMfkz3w
         T6e6K8GoG9Q2ez+U7tYXF0hpA8vCEnz471guvFxvMpm0+ppSscC87in/PqZqXFkKcVm2
         tNgi1LEehy9u8G3eD63v/NTWiZVJ3eCPYbJ6mOILbMx46fOXAe4CxWo6ZtHkc9OaPrbV
         9Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713951949; x=1714556749;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODURQpcf5mZPZmlyVscGo3SS0K0sK6FUUP0n9EUjEQk=;
        b=sdoK5OkJhy++5ZizsyQPJYNDSzDTwjmpWpqPPWivtTWEwuvg+b4g/HBUuFSB0cNmqm
         OxNnjkO7BC3xiiihBUtZjqTHdjrEuX1RYsZorf9727fP35oHGzkjL8JPxAe7k75LOmby
         9m8R4XUqHbOIXfO252EEvLCqPAfQQnSh3dv3lueQU7ScBbKRp57whwjSsXsk1dBvDK+m
         PAIk66vp67d6uteWNJZVpE1TsE1Tpq9FBF+Q0oeakGzbIN/+9tKcnTzT1H4EJXntSKOA
         q4gcbbOA0nVd0J8HfnBhUKM8Em2c8mHTTRjB5GXw6Qzx81WD4xgRd20OBvhTHdEvHQkI
         rq+Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXx1/ixWMbR+cNe9ItbpOakEzIuybiA7L4mgoMhcNFSnaUl1eo6EWW87CofZMExkATLJGlIr0SDSutNBkqwFYo2ALqvSX63NoTRkUg=
X-Gm-Message-State: AOJu0YyQQVKMRvV5YXf3MBYeRmOVTWjsqbCAXXPJjCzdNqBNh8GfbS+5
	Lf+DVZvibqzrCvX8zrXh/EbrO89ybDGsXMdeCW8rmX6xo/DGL/8c
X-Google-Smtp-Source: AGHT+IHvGrDCIyDqJD4j/Vbiiq2zK2eKKPxpTMkdlVlKxdH4laasmgOUcQ4xA+7QjI3SqLfvMbQRyg==
X-Received: by 2002:a25:6b0e:0:b0:de5:51dd:87da with SMTP id g14-20020a256b0e000000b00de551dd87damr2284095ybc.32.1713951949333;
        Wed, 24 Apr 2024 02:45:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:2b0f:b0:de5:520c:21bc with SMTP id
 3f1490d57ef6-de5520c267els2059644276.0.-pod-prod-08-us; Wed, 24 Apr 2024
 02:45:47 -0700 (PDT)
X-Received: by 2002:a05:6902:2d05:b0:dd9:1db5:8348 with SMTP id fo5-20020a0569022d0500b00dd91db58348mr653725ybb.8.1713951947535;
        Wed, 24 Apr 2024 02:45:47 -0700 (PDT)
Date: Wed, 24 Apr 2024 02:45:46 -0700 (PDT)
From: Syed Aftab Rashid <saftab.rashid@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1e39fb3a-f017-480d-aef7-2522a4735df0n@googlegroups.com>
Subject: Direct Interrupt Injection for x86
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_37792_1390426206.1713951946779"
X-Original-Sender: saftab.rashid@gmail.com
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

------=_Part_37792_1390426206.1713951946779
Content-Type: multipart/alternative; 
	boundary="----=_Part_37793_1823108255.1713951946780"

------=_Part_37793_1823108255.1713951946780
Content-Type: text/plain; charset="UTF-8"

Hi all, 

I am working on a project to analyze Jailhouse performance on x86 
platforms. I have managed to set it up on an x86 machine and I am able to 
run the basic APIC demo that comes with Jailhouse. 

I wanted to know if Jailhouse also supports something like Direct Interrupt 
Injection for x86 platforms? or is it something specific to ARM 
architecture only? 

Thanks in advance for the response. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e39fb3a-f017-480d-aef7-2522a4735df0n%40googlegroups.com.

------=_Part_37793_1823108255.1713951946780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,=C2=A0<div><br /></div><div>I am working on a project to analyze Jai=
lhouse performance on x86 platforms. I have managed to set it up on an x86 =
machine and I am able to run the basic APIC demo that comes with Jailhouse.=
=C2=A0</div><div><br /></div><div>I wanted to know if Jailhouse also suppor=
ts something like Direct Interrupt Injection for x86 platforms? or is it so=
mething specific to ARM architecture only?=C2=A0</div><div><br /></div><div=
>Thanks in advance for the response.=C2=A0</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1e39fb3a-f017-480d-aef7-2522a4735df0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1e39fb3a-f017-480d-aef7-2522a4735df0n%40googlegroups.co=
m</a>.<br />

------=_Part_37793_1823108255.1713951946780--

------=_Part_37792_1390426206.1713951946779--
