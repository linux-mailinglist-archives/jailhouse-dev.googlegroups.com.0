Return-Path: <jailhouse-dev+bncBDSKHYNC6UGBBJPY72YAMGQEAD5OKBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F98A82DA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 14:10:15 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dced704f17csf9336057276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713355814; x=1713960614; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGP/gxJC9BIk00k1OCJ9YWzV5iKCwVTE1JcVC517zhI=;
        b=ObBrhxXYWfNy6b24ioSy+yecfQqdj0UmfZtTGcIZsi9VlsNaZSnsJF+DMT80+/rmhG
         UOH6EJXCLe2Ug3EfuzG68ERuq0TAPVsqa83PYGZseqHDVLGwVoFz1MS0TZXu7y92PU+s
         3jlca+PROvEowv815Vl3svc544/h7AJHdyQ4Oa4+K5cZ12EpBMEmsCVLxP3BRveNUC/q
         SFevWo+HKWke4uQORQis5nZxh5eyKZz2KrgqhHxFZMFUevvWD+2vfvDBKk6JbOYC6uiW
         c/qdupWrC2udcqQ8sgxa3vjk0xrOkxRgziUaOYyNR2WxESnxOPOMZUKjoY3ll/kDMh2c
         Tifg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355814; x=1713960614; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGP/gxJC9BIk00k1OCJ9YWzV5iKCwVTE1JcVC517zhI=;
        b=QZ30xZs2QcNz4PNhQYK5ampBv8JJTn5VnsTz7RAmqQZWqs6CWvrY3PiECUxBqoW8xg
         QBzhGsmevO6+n/arwqsnJvSexTSIpsqdUvPjalWqrQpZ0zo6i/OMf8fbVkRvzqXX8u1A
         tVWRBoerts4k1jN+B0VWLIw4Us1cqglF0G4xXLH3EaAOBF8zP64YMnmuj/lV6ZIzeErw
         Fcui1qpG5g/X3vVbK+6YyZUNvxOwQDVZL9rj2w/a00bdi7CToro55YmajnNISkMcwzr1
         Q9wm4MasrG6Ag/uiMpRZN2ZWYZV6UvzC/Ym0C98wXzqxyUl++0tzIQlPEsjBKvplVxW6
         dwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355814; x=1713960614;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGP/gxJC9BIk00k1OCJ9YWzV5iKCwVTE1JcVC517zhI=;
        b=Uxq0e/KFkSsp9+r22nF7abMqjwEx1xQ5CexjHofNAZu5uTwhdHsL1h/rbIXt5E6BHf
         QxvepruxzoUdp6WlbzpWE9mCEbdbalqFizl1YfLDXc/EQHIX9UcvVzOgQXLrdRrwDeOx
         oYwRv302zYZmkt24r/E9D5BQSLggXDwHbqhHemv4S6Zi49tHhexb0jtQIRFM/fkyNhq3
         uzAvjVChnuTyAJEcrPde5Cz0woG3c7Zq0piPfPISeiUY18mji4pyj+pv486SfaPw7veW
         55id2AN+rtk6ADZoChR4z5LVwHKlMAohgGApsxJPSY6XnyszVAzRnK1AN5Ko13DIhyb2
         iDmw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWPV0xVqhDEPD52Pr8zQocPk9qPHKehJdrFWyV4/hZ6aj5dzY0xB03TZAxp+DbCoWuJ0yBhgAH3DMgWRGr58PIt5d2qw6UtmqAo/nM=
X-Gm-Message-State: AOJu0Yy6vZZszxUPzuzGZFHFs4kuMa0VmZkJ1l7/8DWXuTcWPBgxCKLx
	LPFwQSLs+eMhneW6y1HemaXUqFUJMb7aNkDHrxeVPQHxpnx3vye3
X-Google-Smtp-Source: AGHT+IFkcsfDpJ0Egs0NoWefITlHgkUqQ82jWoArm/dZTv95bWIgnZVKJqW27iirqKrILDZzewDk/g==
X-Received: by 2002:a05:6902:728:b0:dcc:323e:e1a4 with SMTP id l8-20020a056902072800b00dcc323ee1a4mr18574678ybt.6.1713355814004;
        Wed, 17 Apr 2024 05:10:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c2:0:b0:dcc:4b24:c0e3 with SMTP id x185-20020a25e0c2000000b00dcc4b24c0e3ls3900526ybg.1.-pod-prod-07-us;
 Wed, 17 Apr 2024 05:10:12 -0700 (PDT)
X-Received: by 2002:a05:6902:c13:b0:dcd:5e5d:458b with SMTP id fs19-20020a0569020c1300b00dcd5e5d458bmr4808768ybb.3.1713355812302;
        Wed, 17 Apr 2024 05:10:12 -0700 (PDT)
Date: Wed, 17 Apr 2024 05:10:11 -0700 (PDT)
From: Jamel Ihbrahim <legit.prodoc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cc78f2c1-9dbf-4efe-8cd3-39b29da64c6bn@googlegroups.com>
Subject: k2 Liquid Spray / Sheets Order now. Whatsapp: +1 (662) 626-1163
 Telgrm: @Street_key
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_41878_640184284.1713355811754"
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

------=_Part_41878_640184284.1713355811754
Content-Type: multipart/alternative; 
	boundary="----=_Part_41879_895497982.1713355811754"

------=_Part_41879_895497982.1713355811754
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cc78f2c1-9dbf-4efe-8cd3-39b29da64c6bn%40googlegroups.com.

------=_Part_41879_895497982.1713355811754
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

k2 Liquid Spray / Sheets Order now. Whatsapp: +1 (662) 626-1163<br />Telgrm=
: @Street_key<br />K2 Spray and Sheets available.<br />Each A4 sheet is inf=
used with 25 ml=3D0.845351 fluid oz of liquid K2. You can buy the infused A=
4 plain paper and write a letter to send to your buddy in prison. This pape=
r is odorless and colorless. <br />Telegram : @Street_key<br />WhatsApp +1 =
(662) 626-1163<br />Visit our page for more good stuffs: https://t.me/+_A7N=
2XkymGphODRk<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cc78f2c1-9dbf-4efe-8cd3-39b29da64c6bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cc78f2c1-9dbf-4efe-8cd3-39b29da64c6bn%40googlegroups.co=
m</a>.<br />

------=_Part_41879_895497982.1713355811754--

------=_Part_41878_640184284.1713355811754--
