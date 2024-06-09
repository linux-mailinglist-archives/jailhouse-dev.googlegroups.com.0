Return-Path: <jailhouse-dev+bncBDHL5ROYQ4LRBXH6SWZQMGQEAHVM5DQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396390157E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2024 12:09:34 +0200 (CEST)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-62cf0ed7761sf13441537b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2024 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717927773; x=1718532573; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQmQJLfYu+pIyJohGl2kBtMBz1RMkMHmX5LJZ8HWg6s=;
        b=qOYL56uFAIEjeVLPB9ne35OPLtxGq94WGGiMj1tv0odjD+UrV2rbvJnLz3Pab+nhpE
         5U0VtcOh0gnGJWx+xMYHoH/lwv4v248sRZuJtck656RTMUNzySRwhjQtDdIUu+DS9GdM
         tiXw0NUqUHpPx+P2EtV82jln5AycFGYh2KY/B7fY9HIChz/Q2NmERM/WPkLxuF05YU4m
         ygUNl0//f3rRYMPFP4IT/zOOt3X0PHDWbpMRK+1zEgDoXZ/F0CfHjDi3MOoZiV+FT0yI
         yR8kvzdHcsGhT6uJGQrfcLrr4mpVQtpIHdIXZNaPNWxqDW87+OqdUCRzfO3sZT+V3ahN
         z+Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927773; x=1718532573; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQmQJLfYu+pIyJohGl2kBtMBz1RMkMHmX5LJZ8HWg6s=;
        b=UGKAvdOwj8WlDGcbFa8NebcwhNnWP2aE7mLY91jaKQ3mHaSpAPC/5j/PvalbRz+BHz
         B7AeW0L4e5YrfD4MEr0Ce6EvALzEDagPIY3Dqn519iOLRDoX9N06HRBg5BljSAmgapoj
         U29mfkRYp5IsKiit/lt/hGX3MLmdFPOXeu2UEcCBxMllP+PpvlMOFVpHDndXsCnxEj5i
         iG/e3c22sIxijknXh4YSA3LndcZ5bvThVg+OJFtvHVv/XUycAEjcEVZZcHZFI5Y5cU9W
         6B8JEe8ORIc2hToWExdGmyNGx1EnYEvF/JNziGR1/weF4LiH2IcJGepcEuMdmq8Si5Pr
         HUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927773; x=1718532573;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQmQJLfYu+pIyJohGl2kBtMBz1RMkMHmX5LJZ8HWg6s=;
        b=mvKdtJmU6n6pJgXtjOS0n1ceeG7r6lw5pcRqTBcLHfRmDbTvfkQ12ke/NviJ/KgN5j
         QcidcZQ9Yo5uI4UPAjvoL7rWg+yf/OohxBFgi6Bw1tKKokVSWGJ9bac/D1LX6Es8vNCU
         Jal/mNGumfyxtyv+uKEhcUDrGeSLLFCmOVmDQprEwp5EBVxYbQvL2k9z7MLnqBmGQ0+x
         h4THiRB/aB19m/hMnc3NXmVxHF5RQFLE0ybRSFmTOGPefpg3QL9fq7TbpFZcmDbtL0q1
         Ro5YvyqZMkUo46/t5pn/NqBymnb6dCkhFc1rGfMS66ZeHid5gIhtxr7TRc0OqW14NtIl
         6pDQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXgv1fRJjMstMXB3e1DESCIG04WxsL4TVwGF8EA1w9G8W7+00kBKPDI72uzwyfCeXK80wbw/at8vnRl6Vi+e9BdbosXdiTHldRRNY4=
X-Gm-Message-State: AOJu0YxGKHWIordA347XbT4rYH4y78jQNH4WFX4Lf8FRMxHDkOS4Dlc4
	tEy4T5ABz7MfoUW2ibUWmu4P1t1MN+6/hM3uRVSbWW/hlBvaEurr
X-Google-Smtp-Source: AGHT+IGASfR2OIKqjamFf4oxsHnp3RwNLflmuoY7B/n52XGT84i2LfulA4hmNmcrONrR2y9YSwKRlQ==
X-Received: by 2002:a25:bcc4:0:b0:df4:f44a:f725 with SMTP id 3f1490d57ef6-dfaf4a01456mr4734165276.21.1717927772734;
        Sun, 09 Jun 2024 03:09:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d6c5:0:b0:dfb:10b3:1d6d with SMTP id 3f1490d57ef6-dfb10b31f26ls1233326276.1.-pod-prod-03-us;
 Sun, 09 Jun 2024 03:09:31 -0700 (PDT)
X-Received: by 2002:a25:6b08:0:b0:dfa:59bc:8867 with SMTP id 3f1490d57ef6-dfaf64d3340mr436414276.5.1717927771178;
        Sun, 09 Jun 2024 03:09:31 -0700 (PDT)
Date: Sun, 9 Jun 2024 03:09:30 -0700 (PDT)
From: Hassan Mefire <mefirehassan00@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1e0b0336-03f0-4530-b1e9-feb5d7953dbbn@googlegroups.com>
Subject: WHERE CAN I BUY LSD-CAN YOU BUY LSD ONLINE-WHERE TO BUY LSD
 ONLINE-1P LSD WHERE TO BUY-1P LSD BUY ONLINE-BUY 1P LSD ONLINE-BUY
 1P-LSD-BUY 1P LSD USA-LSD FOR SALE-1P LSD FOR SALE-1P-LSD FOR SALE-1P LSD
 FOR SALE USA-LSD FOR SALE ONLINE-LSD TABS FOR SAL
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_242584_1009895709.1717927770448"
X-Original-Sender: mefirehassan00@gmail.com
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

------=_Part_242584_1009895709.1717927770448
Content-Type: multipart/alternative; 
	boundary="----=_Part_242585_1715388553.1717927770448"

------=_Part_242585_1715388553.1717927770448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

WHERE CAN I BUY LSD-CAN YOU BUY LSD ONLINE-WHERE TO BUY LSD ONLINE-1P LSD=
=20
WHERE TO BUY-1P LSD BUY ONLINE-BUY 1P LSD ONLINE-BUY 1P-LSD-BUY 1P LSD=20
USA-LSD FOR SALE-1P LSD FOR SALE-1P-LSD FOR SALE-1P LSD FOR SALE USA-LSD=20
FOR SALE ONLINE-LSD TABS FOR SALE-1P LSD FOR SALE CANADA-1P LSD CANADA-1P=
=20
LSD FORE SALE USA-1PLSD SALE-1P LSD BUY-1P LSD FOR SALE

What is LSD?
Buy LSD Online is a synthetic chemical, made from a substance found in=20
ergot, which is a fungus that infects rye=20

https://t.me/psystoreoeg

LSD belongs to a group of drugs known as psychedelic when small doses are=
=20
taken, it can produce mild changes in perception, mood and thought. Larger=
=20
doses may produce visual hallucinations and distortions of space and time.


https://t.me/psystoreoeg


Sometimes, Buy LSD can actually be other chemicals such as NBOMe or the 2C=
=20
family of drugs (part of the new psychoactive substances these can be quite=
=20
dangerous, as their quality is inconsistent. Taking too much of these other=
=20
substances can be fatal with a number of deaths having been reported

https://t.me/psystoreoeg


What it looks like

In its pure state, LSD is a white odorless crystalline substance. However,=
=20
LSD is so potent that an effective dose of the pure drug is so small, it=E2=
=80=99s=20
virtually invisible. As a result, it=E2=80=99s usually diluted with other m=
aterials.

https://t.me/psystoreoeg

The most common form is drops of LSD solution dried onto gelatin sheets,=20
pieces of blotting paper or sugar cubes, which release the drug when=20
swallowed. LSD is also sometimes sold as a liquid, in a tablet or in=20
capsules.

=20
https://t.me/psystoreoeg

How is LSD used?
LSD is usually swallowed or dissolved under the tongue, but it can also be=
=20
sniffed, injected or smoked.
magento1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1e0b0336-03f0-4530-b1e9-feb5d7953dbbn%40googlegroups.com.

------=_Part_242585_1715388553.1717927770448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

WHERE CAN I BUY LSD-CAN YOU BUY LSD ONLINE-WHERE TO BUY LSD ONLINE-1P LSD W=
HERE TO BUY-1P LSD BUY ONLINE-BUY 1P LSD ONLINE-BUY 1P-LSD-BUY 1P LSD USA-L=
SD FOR SALE-1P LSD FOR SALE-1P-LSD FOR SALE-1P LSD FOR SALE USA-LSD FOR SAL=
E ONLINE-LSD TABS FOR SALE-1P LSD FOR SALE CANADA-1P LSD CANADA-1P LSD FORE=
 SALE USA-1PLSD SALE-1P LSD BUY-1P LSD FOR SALE<div><br /></div><div>What i=
s LSD?</div><div>Buy LSD Online is a synthetic chemical, made from a substa=
nce found in ergot, which is a fungus that infects rye=C2=A0</div><div><br =
/></div><div>https://t.me/psystoreoeg</div><div><br /></div><div>LSD belong=
s to a group of drugs known as psychedelic when small doses are taken, it c=
an produce mild changes in perception, mood and thought. Larger doses may p=
roduce visual hallucinations and distortions of space and time.</div><div><=
br /></div><div><br /></div><div>https://t.me/psystoreoeg</div><div><br /><=
/div><div><br /></div><div>Sometimes, Buy LSD can actually be other chemica=
ls such as NBOMe or the 2C family of drugs (part of the new psychoactive su=
bstances these can be quite dangerous, as their quality is inconsistent. Ta=
king too much of these other substances can be fatal with a number of death=
s having been reported</div><div><br /></div><div>https://t.me/psystoreoeg<=
/div><div><br /></div><div><br /></div><div>What it looks like</div><div><b=
r /></div><div>In its pure state, LSD is a white odorless crystalline subst=
ance. However, LSD is so potent that an effective dose of the pure drug is =
so small, it=E2=80=99s virtually invisible. As a result, it=E2=80=99s usual=
ly diluted with other materials.</div><div><br /></div><div>https://t.me/ps=
ystoreoeg</div><div><br /></div><div>The most common form is drops of LSD s=
olution dried onto gelatin sheets, pieces of blotting paper or sugar cubes,=
 which release the drug when swallowed. LSD is also sometimes sold as a liq=
uid, in a tablet or in capsules.</div><div><br /></div><div>=C2=A0</div><di=
v>https://t.me/psystoreoeg</div><div><br /></div><div>How is LSD used?</div=
><div>LSD is usually swallowed or dissolved under the tongue, but it can al=
so be sniffed, injected or smoked.</div><div>magento1</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1e0b0336-03f0-4530-b1e9-feb5d7953dbbn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1e0b0336-03f0-4530-b1e9-feb5d7953dbbn%40googlegroups.co=
m</a>.<br />

------=_Part_242585_1715388553.1717927770448--

------=_Part_242584_1009895709.1717927770448--
