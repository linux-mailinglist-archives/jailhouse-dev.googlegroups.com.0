Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB2WN3DUAKGQEO5HF67I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA459E0B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 16:40:44 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id i2sf4033531pfe.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 07:40:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561732843; cv=pass;
        d=google.com; s=arc-20160816;
        b=uKIl/uAfoESg4/tgzHfgA7fjHoNWZna427U5yskCoh3DXW7t6XQg3wPKo/JMGOoAHe
         sLWeyAi0yVfArhKp3XoeMrHPyIj51OSLTtG33E/2WIIHdBo/6YpLkDPZbJtqQQ+6lIsA
         dT059OtAGxk3JoWei/0NaJykmzrUjVlIhHjYZVrXPuMshp2vw3WCRL2JM3dXJPetuB/G
         Txb3cu5ponJQMndDRTADRhdcXRgPmjNhL+Al0pBiJhqfH3BKHqc7VU2zDBhrn3O3FgrC
         CZ8xDKQ9OHGEHF0EHJYGn/89DsgFm1jCv55tmfb9PX7L88LnmVtCXMk3JGlmmJwOgr9R
         6wNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fNDstWaXUZTznePwY8wT0sEhs1JJt5uh+NswTCDGTvM=;
        b=f9Kw5SJDA+XktpQ4SFbBRu178w0ChcalLGfj8KpWFn2p7gcaOfW7EAVV0naux7wLPg
         U//pY6C6+cvORi8DNRGf2vV2I9cGMJm5OwyrnFRevyfatyDPOn58WGDxFCIsgS46WPrl
         gwMG0ZLWmuScAtEqsRrU28YFi4gsA3wH6aG4vSkl+PiSWZod9eb4NyTvrjW7d57VQwf0
         Ao8lQ4oB4N2oKZtoPj8nnNddbPETHucs01BSNT9gSpiIAIPRqlBYDdBSe5Fi0+q8zq5W
         YA253cGL/yJnCWuUb+OugsQDZwPPd0vDHUhUGOyqYOL7lVKBUZPJQHyZGy8y3ePrtGw/
         sKbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P4IQdWBB;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fNDstWaXUZTznePwY8wT0sEhs1JJt5uh+NswTCDGTvM=;
        b=TFO2YRRbmh6YQ1v4OhsJU08agCAXwmz4U+pjLLZ+TNuO/OhvBNVG2ylOX6yk0HqhMJ
         fuwFTvsy+SHthKT2m0n6aFtZvYUp2EDosJcinzgOBXhpGAqfRc57x4dVlidXkWzF1N1N
         G/nddwMg7NW8faqXAvof5JZvuIjU8TIjmeRbPlx2IrfBRaQU4PcKAmgCGNXU0eT2TS/c
         /F1smGs4ngGJMS5LGBVreJq1368mO+xDAziK9AGYcn8/CzO+/3PSjG4pb4ocn/mfJTZ7
         3IuZwbC4/deQhgkOS4DVd9lPrw4NH6Io/PFWG9CyYZMEohPZFY2Aga+6RAzbFBKxG/I4
         yS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fNDstWaXUZTznePwY8wT0sEhs1JJt5uh+NswTCDGTvM=;
        b=WOdYweHsm/xBkvkGNEY0cT9MJ7JzXZeB3Li3CVHe2C1TgKa6maQcyyJ7lDrV40xI3O
         IOwkjEFsZpGucnYbnGlrFLbK66jebmtninXH6vLS6VBFHI2i0BISKQFUYfBtWTfklOeY
         qJ2UVdTZ6YIvvCrVxKpev1VCnSl3khI59375V9hCDap4PZL1TmVOs+XyP2v9yv2XLE8A
         RpJczTEp4llPDiSxJtvxPBYPuWDdsKR/YUbj1snaDoWszNL9ONAbqUNU1n13fiP3Bixi
         ogPBerbMLAZfvux7W/BO8W7SO5B5v6PYJEFYwYWiZMOkDfFpsxMslpnRscv+0zXR8jS5
         bMKA==
X-Gm-Message-State: APjAAAVUsG+SFoQ/NdErlceW72vvaA4hpOpn75isBOYRIN+yTrDiIoiG
	HabJdTc9KFoDufoYU608p/A=
X-Google-Smtp-Source: APXvYqyTvm3CNvJ+5dqfwJHXHUpZJZPpAgP45OfKQa9UHpKL2vW8MmHKaWhpfJ/AGWgJLX3HOB9Emg==
X-Received: by 2002:a17:90a:30aa:: with SMTP id h39mr13713465pjb.32.1561732842853;
        Fri, 28 Jun 2019 07:40:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:d705:: with SMTP id w5ls1000671ply.12.gmail; Fri, 28
 Jun 2019 07:40:42 -0700 (PDT)
X-Received: by 2002:a17:90a:3463:: with SMTP id o90mr13998837pjb.15.1561732842395;
        Fri, 28 Jun 2019 07:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561732842; cv=none;
        d=google.com; s=arc-20160816;
        b=rANe2zU6PTYH2vf8Vun3oK15v+ybaFte2+hE2LsS/OZy+snY33LmjXShG7OtNi2uOO
         NgCzP8lK08AN0K628Ze6Vh4wODKyU2N3w+mJwjjL33DJploXHftPe15DMhGP2S+NTaVI
         MIOKzznlClNEyzlt+BboljEPa+oYUFI+zwkg7pyMkKhjOhHHpCJ73W76wW2ZUHDa0uHi
         e40tLjutEpaznlBq9wk0BZCYX2Zli1k4NE2ltnrFWOdewrfjLi8FUPHPz5OV+XBbLj0n
         KrNz76VXLgqy0Dd9HQKrbI4gFYSAu+VB2QJ+6vm0pL1mt8YlXVmKR1rnOLciTKrYnRUa
         8QFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=hep3HGIMT/HQB4P4LartZiYHwlIMrDLq8x38ZwWBWTg=;
        b=wO/vEfnv8he+5LaPvTyh6kb1eXp6kE3rwG6dRg+jq0k1M3pWIAahZYHwBs8B8yYMUD
         RaojdmDEbyxZN8taD0uxZYGw1bRZ0F56AfO1YxcCftzK1H0vHiTkq+qoN6Bw9GBKeMmU
         9oukq7veW4n++/k8/pQ5CoZRWfaYL3AbPcQgUDcXsVn7/zNc5175O4cErALxgPOlADE8
         0NYiblyK7zBCunRYFVx4VarSxMKzmWbbpgcYub0L2x2pGUK0mUKITM9Ey0cryhJWxiZt
         UVP8eGBdVYnWETAdeuWOTRl3vMlsE7sA2d5+MAXMSJPQtE5Syc2nCk+r8qjE7NAKEGPy
         PAGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P4IQdWBB;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id j2si99529pff.1.2019.06.28.07.40.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 07:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SEef00052472;
	Fri, 28 Jun 2019 09:40:41 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SEefio065574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2019 09:40:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 09:40:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 09:40:40 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SEectr101019;
	Fri, 28 Jun 2019 09:40:39 -0500
Subject: Re: [EXTERNAL] Re: Errors to compile jailhouse with ARM GCC
 8.3-2019.03 toolchain
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
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
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b98a12f8-f526-15d0-ff5f-8b3e9058a9e0@ti.com>
Date: Fri, 28 Jun 2019 10:37:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <c1ca3b69-9521-84d1-c37e-a83c085dd0a4@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=P4IQdWBB;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/28/2019 10:07 AM, Jan Kiszka wrote:
> On 28.06.19 15:50, Vitaly Andrianov wrote:
>> Jan,
>> I was able to get almost everything working on AM572 IDK, but had to mov=
e to a new compiler:
>>
>> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture 8.=
3-2019.03 (arm-rel-8.36))=20
>> 8.3.0
>> Copyright (C) 2018 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.=C2=A0 Ther=
e is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPO=
SE.
>>
>> Now I'm getting errors:
>>
>> =C2=A0=C2=A0 CC /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/=
../arm-common/setup.o
>> =C2=A0=C2=A0 CC /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/=
../arm-common/smccc.o
>> /tmp/ccm9f2Kw.s: Assembler messages:
>> /tmp/ccm9f2Kw.s:52: Error: selected processor does not support `smc #0' =
in ARM mode
>> /tmp/ccm9f2Kw.s:82: Error: selected processor does not support `smc #0' =
in ARM mode
>> /tmp/ccm9f2Kw.s:109: Error: selected processor does not support `smc #0'=
 in ARM mode
>> /tmp/ccm9f2Kw.s:140: Error: selected processor does not support `smc #0'=
 in ARM mode
>> /tmp/ccm9f2Kw.s:170: Error: selected processor does not support `smc #0'=
 in ARM mode
>> scripts/Makefile.build:303: recipe for target=20
>> '/home/a0794637/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smc=
cc.o' failed
>> make[4]: *** [/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/..=
/arm-common/smccc.o] Error 1
>> scripts/Makefile.build:544: recipe for target=20
>> '/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm' failed
>>
>> I guess the new toolchain requires to pass additional "arch_extension" o=
ptions to assembler.
>> If I add asm(".arch_extension sec\n"); before each asm line in the smccc=
.c that works, but I'm=20
>> getting errors at other places missing "virt" extension.
>>
>> I don't believe I need to edit each source file, It must be a way to add=
 the required options to=20
>> makefiles.
>> Do you know how to fix that issue?
>>
>=20
> The original idea was to have that extension enabled by just including=20
> hypervisor/arch/arm/include/asm/smc.h which contains that statement. Seem=
s we lose that with this=20
> compiler version. Or we rather need it in the asm blocks that define smc(=
) and smc_arg1().

Yes adding the extension to each block helped. After that we have errors fo=
r each macro in the sysregs.h

-Vitaly

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b98a12f8-f526-15d0-ff5f-8b3e9058a9e0%40ti.com.
For more options, visit https://groups.google.com/d/optout.
