Return-Path: <jailhouse-dev+bncBD65FYEH6ABBBPUPVOSAMGQEAGOCR6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F57311CE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Jun 2023 10:11:44 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-bc501a1b17fsf2014331276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Jun 2023 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1686816703; x=1689408703;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ3QcUO1sbEVEYd9Vfz65MeTiqdJlBjCu8zgQRWs3jQ=;
        b=oZTgHrlKvSlP/YXiXWppDZMDWyRLhj6dDnTC4O/eKunmIRtlf6zs5sVNATiAEOl3AT
         RCK6jafYqinCXrbLh1Swo51BK1VjKpyI76DpyMV++SSHRfyYpJ1XzoWbV3GPKaqt8/3a
         XiZoNvZBTyp0L27pPWPid+2QuA3ioSLNxduuHJyQxY6IwnD0STOGngLUXzR2Skjf8bib
         X2nBz5IQrNCYf3J9bxbRtYmJyFqvnLvsPPib5w7VHp6IyYH91lGOw9eqgjylkcd882f7
         Wc5b0PAyWhgLUSRAQqVq2Kl5QZaBVelZF0uI8U+NfVMlJiGSK4S+eHtaCDn/ZvzGWGtI
         O2oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686816703; x=1689408703;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ3QcUO1sbEVEYd9Vfz65MeTiqdJlBjCu8zgQRWs3jQ=;
        b=pdgbCXfYG+vVb0FvWxtYYk4JuScRKxcOBXjGwpa5byKUy2DKoNqxGURmaT7e55ra7l
         MvyIgOcOprXd/qa0IvSaTIJi8Z6OxYVx3Pp3h5xiUBDHK3lRJ5eE2xrR5aEQI9AbKfLf
         rHtH+IjI7TBnfcpqU++hIH8Tjn0u8B6upsuFajeYQCST6mvzyjpvy0W7VHiALjw6U8Qw
         HdspNv2Xn/raX2VZeiLLEDa/c/G/y2ygyMN7zQ0egL8G4ghrt4Rquk7w10sm0RFgsjmZ
         05T0YKs7c5mRbIRK6IdX6dnZYgpsJHFIgqgwiwmGJ5CPrCB+fz8Ruvo834c+kmfD46Ee
         7xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686816703; x=1689408703;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ3QcUO1sbEVEYd9Vfz65MeTiqdJlBjCu8zgQRWs3jQ=;
        b=Zr4Mvp7Y3jqYasVqP/SLTdxyFtcIj51GD9Ox+nx/wO9KYg4kcGam0nyGArrj+V/uPm
         2g0uYQOVy2MkHZHaV8FKurtgw61L03x566fY6Mejlb7B3s9dqhzdT/mR8diieXVmTx4O
         tkL6Mhle5K/SiQzSMRXmJXRZ+zarlImoY/RqTWHloSOyxaUcl6xe6uF0ItH6ps3XlSkE
         EHFLqc9mv+A5ffXWipLj922lflMfN1l12/gIZp8oEQ+/dyro7lmmwukWoKXaa0DCuojG
         On4oqSixbEDGLpoMN/+pCbQ13RO4LryOGe9C1FEmPON+3/DvkXCknrX9FAbXhlSCBvJL
         kWDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyM5BKUYiYeEULiOKeY1waa4n+VNJ6MHAOxB1ey0RnDs0olWZGa
	ww0wElTK87zhA4aWMTx933Y=
X-Google-Smtp-Source: ACHHUZ56k4dGDRSPshJdG0TQuGXVEhID14NJPQrbTBO36jW3pEhi9YZG08V3N3ftCRzMtISLOBaOIQ==
X-Received: by 2002:a25:495:0:b0:bd0:1f43:5618 with SMTP id 143-20020a250495000000b00bd01f435618mr4024642ybe.58.1686816703237;
        Thu, 15 Jun 2023 01:11:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ac97:0:b0:bc6:44e9:7fe0 with SMTP id x23-20020a25ac97000000b00bc644e97fe0ls1161504ybi.0.-pod-prod-07-us;
 Thu, 15 Jun 2023 01:11:42 -0700 (PDT)
X-Received: by 2002:a81:ac1f:0:b0:562:837:122f with SMTP id k31-20020a81ac1f000000b005620837122fmr1913947ywh.9.1686816702035;
        Thu, 15 Jun 2023 01:11:42 -0700 (PDT)
Date: Thu, 15 Jun 2023 01:11:41 -0700 (PDT)
From: sai krishna Allu <saikrishna.allu@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
Subject: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7570_1242228106.1686816701377"
X-Original-Sender: saikrishna.allu@gmail.com
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

------=_Part_7570_1242228106.1686816701377
Content-Type: multipart/alternative; 
	boundary="----=_Part_7571_1491710881.1686816701377"

------=_Part_7571_1491710881.1686816701377
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I have Raspberry Pi 4, which is installed with Ubuntu 20.04.5 LTS 64 bit.
after loading the jailhouse.ko file, when I gave following command I am 
getting the exception.

ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cell

Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
 CPU 0...
FATAL: Unhandled HYP exception: synchronous abort from EL2
 pc: 0000ffffc0203820   lr: 0000ffffc020380c spsr: 800003c9     EL2
 sp: 0000ffffc021ee40  esr: 00 1 0000000
 x0: 0000000084000000   x1: 0000000000000008   x2: 0000000080003580
 x3: 0000ffffc020e170   x4: 0000000000000014   x5: 000003ffffffffff
 x6: 0000000000000029   x7: 0000ffffc0219d30   x8: 000000000000002a
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001
x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000
x15: 0000ffffc0015040  x16: 0000ffffc020d1fc  x17: ffffbcae22826688
x18: 0000000000000001  x19: 0000ffffc021e000  x20: 0000ffffc0219000
x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000000
x24: 0000000000000001  x25: 0000ffffc021e000  x26: 0000ffffc021f000
x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc021ee40

Hypervisor stack before exception Stopping CPU 0 (Cell: "Raspberry-Pi4")


Please suggest how to fix this problem.

Regards,
Sai Krishna

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com.

------=_Part_7571_1491710881.1686816701377
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,<div><br /></div><div>I have=C2=A0Raspberry Pi 4, which is installe=
d with Ubuntu 20.04.5 LTS 64 bit.</div><div>after loading the jailhouse.ko =
file, when I gave following command I am getting the exception.</div><div><=
br /></div><div>ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/ar=
m64/rpi4.cell<br /></div><div><br /></div><div>Initializing Jailhouse hyper=
visor v0.12 (0-g92db71f2) on CPU 0<br />Code location: 0x0000ffffc0200800<b=
r />Page pool usage after early setup: mem 39/994, remap 0/131072<br />Init=
ializing processors:<br />=C2=A0CPU 0...<br />FATAL: Unhandled HYP exceptio=
n: synchronous abort from EL2<br />=C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 00=
00ffffc020380c spsr: 800003c9 =C2=A0 =C2=A0 EL2<br />=C2=A0sp: 0000ffffc021=
ee40 =C2=A0esr: 00 1 0000000<br />=C2=A0x0: 0000000084000000 =C2=A0 x1: 000=
0000000000008 =C2=A0 x2: 0000000080003580<br />=C2=A0x3: 0000ffffc020e170 =
=C2=A0 x4: 0000000000000014 =C2=A0 x5: 000003ffffffffff<br />=C2=A0x6: 0000=
000000000029 =C2=A0 x7: 0000ffffc0219d30 =C2=A0 x8: 000000000000002a<br />=
=C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 000000000=
0000001<br />x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0x14: 0=
000ffffc0219000<br />x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=
=A0x17: ffffbcae22826688<br />x18: 0000000000000001 =C2=A0x19: 0000ffffc021=
e000 =C2=A0x20: 0000ffffc0219000<br />x21: 0000ffffc0200000 =C2=A0x22: 0000=
ffffc0219000 =C2=A0x23: 0000000000000000<br />x24: 0000000000000001 =C2=A0x=
25: 0000ffffc021e000 =C2=A0x26: 0000ffffc021f000<br />x27: 0000ffffc020f000=
 =C2=A0x28: 0000ffffc0218000 =C2=A0x29: 0000ffffc021ee40<br /><br />Hypervi=
sor stack before exception Stopping CPU 0 (Cell: "Raspberry-Pi4")<br /></di=
v><div><br /></div><div><br /></div><div>Please suggest how to fix this pro=
blem.</div><div><br /></div><div>Regards,</div><div>Sai Krishna</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.co=
m</a>.<br />

------=_Part_7571_1491710881.1686816701377--

------=_Part_7570_1242228106.1686816701377--
