Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCF63DUAKGQEEGDQWJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0259D77
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 16:07:05 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id e14sf1564978ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 07:07:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561730825; cv=pass;
        d=google.com; s=arc-20160816;
        b=y3TF+XeXqVnIGeL3pK9C5K4qjS1TBdyl8WUl6zvStVknQZ5GdRBm4CPFZxaCMEjUJ8
         ICm1n6umMnxnCszeM98L0qs1oiSQvqYadbBq912qxvGrrsmkeYRNyiyEtj1x8buWPn7U
         FvIbAbXYMe+SBxnRrSnatEQgmteaEvdf8AR0hB4qZ2t3lIDjtXDdvBoL3zZ849+vO1X1
         +QDJRKvSOKFJRxbcCJdlXK2wncT4lflfNrtN07l+zx9LCAoY0XFugRD+AZcU40AhnXe4
         3pi4P74mNkgNLGlCk1CalMcNe21UxQm3xj0yZ03q4f0wqh0K7obKiaTfHT0jG+bmLxRV
         SgLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yer558pIrzgunliCDb4ni39Pg4UywTz4s3xoi6pa9TU=;
        b=QC3efyRK2+8In9WU3lyVTfFy3PusuJpXxBxp+/Kb8nzqOkAHTM0xjg6zhOhE6L4xpr
         j0pD+Kd01gCAGBnX7YEzgwQTeFXjnBY4hNcumNE8Rh95a5bkU+uApir2eqjqTz/Za3CF
         NPsIXpR8+fe5HTMobrBxJYZi1RrBMbdmBoNIFoWoX3JxZIA3t5AwpyozNVYQVxDcJ/rf
         028jVnT2Il8cyLlxIShNyH2JytHv4E1ZE2bAEQiAmnFZ08W+N3j8V8OUiATpl9JIXxmJ
         e+YibuxAAanmpM4fkOAEtG7MuuqQc2L6RII7e0Bb/eOBlbHVgBK5+q9Ycylt/XRIJkzS
         bGXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yer558pIrzgunliCDb4ni39Pg4UywTz4s3xoi6pa9TU=;
        b=iN1XFtpOJMrxsh5hl4FmMyuFvbOXvxnmpOZj1TzZGJzLOsUaeapIm3GN/S05vvpHJR
         VEOfuH/IwkQUES0fc1JWXwN68ExeJ3sFWKpEsqu7y0YMHqNB7ls3t6ouXOcTWwXjvK9G
         ffmT/VlVHjs+Rvrhl25eSNmylQfBX5lFhb+vHddSw8/BqUUGQALx3lc1l6Fm2rgZPeVk
         4exVMxl0QnepRIIsgDG5UKhwF2OjeBn0Oz3Jix1F6cjviKEsyG5Q3JtLohWWW02tgw8l
         AewbCkHQ5owc05enB7M3sfUZ7HtD8H09v1mYuu3nqipkhwTy09bHLFRmslGSZW5YkUwn
         CJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yer558pIrzgunliCDb4ni39Pg4UywTz4s3xoi6pa9TU=;
        b=JH8HMDh9JUH9n0EhHCi/OSUK8yYuU+bEGr17+mimGoH/neC35npIbgv8vQHmqmC5b7
         dZzKMXK+O7Yh8afIS5Dk+2z2cCRHn6eDd3d0MW4E6dLIoktQtbLr0DmNKncbtA/HUxZ2
         ia/3wHeTrekDO+wIg6pI1N+AracgCH+4g72kRcsI3ThyxHgG0IE2KcT8Vgcdpro3yUWk
         fiY65lJ3oXuaUPfX/HTH2Nrn7Zh2aY7/DxrWanpqPbvG8uwCOgbfuCypZqI25fhWFLOD
         qfmI8c/9rk+BXIR5iCXfED9NyTHootkzDMr+LEScyXBfdk2t0LpGRGLa1FZwTujMjfwO
         bVPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX6AZpDsgrJBfHZP1z4B6hT/6CKl5fWj3ipDUpnmikYiKjYUe1e
	FSWLdnxCriWXuqXCKja73Ng=
X-Google-Smtp-Source: APXvYqyAryYE+qmths5kbyaS249ewAp8VciRRY80ZTLTbji4YEKimOnpAq6RSMFkImgZXoHMh+lEAA==
X-Received: by 2002:ac2:5dc8:: with SMTP id x8mr4959007lfq.94.1561730824954;
        Fri, 28 Jun 2019 07:07:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9153:: with SMTP id q19ls343083ljg.13.gmail; Fri, 28 Jun
 2019 07:07:04 -0700 (PDT)
X-Received: by 2002:a2e:8801:: with SMTP id x1mr6217283ljh.1.1561730824296;
        Fri, 28 Jun 2019 07:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561730824; cv=none;
        d=google.com; s=arc-20160816;
        b=q33TP+TqA5OHNSdZhcVzmgaeX+Q8ZuG8eRj1q+G23AqpOrc5n9JJSTOXeFsqjoPyI+
         CZMKVAo/e7edyQ1k8UbacjRO4QJwxGxm1Kpx15K0Gnj4TEjT9+ZkSusVSYWoXMGWB3P9
         Sa5csubxQhXhVap1dIavE5ZgJqye2a3ERRvRpgIrkgb9QTCdxE63kqhV+nJ8SWFknutt
         LLVvweO7SDCLRYU/fMl6QbkAVJxteDHGx7HDp3Zq216i3WbWb9lcS1uhH98UTiIhnX0k
         NOWUMp/mz1XAEqiTISvp6rCDh0q8ln71/c309eLHHflYUIbv7/gjn8xGOdT2fxvP4ec3
         oc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2IcCVc/AE1Si/EYujeA2H75esBaRJq0AuK1ZjBZ2V+Q=;
        b=mxNGe/d8jcTAy9ooKV+PmIJZ+zqgJdQq3Rn/p3oSSTNLMbgpBYxqJeSe/oP3dxPqpr
         eqadRNRmMohgCKd75RhHSRSfdCiUVUxwPaABSMrVgG9e7uRJrVzqrFc9NMG1lsGEVw/k
         kK7p3XxOQbL0xfApRMQ4us8Mu1sub2ORvzxCpRrABE8FxvaIAddxtsX8dg6ScyITA9s9
         I4UOStDzK43WsPnAnV6c3leJ9HLZQZ17xi1ds4hTMZ5mvSn9z6dUceMmkeNz1uq4/eCo
         NgDLiZytvxfOw7vpuWfllcKk/ReBxJOJ+nf6nfxKjE1v0o45mV1jEMQ5PvtH7ZdLxif4
         HE+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e24si89837ljk.5.2019.06.28.07.07.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 07:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5SE73uX026806
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 16:07:03 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5SE72Jd026429;
	Fri, 28 Jun 2019 16:07:02 +0200
Subject: Re: Errors to compile jailhouse with ARM GCC 8.3-2019.03 toolchain
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c1ca3b69-9521-84d1-c37e-a83c085dd0a4@siemens.com>
Date: Fri, 28 Jun 2019 16:07:00 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <aa74bdfd-c7b3-f798-6ac7-6ef836017c46@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 28.06.19 15:50, Vitaly Andrianov wrote:
> Jan,
> I was able to get almost everything working on AM572 IDK, but had to move=
 to a=20
> new compiler:
>=20
> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture=20
> 8.3-2019.03 (arm-rel-8.36)) 8.3.0
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.=C2=A0 There=
 is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
>=20
> Now I'm getting errors:
>=20
>  =C2=A0 CC     =20
> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/set=
up.o
>  =C2=A0 CC     =20
> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smc=
cc.o
> /tmp/ccm9f2Kw.s: Assembler messages:
> /tmp/ccm9f2Kw.s:52: Error: selected processor does not support `smc #0' i=
n ARM mode
> /tmp/ccm9f2Kw.s:82: Error: selected processor does not support `smc #0' i=
n ARM mode
> /tmp/ccm9f2Kw.s:109: Error: selected processor does not support `smc #0' =
in ARM=20
> mode
> /tmp/ccm9f2Kw.s:140: Error: selected processor does not support `smc #0' =
in ARM=20
> mode
> /tmp/ccm9f2Kw.s:170: Error: selected processor does not support `smc #0' =
in ARM=20
> mode
> scripts/Makefile.build:303: recipe for target=20
> '/home/a0794637/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/smcc=
c.o'=20
> failed
> make[4]: ***=20
> [/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/sm=
ccc.o]=20
> Error 1
> scripts/Makefile.build:544: recipe for target=20
> '/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm' failed
>=20
> I guess the new toolchain requires to pass additional "arch_extension" op=
tions=20
> to assembler.
> If I add asm(".arch_extension sec\n"); before each asm line in the smccc.=
c that=20
> works, but I'm getting errors at other places missing "virt" extension.
>=20
> I don't believe I need to edit each source file, It must be a way to add =
the=20
> required options to makefiles.
> Do you know how to fix that issue?
>=20

The original idea was to have that extension enabled by just including=20
hypervisor/arch/arm/include/asm/smc.h which contains that statement. Seems =
we=20
lose that with this compiler version. Or we rather need it in the asm block=
s=20
that define smc() and smc_arg1().

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
jailhouse-dev/c1ca3b69-9521-84d1-c37e-a83c085dd0a4%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
