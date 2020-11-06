Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4GKST6QKGQE6WXHYOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A22A9457
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Nov 2020 11:29:06 +0100 (CET)
Received: by mail-pg1-x538.google.com with SMTP id s4sf630253pgk.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Nov 2020 02:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604658545; cv=pass;
        d=google.com; s=arc-20160816;
        b=xbzKxdVgyWBIg1zCGyDXeeFo/nQCokAygr7cA+Dr/rZpw+omNcl5jBdST3T7sbdcuk
         FIVG/OiOKG8uyDV6+QID5pE/0bakv3FyiZOjzc9VoX3Vo0TnIO1c1znNcgAFe0eJpMsi
         yNohIGuDdmE52JQU6BshCHNODp90pj7dOCZzC3eU4iggRp0Kntw0SmupuIKRgrZLLqWe
         Mg44FRMPIvjL9u3WUuzl1TfrLmAKIbieteTmApcWZeD6/Gyo0//DBKoI8F7Zmfader+E
         bCdQhaOuoknGcicgS8oFZltiIGUZ6RoP/9gz31YGavW+d4gT18YV97V3pWUQ8tE/OiSZ
         zyuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=qQEUTnojKLiu247ncKy4BEyJziHTgXpmg0dduVk7/gg=;
        b=dEbffI9ULgTw7hHyOoSUyaTmQk1E0V1ZMGctKnl17CjUdA9yhtZsTqKZEXpZ4GO2rf
         /wQie5vHM4roiTIPq4Y04dc5HiUN5Ag4F2nk/GafSDYD846deeKGiof+TsKs065d6nog
         cgSTxACL8/OzdILC9EjMNQAJO08br2TiH6j6/rPDr76rff/q0Oh1RSwNg1E1sMdS5NmF
         aH705L+4M7xQ9grtqd8jZioDMXy0Cy9y7Pn/++YUB+4ZA3dpt/K+Mk0UAepDy23t0Q3Q
         +3WUJcFPX7+EWYRxT4lu1XUA1hOP6ZOH0peMFiqJTGgSe3XhuZIKbOrQHJCUz/CZ3Cv8
         OALw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GfB41ZDC;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qQEUTnojKLiu247ncKy4BEyJziHTgXpmg0dduVk7/gg=;
        b=gu4vWLprg9O53fT6yF7kXgsKh8jHKRTO/Zo+Uso/YTitAVBF8hrNwEYRYQr6V7K6Wj
         n4ebpesyVMTF1+x6B5Bne6p1nUZWk5gBSBQR+MT+P4WbqEdvWtn/cf8ltjl7cWyHCpia
         hdObwJc1Fw1QeVFoEbhzTUxCv9CJbQlfGzVl+jcJAQG4zFeZetZsmDU0RD4CXovnw55h
         k3Wlx8vE/G3bSZu8WJQOpSI+vt44QzwztRuGweZET0MXJ4XUEXiSqzVB3r7JcuLndwTS
         +tsHupfTS+RQ0vo2ZEWkhiqHvmDyfpNLrJupnIsk52g41z5tgS6E9Aujz/QQ6Qopf8kF
         zJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qQEUTnojKLiu247ncKy4BEyJziHTgXpmg0dduVk7/gg=;
        b=Pkbv3AkcL2xVKNGshPMOfsu4eM1xZgnh4Ck3oyPPKHppz+shXsh0lZWWrlMcDVxaWl
         XfC3ic0pUNyePI0LDW7cCTkbjywExDIkf9q9Ej4GlA0T2SqnM+Pslw1ew0XzvTXnPeSu
         tAQpMYqjp4s39/2bEwFMd1icY02T0isqZC3OT7yr/ibRnGPCcQdg9zbaTiflz2+MlaSl
         7oEhS4/TIjJZBF2XcHJBp2E8Bp9MkR7ZE8x92C4dC1WHErB76HTQYbIjayiTL0ppN539
         kRAETbqA+NWSqjhWkH0S0vLa2ogFjx89d02kuQFYmzC0CnenoDKR4ow1WqQDwQ40AF4H
         GSYg==
X-Gm-Message-State: AOAM5322xDlFVPeUffSSayemFuxftmq9RH6NVjeuuPNtaEcO8fuj/SVt
	JxqmL9JpUTurcrAGKM00Lrw=
X-Google-Smtp-Source: ABdhPJwKSIv8mLYRt124pwuoO/qsfdqI2labqnI2T3I9TWXlSEX14mbdpVPxpnkJmV7UsqhPfH2BNA==
X-Received: by 2002:a63:af08:: with SMTP id w8mr1183558pge.419.1604658545076;
        Fri, 06 Nov 2020 02:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:a107:: with SMTP id s7ls622793pjp.1.canary-gmail;
 Fri, 06 Nov 2020 02:29:04 -0800 (PST)
X-Received: by 2002:a17:90a:4a0f:: with SMTP id e15mr1689483pjh.151.1604658544116;
        Fri, 06 Nov 2020 02:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604658544; cv=none;
        d=google.com; s=arc-20160816;
        b=fyxAQr7zbYDt6o/k0CyZ6nDH5xApQDOuvfVjMyRIclPx8sJr5y5ts5QpqrNZPTOVii
         BPKKG8RqhywUYsnjyE+4cx3m7dSIpRJy20FVCSTM3n1LrABGNv9W33GMFZ070/pEuNRt
         5Jb4BmdpB6VafGTKzMpGc8UAsFE1NGsAOd4cTma75/qUQinkfvItsrw3On1TMDqI7+xx
         dnegY4bzUgnPrgguueIQ3RfO2YYh5tML9cEP9awWpVhKMsXaZCY8HoEuiUwvz78Mh442
         Jig345ZTJqr/s3b3+/yO+13D+ezGRkMZyi0vg39+la/cutKUOBt9RR2mA2fKSLbIi7wR
         t9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=YfkiBYVtJdMup03hz5dsel1e1wTxFy2KabJT/he2tBs=;
        b=D/MoKJQ9O2n9012IV0alc6AjfkKF+MQGolsAbZN1U6XrsM6q60EdYxRxkWX4iG8rN1
         l17opBYLD2OeINaYR35Um2S76cWg2hhpwYBt2bWZv1Tk1Jb/MyB+YDm5eoTvdto4g1qO
         ZFSc3QS7IaNiuwU/oHgnXyyRaNqJT72M3Zbkk/Mqu7aSkxEhBtjl8cjclls0ct+xQ8Z0
         1RDVwFH66fBNO6r11Bz0XjwMqCvpj/cqnRDNsE94SVSjBzfurxcpJkdacJbwzyJMhUOO
         SAHK5x0KrRE//8dBzj08KGMmkE+mzjmUdRYdMqyYfUryITHR9DmI4mRnBvsddM2LjiLl
         NkJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GfB41ZDC;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d2si71677pfr.4.2020.11.06.02.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 02:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6AT3uB053860;
	Fri, 6 Nov 2020 04:29:03 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6AT2dU092151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2020 04:29:03 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 04:29:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 04:29:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6AT1O6010078;
	Fri, 6 Nov 2020 04:29:02 -0600
Date: Fri, 6 Nov 2020 15:59:01 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: "Liang Jingyan (M)" <jingyan.liang@marelli.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Xiao
 Jianhao (M)" <jianhao.xiao@marelli.com>,
        "GAO Zhao (M)"
	<Zhao.Gao@marelli.com>,
        "THOMAS Deuilhe (M)" <deuilhe.thomas@marelli.com>
Subject: Re: [J7] jailhouse hypervisor in TI J7
Message-ID: <20201106102901.i4qk35q4g6eqglhu@NiksLab>
References: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=GfB41ZDC;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

On 06:30-20201106, Liang Jingyan (M) wrote:
> Dear Jailhouse develop Team,
>=20
> We are Marelli(Guangzhou) Team, We are now developing TI J7 board, as we =
know, TI use the jailhouse hypervisor with their Cockpit Demo. Now Marelli =
team want to know more detail about the jailhouse hypervisor, we have some =
questions, Could you pls help to confirm? Thanks.
>=20

Hello,
You can find answers to many of the questions in the Jailhouse source
README and Documentation. I recommend you to go through these


[1] README https://github.com/siemens/jailhouse/blob/master/README.md
[2]=20

I will try to answer a few of the questions.

> Question:
>=20
> 1.       Can the hypervisor allocation HW resource dynamically when hyper=
visor running?
>=20
No this is against the Jailhouse's design of partitioning the resources
statically.

> such as below resource, could be dynamically changed?
>=20
> a.       CPU core (Adaptive cpu resource share)
>=20
> b.       DDR size (Adaptive memory resource share)
>=20
> c.       GPU core (Virtual GPU module share)
>=20
> d.       GPIO/I2C/SPI/I2S etc.
>=20
>=20

>=20
> 2.       if the hypervisor could not allocation HW resource dynamically, =
how the design logic of  hypervisor allocate resource?
>=20
> pls share some introduce documents if have.
>=20
>=20

Jailhouse does not and will not support dynamic allocation. For
deterministic performances, all the resources are statically
partitioned

>=20
> 3.       Does the hypervisor have some KPI data?
>=20
> such as below info
>=20
> a.       How Fast boot time when OS mount filesystem;
>=20
> b.       How Fast boot time to show first image?
>=20
> c.       How Fast boot time to play audio?
>=20
> d.       How Fast boot time to show RVC?
>=20
> e.       How Fast boot time to run second OS filesystem and touch?
>=20

This varies across different platforms.
There is no benchmarking data for the TI platform

>=20
>=20
> 4.       What=E2=80=99s the communication solutions between different OS?
>=20
> Does it support sharemem, socket, or another fast/ large-capacity data co=
mmunicate method?
>=20

Jailhouse supports following
* IVSHMEM demo - a simple application to send receive simple messages
* ivshmem-net - a networking device which allows to communicate different
VMs using sockets.

>=20
> 5.       Does the hypervisor Support posix interface or not? have some me=
thod that easy for porting Application from our former OS?
>=20
> if do not support posix, have another method to port easy?
>=20

OS can run unmodified on Jailhouse. It need not know about the
underlying hypervisor. Also, Jailhouse does not affect the application
binary interface and there won't be any application (user space) level port=
ing.

>=20
>=20
> 6.       Pls list the hypervisor Support how much connectivity features;
>=20
> such as BT/ BT LTE, Wi-Fi, ethernet stack pass TC8 test, USB Ethernet(NCM=
, RNDIS),  ZigBee etc.
>=20

These are features generally supported by the OS not hypervisor.
If the standalone Linux supports these features, it should continue to
support them with Jailhouse as well.

>=20
> 7.       pls list how many Host OS does hypervisor support So far? (such =
as Linux, Linux AGL, QNX for Cluster etc)
>=20

Jailhouse is verified on ARM64 platforms with Linux, FreeRTOS, baremetal
code, etc

>=20
>=20
> 8.       Pls list how many Guest OS does hypervisor support So far? (such=
 as Linux, Android, Linux AGL, QNX for IVI etc)
>=20

Same as above
>=20
> 9.       Does the hypervisor had Supported 3rd party SW lib(such as DOIP,=
 SOMEIP, Adaptive Autosar, OTA solution) ?
>=20

There is no official 3rd party software that Jailhouse recommends

>=20
> 10.   what kind of program language(such as C, C++, Python, Java, etc.) c=
an support?
>=20

What do you mean by this? Jailhouse is written in C and assembly if you wan=
t to know that.

>=20
> 11.   Is the hypervisor open source ?
>=20

Yes, you can find it at  https://github.com/siemens/jailhouse

>=20
> 12.   What kind of development tool chain(such as Compile, Debug and anal=
yze tools) can support to develop bsp and application?
>=20
> such as use the IDE could debug step by step?
>=20
> such as use which Compile to compile application?  GCC or itself compile?
>=20
> have tool to analyze hypervisor system performance(CPU load, GPU load, DD=
R bandwidth)?
>=20

For this, you can refer to the BSP of the board you are working on.

>=20
>=20
> 13.   What is the fault handing mechanism on the hypervisor(such as Ramdu=
mp, VM crash, coredump)?
>=20
> How does the hypervisor analyze the system crash?
>=20
>=20

Currently, the Jailhouse detects violations from the VM and parks the
CPU and provides the register dump on the console.
Note that there is no mechanism in place to detect a crash at EL1
(Kernel crash)

>=20
> 14.   What the hypervisor have got Safety certification level?
>=20
> if no safety certification, pls share some introduce how does it make saf=
ety?
>=20
>=20

I think the smaller code base, deterministic resource allocation and
other decisions are taken considering the usage of this hypervisor in
safety critical systems. This shoud ease in certification.

However, there is no certification done for Jailhouse

>=20
> 15.   what is the hypervisor Maturity?
>=20
> such as In J7 platform, how many bsp driver have release? how many projec=
t on going and SOP?
>=20
>=20

The J7 platform support has been there in the Jailhouse upstream for at
least 8 months now. Regarding BSP release, please contact TI support team

>=20
> 16.   What=E2=80=99s the security support of this hypervisor?
>=20
> Does it support security boot, sandbox, MAC, security filesystem, SCM, DM=
M, firewall, Security unpack, SRTC, TLS etc?
>=20
> if the hypervisor have security feature list, pls share.
>=20

This is too open ended question

>=20
> 17.   How many resource usage when the hypervisor running? (such as Resou=
rce usage: CPU, RAM, ROM)
>=20

Currenly, for TI platform, 6MB RAM is reserved for hypervisor
There is some CPU usage when enabling hypervisor and using VM management
hypercalls.

At runtime, Jailhouse is involved only while handling the interrupt
injection part and IVshmem


>=20
>=20
> 18.   Does the hypervisor had  team support in China? or which side suppo=
rt when Chinese GuangZhou have the hypervisor project?
>=20

It's an open source project. If there is some issue with the upstream
supported platform and features, community can help.

>=20
>=20
> 19.   What kinds of HMI engine can this hypervisor support(such as QT, Ka=
nzi, Altia, CGI Studio, crank, html5 etc)?
>=20

Again, Jailhouse is hypervisor. Not an operating system. These features
should be supported by an operating system, distro, and apps.
Which you can choose your own.

Only restrictions is that - Root cell has to be a Linux based OS

>=20
>=20
> 20.   Does the hypervisor have some technical document(user guide) are pu=
blic?
>=20
> if have website or link.
>=20
> if no, how could we get these technical document?
>=20
>=20

You can find documentation at
https://github.com/siemens/jailhouse/tree/master/Documentation

>=20
> 21.   Does the hypervisor had use in OEMs?
>=20
> pls share some info.
>=20
>=20

I do not have answer to this.

>=20
> 22.   How do we get the hypervisor license?  Is it free(no NRE, royalty) =
to get license?
>=20

Refer to https://github.com/siemens/jailhouse/blob/master/COPYING

>=20
> 23.   Is is free(no NRE, royalty) to use the hypervisor and its hyperviso=
r modules, Customize Support Package, Tool Chain, Special function lib?
>=20

Yes, it is free. There is no royalty and there is no warrenty from the
community as stated in the above license.

Go through the GPLv2 license for details on restrictions on
customization and distribution.

I recommend that you go through the source code, public documentation.
That will clarify most of the doubts.


Thanks
Nikhil Devshatwar

> Best Regards,
> _________________________
> Liang Jingyan =E6=A2=81=E6=95=AC=E5=BD=A6
> Cluster SW Engineer
>=20
> Magneti Marelli Automotive Electronics (Guangzhou) Co,. Ltd
> No.2 Yongli Road, Xinya Street, Huadu District, Guangzhou, Guangdong, P.R=
.China
> www.marelli.com<http://www.marelli.com/>
>  [cid:image001.jpg@01D577BF.28F4D310]
>  Please note our web domain and email
> account have changed to marelli.com
>=20
> --=20
> You received this message because you are subscribed to the Google Groups=
 "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/jailhouse-dev/e2ab7c14fd244457a1faeb99ff0fe5be%40MXPO1FGAW.fgremc.it.


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20201106102901.i4qk35q4g6eqglhu%40NiksLab.
