Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBL7HTXVQKGQERHC4NTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9FA11E9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 08:41:52 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 14sf531961lft.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 23:41:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567060911; cv=pass;
        d=google.com; s=arc-20160816;
        b=p1sav03WbYBFaoCUrOUg76H5z07YoPaO3g42yZKHanXhm+qvOZ10Q1aMfejtZA+F6F
         tte7pbxNR26p39fhLNCpZkMoZqrtxAGtNuNBQohcw7jxqPXUuUb2dOmE5IeVhnxfdNzh
         k8ulTsfiZtIA9eXnMEFsQbPcb94CpYcdzLNj+rqtARQv4H4Z4KJnTFQJ+nQ9/p6quYuf
         rJQj/JohqxClouIO8f93oOhwrPCA4GPbuinyPrCFs99WLQE/rPztLHDTtd6HAMQSpXw2
         AvhbBNhvL3L2A7wMEq+W15qOWKMDxuN7BnE/gN/AJjOLnv0e4n047EdimmU3hi2qBNm2
         uQ/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=37NWQFNE4wzGvYFkeAzRKETDoYSG5GGNZ43b4GYX08E=;
        b=Vm0T/tV438yCdWJ4RtK8y6sftcluw778FfadN+NoitBPcY3eZlGEuJKfyApmPbadQs
         P+blohKVhLBhI/NsNsedWmeYowwAmLZhpWzVcOIXFApONvNr8xSRtkjk9WWqwZO9QLrC
         uc3BNostgOg5wouVjUUvL17YMLNbk12Sby3tqoq6vSEBpeLeXRpQ3wDnUElsPvi8wW5L
         C9WIt45CMCfbTnca4UjQkLFWE9BneT3cjun7mDHkUaYjnuPyDKB+fBo+p1vJKOkvYv8l
         vmSiyGlP9S9ev2d267i0g8dZnByN4MgNEypAmzSYOM6PUi+nGKbjDraJ+0gZDJLdpf14
         W4sQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=iVJTYJtf;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=37NWQFNE4wzGvYFkeAzRKETDoYSG5GGNZ43b4GYX08E=;
        b=PQCz9Vs4SjiA1Def8fomos/Km9yy8SUyt3rdm1aEB7pFO0t2+I0ERCsU6RFE1pxLLW
         7hmjD277Z/TKNPXP/Gdu/KjhacAI9F7nnY8gW6itKU3OiamxhmmQZzR1afHWtAYa38iC
         kKzCHXBsqFIuw96utLK9mqb0xpKRgQUnbfj4QE2wuB0hmmu6dEYVNel8kIfBkjn/Xiu1
         ivAN8aRi+i7eBWNY23avbbFjit11UJ314lAS0xD+mdWUBgUMHLjMDNw241aqdbPZLHtS
         L/GoUOKxcIdmBMlLIyYSHJxomqu0T9590mA3XNmDqd54WLsIU2fepEsyFKZsnDOK0yIH
         Ri3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=37NWQFNE4wzGvYFkeAzRKETDoYSG5GGNZ43b4GYX08E=;
        b=OWLKne2JI3cj2FfJr2STgpKlyC2uz0LJgiaxzpiZmhVGw8lPjvjeN9hwjNYcsz+Q1E
         bIRo9OehDjgkAEsazZgIJE9Yzhqn29ESArRYI4Sjr/ScTiA5c69DF5ICnNGFQcBbdT6W
         wuMz7hKZEBma0g3EpijzHwjFv/p15h3sABUohmkbDabtOE4FYUVnPSRsCIZ1zGzqQvBY
         JOvkyakV5gmEzepP+SpzJXgrGJSiUA795xpvwa1S9hyuhyMc6c6GMijrjK11RNxtonaj
         kKVf9zaKRAsFKyYPhwfzr1Rev/jQGPcC7Szx+Y6c0ly7HBKahHtcC09zQnxbMWmR0NA6
         7X4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXHPfB6oZ+Gety/KxGxgosuNW66lqYiOaNYhVWtTKiFbN+1gXKQ
	IEQwFPSJNQdPsTMJiql4StQ=
X-Google-Smtp-Source: APXvYqyOJzIIM//qocFtOXnXoZDG8nSeDPXc1dpB52l4szArvfOmrYpIkUBcSs+jgVPGDFQvWRGxpA==
X-Received: by 2002:a2e:3004:: with SMTP id w4mr4255077ljw.216.1567060911791;
        Wed, 28 Aug 2019 23:41:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9245:: with SMTP id v5ls165756ljg.3.gmail; Wed, 28 Aug
 2019 23:41:50 -0700 (PDT)
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr4304859ljs.16.1567060910931;
        Wed, 28 Aug 2019 23:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567060910; cv=none;
        d=google.com; s=arc-20160816;
        b=CY6sO3bsn/AtvbSP7nkKkQPARkrWO056vp2lmsFYZoE1NQs4mHKJptYc7ifiX4EjZX
         lEUE5HQlEqtbGvg9msSaYcZcxBtfa+vRs7od+AW5QtPaZjfVK0TToWPcQUHNkmjlfVUe
         CLCxEVaLpdqC7b2Q7giihTsJC14m6JYCCddWngTfMOkMv/acfWSKLsnYs8GIRKnK73rt
         A0B27xde9Y8z7QQulH9r3PcVSIAthQZok9ss76AWeMrykC+D7kgnOJBZ8qSE9qPIg73h
         IuIN8Mjy/GpUy8MUKUb6vaX79B2MZ1dPq7bBnTYC6o8DW4mtQzOhbkBz6kL4IYXNaiqI
         9AtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=Pux9t7KNlvUwRLTWtZrrNxc9QoEJDjtwjZXwNTHwTMo=;
        b=lFkP+CirM0yOx/Mh33x4mQh2XYOG6CDdBAfPyCtPd2h8QpJ5N1bTyTrnSUl/tPQRfj
         PfgPQi32Jygkz5fj6qjbdyqRU1oH3HGZ5HANVmqvaBdBYvLqZFwWm9xoZEEUJ9eBQxZd
         iV4/3vNP0swD4/5lyFSBlhFrqqp5P0zhsrQxSP7JWeWJ3zT36GErPQasux8lPG6ehBi0
         Y3cx4SM/YknQn6mbJBbY08PuQcpT6gRLRh1KlpnnD0PKlZ23syJOMdRir/YDovFSKZN4
         ld3h32QylA/MK38/IVvd4WzCGZ0zLWmtYXP+DkxZL8+Cd5bBFhXr+y5Lrx0CYJOA1rrp
         Zx9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=iVJTYJtf;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id h19si95223ljj.3.2019.08.28.23.41.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 23:41:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1if1K50KcJ-00fiht; Thu, 29
 Aug 2019 08:41:50 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: IO access in jailhouse root cell
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
Date: Thu, 29 Aug 2019 08:41:49 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:zGljO8jaBeIHv0BnSZXBlvLFe92Rru1/zOURDIcHZJTktIyIFLg
 AUD79jktPJhyy7Sykteuc55aid91E9+xS27mKYPKwOhZ/ikVEzGr7frNA0WK+UXh4481Q9p
 jH4v8d/UHK2Sqd48McOY1IfZ0/Ok44NbM5az69943NAdqydERXBD6LLjdMpIa4GE8iivJhh
 7A0hnQe0O9kF1D1+ALF9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/0YQ5FqdVQo=:+84QK/kALTmGanjkyt4yoI
 76S/NZP5DYge4AY0mVVCTj9yYAl2PL/PKZFcVz7VK54GxWDAuHEP+gpuHT3Vw3gM3GlK+4/Z8
 pquA6O/DwHqqOHRmDH6uEojmxVzKCATKpARPSfp+n3SzkVxWlWwEoZ7pCxi5pmVa7XqcfQAPW
 xjVJhT1CEysL91K08l5sP/8Pb8zDtEfG4Yf+BkOOxkulDOX9zX2fRHGetxCzkH3XSi7S/nbrA
 CuGEcMhSYqQQnUgbgZfA5uZvEk2voz8rL4py6tIppkr493ZT/DNHbC9UF0u1UZZAx7fp4biqs
 upjQuCKB8w0j2R+GQi9BOFQq/xGgyKFH3wsUwwhDCKYaM7t5AV5WdFyBa65tE45P44LehQ9bB
 zBbQfgqfpXtVAX/MW2K0/L3fGsMkqkb79av8mFmiGtO8uo1BlAkGOkd2H932Rfc+lWOfa6YHP
 3NZzTSz+rR44OtFR61l9kqEo6izWpojpFsC92/9b16BbHD5c2ySnC1GlDiusSCOuf6RMgT7cO
 8m5oI/BFKcoBgzyhDECC2JFejSwL6gcUIvJ6anz8fquO6WieXkiihhqHUP12uQk+CzlfYVBnO
 aST85qKsxYM1kTjfxmpVyEcRLQju17tQubR4Khsmz2hCatXx+glkygnLjPcQaKvNQGrWucZPv
 9DyegK+que6zl+S2sZ/o0WF6iCo24dbOcvKXjDwfdT5iNeFp8uueme1EyKmzE0yGyOs+GH+tR
 dJo3r47mh0g5j24UcZwCNaP0ObS7/TVt4OJ7zHp5XAbeqpFa7Z5s2pZAbltn/7reg0yCkYKkX
 in8bI+jFThjZ5nzB8pa1a4tVkm8Lq4Iwajbn4XSlzIKkm+iGJ8yrnCQGNdKxW/QpNSIECD880
 J7E4xetnrMnITKj1gnN12wZcHELnaU+IIpRlVgbl+To/HXFWIA0bNKgN2SZ6Af5cWLPKb11Hu
 UgkVDlvwou3N91Gj0pYLAIhFYaTzTkBGq1J91fpxe5DUI+QSeXsbqFyQ3a6Fo5MKA8u50Bhwb
 V/oBGbKU+ucy5FPV8Kzby4L7QhGlWp5bkqg82dMViDHNIII0AljgyKIJUVg/VXcudxPGD0LHl
 whPLjG/FFTTG/blN4Uerm1YCsNzD0mv5stc/LYTeC8p5cHnWgI/h3FO2PF8j8t3nSwb2y4MsS
 8lF80=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=iVJTYJtf;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

I=E2=80=99ve now tracked down the error to power management, in particular =
to clock gating when autosuspend is used in IO drivers.

The drivers in question, spi-cadence.c (https://github.com/Xilinx/linux-xln=
x/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (https:/=
/github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/i2c-ca=
dence.c), use autosuspend and turn off their clock when suspended. This is =
done using the PMU (Power Management Unit) firmware interface (https://gith=
ub.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/zynqmp=
/firmware.c). The firmware interface can be configured to take a hypervisor=
 into account, but my guess is that this is not yet handled in jailhouse.

I haven=E2=80=99t yet figured out if driver autosuspend can be disabled by =
some kernel configuration setting. However, I can work around the issue by =
patching the kernel drivers to disable autosuspend.

This also effects any other driver that relies on PMU functions. The CAN dr=
iver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/net/=
can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=80=9D =
occasionally while jailhouse is loaded.

Oliver

> On 26 Aug 2019, at 15:13, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 26.08.19 11:44, Oliver Schwartz wrote:
>> I=E2=80=99m stuck with a problem when accessing IOs from the jailhouse r=
oot cell.
>> Background: I=E2=80=99m running jailhouse on a Zynqmp ZCU-102 like board=
, with additional peripherals attached to i2c and SPI bus. The basic Linux =
system is Petalinux 2018.2 (Kernel 4.14). I can run the zynqmp-zcu102-gic-d=
emo and have successfully extended it. The configuration for the root cell =
is zynqmp-zcu102.cell from the jailhouse repository.
>> Before starting jailhouse I can access my i2c and SPI peripherals from L=
inux without problems, using either kernel io modules or direct i2c access =
from user space with i2cget / i2cset. Once I enable jailhouse (just the roo=
t cell, no inmate configured) access no longer works (e.g. i2cget complains=
 =E2=80=9Cresource busy=E2=80=9D).
>> The i2c registers are located at 0xff020000. This memory region should b=
e covered by the first entry in the root cell config:
>> 		/* MMIO (permissive) */ {
>> 			.phys_start =3D 0xfd000000,
>> 			.virt_start =3D 0xfd000000,
>> 			.size =3D	      0x03000000,
>> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_IO,
>> 		},
>> Interrupts should also be delivered to the root cell:
>> 	.irqchips =3D {
>> 		/* GIC */ {
>> 			.address =3D 0xf9010000,
>> 			.pin_base =3D 32,
>> 			.pin_bitmap =3D {
>> 				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>> 			},
>> 		},
>> In fact, register access seems to work after enabling the root cell, so =
I=E2=80=99m suspecting some other cause.
>> Any ideas? Are there any kernel patches necessary for the root cell kern=
el?
>=20
> Nope, when just the root cell runs and you have permissive configurations=
, Jailhouse is supposed to be transparent.
>=20
> Can you track down where exactly the error is generated? Maybe ftrace wit=
h function-graph tracer can help, otherwise code instrumentation.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7297AC93-068F-4C6F-8486-222D62F7D1EB%40gmx.de.
