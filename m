Return-Path: <jailhouse-dev+bncBDSKHYNC6UGBBOM26CYQMGQEFP6MBBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED748C07C7
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2024 01:39:40 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-620308b3684sf4801197b3.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 May 2024 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1715211579; x=1715816379; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbB9GL4PK4lhoNH/9PeWLOgxeRNg0kMNM1+LQnaTw70=;
        b=tyPaCl1pwFZ1KdSjKghnSO4d7BvicLsFlYGHO7LloqQPZvT4W+bBpnHrBZSkL6D+nc
         RFpV3QLpgjwUaKYYy/rxExvgbVD0cuqhyxZ5CBY7k4hQqAyCtd9Kh8nQgWuYSdPdmpp5
         BktnjrIDF5Du87NYkQLe4uOjpmEyPDOrOqhAfN+cQweRjD3uU08hP/TkmtFAWQzbVjiv
         lFowQsT2yVv2BkF9iQFUZ3SBud+rVWoUfRvRxpIffQ4yQjoleSm3aeqwbbT6cOCNlgz4
         zFfuL42noHRlTxKdf9QX8DWS6dmMRVamTld2dzv95+txZtOCaQCyQ2ew79+UE/PttvNd
         6p8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715211579; x=1715816379; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbB9GL4PK4lhoNH/9PeWLOgxeRNg0kMNM1+LQnaTw70=;
        b=VwZ/fmH9We24/Nu9/PQgqYYHDDHPWQe0lK2C8PGIM/C8Ow5B7Cm/ZqWTmYv30SV7/F
         kaA1wpbE0LWBaSWDxTMCCI7e85nyQAWYUO6qy4eiYh47lgbBbQv2wp4+Esga27qefL3n
         /7DAq1TScNBXiCpMaGe4PO2Cpqzw7LLiZ5IlP06v4GlZIjvdqFHNh/zbaTEVDOwaVFAN
         A2wq3GPeFSlMmRa2U3Qkvih1NSPcjwkFJ0wVdk20DxkKHmu6LpzgOdoikmPjgY9RwLX5
         25/ox6wghhFV+m62HN5eaVWINVhHFdifSvGqCVr0E8BnS4EUqDVQ7x1crOp8f3o+bPM5
         RJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715211579; x=1715816379;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbB9GL4PK4lhoNH/9PeWLOgxeRNg0kMNM1+LQnaTw70=;
        b=EFeLtzjy/NOToomMN+k0B/KbpfyGKapqiPs6JufexyPIYPytqcQMKZqediz8QxExDd
         O6f9JfbYZ3aNw+YiDo7EaJXW5kkmC1droDTJrufWCV6PgrMyUbmtgZJA8YKEfkbfX4Es
         R8Z8dA37nu1h3g+whK5WTOyUlnuNomfbnyDASZiU9q3h3C7906b2dM6zsjDLqVR3MsO6
         f5FHUl2Oi5VtfmsvRuFQIX1MchhTAWnsWyfGlVouxKOtbLPR3a8brbxe3tYOeQTDUf1i
         JfPYtQ5JpdaWXUhJPO4v4+EPKIMFuWWw/+7zySZ15BwRT5i1WELP1yWi2bJW+TBE/LTs
         sIAQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWHLtT0cJhHOqv/rFoQ3ky1bCs33sUO1d2cToyW2UwiZsquqw57vS/SbXrLyfYdbyG/MKv0TSsBopgYhiBGNPuQWOnaGjM7cCpke0o=
X-Gm-Message-State: AOJu0Yxtma2GhfICXX5sX+6vkYEk2HimvoJCSBQYWtfAs1DxnCul2Xjn
	M/+kkKzkB4B1EahQ9EtsUPY6e1xEw8n7VivM/zOpNm2TCznO95A3
X-Google-Smtp-Source: AGHT+IGj+vcebdtDI0bCzj5gPoacLOvyAZyaSj4MuG0ot4ZKX0Vhh25nw5aQo6OMwj+CppAjBNKY7A==
X-Received: by 2002:a25:b327:0:b0:dcc:6112:f90d with SMTP id 3f1490d57ef6-debb9f664d6mr4211990276.62.1715211578703;
        Wed, 08 May 2024 16:39:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:be81:0:b0:de5:9eb1:327d with SMTP id 3f1490d57ef6-debd088a517ls468585276.2.-pod-prod-06-us;
 Wed, 08 May 2024 16:39:37 -0700 (PDT)
X-Received: by 2002:a81:4807:0:b0:61b:e1f6:2098 with SMTP id 00721157ae682-62085a6966emr10712357b3.3.1715211576999;
        Wed, 08 May 2024 16:39:36 -0700 (PDT)
Date: Wed, 8 May 2024 16:39:36 -0700 (PDT)
From: Jamel Ihbrahim <legit.prodoc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5417360e-b5d9-45d3-acfb-facc2daccd94n@googlegroups.com>
Subject: K2 Spray and Sheets.Order Now Telgrm: @Street_key WhatsApp +1 (662)
 626-1163
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4888_1890469335.1715211576293"
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

------=_Part_4888_1890469335.1715211576293
Content-Type: multipart/alternative; 
	boundary="----=_Part_4889_751541616.1715211576293"

------=_Part_4889_751541616.1715211576293
Content-Type: text/plain; charset="UTF-8"

k2 Liquid Spray / Sheets Order now. Whatsapp: +1 (662) 626-1163
Telgrm: @Street_key
K2 Spray and Sheets available.
Each A4 sheet is infused with 25 ml=0.845351 fluid oz of liquid K2. You can 
buy the infused A4 plain paper and write a letter to send to your buddy in 
prison. This paper is odorless and colorless. 
Telegram : @Street_key
WhatsApp +1 (662) 626-1163
Visit our page for more good stuffs: https://t.me/+_A7N2XkymGphODRk

K2 Spray and Sheets.Order Now Telgrm: @Street_key

#k2sheets #k2sheetsusa #k2sheet
#k2sheetsa4paper #k2sheetsuae
#k2sheetsgermany #k2sheetsuae
#k2sheetsindiana #k2sheetsindiana
#k2sheetsindiana #k2sheetsindiana
*k2sheetsgermany #k2sheetsuae
#k2sheetsarkanss #k2liquidsprayusa
#miami #losangeles #lasvegas
#k2lifewater #usa #florida #california
#chicago #illonois #k2sheetsuae

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5417360e-b5d9-45d3-acfb-facc2daccd94n%40googlegroups.com.

------=_Part_4889_751541616.1715211576293
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

k2 Liquid Spray / Sheets Order now. Whatsapp: +1 (662) 626-1163<br />Telgrm=
: @Street_key<br />K2 Spray and Sheets available.<br />Each A4 sheet is inf=
used with 25 ml=3D0.845351 fluid oz of liquid K2. You can buy the infused A=
4 plain paper and write a letter to send to your buddy in prison. This pape=
r is odorless and colorless. <br />Telegram : @Street_key<br />WhatsApp +1 =
(662) 626-1163<br />Visit our page for more good stuffs: https://t.me/+_A7N=
2XkymGphODRk<br /><br />K2 Spray and Sheets.Order Now Telgrm: @Street_key<b=
r /><br />#k2sheets #k2sheetsusa #k2sheet<br />#k2sheetsa4paper #k2sheetsua=
e<br />#k2sheetsgermany #k2sheetsuae<br />#k2sheetsindiana #k2sheetsindiana=
<br />#k2sheetsindiana #k2sheetsindiana<br />*k2sheetsgermany #k2sheetsuae<=
br />#k2sheetsarkanss #k2liquidsprayusa<br />#miami #losangeles #lasvegas<b=
r />#k2lifewater #usa #florida #california<br />#chicago #illonois #k2sheet=
suae<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5417360e-b5d9-45d3-acfb-facc2daccd94n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5417360e-b5d9-45d3-acfb-facc2daccd94n%40googlegroups.co=
m</a>.<br />

------=_Part_4889_751541616.1715211576293--

------=_Part_4888_1890469335.1715211576293--
