Return-Path: <jailhouse-dev+bncBCWL5HFL4MBRB55VVCZQMGQE3K24TZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF70905E36
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2024 00:02:33 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfdfe3d9fc8sf611313276.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2024 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718229752; x=1718834552; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFxpu6z3uWcS3KsRaR216t+8r2oEVeDpoQYz60cAb/M=;
        b=NoYPKSv6OaxMhwh+9XnRrf7w/3UDAtx+bnRfAJzsPP1W7t/UFnoKnWZmwL58HOZyUm
         rriZDqD8if46Czt7Jy4FVcy+ce0IJNhO6K16mL8ywIUdBNjEYaOpD3rx13u/mzxBmCXT
         VUW5boMKHKm5G0qJ5MNh2yFq0tKjA3V4ITkvRR1IZtUufNek8aQCPqSZbHFYShbiCpQb
         v2ihPoz3vVUWPBSzucJccPDbLjfdVHJaE8VWiucvgv0yGrd/fZ1aUJphRCBom07s7GqV
         jj9CgY3hkrtmPpbCtwVVO6dSMvnLzMOYkN+cBBYQsrPS7VFctfChw4ql3jSBJT4GgGgw
         juZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718229752; x=1718834552; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFxpu6z3uWcS3KsRaR216t+8r2oEVeDpoQYz60cAb/M=;
        b=d8gzdFi0K2Y18ZY6CujdYw7SKUXSV0FAcOGEL3bI7C/lbH5jkBnWAqFby1qsMC66r9
         Zntvdg4OL5D1RKYOeZOSz8ZmTKqQ+3tQWB5hV7m7sMUXVwb2pZ8kvI0njtVq+tXA2UO+
         usazH2dkfa9MAGt5VaeemK5ARqMXrOjb3yh2LO2SxhZ8EVEdlJPUl3I3n/VvwpxReFdK
         jIP6HpUpAWPg4vU8WtNkemvxFD1c188h3AVy2rLZH3DmtTib66cwUJ7coUaeZQgSfXNe
         Qvri76b2noNhpRnUXRNVUgo8UC9b8WNwAiizzPDvrIPS+aW33zY40tBivNL94JBH9LpF
         1hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229752; x=1718834552;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFxpu6z3uWcS3KsRaR216t+8r2oEVeDpoQYz60cAb/M=;
        b=oNM7CfNnkml4rQAKquPLofm2FjWxq2mmDc9EusccFX6+MBvyCY0hwIlKvjZ7eNyXOG
         1PBZ0eqf4tCI/0xjHGkndAo9kd5KwnQGUCzy59gqzPNrvHGm3ViMaq3LLMusSauA8N7J
         t5mwD2QAfXPe0zULFfXHxCQvU10LauXIJz03iqHkxVCPYPadhSN9QaJbQrD8V3ytVPxc
         WMxuaSOl91ucepurM/+DxDg1sqW1XQTX33D0gfdAonrdBNWxlvSHhOp1SDsjjLxNgcy6
         5Wuh3uowuYzOzTO7CYIomOpoZiiWOz5GoAff0RberzT2fZ3fc2mRhEH0z60GVSDtd+NI
         A9ag==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWuj8DSAYC015WGmcTT9wrbmvnBRnMVHaeNpnJaFT+rHf6VrZmAmkPvulPZYrJ+t5pAYWj2ZUS1qyeUtlc+R3STO4dobwAHDD8YZrU=
X-Gm-Message-State: AOJu0Yyk4L4zwQX41EhDHOml6512RrutJXC3BKy+8EuZ2NhryFlaQrpJ
	OeQJfvXnQW50HPDT8ZRDGWkoeBreV+I+CDnjBGBym04aOoKB75Cm
X-Google-Smtp-Source: AGHT+IFWdPPScymJj8IzSgwdeXKswuOUD7w8Ra4OmkMhbkM1sbdPugTf2olJ47URt2ZU9lXirZApfg==
X-Received: by 2002:a25:ae44:0:b0:dfb:149d:7593 with SMTP id 3f1490d57ef6-dfe68c0de19mr3119671276.44.1718229752194;
        Wed, 12 Jun 2024 15:02:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1008:b0:dfa:7e23:93a1 with SMTP id
 3f1490d57ef6-dfefe6e1c27ls638522276.0.-pod-prod-06-us; Wed, 12 Jun 2024
 15:02:30 -0700 (PDT)
X-Received: by 2002:a81:4cc7:0:b0:630:28e3:2568 with SMTP id 00721157ae682-63028e32ea1mr4038337b3.3.1718229750411;
        Wed, 12 Jun 2024 15:02:30 -0700 (PDT)
Date: Wed, 12 Jun 2024 15:02:29 -0700 (PDT)
From: smith baron <baronsmith294@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d44a2a1e-8e29-4667-b86d-740f0a614026n@googlegroups.com>
Subject: 5-MEO DMT VAPE PENS - BUY DMT VAPE CARTS LAS VAGAS
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11067_880316515.1718229749444"
X-Original-Sender: baronsmith294@gmail.com
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

------=_Part_11067_880316515.1718229749444
Content-Type: multipart/alternative; 
	boundary="----=_Part_11068_1342643482.1718229749444"

------=_Part_11068_1342643482.1718229749444
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

BUY DMT VAPE PEN

https://t.me/dannyw23official

Buy DMT Vape pen. Offering a quick blast into another dimension, DMT Vape=
=20
pens are known to occasion among the most profound trips of any=20
psychedelic. Although its effects last only about 30 minutes, the peak of a=
=20
DMT trip happens almost instantaneously, within about the first 10 minutes.

https://t.me/dannyw23official

DMT VAPE PEN FOR SALE
A DMT vape pen combines either N,N,DMT or 5-MeO-DMT with an e-liquid base.=
=20
It=E2=80=99s then added to a standard vaporizer, just like the type you=E2=
=80=99ll find=20
from cannabis manufacturers.
In fact, you can even use DMT vape cartridges with any standard=20
cartridge-style vape pens. When the tank is empty, it=E2=80=99s removed, an=
d a=20
fresh new tank is screwed into its place.

https://t.me/dannyw23official

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d44a2a1e-8e29-4667-b86d-740f0a614026n%40googlegroups.com.

------=_Part_11068_1342643482.1718229749444
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

BUY DMT VAPE PEN<br /><br />https://t.me/dannyw23official<div><br /><div>Bu=
y DMT Vape pen. Offering a quick blast into another dimension, DMT Vape pen=
s are known to occasion among the most profound trips of any psychedelic. A=
lthough its effects last only about 30 minutes, the peak of a DMT trip happ=
ens almost instantaneously, within about the first 10 minutes.<br /><br />h=
ttps://t.me/dannyw23official<br /><br />DMT VAPE PEN FOR SALE<br />A DMT va=
pe pen combines either N,N,DMT or 5-MeO-DMT with an e-liquid base. It=E2=80=
=99s then added to a standard vaporizer, just like the type you=E2=80=99ll =
find from cannabis manufacturers.<br />In fact, you can even use DMT vape c=
artridges with any standard cartridge-style vape pens. When the tank is emp=
ty, it=E2=80=99s removed, and a fresh new tank is screwed into its place.<b=
r /><br />https://t.me/dannyw23official</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d44a2a1e-8e29-4667-b86d-740f0a614026n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d44a2a1e-8e29-4667-b86d-740f0a614026n%40googlegroups.co=
m</a>.<br />

------=_Part_11068_1342643482.1718229749444--

------=_Part_11067_880316515.1718229749444--
