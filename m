Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXKT6EQMGQEMCSRAPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 989DD3F8F85
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 22:10:32 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id ak17-20020a170906889100b005c5d1e5e707sf1673925ejc.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 13:10:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630008622; cv=pass;
        d=google.com; s=arc-20160816;
        b=yWtF1/JX9Sa7fs+1cmSs4xEvH3oYX+G5y5BZBSnXZE2iRDaiNrsw/rCpzUv/pfOs8J
         ykPASOIfRRDq6Zskit0bsw4QwBeNLq7UA6GX0tIU0K3RcE+S6e2VfreeH2/HCHMehi8K
         EMB4qVgZRrmTe53CTd8c+Xwu4coikD5HWdwGOVrvEqQXUDHrVmiGbeBAV3Y02y+aQbkB
         1NyM9uJW/2x/mt6UfDvPeHHPl0+wdiUnnJSY5ASdC3zvjs6/Zn/8BZo+gjAjFV5Q7zRe
         pElSpmYHenVi4btKRJGkWQSw3WTWo/trfQBRwcoMn4O0Q7WM+3G3YlD+FLU4h3I9/Cna
         0/zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Sp5aAg5wfRDqe3HE02cmeTDIkI11+C6vGnyFiJmyGN0=;
        b=zwkzMjhlyoZkFLFiCLUmCkSBFpT5zYWD6wHlDQzp0w8jyuef7psjsXbttKOKL534cC
         1XPxhPcKeTDHnoRNkje5ghW8ppEJGKZFPEtVY0xMXJZ2rJogs6O5P/knh/WaCqd74V6J
         1E+AhHr8Q+MfpDMPO9ixsqKjThZHusznhCuAss5LzGxgw9eIAIbX1WqHBe1ffvwBysWX
         cTHvCdtAhcMJVDTHiyAvSbtZIx691zK3kALb8TKb2wP09+szCrXiY1nRwtzN+QFAStH3
         feecYsuzOmYJt1pJolbHM13dSv51Ulp99R8dC3ZqrgZTLiCbki7dgzq+YEwHIU15dFSD
         GODQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Sp5aAg5wfRDqe3HE02cmeTDIkI11+C6vGnyFiJmyGN0=;
        b=DUqXUK/93G+fnoC/yFbGMlV5U4dPgVp4Ol3ZJ8aS2YeGnhP2e0a3vPfoUOundCs2tJ
         u/pYFT3wYs7XBfNrpTMOO4YBA4vETDbKQb98XA3uQxABPs9byzVZ1pzOwoiSwGedpTtz
         O3BZJ0AGGcxkM5T/HLOGSfBgsN9Axo2cy6euxlre6tJ5QR31ILplYYBQqeS8fUeqFDRR
         +3TfML9PQj1YuMFsUsWCeVANB7hZnFZe7BT8131aAoxp+rUu8a7NC+mBueRFKYrCE4QH
         SgGC5ynnMR/1l72aYp2x4AnIG7umhTuI5eSeazE7k/TF0NhUa2vZzwIO7ImEY2OgyShs
         m8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Sp5aAg5wfRDqe3HE02cmeTDIkI11+C6vGnyFiJmyGN0=;
        b=YHPtJO4SXn3UHAhehHg9RiCCDyD3f+6C1r/OCY1Y0pteQVJOcmjIo+2TPVygz8ZwR+
         i7rvRgrS/zq1H2d5xfa9poAxPjzsZ6Ts237bGbXqvoMH8Bn4f4fdMbEOmAHYky7fqD8n
         mFQikdwZO3iTvCbBJrduBgcBo2U4f/4Jft8wxsqGlNK63QrGv4eOKwEfmABHZ4ep8zAp
         34OMNRh9rIHRkl7nM7orCApOUEkUR+O28XrnGZBTbrtqNvYt6W2wtayaq5ePkyqkIe0+
         iaQmcTBH5Olec+J2bT/eDlkSlyBa96iJrsoKFE17oUyNBqv5bGhAcTVcvIE7lmsHKT+i
         v0wQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UgUr4/W66kW0OEuMGaeUxDMstSQEqs9myxUhZApyeVz88fwb4
	IPgiYAdJME4DmYSC01hbimk=
X-Google-Smtp-Source: ABdhPJwbAuMzlkyI+AFhTJdKfri6j5T1uqRZ6HkwzyO1GabJTyvK6fBsx3bngGmR7mVEAtk0hLWXfA==
X-Received: by 2002:a17:907:2d8b:: with SMTP id gt11mr6331177ejc.432.1630008622287;
        Thu, 26 Aug 2021 13:10:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c348:: with SMTP id j8ls7209188edr.0.gmail; Thu, 26 Aug
 2021 13:10:21 -0700 (PDT)
X-Received: by 2002:aa7:d3d1:: with SMTP id o17mr6204569edr.272.1630008621198;
        Thu, 26 Aug 2021 13:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630008621; cv=none;
        d=google.com; s=arc-20160816;
        b=hrv1DR8HC0KySHbRla9cqi2gqCoc0eOm7o+t17qXw8qIABVv3Cje+rPu70MfKabFm+
         6Aqmst/Pj/luIUvRqkxdQIN5Kjzb7dZF5aibLdfZ/cHoVmde4b8nx+I92VG+z/n9qnqF
         uiFSAv7BbJVbqDrdmhtJXPQBWVccIplop5821s3f1vxAlqoB8pqK/4JnOSopuT0xB7uy
         uK0X1H9P6NspPS+1ORE+iJr+YHQF9AXNZrMmz18SLtAU1GF4iPSFJV9WGlDAMwihT+ZX
         V9o0mW+EqxoigkhlHIX/KLSq0vx5Fa448b/cvY5wZGgTlTG9Rn2gok+EBJIdFckWrgp5
         GY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=pUGCDq2GSWvt53L5XIGEtuPCj3TxzHT07w6P2SxwHPo=;
        b=NcViSOmcjXPOISXhSVT4FAXc6v3ohEeHzBZzQieiq6js4TpraN7jygp7E14VcTdHZj
         skHXPAiomrRlGWHB7IKUZN0bMcnpHYszbNUxaiokGXbaCBcNWd13PAjc5rjY+/CFp8KF
         MgpRMW/I93gD+Jen6Rh778/foCdDP9B2iOj1EbZafFVT8P5rnaDrsGjEt9KCAX8wujTY
         OBpBuveAnGbayfq58n4CO09Wvnec8HhWICOaEaCxGmTDQokdHb4ohwMi3YZIGhPwDgB9
         /+5sw76ezhm1L8nQOqkQ2J2T69W+20exQinZ2IV9erIDeykKT76/0O6L4C0Ur7M4qw0/
         /kfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x1si164640edr.0.2021.08.26.13.10.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17QKAKTa021224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Aug 2021 22:10:20 +0200
Received: from [167.87.32.3] ([167.87.32.3])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17QKAJ3m026845;
	Thu, 26 Aug 2021 22:10:19 +0200
Subject: Re: FreeRTOS on Raspberry Pi 4
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
 <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6c30c54f-7dff-b8f0-f4fe-6da67ab97fc9@siemens.com>
Date: Thu, 26 Aug 2021 22:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 26.08.21 21:38, Ralf Ramsauer wrote:
> Moustafa,
>=20
> On 26/08/2021 12:14, Moustafa Nofal wrote:
>> Hello,=C2=A0
>> I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and jailhouse
>> forked from:
>> https://github.com/siemens/jailhouse.git
>>
>> Fork Link:
>> https://github.com/mustafa13e09940/jailhouse.git
>>
>> I edited string.h and added FreeRTOS source code to inmates/lib/include=
=C2=A0
>> The problem that I have now is compiling, I got these errors
>>
>> I tried previously to make my own scheduler on assembly, but I though
>> FreeRTOS would be more feasible.=C2=A0
>>
>> I am not sure what modification, that I require to enable Free RTOS on a
>> jailhouse cell.
>>
>> =C2=A0CC=C2=A0 =C2=A0 =C2=A0
>> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o
>> /tmp/ccm8j1fg.s: Assembler messages:
>> /tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb SP!,{R0}=
'
>> /tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer register --
>> `mrs R0,CPSR'
>> /tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector register --
>> `orr R0,R0,#0xC0'
>> /tmp/ccm8j1fg.s:1666: Error: unknown or missing system register name at
>> operand 1 -- `msr CPSR,R0'
>> /tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ldmia SP!,{R0}=
'
>> /tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `swi 0'
>> /tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi 0'
>> make[4]: *** [scripts/Makefile.build:281:
>> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o]
>> Error 1
>> make[3]: *** [scripts/Makefile.build:497:
>> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
>> make[2]: *** [scripts/Makefile.build:497:
>> /home/pi/repo_jailhouse/jailhouse/inmates] Error 2
>> make[1]: *** [Makefile:1629: _module_/home/pi/repo_jailhouse/jailhouse]
>> Error 2
>> make: *** [Makefile:40: modules] Error 2
>=20
> This is where you took the source from, right?
> https://github.com/jameswalmsley/RaspberryPi-FreeRTOS
>=20
> This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit ARMv8
> on the RPi4.
>=20
> I don't know if it's possible to switch back to 32-bit mode is possible,
> I guess Jan knows.
>=20

Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6c30c54f-7dff-b8f0-f4fe-6da67ab97fc9%40siemens.com.
