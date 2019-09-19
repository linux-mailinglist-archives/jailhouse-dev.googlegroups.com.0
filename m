Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBAGWR3WAKGQEWMJURYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id A257BB7EF5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 18:21:20 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id m14sf1258761wru.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 09:21:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568910080; cv=pass;
        d=google.com; s=arc-20160816;
        b=OzY8z7V2XzhlTWwsjfALQIGX7IUfMfuZSfhnzN07v6wukZOCRuZeOohsrSEji99dUU
         8eec3Om3EDrUXVrRbHcjqRZNwGDQvhumsEDt4TgZNw3OTQyZnwhlUU2GsIWULxiP8c2t
         OqdbOZFtEf8U+o5ktBHKoDdnBIkA8Et2tdK0jATu9n4zSdYl59eIsMlk+5zWekuH07u7
         iPHOpiur0VC7egfIkivzIq9CzapUCaCtA4RnaVUHTh9MJsKvloZt9fa5+V40qdkqqJW5
         wZCwmHJa/yijAeWnOLtnbQOW8jBOLZMMObBLR/KhxCO9SF/BoIR4YK8pLoHagGVaPg2L
         CKHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=0NSChV6O2h+7kHm4ikxxOGi9SJpWwq6SUk6eiROJHF4=;
        b=iRzDxe2dbuw0retBIkW8tfvmXPAKgnJW3pqOvWqm7ZLp83pH2lAGPrN1pUKgvazzdq
         rR0cqKcZqzod7D1l5l+9BQjpb47QSryuUd1uNT9BRufYoajsZ4OTNVNcOfIFJTH6fFpb
         SLVX//ftm544xFUE+9baQqpnFl5JlGPdZJw7zukOcB2iPmzXUj1AJYk8Na3/BbWO1qJ9
         e5ZTmEm26jrrbnCGJpfEL54g/M4/8M+ep6cCBrVRm1duH2QqiGfo38q2yDm5h7053Kt3
         7LdvHFfjI7EK4Kz7uDMyBKD8qaa87w4V7h73ad7ddMOXcdWNm+/dBGjWeu7Y2eSdJs/J
         zJ7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0NSChV6O2h+7kHm4ikxxOGi9SJpWwq6SUk6eiROJHF4=;
        b=Va6uKT/d48XtFaBMU1q+P4ye0azt9QNhN2BloGQQQUuaUwK4SxS08zdbiZz7SVU1NW
         Q0bDh51c5SIMoqBcTQuXUxwgaEZ2N8nzuZrpwUrIvAMQvlObg1wkts+hNavnedZMJQxP
         jT1jgoTGvXYgiWeRsLDY+7aNVvX81rmcb1NGfNTBBfcve93nJltJMEHB/QNtx9iwjSPR
         g/VLoHCTb5EG/z1YXMWRwT5KOGiNWpI/MmFUn7X3xfty9Abrmj5meYuuX2eEoJOL3Rwh
         M07/twyyKaz1+mmWitydmiE8oM+Ar4+Nzzp/by+vIukH2xB8lnk3MZwkmd0pyNlZrOY7
         LKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0NSChV6O2h+7kHm4ikxxOGi9SJpWwq6SUk6eiROJHF4=;
        b=BQgPnSmHuwmn6gJ/z87SXe5PzTo6mLMELNZ+gkLQRtcTv1UloWN9Bf56Bd9ImnszTc
         rlBAzyKo8p/yQeF5kVt9cDHlS/eRuQYpipUC3NYOG5QnoIreWq+eDgiTEmjycZWVnJrq
         zCaPIMeuQkL/pnuYewSr3TKPKCg1aoGdPAmX/dmIUv4BpSFPOQhU2EN5ecqGd0Qn/vxX
         UHBU6iwqJ9UwLLp/LaHmfuYkXHaIdhB5aayAD87MRp1z2KLSs12F6RpsIBYaLoztG4vg
         Hztuk29zJmStNGzbUAilEspThY/7Ruu5tkJMIUZo72oS9smJOydY0SpJNM5Ld4svxxyi
         YJZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVncc+HwlPrFlJ8hXbEzwQhnD7ptXy8BaFO4w1gc3jll3yrjxcz
	fkpYTwejNr37pJkUsOO8jHI=
X-Google-Smtp-Source: APXvYqz8mhSqu4j01jKAajaMvIYXaREXjXQ6FY8trU1vKn9ngok8xysTZSuGlMH3gIRAwQeCF4tN5A==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr8233195wrp.312.1568910080245;
        Thu, 19 Sep 2019 09:21:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:ed12:: with SMTP id l18ls1636740wmh.0.gmail; Thu, 19 Sep
 2019 09:21:19 -0700 (PDT)
X-Received: by 2002:a1c:6508:: with SMTP id z8mr3747301wmb.93.1568910079598;
        Thu, 19 Sep 2019 09:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568910079; cv=none;
        d=google.com; s=arc-20160816;
        b=0oBmbPPXRVCX8PdCLg6sABHl6FHu+0Rcvv78mtttkILn+HdgKQlSRXKMJoRmdC/2k0
         UsnNbEvvBu4j4wFhgzMcHpX1KlTY2Xl4eE1OKkgLMiYFnTPrbDZfdjIqgBofr9EWnPU8
         KGaomoTEOOZ+mlawOoZ33P+ih2ee1rrMmJ1+Bof1X0ZpByvoBc38rh5l9KxxFg+IU85O
         dH5Q57mp+Aoer2g7HDmxqa6837ahnWAZHQCckw4VaIL5fh8QiAyXowtXeXVO8L9P53kE
         /B8Y1eZ74TohKsFXYaNH6OzGYbytg5SaxLt58IhH8FtxQX2lGQlE6QMtOact8o51mlVj
         1URw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=h4HAx+cJR8S1JbZhLF9dWZBwKHpU+9m0vufqkb7hjTM=;
        b=wPjgvOYSgH4t98cLKXdGqQcYBD0YSbnADtjjr1ifogz+Z+zxAZhvFNVCbzzS3lT7LS
         uqHbEX7Vr4lrbljAG8V2gExT5jhIlKnLSLRJd+dX3zQGXL1L6RcKgznqHIU1iXGqeFVY
         nHNFfzHTRMPS3aDERpeBmfVS0meX+619CIraNXiyWmS7ufFS/Stos1466MVLrRCGffAt
         iHy4mpJ3QScNHBWZS33gMjH7WlSfI3r5Q12xNzat1JiU8EZTvQ0QV0uLFlhNkUIpTYM2
         KEAeqJUu0wSVTq5uUv60yIPsZ/bkA1lKJPpPJKeLeQtv9FD+M2bMtM2PdMyQHmdWRLed
         eh5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m1si469121wrs.0.2019.09.19.09.21.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 09:21:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x8JGLIcs017074
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Sep 2019 18:21:19 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.220])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8JGLIx6007781;
	Thu, 19 Sep 2019 18:21:18 +0200
Date: Thu, 19 Sep 2019 18:21:18 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Cevat =?UTF-8?B?Qm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Cc: Ola Redell <ola.redell@retotech.se>, Jan Kiszka
 <jan.kiszka@siemens.com>,
        <jailhouse-dev@googlegroups.com>
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
Message-ID: <20190919182118.501a3060@md1za8fc.ad001.siemens.net>
In-Reply-To: <CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8yMO-dcDw@mail.gmail.com>
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
	<a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
	<CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
	<20190814085057.43ce8c63@md1za8fc.ad001.siemens.net>
	<f4eb47c2-7a86-3e6f-8ae5-8e84ed8b70d3@retotech.se>
	<CABPcKDN5izWjNsHsij8eK-3BBF5ch34peerH4EBzD8yMO-dcDw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Sat, 17 Aug 2019 16:46:37 +0300
schrieb Cevat Bostanc=C4=B1o=C4=9Flu <bostancioglucevat@gmail.com>:

> Hello, it's been a 3 days and i am still trying to compile, i changed
> yocto versions, gcc compiler versions, external toolchain, checked
> against debian build etc. but nothing worked.
>=20
> i cant understand why this is compiled in jailhouse-images setup and
> not compiling under this setup ?
>=20
> my setup is:
> https://github.com/cevatbostancioglu/meta-orangepi/blob/dev/yocto/meta-or=
angepi/conf/machine/orange-pi-zero.conf
>=20
> my latest error is:
> Short log:
>=20
>=20
> *arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and
> -mfloat-abi=3Dhard may not be used together*

That is the compiler complaining about getting instructions that make
no nense. You tell it to use soft and hard floating point at the same
time. Well you probably do not ... but something does.

"make V=3D1" to get the full command line

A first grep does not suggest that the CFLAGS come from jailhouse, they
come from the kernel and your toolchain.

The context from V=3D1 could also lead you to which code-path added the
FLAGS, because they often come in groups.

Wild guess is that your toolchain/compiler might be missing a configure
switch.

Henning

> Long Log:
> DEBUG: Executing shell function do_compile
> NOTE: make -j 8
> KERNEL_SRC=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/=
work-shared/orange-pi-zero/kernel-source
> V=3D0 CC=3Darm-oe-linux-gnueabi-gcc  -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhar=
d
> -mcpu=3Dcortex-a7
> --sysroot=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/w=
ork/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0=
/recipe-sysroot
> CROSS_COMPILE=3Darm-oe-linux-gnueabi-
> KDIR=3D/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-s=
hared/orange-pi-zero/kernel-build-artifacts
>   CHK
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/
> config.mk
>   CHK
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/version.h
>   UPD
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/
> config.mk
>   UPD
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/version.h
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../alloc.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../cmdline.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../string.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/asm-defines.s
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../uart-8250.o
>   CC [M]
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver=
/cell.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic-v2.o
>=20
> *arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and
> -mfloat-abi=3Dhard may not be used together*make[5]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/scripts/Makefile.build:314:
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/=
cell.o]
> Error 1
> make[4]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/scripts/Makefile.build:573:
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver]
> Error 2
> make[4]: *** Waiting for unfinished jobs....
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-linux-demo.o
>   LDS
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/hypervisor.lds
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic-v3.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/mem.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/timer.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-hscif.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-imx.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-mvebu.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-pl011.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-scifa.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/paging.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/control.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-xuartps.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/lib.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/mmio.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m-uart-demo.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/header.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m.o
>   LDS
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/lib/arm/inmate.lds
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/pci.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1.o
>   AR
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/lib.a
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0-gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/ivshmem.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/tools/arm/linux-loader.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/uart.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-bananapi.dtb
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/gic-demo-linked.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1e.dtb
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/tools/arm/linux-loader-linked.o
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/uart-demo-linked.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/demos/arm/gic-demo.bin
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/tools/arm/linux-loader.bin
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/demos/arm/uart-demo.bin
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1h.dtb
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1m.dtb
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-jetson-tk1.dtb
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/uart-8250.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-orangepi0.dtb
>   GEN
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/arch/arm/include/generated/asm/asm-defines.h
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-gic-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/control.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/dbg-write.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/gic-v2.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-uart-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/gic-v3.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e-uart-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h-linux-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h-uart-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/irqchip.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/ivshmem.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m-uart-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/lib.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/mmu_cell.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/paging.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0-gic-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/pci.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/psci.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/smccc.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-hscif.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-imx.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-mvebu.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-pl011.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-scifa.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-xuartps.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/caches.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/control.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/entry.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/lib.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/mmio.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/mmu_hyp.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/traps.o
>   AR
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/lib.a
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/hypervisor.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/jailhouse.bin
> make[3]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/Makefile:1503:
> _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
]
> Error 2
> make[2]: *** [Makefile:146: sub-make] Error 2
> make[1]: *** [Makefile:24: __sub-make] Error 2
> make: *** [Makefile:40: modules] Error 2
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
> ERROR: Execution of
> '/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/temp/run.d=
o_compile.28600'
> failed with exit code 1:
>   CHK
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/
> config.mk
>   CHK
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/version.h
>   UPD
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/
> config.mk
>   UPD
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/include/generated/version.h
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../alloc.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../cmdline.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../string.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/asm-defines.s
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/../uart-8250.o
>   CC [M]
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver=
/cell.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic-v2.o
> arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and
> -mfloat-abi=3Dhard may not be used together
> make[5]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/scripts/Makefile.build:314:
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver/=
cell.o]
> Error 1
> make[4]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/scripts/Makefile.build:573:
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/driver]
> Error 2
> make[4]: *** Waiting for unfinished jobs....
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-linux-demo.o
>   LDS
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/hypervisor.lds
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic-v3.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/gic.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/mem.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/bananapi.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/timer.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-hscif.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-imx.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/printk.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1e.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-mvebu.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-pl011.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-scifa.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h-uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/paging.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/control.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart-xuartps.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1h.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/lib.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/../arm-common/uart.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/mmio.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m-uart-demo.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/header.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/emtrion-rzg1m.o
>   LDS
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/lib/arm/inmate.lds
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/pci.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/jetson-tk1.o
>   AR
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/lib/arm/lib.a
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0-gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/gic-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/ivshmem.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/uart-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0-linux-demo.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/tools/arm/linux-loader.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/config=
s/arm/orangepi0.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/uart.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-bananapi.dtb
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/gic-demo-linked.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1e.dtb
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/tools/arm/linux-loader-linked.o
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmate=
s/demos/arm/uart-demo-linked.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/demos/arm/gic-demo.bin
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/tools/arm/linux-loader.bin
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/inmates=
/demos/arm/uart-demo.bin
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1h.dtb
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-emtrion-emconrzg1m.dtb
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-jetson-tk1.dtb
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/uart-8250.o
>   DTC
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/dts/inmate-orangepi0.dtb
>   GEN
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/arch/arm/include/generated/asm/asm-defines.h
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-gic-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/control.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/dbg-write.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/gic-v2.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi-uart-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/bananapi.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/gic-v3.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e-uart-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1e.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h-linux-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h-uart-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/irqchip.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1h.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/ivshmem.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m-uart-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/lib.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/emtrion-rzg1m.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/mmu_cell.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/paging.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/jetson-tk1.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0-gic-demo.cell
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0-linux-demo.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/pci.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/psci.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/configs=
/arm/orangepi0.cell
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/smccc.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-hscif.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-imx.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-mvebu.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-pl011.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-scifa.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/../arm-common/uart-xuartps.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/caches.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/control.o
>   AS
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/entry.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/lib.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/mmio.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/mmu_hyp.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/setup.o
>   CC
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/traps.o
>   AR
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/arch/arm/lib.a
>   LD
>  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_=
pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hyperv=
isor/hypervisor.o
>   OBJCOPY
> /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_p=
i_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git/hypervi=
sor/jailhouse.bin
> make[3]: ***
> [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/=
orange-pi-zero/kernel-source/Makefile:1503:
> _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/=
orange_pi_zero-oe-linux-gnueabi/jailhouse/0.10-gitAUTOINC+55de0454d8-r0/git=
]
> Error 2
> make[2]: *** [Makefile:146: sub-make] Error 2
> make[1]: *** [Makefile:24: __sub-make] Error 2
> make: *** [Makefile:40: modules] Error 2
> WARNING: exit code 1 from a shell command.
>=20
>=20
> Ola Redell <ola.redell@retotech.se>, 14 A=C4=9Fu 2019 =C3=87ar, 10:38 tar=
ihinde
> =C5=9Funu yazd=C4=B1:
>=20
> > Hi all,
> > There is also an imx8-dev branch in
> > bitbucket.org/retotech/meta-jailhouse.git with a jailhouse 0.10
> > recipe and much of Henning's changes. I will look into updating
> > master to build 0.11 and test it for BananaPi at least.
> >
> > Ola
> >
> > On 8/14/19 8:50 AM, Henning Schild wrote: =20
> > > Hi,
> > >
> > > i did not look into the problem yet. But my jailhouse layer for
> > > yocto is on github.
> > >
> > > https://github.com/henning-schild-work/meta-jailhouse
> > >
> > > Have a look at the branch henning/staging for patches to get a
> > > more recent jailhouse to work.
> > >
> > > Henning
> > >
> > > Am Tue, 13 Aug 2019 14:31:36 +0300
> > > schrieb Cevat Bostanc=C4=B1o=C4=9Flu <bostancioglucevat@gmail.com>:
> > > =20
> > >> Hello,
> > >> Thanks for the fast reply,
> > >>
> > >> I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and
> > >> also latest commit, still have same problem.
> > >>
> > >> I will be appreciated if you guys can provide/help with examples.
> > >>
> > >> Thanks,
> > >> Cevat
> > >>
> > >> Jan Kiszka <jan.kiszka@siemens.com>, 13 A=C4=9Fu 2019 Sal, 14:09
> > >> tarihinde =C5=9Funu yazd=C4=B1:
> > >> =20
> > >>> On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote: =20
> > >>>> Hello,
> > >>>> I am trying to learn/play embedded virtualization tools and i
> > >>>> saw Isar Integrated jailhouse-image repo, tested orange pi
> > >>>> zero(256mb) image and everything is fine.
> > >>>> I am trying to integrate latest jailhouse(0.11) into yocto
> > >>>> project and i =20
> > >>> saw =20
> > >>>> https://bitbucket.org/retotech/meta-jailhouse/src/master/ ,
> > >>>> which is =20
> > >>> for banana =20
> > >>>> pi with jailhouse_0.8.
> > >>>>
> > >>>> Anyway, I ported jailhouse-images and meta-jailhouse =20
> > >>> together(meta-orangepi, =20
> > >>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev)
> > >>>> and trying =20
> > >>> to =20
> > >>>> compile for orange pi zero(256mb) but I saw many errors while
> > >>>> building. =20
> > >>> can you =20
> > >>>> guys can guess what is the problem?
> > >>>>
> > >>>> my status:
> > >>>> i am trying to build exact image with jailhouse-images so i
> > >>>> patched =20
> > >>> u-boot & =20
> > >>>> kernel, now i am trying to compile/install jailhouse.
> > >>>>
> > >>>> You can see build error as follows,
> > >>>> also attached log outputs too.
> > >>>> =20
> > >>> The errors look like they could get better with
> > >>>
> > >>> =20
> > https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f=
2c624405d8c81 =20
> > >>> =20
> > >>>> My repo:
> > >>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
> > >>>> =20
> > >>> Thanks for sharing. Henning did some yocto'ization for an
> > >>> internal Jailhouse
> > >>> project recently (though that was for legacy vendor BSP) -
> > >>> maybe he can share
> > >>> some thoughts on your direction.
> > >>>
> > >>> Jan
> > >>>
> > >>> --
> > >>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > >>> Corporate Competence Center Embedded Linux
> > >>> =20
> >
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20190919182118.501a3060%40md1za8fc.ad001.siemens.net.
