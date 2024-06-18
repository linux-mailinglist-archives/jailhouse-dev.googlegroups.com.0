Return-Path: <jailhouse-dev+bncBC6PHVWAREERBFUPYWZQMGQEVCXXQHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id F387890C4F9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2024 10:38:48 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfefc2c8569sf10760365276.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2024 01:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718699928; x=1719304728; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hFSuz1lUxxcFHLoDctGmR3Bwfu+kNXOc7+yMn1Ej+U=;
        b=rzOh6qN2nyuPzMQFMhuI0tNnxlEcJicrSCYmSJSeIIelT6hsEYqvemvQVhfyU+UtnW
         Xobc9vDR1s55uGeUVtMTv/ytfkG6JICFrzH1RFXxm/sPgTtR8kLAR2u4NUQhxUJSn9Th
         +tQZwI1/H5LGZ0mtzI728tHU72ltIfrGm+cSMvl8vL8MLWbgpHI2lxBNd1gk1lelitRe
         lqiLgi25bhhwbbXGt3iehFc+IHIshLBxSJ+Ft9igS4/exqBjcocB7mE26MnZpqmyp+vD
         X/qDujM7OnWyEEYWsTw0z3tFNz1YZKEkQ2nlKX1vjrYNaSLBXU6JYA7sSJ98K7HlgRK6
         1EJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699928; x=1719304728; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hFSuz1lUxxcFHLoDctGmR3Bwfu+kNXOc7+yMn1Ej+U=;
        b=QnMYHSlLyOmdYyPec1OP8jxbCUoMJJ+O7ZAbpCKTDNU/R4/BvLn0uWdb2uCV7JYG1v
         KCsYnfA2oxFhxdNN8od6bWhJxK0q6WQTNQPmGrRtsrMk5q8jJ5stnChXGJxLmlyn9JDV
         DdxWFHI35ns2yqR3OFUnA46PKPbUTzavfv4w8oegXWIHbwI6bGsMAkdFbeUWAbBDebZg
         xd894NXCmAqumzmjrldw4y1p1CsVKznxbmmydVQtDZpymo6L2/bkWV7AnIL/9A+Il+JV
         fh9SDXKEDKXp2faQhIqPHr8LqctwO1QGB9m1VYVXJzwiyf5isvRIwjvwaUvyWrFeoo4P
         vPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699928; x=1719304728;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hFSuz1lUxxcFHLoDctGmR3Bwfu+kNXOc7+yMn1Ej+U=;
        b=lBOGWh3JwP/ytKgjAOigkNvm5dp82hy4BVkoCDgiMw5DAUkZvIk3dN2Fz7oRXYwu8q
         FXsRqNdeTvdgGCEioB859R+7TjbBWNszM8b62HjoF+0BQMJcwYDITkK9G/yEfVYJDY4u
         j85xTrwdYEUXM1N9+mEd/tPuouzi7y+JosvN1a2HhRA3TLvemq+edUoVpwR9CTeDX0j2
         0xkeOXUlx+Iy1G8Svz2IzjENErVe7TnP57VP0eHEiPgxdkjSQiv4JW4JblgnnF6YV/sV
         CkRPMcqyyzPcEA0FDd7M+IWv4vaXf0wplPzfo8oXhu0rk6aKkMIigKiLoZN5R+sK8Bjx
         heFQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVlYJmJVBPYk0A9npc22KL7v5heiUp3IEV+KolaS+0ElnXi5VFRCD1YF0PgOlNaONqn7tn2sg8HA4f9fReaETbzSuVUvBpnHHkjGD8=
X-Gm-Message-State: AOJu0YxIC8ha5rozwiXmkl8OD5GXjDLbD29krofXS5C5mw0kndw6P1qL
	dgtqpOwE+tLgDzm0/xxQT1G1sYOraYcPjheWI+tn5iuakRQiIHOC
X-Google-Smtp-Source: AGHT+IFVrs7GPNQIVK14LPVfxfU3XH5eJjH6hH/RO7yJ27a9BBNBaInvJLj68XfvgCe/ZQTYc/XOOA==
X-Received: by 2002:a25:b314:0:b0:dfc:e373:5402 with SMTP id 3f1490d57ef6-dff154ce45amr12241419276.57.1718699927636;
        Tue, 18 Jun 2024 01:38:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1505:b0:dff:7a3:b0d with SMTP id
 3f1490d57ef6-dff07a311bfls7018088276.0.-pod-prod-07-us; Tue, 18 Jun 2024
 01:38:46 -0700 (PDT)
X-Received: by 2002:a05:6902:2b92:b0:dfa:849d:3a59 with SMTP id 3f1490d57ef6-dff1552ecd2mr3527836276.13.1718699925999;
        Tue, 18 Jun 2024 01:38:45 -0700 (PDT)
Date: Tue, 18 Jun 2024 01:38:45 -0700 (PDT)
From: ecstasyclinic pharmacy <ecstasyclinicpharmacy@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b350f415-b969-4f88-afb5-7d47f77b6d20n@googlegroups.com>
Subject: Ephedrine for sale
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_78815_1172368832.1718699925021"
X-Original-Sender: ecstasyclinicpharmacy@gmail.com
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

------=_Part_78815_1172368832.1718699925021
Content-Type: multipart/alternative; 
	boundary="----=_Part_78816_135091036.1718699925021"

------=_Part_78816_135091036.1718699925021
Content-Type: text/plain; charset="UTF-8"

Your best online shop to get platinum quality products online, pain, 
anxiety pills, and research chemicals.
Be 100% assured about the quality and genuineness of the product, and you 
will also be able to buy legal hallucinogens at a fair price.

ORDER DIRECTLY ON OUR Telegram
message @Clackderby1

Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv

Buy champagne mdma,ketamine for sale,order crystal meth online,Roxicodone 
for sale,buy vicodin online,order OxyContin online,mantrax for 
sale,tramadol for sale,buy xanax online,pregabalin for sale,buy 
morphine,order amphetamine online,viagra for sale,retaline for sale,buy 
vyvanse online,ephedrine for sale, lsd for sale online ,cocaine for 
sale,dmt for sale ,ecstasy pills for sale online .

Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv

-100% Discreet and Confidential ,
-Your personal details are 100% SECURE.,
-Your orders are 100% Secure and Anonymous.,
-Fast Worldwide Delivery (You can track and trace with your tracking number 
provided).

 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b350f415-b969-4f88-afb5-7d47f77b6d20n%40googlegroups.com.

------=_Part_78816_135091036.1718699925021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your best online shop to get platinum quality products online, pain, anxiet=
y pills, and research chemicals.<br />Be 100% assured about the quality and=
 genuineness of the product, and you will also be able to buy legal halluci=
nogens at a fair price.<br /><br />ORDER DIRECTLY ON OUR Telegram<br />mess=
age @Clackderby1<br /><br />Telegram : https://t.me/ukverifiedv<br />Telegr=
am : https://t.me/ukverifiedv<br />Telegram : https://t.me/ukverifiedv<br /=
>Telegram : https://t.me/ukverifiedv<br /><br />Buy champagne mdma,ketamine=
 for sale,order crystal meth online,Roxicodone for sale,buy vicodin online,=
order OxyContin online,mantrax for sale,tramadol for sale,buy xanax online,=
pregabalin for sale,buy morphine,order amphetamine online,viagra for sale,r=
etaline for sale,buy vyvanse online,ephedrine for sale, lsd for sale online=
 ,cocaine for sale,dmt for sale ,ecstasy pills for sale online .<br /><br /=
>Telegram : https://t.me/ukverifiedv<br />Telegram : https://t.me/ukverifie=
dv<br />Telegram : https://t.me/ukverifiedv<br />Telegram : https://t.me/uk=
verifiedv<br /><br />-100% Discreet and Confidential ,<br />-Your personal =
details are 100% SECURE.,<br />-Your orders are 100% Secure and Anonymous.,=
<br />-Fast Worldwide Delivery (You can track and trace with your tracking =
number provided).<br /><br />=C2=A0

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b350f415-b969-4f88-afb5-7d47f77b6d20n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b350f415-b969-4f88-afb5-7d47f77b6d20n%40googlegroups.co=
m</a>.<br />

------=_Part_78816_135091036.1718699925021--

------=_Part_78815_1172368832.1718699925021--
