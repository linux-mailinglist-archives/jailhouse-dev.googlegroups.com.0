Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTPM3DUAKGQENV5VTCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E259F45
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 17:46:22 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id r4sf2702577wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 08:46:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561736782; cv=pass;
        d=google.com; s=arc-20160816;
        b=OY94FNEbOd2hWg20QS2ixFUEH10RMGLrQ5qPZce8FZKDE/QMQKjHdPvO2UlowXMswc
         4Q2N1Byo56xnh0XuHP4QsLkBCUO0+rTsVxLJ2H/ynphlP20ARLy2DB8d5vI95MHmAWUB
         0uOc72sy7Y5/1x8nCvLMFbSSMjoV3NTBSHRxiDdxfbGrXuBEoT9ZgQdkHwjnTsHm7wEB
         tYB5W5DlsZTDGKV8v1dxE2q4v8io7YL60rI+yIbM7T7mNiMCsFZKlA6HSpq1YeG76x9i
         y1vPPHeYzpXwCBAt6KyIPQY8lZQvfES/mO/JHJh4fnwZ3jzxszbWuXtYz4HVYo4/h90o
         rycQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8ulZUv2+unF5/MUSMPlIPU6CyyZ+Koe7EF4lRsoyviM=;
        b=1EucYRODzzetDy9aAXLR7+cxqqfwf6CAHibtYqRMyeJjD0Ch3ce7Uzi3xh3P4ce5Vp
         vEAn2TXOYU+kwAn1EkbptJNdC+W//XQL3nCiLj2arQ/0q/zys+k4vG+Qk/shP6fSRbbl
         ouUkYYHmNumfz8Tx+3AWCLc/j0oKb4J6yhmleybXTwbWhAc2iTkgLqZFDBxeiIEphSlI
         b0nIqykCclrgn68KuErJ/WGV0WM8pYDiOp5NEcFiJuEAsxGhSvDNJdevFFBCY8rk1duQ
         AUZwIETFpaiql1Cvx2huLqj2q1dM108sUBKcothAP+D5zNnBqbT07lOVPVVIfu/X3OEs
         vpcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8ulZUv2+unF5/MUSMPlIPU6CyyZ+Koe7EF4lRsoyviM=;
        b=PXQC5LvHwgaxzyUWY+l4YddYJ/BzBpZJhCbQ1wcfGwg9hZ8eRXsgsYasqBVRD4UxiW
         xsv4aaWzBTQASC3FHYMBDy4vIeTg+VU33LHBR+Vh4SdnXsKF3twNRIt5azzNpQdw83Vo
         kc9Ai2Hjp0/KNo6IEgf7sFdIf/9fXrEhe2XU8yv1+6UNlnGj5EaCbkVHG4t9HMGV6D0c
         odXg6E825vk6pQRDLojwLMHa6v7ff4gep1j6GHtOk8mFyrSySw8MHKerNud0ogWJJOzF
         jeUSgggGXs+TSKS6WJVN1VTJxgq74jWeG3+mIV/l3vrv2XDONnPg55G0bt3Q3c+fWkak
         cf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8ulZUv2+unF5/MUSMPlIPU6CyyZ+Koe7EF4lRsoyviM=;
        b=jUgMGAWtAlWv/Ovf/UyK9FsK2KsLM/NcHNM57No8zFhriu1/rTd8L3tMiUk7NCyjXm
         Q0r3Y8BNjv78VqDdftfFdqh5EDushX3NHVTs23HlIlA6y1nf/ybvLWSz7MO7lbe3/yEM
         Q1UFAsjApwfRIVDSNGuWfNCCUu20lbMUWoibTgFUdtIyN0KHHxeKDraK0aEg35sctx2m
         l6GqAgbHzMZZ2m3aAwEgcf1yXgyI8pMzC/ryWj8+nMZ6fiK/7mwpl1ZfwN9W0EI8gB89
         Eete21KieKfkVe0Qrru/Ig/+knVyJVQV/ww/R6o693fGzLJ/kSHpipCdbwD7xpAHPvHc
         o57A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSlGY34GVn6afQFZV0Gw8IzYtgHp4gP8iUyG49SxKymgAHMedc
	JSReRQSL87GMdwvnUpVxIWw=
X-Google-Smtp-Source: APXvYqzCNw6WZVbADqo0FCOONYG9aZYz8Pf1p39eEXypCbrWV0vwKMo6qXBJfEu7hNfsR5KZp7Hx+Q==
X-Received: by 2002:a05:600c:118a:: with SMTP id i10mr7515192wmf.162.1561736782135;
        Fri, 28 Jun 2019 08:46:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e844:: with SMTP id d4ls724796wrn.7.gmail; Fri, 28 Jun
 2019 08:46:21 -0700 (PDT)
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr9050660wro.190.1561736781522;
        Fri, 28 Jun 2019 08:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561736781; cv=none;
        d=google.com; s=arc-20160816;
        b=mNWn6Y/4H3CBffDftll/1I81SuBpFNkSCml0kAi4t2753rI7xih1Fj1RB6eYJsSFsQ
         3CsV8mTSMpbnvDl5++BbZj1maTH7PIPs5mn3tJlMfVl6KIOaEaKJdBjJXYlD1FskPfac
         4vTTLeWB8164DlswyLSFUhDZAZGL7HEtbMd30uFKV3G0dcq2ramnc/YONywrky1wxPLC
         2BZJHn8GNTNICJ3KyEcjxp9byJYetTOnoXuv8fPAL9Grm26sC86bufK4VQDQmJGim/Ig
         JwaGrJkZE1iiA9IOCrfKOEZTg7SlXI8QTAUYlqFYpUWjC8/v2CPUzkTPNwg8+D0TNgzI
         gA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=yIPGt03CttEOPHtbTXxdcH8WZaQdfCJ1YXRskGNjA4o=;
        b=xEHM+2/XKuDjVGg94e/ZG8UodJ3p0Qrkd50GoRQ7steiDhIAY3twDHryTmLdZCUn9p
         KFkY/xXsN825fJ2fDpW2SJG87dP9RegCUeg4O/yphRKrGPnJLynEu3ytxfqt2Lf/N6Nq
         n/6daSCuTZjaRNPTxC+VxYQcPv5DM4o1LokAl2mOW3t/0LVqmqIEK0H8FF7zYM+iVV5Z
         oDLvAkh6ujzJb8PYr+Mgll0sCzOuuOz8vIi+h9rh9hQoiteTpsLX0iiu5RagOpN7sww6
         CdTr2OmXnl4inLwYodSm2KJwx4B692sE4DKT4rDXiePK1bTOC3pv2S41/E3sQpSxOCpy
         eOZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j4si452898wme.3.2019.06.28.08.46.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 08:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5SFkLtK019550
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 17:46:21 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5SFkKT9026916;
	Fri, 28 Jun 2019 17:46:20 +0200
Subject: Re: [EXTERNAL] Re: Errors to compile jailhouse with ARM GCC
 8.3-2019.03 toolchain
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
 <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
 <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
 <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
 <7c482200-ebb3-f373-1186-f36928dea965@siemens.com>
 <aa74bdfd-c7b3-f798-6ac7-6ef836017c46@ti.com>
 <c1ca3b69-9521-84d1-c37e-a83c085dd0a4@siemens.com>
 <b98a12f8-f526-15d0-ff5f-8b3e9058a9e0@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0dd9d362-e37e-ddca-b687-8e529dec5cac@siemens.com>
Date: Fri, 28 Jun 2019 17:46:18 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <b98a12f8-f526-15d0-ff5f-8b3e9058a9e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 28.06.19 16:37, Vitaly Andrianov wrote:
> On 06/28/2019 10:07 AM, Jan Kiszka wrote:
>> On 28.06.19 15:50, Vitaly Andrianov wrote:
>>> Jan,
>>> I was able to get almost everything working on AM572 IDK, but had to mo=
ve to=20
>>> a new compiler:
>>>
>>> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture=
=20
>>> 8.3-2019.03 (arm-rel-8.36)) 8.3.0
>>> Copyright (C) 2018 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.=C2=A0 The=
re is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
>>>
>>> Now I'm getting errors:
>>>
>>> =C2=A0=C2=A0 CC=20
>>> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/s=
etup.o
>>> =C2=A0=C2=A0 CC=20
>>> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/s=
mccc.o
>>> /tmp/ccm9f2Kw.s: Assembler messages:
>>> /tmp/ccm9f2Kw.s:52: Error: selected processor does not support `smc #0'=
 in=20
>>> ARM mode
>>> /tmp/ccm9f2Kw.s:82: Error: selected processor does not support `smc #0'=
 in=20
>>> ARM mode
>>> /tmp/ccm9f2Kw.s:109: Error: selected processor does not support `smc #0=
' in=20
>>> ARM mode
>>> /tmp/ccm9f2Kw.s:140: Error: selected processor does not support `smc #0=
' in=20
>>> ARM mode
>>> /tmp/ccm9f2Kw.s:170: Error: selected processor does not support `smc #0=
' in=20
>>> ARM mode
>>> scripts/Makefile.build:303: recipe for target=20
>>> '/home/a0794637/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/sm=
ccc.o'=20
>>> failed
>>> make[4]: ***=20
>>> [/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/=
smccc.o]=20
>>> Error 1
>>> scripts/Makefile.build:544: recipe for target=20
>>> '/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm' failed
>>>
>>> I guess the new toolchain requires to pass additional "arch_extension"=
=20
>>> options to assembler.
>>> If I add asm(".arch_extension sec\n"); before each asm line in the smcc=
c.c=20
>>> that works, but I'm getting errors at other places missing "virt" exten=
sion.
>>>
>>> I don't believe I need to edit each source file, It must be a way to ad=
d the=20
>>> required options to makefiles.
>>> Do you know how to fix that issue?
>>>
>>
>> The original idea was to have that extension enabled by just including=
=20
>> hypervisor/arch/arm/include/asm/smc.h which contains that statement. See=
ms we=20
>> lose that with this compiler version. Or we rather need it in the asm bl=
ocks=20
>> that define smc() and smc_arg1().
>=20
> Yes adding the extension to each block helped. After that we have errors =
for=20
> each macro in the sysregs.h
>=20

OK, this doesn't scale. I guess we need to study how the kernel does that..=
.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0dd9d362-e37e-ddca-b687-8e529dec5cac%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
