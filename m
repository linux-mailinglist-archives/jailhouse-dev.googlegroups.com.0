Return-Path: <jailhouse-dev+bncBC7MJ2PM5UERBIXFVLVAKGQEE6NSFOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5F84A6E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 13:14:43 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id m16sf54113635otq.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OYo0XgSb0O9lFps5LbKFxjRQQ+jaLrhMpbhmU/k8GcM=;
        b=EgRS/+JcDuTEOcH92TbBouruHqA1rucbb5B4BooQy+w7yNoGg+6nRmGimAucC2A3n3
         +Ut88mRpVShJyFvrUlTbby/cDDW2qR9yLsnJzKwBRYz0YZdW5/CZPI10VqfX6EgMIXBc
         +JEjh7hbGGLEy8waThRUXU9l1egATYB88b+EbY6ky6GLHDk46pEsDrXRS5YqrHE8ktkZ
         DzYiytHbVGB3O6rQFwqcPr94qDWfQSqC2+tjQdNGl1TJhCs8Tx1V12uLJqJ7FhenEafo
         vH7lWJkGjn1bGGcepQZwPlQu+W/h/p+1DurB9krHAfN1j6+yQ13qgd+/VGXDsRYxGH8T
         fvXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OYo0XgSb0O9lFps5LbKFxjRQQ+jaLrhMpbhmU/k8GcM=;
        b=mwJwu82c+btlx9remkZrZ/cgHn/XkLtbVNpmnuLyrsXNCwaJ7vwj7HB7ReBB96hMxj
         dAQINupRJzdTARugmZoYKDQBwlyx+IGA76t5DUl28SpfrDKgBG+pJi7p7km62ticrwUl
         JgAgFwKgur6M88bhIBZBNTy5KY858NnYl3xBbhPMrsHEJegIRyULYv8kzvBxCGJ+q9oI
         DSqeL2jN2gHf0MXIGLJ/I/BH9HcKc0tdN1Nr3hpXsygmoA01wbo+hJQiMp/E6+e7bRUf
         bstZyc09P+fERCdNFznpRI36PXB+V9Ae0+k68FcS+FIbxg68wwJvJt9IROI4cULrQsig
         d3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OYo0XgSb0O9lFps5LbKFxjRQQ+jaLrhMpbhmU/k8GcM=;
        b=CcvAIfvuOKmNI6mEP65fjV+z2mNa8Pk2eSRoMj67Bphr2wRCxM9qmV4uSO5xEuFMWO
         t7nNBNV+mJsAa9xnq5dxiUTLXPdoOKVkrr1O+Ivefau2Sy5n+PcU5NF8i8funyEVROPf
         4vJ83cA4ZXKac04glsZmnYWtHldE0iTwK+PwFUBpm1ECArXCsl20vNIGu6XlDe+05OGJ
         lTKqSIux2YbA+TRtoB0B8T4r0L/sTXOdDd9EhtmHrjqMLNLG9Sy7Q1XLsVWusRNbBq+g
         bskIMJsZjmInOCIwx4EmMen2ygIYxMbqncBX8K3GXGDn9C4xLlOcGKctHRMMyBkNmUHm
         bvdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBY+ITnRJ9pfFG03mLh22v/cLmpdl1nFeqTfnVCMjmhmXPc5Ye
	p7PpJfOExcumySGH1WTuisE=
X-Google-Smtp-Source: APXvYqz7HaFLs1eaObbUQInvtuowOXx9cnKAZk69CdXBfT3cACymgHFoRUDmH0YrX2C3gYU01zZlag==
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr7704706otl.328.1565176482365;
        Wed, 07 Aug 2019 04:14:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:2083:: with SMTP id y3ls1764800otq.3.gmail; Wed, 07
 Aug 2019 04:14:41 -0700 (PDT)
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr7879091otc.44.1565176481721;
        Wed, 07 Aug 2019 04:14:41 -0700 (PDT)
Date: Wed, 7 Aug 2019 04:14:41 -0700 (PDT)
From: dianaramos007@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <23d3e368-b653-41e9-bafc-65fe0d6a2eb4@googlegroups.com>
In-Reply-To: <a96c2d69-3449-b4e7-db1b-bf7a68708137@siemens.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
 <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
 <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
 <0a03b7bf-fcce-4de2-9a06-bb495cf47bb7@googlegroups.com>
 <a96c2d69-3449-b4e7-db1b-bf7a68708137@siemens.com>
Subject: Re: Problem with IVSHMEM on Bananapi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2632_2080434011.1565176481200"
X-Original-Sender: dianaramos007@gmail.com
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

------=_Part_2632_2080434011.1565176481200
Content-Type: multipart/alternative; 
	boundary="----=_Part_2633_32610377.1565176481200"

------=_Part_2633_32610377.1565176481200
Content-Type: text/plain; charset="UTF-8"


>
> Loadable does not imply that the root cell will get access to that region 
> automatically. You also need a memory region in the root cell that covers 
> this 
> area. Access to the overlap will be controlled by the hypervisor safely, 
> i.e. it 
> will be taken from the root cell once the non-root cell starts to run. 
>

It makes sense. I no longer have those unhandled traps related to RAM.

Now I'm having the follwing:

Unhandled data read at 0x1c2006c(4)
(...)

The debug console for bananapi is set like:

.debug_console = {
            .address = 0x01c28000,
            .size = 0x1000,
             //.clock_reg = 0x01c2006c, 
             //.gate_nr = 16 
             //.divider = 0x0d, 
            .type = JAILHOUSE_CON_TYPE_8250,
            .flags = JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },

And for bananapi-gic-demo:

.console = {
            .address = 0x01c29c00,
            .clock_reg = 0x01c2006c,
            .gate_nr = 23,
            .divider = 0x0d,
            .type = JAILHOUSE_CON_TYPE_8250,
            .flags = JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },

By the output and both configuration files, I suppose that that clock_reg 
from bananapi-gic-demo is triggering the trap. Can you please explain how 
this works and how I can manage to fix the situation?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23d3e368-b653-41e9-bafc-65fe0d6a2eb4%40googlegroups.com.

------=_Part_2633_32610377.1565176481200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin: 0;margi=
n-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Loadable does=
 not imply that the root cell will get access to that region
<br>automatically. You also need a memory region in the root cell that cove=
rs this
<br>area. Access to the overlap will be controlled by the hypervisor safely=
, i.e. it
<br>will be taken from the root cell once the non-root cell starts to run.
<br></blockquote><div><br></div><div>It makes sense. I no longer have those=
 unhandled traps related to RAM.</div><div><br></div><div>Now I&#39;m havin=
g the follwing:</div><div><br></div><div>Unhandled data read at 0x1c2006c(4=
)</div><div>(...)<br></div><div><br></div><div>The debug console for banana=
pi is set like:</div><div><br></div><div>.debug_console =3D {<br>=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .address =3D 0x01c28000,<br=
>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1000,=
<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0//.clock=
_reg =3D 0x01c2006c, <br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0//.gate_nr =3D 16 <br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0//.divider =3D 0x0d, <br>=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .type =3D JAILHOUSE_CON_TYPE_8250,<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_=
CON_ACCESS_MMIO |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0JAILHOUSE_CON_REGDIST_4,<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 },</div><div><br></div><div>And for bananapi-gic-demo:<=
/div><div><br></div><div>.console =3D {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 .address =3D 0x01c29c00,<br>=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .clock_reg =3D 0x01c2006c,<br>=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .gate_nr =3D 23,<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .divider =3D 0x0d,<br=
>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .type =3D JAILHOU=
SE_CON_TYPE_8250,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 .flags =3D JAILHOUSE_CON_ACCESS_MMIO |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0JAILHOUSE_CON_REGDIST=
_4,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },</div><div><br></div><div>By=
 the output and both configuration files, I suppose that that clock_reg fro=
m bananapi-gic-demo is triggering the trap. Can you please explain how this=
 works and how I can manage to fix the situation?<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/23d3e368-b653-41e9-bafc-65fe0d6a2eb4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/23d3e368-b653-41e9-bafc-65fe0d6a2eb4%40googlegroups.com<=
/a>.<br />

------=_Part_2633_32610377.1565176481200--

------=_Part_2632_2080434011.1565176481200--
