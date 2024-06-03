Return-Path: <jailhouse-dev+bncBC6PHVWAREERBOVF7GZAMGQE67OWLHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470F8FA68C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2024 01:33:16 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df78ea30f83sf6199859276.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 16:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717457595; x=1718062395; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5OxPQH1NzYbNs5YeQBod+clTP91YJB8kCMsI+3opr8=;
        b=YsFNMGUsW1EhyhEy6psWF8dHA/4/rx75USl2XnJjZJ+1xaHzpadMPIDRskqmdJNSuN
         jB1Rn9ALAAwStg1PoOGOVcuKAcpJ9EPQ4iGqXPiR2dYy57acy9nHRDEr6xvZ4QLlgTqY
         wd8pypRL43UpK2Vb/eH389yoQmEW/D5iHDyXlXdY9jRTosJUgPXHvbZULTmQ74EAdQ/U
         xUQWNoT+6KVSCuGAqfr6YAR0KWPN05SoCLmW6RFTw7Qwk+ebBIzU/r5kvvNSu1p9Y+ei
         i1AVK91uwUiMMA1tQJYtG6ej2IYddvFiF2URMBz0Y2vFcfO6nxQUDdiLE8POUmGn/dUq
         U6CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717457595; x=1718062395; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5OxPQH1NzYbNs5YeQBod+clTP91YJB8kCMsI+3opr8=;
        b=bG7o/yEZBGY1BwWoByBN8eo1FAjRbXATvkpsNfUFTVMwYwnvLBtwvrtmHz8hVVrhei
         Y3MkeHJS5nVoXps6xB3b6D2ZmoO304xLgu+S0V0H+RUvSNVZyDxk5lLxKNfYMyxiZHDk
         RSJLzgrNLJx78Q/bCfx+4cHd3B1thdn5dLP/gbNltZoAqzFf8L13reLVbcq23nzEzv9X
         gMHjkF5ur3WkGXJ4OCCUGQhA4UOq/JcO1ljNwGCZWkYMNBk/eVYnkeJq7GWo8as6pOxb
         9Qf4JDiNu9SubnWaYqfLovSDGejAsElBHA00qMn0cRd5oDosia3LWf1tv42bDTY2UGvG
         93TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717457595; x=1718062395;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5OxPQH1NzYbNs5YeQBod+clTP91YJB8kCMsI+3opr8=;
        b=BeqPeVwNbfYKn5KDVL34TVhpI9DCqu4uHo3ELbOs2zM9VN6sfA2KLY7AG017sOjQ8X
         Klsg3RX+v184meJUmWP4qDOpnMCWo01KH+Z8kdW1e+ytxLA4/CPCTjg6ZmmF8iYSt5ek
         rGFsu6b91aeQiKMKyf1kxo2RzPAZr3CteHn0gpccGYXhe9LRm/9Ai8G4ltCspNLT4888
         73yR6gKswuDVSD5rOp3JswxWtWwEMaI3kfhB2uYyFNZwOLvDfZcMQooyRdPy7G8Ct47R
         S0jblyQA4zkKW27nJVWdV/uaux58a1GYMlLxmgIBfue6gUBYz4ksAZBu4VrlF6gzjW7A
         Eo1A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU/b2jdtdQyBZuxm/5U9JPUvZc9t487wbc7KWUCA55mf+d+G82spMoNt1jrQXk/8PQG8HzvY3q3ep0AcVrh+FqK9H5OarsEsYUUeEo=
X-Gm-Message-State: AOJu0Yx41zoEDDLZbPKFw7+dEbW8rxSroOZwHIy4HB2Wh3M9EjEFwDce
	nDnrcMSh9FeLSIgMp3gs6lzHYHIEb2nafpf0wuTtw9fYq4UvBh/2
X-Google-Smtp-Source: AGHT+IFMS5XVyJSe1i8RtFV+qgq7y+4Wi8JkkrrO5sXJeFwJI494oCBc6f12HfuLJTgKsPLRl8q0Aw==
X-Received: by 2002:a25:aa64:0:b0:df4:d837:73f5 with SMTP id 3f1490d57ef6-dfab89c767emr948111276.16.1717457595402;
        Mon, 03 Jun 2024 16:33:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b02:0:b0:df7:7249:e32 with SMTP id 3f1490d57ef6-dfa62f459a3ls882135276.0.-pod-prod-09-us;
 Mon, 03 Jun 2024 16:33:14 -0700 (PDT)
X-Received: by 2002:a05:6902:c08:b0:de6:166f:3250 with SMTP id 3f1490d57ef6-dfa73d71e53mr3512124276.2.1717457593892;
        Mon, 03 Jun 2024 16:33:13 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:33:13 -0700 (PDT)
From: ecstasyclinic pharmacy <ecstasyclinicpharmacy@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <35bdf6d5-e813-4572-8687-aded6ce6c2c5n@googlegroups.com>
Subject: #Xanax for sale
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_33836_2031873867.1717457593267"
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

------=_Part_33836_2031873867.1717457593267
Content-Type: multipart/alternative; 
	boundary="----=_Part_33837_2140458866.1717457593267"

------=_Part_33837_2140458866.1717457593267
Content-Type: text/plain; charset="UTF-8"

where to buy high quality LSD, pain and anxiety pills, depression 
medications and research chemicals for research purposes? Be 99.99% sure of 
product quality and authenticity. With a focus on quality and customer 
satisfaction, we ensure that all our products are sourced from reputable 
manufacturers and undergo rigorous testing for purity and potency.

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv
Message @Clarkderby1 to place  your order

100% discreet and confidential,
-Your personal information is 100% SECURE.
-Your orders are 100% secure and anonymous.
-Fast delivery worldwide (you can track the shipment with the provided 
tracking numbe

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/35bdf6d5-e813-4572-8687-aded6ce6c2c5n%40googlegroups.com.

------=_Part_33837_2140458866.1717457593267
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

where to buy high quality LSD, pain and anxiety pills, depression medicatio=
ns and research chemicals for research purposes? Be 99.99% sure of product =
quality and authenticity. With a focus on quality and customer satisfaction=
, we ensure that all our products are sourced from reputable manufacturers =
and undergo rigorous testing for purity and potency.<br /><br />https://t.m=
e/ukverifiedv<br />https://t.me/ukverifiedv<br />https://t.me/ukverifiedv<b=
r />Message @Clarkderby1 to place =C2=A0your order<br /><br />100% discreet=
 and confidential,<br />-Your personal information is 100% SECURE.<br />-Yo=
ur orders are 100% secure and anonymous.<br />-Fast delivery worldwide (you=
 can track the shipment with the provided tracking numbe<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/35bdf6d5-e813-4572-8687-aded6ce6c2c5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/35bdf6d5-e813-4572-8687-aded6ce6c2c5n%40googlegroups.co=
m</a>.<br />

------=_Part_33837_2140458866.1717457593267--

------=_Part_33836_2031873867.1717457593267--
