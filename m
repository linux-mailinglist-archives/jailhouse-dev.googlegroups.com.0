Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNG3T6EQMGQEFQS2AWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id BED263F8EC9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 21:38:28 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id j13-20020aa7ca4d000000b003c44c679d73sf2068064edt.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 12:38:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630006708; cv=pass;
        d=google.com; s=arc-20160816;
        b=plmbrnhKVJ5/3cx/cbmEGLycvvbZTlHauv08sbSY0ZLWhm9aOc3JkB3RxkqGcAsO30
         ClTO2dY86VMTp0AWqjVB13GaWIgZiykHvioYApN4jYU8rCjuo3PNfRP3My71dVzmNu3L
         oUNToS6pE982SfjPjNmlgCVXhtG8JezgP/lD3ds8ESkI3IUi3G6BHI79Nl0tU52t47hC
         sFOehVw/0E+1qYqS49wr5BMMTRhLvj/h0gG2ian0ICT3J7/dsL4V5qFnbz4mNjC2NsXN
         ihfahv9Zbog9X0AJY6DKO79ecw6BbA/lRLe2p/kODDKRmXOQ2rfyUaEuoUG/dsl8pkGC
         T1DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:cc:from:references:to:subject:sender:dkim-signature;
        bh=g7+AGz5iugcQARBaPEQvOlcl0SOsvSfXrsqXvSVUr1U=;
        b=vX7XFUfLUg6GG/tjuBV0xEfUt4X0q9Ick6qD9K9fKVsdoI5UO2SKz5mpY4QowTJHaT
         GnuPCBjsWD+y3JfbVGhwU2m0fACxXa2TAEQf1J6iyCBD3Q2MUpbwwsaiHfmo/3xJwDQ2
         wuLx7iIAPpaSzpBEmf5QC6ixiwl9NiQPEv+39Cbk+fVF4iEMoq+xBE7EWQUkUZVANqKd
         E5J4sLp628ohTL2mDm0sFUtBjbtVh0w3KX9oZ+2pLAwGPPGuFul4AUIMP5Cz6Ypofd+N
         BoNNFxJHWQ8bf3sFcZfePMkruIlPc6MeUI7GBv4XJImdQls1LCV5XB7oLzyY8jC2ligS
         Ublw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GMWnA73V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g7+AGz5iugcQARBaPEQvOlcl0SOsvSfXrsqXvSVUr1U=;
        b=Fo6L3wCX4JuznPNAmoDNRYTGtwRc2kI2KISk+SnBcEW+yPascTS/4Jh9G1gG2CuE1w
         2fQeD9xV/l6BLyJcXcaYRqcLYf2xjMe+AY7Cdi0kL1wvpxck4uPMnMlSf9knYb0PKmx4
         OH6gJfNPV/BC1D/QPtaaoumjICG1b6a4M5KH1i9HBr3LupLxgQSPwIpUu3GeZQ8fSCZX
         Vg+5b8NtbaZz4mWCqnyJlO5bJ4ZvTdg/14kH2GWJ9ZKGodjiX1Lhmw48E0Z4S43fYhfM
         /935CU62hATIxlrGUKKuSnX7U96IYHApZGBiBUtvHX5fismkNisHiNYDYhEpKbnHbJhA
         /3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g7+AGz5iugcQARBaPEQvOlcl0SOsvSfXrsqXvSVUr1U=;
        b=YpchvMOTObiaaBnKF/3G+6taXTih1C6w6i7NUEopyI2Vy9/Kf3il439oYZnDUptsIX
         3e/3rm4rTTq9RF0Qh8tw7ZekrJUq6GiqtsEKrQHTIsxgYxXckJxna8NbLfYJTJPvrZkg
         3ndvUnUDqUYLhccWXwE//e78Zq4/LJ53XJkdm9kWrttbtqxqxp/aJLCbFvlTfw2UrJ29
         lM/fpEF0Pgf5aqF9DUsL9b1ABmCya+XiGVsmO7jKz3iw+lZsEO8sPIFOM4H0vBJKPy04
         KGpDchczHWNSlUdAXsSHgqXVcrrPZorr0C9E6kISzls0Bnc2Lhc1vqUkyrGq3F4oySPw
         PWxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YCI69VSRwXG+sqJPLnqROuul28J73a9ssn2yrrDihrSK6xKDC
	37EoVLgnjEwjcBLMewGrJvU=
X-Google-Smtp-Source: ABdhPJxTeEqMWtxD6GaRrJu0L4A5tYqWyByF6b9jIq9RNoSyqun883ok8rvwCHNaySq7N3Pqs739vA==
X-Received: by 2002:a17:906:168d:: with SMTP id s13mr6056004ejd.13.1630006708477;
        Thu, 26 Aug 2021 12:38:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:254d:: with SMTP id l13ls5895701edb.3.gmail; Thu,
 26 Aug 2021 12:38:27 -0700 (PDT)
X-Received: by 2002:a05:6402:40c9:: with SMTP id z9mr5942833edb.159.1630006707304;
        Thu, 26 Aug 2021 12:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630006707; cv=none;
        d=google.com; s=arc-20160816;
        b=fcmLnjsdDfwk1q3f7k13pRwtcQ/xvWCZOA7YMA7yKHw8DMWzVBi7tFxKy/ZLvYkhl5
         YyXfXAPLmTBS/Q63rc+mKYiaRoUo+r+8pXW9qdy249KUSTSnRwgc/K5S/9Ow3atF+xbe
         Y4yGJsy+jIpX4SuNG38K3jZnsXehI3jiN32fV+FMImGXvlyA4Ai58RHfAeC7bxJGzQDQ
         n+KjbpotphZ1gpxCjPrWiGUz0HLwi3VzTBJq+43vud05gT7UIvUD4FBe8WF2cJEKm8s6
         ncU8bxARoy2UK5HpARW8oib0k6OEflQMIsDf0JbtpmMCsUayKFNjQD8iZUXRl04AzD5V
         qZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:from:references:to:subject
         :dkim-signature;
        bh=CgvOLrIi8Ae8yD9QeU4lp8s3tff2t5Osmvqhu14xy+E=;
        b=GBdwEKx88moezS0mhZJK7D3MrMaaup3lDr2TmckpJyzF+FJcyxB4j0D1/Fy6epuNeF
         rGs/6ASoo1rz47Tg9mD8VYbEz7/+kMAjWEEV99b1Cc2Gg9BEMvztcW9oCbaXEE/qjqCk
         YqMukBckY7Gky5y0iRocH5FwwFuQGcznQWkq70ejV0PCSlLqvL9ea9lJXV6CDzZvIV4E
         kvTY+vkuA3N8GUuJ1NbgJFFid0derbFZUtlCpWN1Q7PhR/VT3N6LPoK5pLP7RKFhe4uH
         PbJq0DNSrHSOIpBNuGs8Qtm9xyUhWd35VTKlmiJpsDZDsrzEpLRA4j0GeA3NZRo88rZv
         Yqdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GMWnA73V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id co13si265293edb.3.2021.08.26.12.38.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 12:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4GwY6p5nVVzyky;
	Thu, 26 Aug 2021 21:38:26 +0200 (CEST)
Received: from [192.168.79.81] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 26 Aug
 2021 21:38:26 +0200
Subject: Re: FreeRTOS on Raspberry Pi 4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
Date: Thu, 26 Aug 2021 21:38:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GMWnA73V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Moustafa,

On 26/08/2021 12:14, Moustafa Nofal wrote:
> Hello,=C2=A0
> I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and jailhouse
> forked from:
> https://github.com/siemens/jailhouse.git
>=20
> Fork Link:
> https://github.com/mustafa13e09940/jailhouse.git
>=20
> I edited string.h and added FreeRTOS source code to inmates/lib/include=
=C2=A0
> The problem that I have now is compiling, I got these errors
>=20
> I tried previously to make my own scheduler on assembly, but I though
> FreeRTOS would be more feasible.=C2=A0
>=20
> I am not sure what modification, that I require to enable Free RTOS on a
> jailhouse cell.
>=20
> =C2=A0CC=C2=A0 =C2=A0 =C2=A0
> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o
> /tmp/ccm8j1fg.s: Assembler messages:
> /tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb SP!,{R0}'
> /tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer register --
> `mrs R0,CPSR'
> /tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector register --
> `orr R0,R0,#0xC0'
> /tmp/ccm8j1fg.s:1666: Error: unknown or missing system register name at
> operand 1 -- `msr CPSR,R0'
> /tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ldmia SP!,{R0}'
> /tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `swi 0'
> /tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi 0'
> make[4]: *** [scripts/Makefile.build:281:
> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o]
> Error 1
> make[3]: *** [scripts/Makefile.build:497:
> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
> make[2]: *** [scripts/Makefile.build:497:
> /home/pi/repo_jailhouse/jailhouse/inmates] Error 2
> make[1]: *** [Makefile:1629: _module_/home/pi/repo_jailhouse/jailhouse]
> Error 2
> make: *** [Makefile:40: modules] Error 2

This is where you took the source from, right?
https://github.com/jameswalmsley/RaspberryPi-FreeRTOS

This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit ARMv8
on the RPi4.

I don't know if it's possible to switch back to 32-bit mode is possible,
I guess Jan knows.

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc%40oth-regensburg.de.
