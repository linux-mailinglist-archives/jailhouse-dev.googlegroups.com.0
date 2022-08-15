Return-Path: <jailhouse-dev+bncBDKIHPWY7EBBBO455CLQMGQE32JP4BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3b.google.com (mail-oa1-x3b.google.com [IPv6:2001:4860:4864:20::3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DC592B24
	for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Aug 2022 11:15:41 +0200 (CEST)
Received: by mail-oa1-x3b.google.com with SMTP id 586e51a60fabf-117b96393f3sf1068524fac.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Aug 2022 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc;
        bh=Quc0Eus5xXr8J44YjOlUc5tit2Cyeq7pwLRAC4pxobI=;
        b=DDAMl/BiDs21h1h5yBUyoQEki9OZ8l1FR9OWWowCHdE8L53RV1nwQNKuW2BZxo+75U
         Sm/RFRQVoGM10gYpdv+gAHlh2dvBOP2dv/Kb8e0jf89NkXySfZZajEl57yHqgSbpehGD
         uN77zYTyrnCm0M11o12msYxTdNvBHX60ckqTSWB7mBBv+a9bTEcOZlG5fzVjxJ7af1zh
         jyn95sDTEHqDezJXsyCIe8UvbLM++9JeVdCYufeYssyo8GnVOX0yHccwarmyMUwQlrY2
         9zrkmg+S06sxkLcgyLm6ycDB4ESwXEzM43f7QBCSJiVvz58IwZC4uHtM8c2vRXVr3rLn
         e5wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc;
        bh=Quc0Eus5xXr8J44YjOlUc5tit2Cyeq7pwLRAC4pxobI=;
        b=AsqspM6Mg5D9Pejyj7c2WdZUu2gIZpybPpxThV/waVYPCvdSRnr70arearkVRTlW91
         kOjHh+1PgITU9TFUvrbYserNO7kAjn09rB7jcumz8awt2hEaJib26NDYAKvF6Bma/nv7
         3AolirfEgKhFMpYktxgfKn8cPoiSBLmTdDHR/AlEdovntaV7FJm5m37kIgC3ozS/0H20
         zomc9xukFp9B2BHiAhq6kFN5r1JUg2Y1pYo6Dcs2ePRQchL974WwiRxfy8b1P3hHVw8c
         z2XsEYw6QldLKPQasauRUCKpFNnL9XNbTQG80rfdkdb+0oGjZv+Icf81qdD7nsGiyyGP
         iICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc;
        bh=Quc0Eus5xXr8J44YjOlUc5tit2Cyeq7pwLRAC4pxobI=;
        b=Ps+bBIYNBXzTzLX2Pxa3JYWbFvbCuPmf/W+qgLucdr8VhWeyYd0IJDuL6o+Q0dh9lP
         nxmhok1YQXDjUO+O46BTShq9I6PYHDRrDuMSX6BXx8iin1534ieA+aJo5mU3foaP7Zse
         bh0ofK9qD0cMP6Cq5Ofy8j0fYlr+5meldp8PWLXX5efGOFh4uYoLVCjGQLi8VHi2+CPf
         N3/MznG8TlH+zAdTQrErqN7VLo1uk4Qc6Rj6jDRwi7xUb0GcRocGxHQi/F2t9Wdev8vn
         FvubDNqfpRJqzui732LA1FQ9TiL2chP7jj29LtsnQ56eAlg36qjmiv6SU13KIZhpCOkP
         e0Ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2rSWusz6WT/mrqYoh6O6wa+IIp+YjJVxLZT3UwFcpcwl8MgEHE
	zbLDyASJp6EvlMlmCWMsKFw=
X-Google-Smtp-Source: AA6agR6jZ67rR4CDeI83wvunoNSHFtlRMlOO5XSiQtT9x6DXCkg32Z28qNmqAMtk2Kai4YrNkQ3grQ==
X-Received: by 2002:a05:6870:63a8:b0:10e:ecbb:4fab with SMTP id t40-20020a05687063a800b0010eecbb4fabmr6432475oap.158.1660554939666;
        Mon, 15 Aug 2022 02:15:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:7402:b0:10e:db06:522d with SMTP id
 x2-20020a056870740200b0010edb06522dls2729537oam.0.-pod-prod-gmail; Mon, 15
 Aug 2022 02:15:38 -0700 (PDT)
X-Received: by 2002:a05:6871:80f:b0:113:6109:7e11 with SMTP id q15-20020a056871080f00b0011361097e11mr6376280oap.126.1660554938739;
        Mon, 15 Aug 2022 02:15:38 -0700 (PDT)
Date: Mon, 15 Aug 2022 02:15:38 -0700 (PDT)
From: Rasty Slutsker <rslutsker@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f431434c-f52d-4d25-82c5-f8fae3bf1b16n@googlegroups.com>
Subject: am5726 interrupt to inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_402_2141740570.1660554938143"
X-Original-Sender: rslutsker@gmail.com
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

------=_Part_402_2141740570.1660554938143
Content-Type: multipart/alternative; 
	boundary="----=_Part_403_375470675.1660554938143"

------=_Part_403_375470675.1660554938143
Content-Type: text/plain; charset="UTF-8"

Hi 
We try to port TI RTOS application to hypervisor (inmate running on Core1).
We have bizarre problems with interrupts.
1) If we use interrupt from timer, inmate got interrupts without any 
problem. Which is good.
2) if we use interrupt from Input pin (IRQ and I/O port are skipped  as 
described in guidelines) we get interrupt *only if we have a context switch 
in rtos* (when RTOS re-enables interrupts when leaving some critical 
section).
3) sys_nirq1 is not delivered to inmate at all

From Sitara perspective all interrupts: timer, GPIO Input  and sys_nirq1 
are delivered to GIC in the same way.

Any idea?
Some refence to explanation of mechanism (to doc or to code) of irq routing 
between cores would be highly appreciated? 

Best regards
Rasty

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f431434c-f52d-4d25-82c5-f8fae3bf1b16n%40googlegroups.com.

------=_Part_403_375470675.1660554938143
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi&nbsp;<div>We try to port TI RTOS application to hypervisor (inmate runni=
ng on Core1).</div><div>We have bizarre problems with interrupts.</div><div=
>1) If we use interrupt from timer, inmate got interrupts without any probl=
em. Which is good.</div><div>2) if we use interrupt from Input pin (IRQ and=
 I/O port are skipped&nbsp; as described in guidelines) we get interrupt <i=
>only if we have a context switch in rtos</i> (when RTOS re-enables interru=
pts when leaving some critical section).</div><div>3)&nbsp;sys_nirq1 is not=
 delivered to inmate at all<br></div><div><br></div><div>From Sitara perspe=
ctive all interrupts: timer, GPIO Input&nbsp; and&nbsp;sys_nirq1 are delive=
red to GIC in the same way.</div><div><br></div><div>Any idea?</div><div>So=
me refence to explanation of mechanism (to doc or to code) of irq routing b=
etween cores would be highly appreciated?&nbsp;</div><div><br></div><div>Be=
st regards</div><div>Rasty</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f431434c-f52d-4d25-82c5-f8fae3bf1b16n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f431434c-f52d-4d25-82c5-f8fae3bf1b16n%40googlegroups.co=
m</a>.<br />

------=_Part_403_375470675.1660554938143--

------=_Part_402_2141740570.1660554938143--
