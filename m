Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBT7T4D4AKGQEVJ5DY2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C32298F4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 15:06:26 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id 75sf1544398pga.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 06:06:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595423184; cv=pass;
        d=google.com; s=arc-20160816;
        b=tD8hLv5A2KD0LwFkJLNz0gDK7dZzgVCRkFdcvYwhzg5Ys1yHD30ZDbkdIKt5EgIdgU
         GqZxzrFDbZ/IklW4WMZRfFVV7FFh5CQAIvMUglGMl3cc4eD1zMyoM2TqjwZByypYq/6u
         LVdZRNTeLx6wP9lPTDZdnutw56+5eKaFqmYAdk2fyVTbtdkr4bIvSeSh9Bma5bR5G3Rp
         OSr3V6u3GfW++jCxINHolM82I3rCtt/6P3/GJjXeVEyvnBvshwN/EgwfEO8R0WaLTw6+
         o4HbWOdfMuGhsArC/eW343jYQ8Fdxbwa96iPQb5+86r3xWdLkQ9GVsA6WiXbf4omy54L
         StKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=Mpe92Xh9RUauJwJiWAsylYj1XR92xxf92fPo04C+FSg=;
        b=z3Sv5RO2a7fGSJJWmVUoFz80JR3sJqxKAcXABUB0DYTc0Hb0VXo4iXq2Cn0CYYW99S
         vnVJFjPX3QTjDLiPMlaAPZk6sz0GDH4H9jlgNtzv9cku5fYmPSMRTPMzwpyz0Ak7asYw
         u9L36vFJeDIb2mxQOejh0IqbqFU5qhx/AGGdhkApVx2ceQT3YQvFZuPEzNhsCpncwc5z
         r9vacg2JGwxQBZKvEybFZWwVReGFp96llOgtm7J0TaFOb3g7dGIoSJdc7NSX+TGKMIIS
         EHQR8IWORmW4iuZuwEJfga2RclMNwD4sgtau+UEMpP7o8dIwZ/6JDFutFTuW73ujfVEQ
         br+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=zCK3HHFh;
       spf=neutral (google.com: 2607:f8b0:4864:20::333 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mpe92Xh9RUauJwJiWAsylYj1XR92xxf92fPo04C+FSg=;
        b=aDNH9TBuk6ntsQKNt2N7phSEP9bMvAKgSEXqUoLIdnMGtxOuV4dWykaL5dzRORIdN4
         op8DKdbWNLvW/zF5IhdDk28I3EjZhs9U1rM5aoevfO+Kl6Fdsh93z/wCECux2SDTnFM4
         3VeqcuOEcjHjlwfMb+sL0eqHKNfYjb8++L5fYSZnlKvcwH1WjUtcTaj70KNZDdU4kICd
         GIQUe3o9haOL4p7sd5Z6NIU3Zp2VZWQ0WXzTk2klS0+q/wogq3EIaquVoaSzdFVcclCW
         6mF2UDVU7cVAp1Yy5Q753bc4SkUNwnwnVi33pGcDMOYg3c+NoUNaD7vCGBzHS/r/Rr9C
         BInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Mpe92Xh9RUauJwJiWAsylYj1XR92xxf92fPo04C+FSg=;
        b=Vh5URm013WNn4NQk5CktWlt7fNH/3U0fHe0WO7KgGB0LfjygxM2NqmhgNrFKCvfEmc
         hFaH/jZZxlkpI1/goXa1PjP80wabii9jPtOAOFElb99yHPGxBq7Jgo3RDPI3Est+ksN4
         rJ1NhcWmDtUqPUxybx7f85/yXLgb3CHa8paxhnfXsI2QiU2gD3Sj028wsL0YxOfdFlWn
         A408eXMekIjkOMkvDNx3vwNbNmLEwIPlDZVzOKYOUUll9q5F30nstdBJaIFsM5r3gcrf
         ns5cPaJYnt5WnI7UuNw4yKgH5RRCnv+8npB/aiqZHGF0R24sYDPCITeKD0nIbtMXGTXU
         wX3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LL+XQuaE/9QJUhFsAcwgwwAOiyMCU4TIw924tF4kdFLIHSqQP
	KBYJPJ1uOGkF5eoX/dY/1K8=
X-Google-Smtp-Source: ABdhPJwUTr5UCZu4RtY8jTFBMbfH7Cg/eXyjMW7VbOtPSefP5tOjIdwabzsmOQSnjOSJaM/nkrTAsg==
X-Received: by 2002:aa7:942e:: with SMTP id y14mr28683764pfo.58.1595423184448;
        Wed, 22 Jul 2020 06:06:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:4282:: with SMTP id p124ls681313pga.7.gmail; Wed, 22 Jul
 2020 06:06:23 -0700 (PDT)
X-Received: by 2002:a63:7c42:: with SMTP id l2mr27403274pgn.35.1595423183412;
        Wed, 22 Jul 2020 06:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595423183; cv=none;
        d=google.com; s=arc-20160816;
        b=yBdwIGFuG4g+J/v5hQF8n01qDuJkaKigwPn4nsOEASU/Ac2RW6a8ZTTudi/YNFnKUL
         MT5KkNtwz9KNkLqNvLyULiXpts1Ckj+sL20jL98VoTzeC+mTnguk7p0Cjtt4FB2ksC4H
         TYdhDPh2XtOIiSQjXrmAeAYc4BM43r+JKKxi2G6VhqsaiIoKuRfEyYbn7d1sstJeeIJC
         NnGmZMzu72U5gWLbzqz9PYCmg9ZxFgp30fFux9kqbm4i8NsnSq93KkPGjm8wtEeBn/l5
         3zo2FcVIC3vSdPEjJEcXFgIlp1rB6AK5KBp/fnozNwLwoxfEbXKVEBswjVLJANmDbxOg
         zOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZmqhYPen/VfdtRvP+OHu0mWIhDLe66D9J7ef97o0Y34=;
        b=KF2NwoQHfdXvAA0Y9EkQNj5mkhAsHIodjvmpnDt1ZCyyCVS531eK3tk3kjwYQ1orvr
         S8vuDoH7RYHhNBMR9kjyY73GKN9SRywvp3aENxbnEysGz6m17/MlLWFyyfkg3MYdHjnU
         ICpgHQ1+Hm98XYK9H8VTnTGkilzPU0yjfKGdgphwIGyTwsA+9HITLpjU9iA1hU/0ccxA
         GjNgy1BxWjmUShyei5UvdDALGnO5oQxarinnH6xXYfdlpW+SRvdXUxsOiGugQsl4sNL4
         kzGk24dCKlw7IWWJ8gZGMcXuU1aak2M0j9oHLUJ7odold1c5834jSW/AuahItSk869gL
         pWxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=zCK3HHFh;
       spf=neutral (google.com: 2607:f8b0:4864:20::333 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com. [2607:f8b0:4864:20::333])
        by gmr-mx.google.com with ESMTPS id cp21si252785pjb.3.2020.07.22.06.06.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 06:06:22 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::333 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::333;
Received: by mail-ot1-x333.google.com with SMTP id w17so1688959otl.4
        for <jailhouse-dev@googlegroups.com>; Wed, 22 Jul 2020 06:06:22 -0700 (PDT)
X-Received: by 2002:a9d:da7:: with SMTP id 36mr27160449ots.133.1595423182064;
 Wed, 22 Jul 2020 06:06:22 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Wed, 22 Jul 2020 15:06:11 +0200
Message-ID: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
Subject: Root cell configuration for RPi4 with more than 1G of memory
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000008a07905ab0768f9"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=zCK3HHFh;       spf=neutral (google.com: 2607:f8b0:4864:20::333 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--00000000000008a07905ab0768f9
Content-Type: text/plain; charset="UTF-8"

Hi!

For the project I'm working on I would like to allow Jailhouse to use more
than 1 GiB memory on the Raspberry Pi 4. Following the memory map from
BCM2711 documentation (
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rpi_DATA_2711_1p0.pdf
) and /proc/iomem, I added this section into rpi4.cell:

/* RAM (1024M-4032M) */ {
.phys_start = 0x40000000,
.virt_start = 0x40000000,
.size = 0xbc000000,
.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},

When I left mem=768M in the kernel command line, everything worked as
before. But I wanted to use more memory, so I made a reserved-memory
section in a device tree overlay. It reserves the range of 768M-1024M and
verified it's working as expected in /proc/iomem. However, when I try to
enable Jailhouse using the modified rpi4.cell, I get this error:

root@demo:~# jailhouse enable rpi4-4g.cell

Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 3
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
CPU 3... OK
CPU 0... OK
CPU 2... OK
CPU 1... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Raspberry-Pi4 4G"
Adding virtual PCI device 00:01.0 to cell "Raspberry-Pi4 4G"
Page pool usage after late setup: mem 61/994, remap 5/131072
FATAL: instruction abort at 0xfbfff7c0

FATAL: forbidden access (exception class 0x20)
Cell state before exception:
pc: ffffffc0089fd7c0   lr: ffffffc0089fd7c0 spsr: 20000085     EL1
sp: ffffffc01000bef0  esr: 20 1 0000086
x0: 0000000000000000   x1: 0000000000000000   x2: 0000000000000000
x3: 0000000000000000   x4: 0000000000000000   x5: 0000000000000000
x6: 0000000000000000   x7: 0000000000000000   x8: 0000000000000000
x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: ffffffc008a04c28  x20: ffffffc014800000
x21: 0000000000000000  x22: 0000000000000001  x23: 0000000000000000
x24: 0000000000000001  x25: 0000000000000001  x26: ffffffc010fe3dc0
x27: 0000000000000000  x28: ffffff80f6da5940  x29: ffffffc01000bef0

Parking CPU 1 (Cell: "Raspberry-Pi4 4G")

The address 0xfbfff7c0 is in the range that is mentioned in the added RAM
section.

Any ideas or hints what else could be wrong?

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g%40mail.gmail.com.

--00000000000008a07905ab0768f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br><br>For the project I&#39;m working on I would like=
 to allow Jailhouse to use more than 1 GiB memory on the Raspberry Pi 4. Fo=
llowing the memory map from BCM2711 documentation ( <a href=3D"https://www.=
raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rpi_DATA_2711_1p=
0.pdf">https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm27=
11/rpi_DATA_2711_1p0.pdf</a> ) and /proc/iomem, I added this section into r=
pi4.cell:<br><br>/* RAM (1024M-4032M) */ {<br>.phys_start =3D 0x40000000,<b=
r>.virt_start =3D 0x40000000,<br>.size =3D 0xbc000000,<br>.flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>JAILHOUSE_MEM_EXECUTE,<br>},<br><br=
>When I left mem=3D768M in the kernel command line, everything worked as be=
fore. But I wanted to use more memory, so I made a reserved-memory section =
in a device tree overlay. It reserves the range of 768M-1024M and verified =
it&#39;s working as expected in /proc/iomem. However, when I try to enable =
Jailhouse using the modified rpi4.cell, I get this error:<br><br>root@demo:=
~# jailhouse enable rpi4-4g.cell =C2=A0<br><br>Initializing Jailhouse hyper=
visor v0.12 (59-g4ce7658d) on CPU 3<br>Code location: 0x0000ffffc0200800<br=
>Page pool usage after early setup: mem 39/994, remap 0/131072<br>Initializ=
ing processors:<br>CPU 3... OK<br>CPU 0... OK<br>CPU 2... OK<br>CPU 1... OK=
<br>Initializing unit: irqchip<br>Initializing unit: ARM SMMU v3<br>Initial=
izing unit: PVU IOMMU<br>Initializing unit: PCI<br>Adding virtual PCI devic=
e 00:00.0 to cell &quot;Raspberry-Pi4 4G&quot;<br>Adding virtual PCI device=
 00:01.0 to cell &quot;Raspberry-Pi4 4G&quot;<br>Page pool usage after late=
 setup: mem 61/994, remap 5/131072<br>FATAL: instruction abort at 0xfbfff7c=
0<br><br>FATAL: forbidden access (exception class 0x20)<br>Cell state befor=
e exception:<br>pc: ffffffc0089fd7c0 =C2=A0 lr: ffffffc0089fd7c0 spsr: 2000=
0085 =C2=A0 =C2=A0 EL1<br>sp: ffffffc01000bef0 =C2=A0esr: 20 1 0000086<br>x=
0: 0000000000000000 =C2=A0 x1: 0000000000000000 =C2=A0 x2: 0000000000000000=
<br>x3: 0000000000000000 =C2=A0 x4: 0000000000000000 =C2=A0 x5: 00000000000=
00000<br>x6: 0000000000000000 =C2=A0 x7: 0000000000000000 =C2=A0 x8: 000000=
0000000000<br>x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 0=
000000000000000<br>x12: 0000000000000000 =C2=A0x13: 0000000000000000 =C2=A0=
x14: 0000000000000000<br>x15: 0000000000000000 =C2=A0x16: 0000000000000000 =
=C2=A0x17: 0000000000000000<br>x18: 0000000000000000 =C2=A0x19: ffffffc008a=
04c28 =C2=A0x20: ffffffc014800000<br>x21: 0000000000000000 =C2=A0x22: 00000=
00000000001 =C2=A0x23: 0000000000000000<br>x24: 0000000000000001 =C2=A0x25:=
 0000000000000001 =C2=A0x26: ffffffc010fe3dc0<br>x27: 0000000000000000 =C2=
=A0x28: ffffff80f6da5940 =C2=A0x29: ffffffc01000bef0<br><br>Parking CPU 1 (=
Cell: &quot;Raspberry-Pi4 4G&quot;)<br><br>The address 0xfbfff7c0 is in the=
 range that is mentioned in the added RAM section. <br><br>Any ideas or hin=
ts what else could be wrong?<br><br>Jakub</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm=
0LzgWS7g%40mail.gmail.com</a>.<br />

--00000000000008a07905ab0768f9--
