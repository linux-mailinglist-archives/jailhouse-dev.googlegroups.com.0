Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5U26TTQKGQEGTOIBPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCDA3A63C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2019 15:45:26 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id i2sf3273307wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 06:45:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560087926; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qyz9pE+8CPKUtQv+MDQAmzc+wHNciArN/su/CK4yICxMnWNencXFWeIohJpi6360RU
         hjGbwaO1BzhRwKOdSvmwk/BdmI4ROtZ9att/ZM1BVQFfxV2uRq7QG2CT0z6eLnkoW2hu
         Qj/bEgSqorMUkcgLuG0jhKDNMs21e5ksXPMeoINgb5NBODatPgTdpeVU9LkhvKdWvcos
         vEFDLLxAk+QoL/U2vxetgKoPedxe0Ilh7DzhCa7UY44XrorP5WCiyZwY0sLFcIe8GfSG
         NqXmyzYNBSfSbG9OxuBqwpR6nJ4Z4FD2VpHjpfz8nYrw2BBNXviPEMPQH/mQ485pkoMR
         c04g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=RG8zsEwcOcvbSk9KpyEy7/HNQdpDK50bkyWiU0AUfwQ=;
        b=vkCyH5gZ4YYVn86TxWz1M5Gt5KEsP37riKdmocXj8J2vAXGZmt3g2hrkjv3i1SQ47S
         5a13hoTAszAO16kb6/fSbbBlNe7yVO7dwJ+p9MJ3P5Vuv8tiuTEN720XrZ7lwkpJMgbC
         +iM6uYv7kBdwhTynQyzR0TheOFfwmVo61r7mpLqCMADXo+blNHq0hJkqgE6eT97ayKeX
         QN/9RJJW4FHSvHKlYQlGMuCNzLVCiwhDaZhCq4aghaatKBBYlutJvP2ErJlhQ2ZstbYi
         BAtqqsg/kea/PyZ/7losEExrpPlLS5mhj6MILMFtXkx4w2rUFvYncfCkzyGOFUFRGbDp
         7vkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YIfZZQ2t;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RG8zsEwcOcvbSk9KpyEy7/HNQdpDK50bkyWiU0AUfwQ=;
        b=iBNCbHDh5UuVGTvbYyjv4JD/OOy39eEuCZX0sCsmtj2iW3Kcjo/Cm3T9atUwMJL6uL
         T8Ns01mYdtzcfk5GNsAR0VnT0lgOVBZNQqabJ1lDKtXKoJcfFHRbEFPfXvNr9uP9EBVx
         CefXt+RPDOQUBHOwDYVdOpLepE9Y2Rf0r6x2gTq0ZXnEv9Lxw5XV6ZssAGBbNqUILLQE
         2U3AOOLtcv/Xc6uqc4RGlG1pMFv3MxM/WV0kqELSkqov3DqveZ2xhAI8h/rxbjK6C0XT
         SowDn2dz+zzOYPVX3gZu/jBeVNbyp12DxcX1oO5MDUCDRtJsfYhNoGmu+Bum+k6Z1M2X
         /KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RG8zsEwcOcvbSk9KpyEy7/HNQdpDK50bkyWiU0AUfwQ=;
        b=FdECseK8r6Kses82mfxGNpDkDEBRIG6mcU89J6sfgG26ZmMwFe8QDeSAoU2FcSgnWE
         UhxOyMzStlngNNRKvYxzUnrXg/3mfo+jy/xQ1KOgJvOq0Z/wdrgKGmOwDICgxUrwBYYh
         hcpAUy/t583dOdcCV5f07UaLljmtkg9mS0Fo794Lo8eIkD81JWlFAsOWTGlei4eBHDZr
         xMHm6kwzu0Xu5WmBD3A1lE31qgR5gGdeM54X4B182DYrB5YeQ/A0EQI26LVpxdY1eoBF
         tWM8NuonVVDkPXvstsg2aHuIDyujMwPksEGwWGy0zotpg326CesDQw1rRC7P3z2Dj+UR
         DS1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXvFSwRPvqiHcfgZoz7XtuU2JQObcyPB3xHaQbUW/ebcN18bpKu
	E8k4coNsrOKMo5aP6ct7bVE=
X-Google-Smtp-Source: APXvYqx1X5sM1nrYq9eRcKpsKLDRx/y0Xa88m/dJqzEWoGyODt3lhgOMHoS0F/Mp4DBHVRe6fX+nPA==
X-Received: by 2002:adf:baca:: with SMTP id w10mr31862568wrg.230.1560087926558;
        Sun, 09 Jun 2019 06:45:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls3030134wrt.15.gmail; Sun, 09 Jun
 2019 06:45:25 -0700 (PDT)
X-Received: by 2002:adf:b605:: with SMTP id f5mr10742703wre.305.1560087925966;
        Sun, 09 Jun 2019 06:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560087925; cv=none;
        d=google.com; s=arc-20160816;
        b=Zgnz276/buSw/pcv/ZkFSC3muRKufP01zo4TXcRI0aVoBKFJy10SxAqa4LpglW5Ely
         uMCmGDmxPSx49FKUZGJPEp1old3kRG7gu+EzRtrBgTCsAPLJ+M0MgNeQPq2efcOc+SCK
         mM4emrhh0ONwFPPRQZemBLdvwAyO8HjyXZvhZS88FEMtMa4cnwBE9JWOLS5sd06TipQp
         1wFO4eXGDOoTBWOWIOA0CD+f0aI+L9mUXAw4DqHEqPqII4v1IYQ16iGgboDfeyfqM+rA
         20BY5QgrKKG1lNR0jMh9oOsUOaTM0m4CkTjTqPM09h1cnBX+uxJHoogxxvtP4rwNogg2
         /tMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=HVJ7NSA9cs7ChlpQrmYM7yOrTfBPkCXd43UNXyQ3GsU=;
        b=c8oCQ3ejHl+gbrz/KCsBn1HOp0aRyfKMMEcFwjF1rs7yasdF36hcFJKqoGk6nqn9GE
         Hla8njKZgSd8l+jbG8X5ED7IxRKuE8kr/sZZuvgNcjLcRMerMubYbfMSclJN0m/rTbYV
         Rbchk5+Ag2RAfbNzlk1pVoqvctUtF7TxXX2wzEMDrwJqBkQ+DCjfoWH6GtI5e1phmP0+
         MxkyuHsItwMnlNcnsbfsjnxEgBElK0p6Ev1TTOc5I8o1qWAl6KaK7FC8ez+ogQfMctDW
         EdOv+fLQlzX8X1klXxvphmNbg433UCYAS/5ToZRi89F8OA0wyAK6ZrIFW6RlAGYoGjxf
         ZAig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YIfZZQ2t;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id 194si285111wma.1.2019.06.09.06.45.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 06:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.112.120.183] ([193.96.224.60]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MQ63n-1hVrWx3WNP-005FO2; Sun, 09
 Jun 2019 15:45:25 +0200
Subject: Re: [PATCH v3 08/13] arm64: Initialise SMCCC backend
From: Jan Kiszka <jan.kiszka@web.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190103180651.8171-1-ralf.ramsauer@oth-regensburg.de>
 <20190103180651.8171-9-ralf.ramsauer@oth-regensburg.de>
 <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
Message-ID: <26dfebf4-9b80-2a77-910c-7bf846b65e17@web.de>
Date: Sun, 9 Jun 2019 15:45:24 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZtYInG/PV3A++E9XGgEnuMbz1fBNA4k3VLlbH6aQlJ1Hu5brFby
 uXyyS29IofFezuxraFOcAzcEEcBd+fLBf4j/zFg/2TNNS47//YrB9DFinsYQoBJXEaqvKqv
 p6fT4vL03levmLNIb1c/BgWO2iyxCQa2QU4SBiCq8A0qhJUGwF7DpIm/aXVkf2Lzis7gBk3
 G3j8Xd4RprGPWwVpecPdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F42OxYw9Fz0=:/8GesjopVvRK9AlZC43t6P
 6W0eH7TMNvO67bj2QOrl7Po2iwkqmivXAJ2f7pDB/H6uo1fAQQ6sD2gluLdfWAHo9XAQIaOcn
 U4Km92vl7bkUHaiG89htdYCc3gVj+Lv2SHeKjCCE8xuTeQIRoMmBXMqOS8327vXo23950cLKs
 u7+FxG6zNBepm+y0GHcsPUSvMx3VXSWs08UDJ7O9phVGDbEAl3Fc10ZxJO9kn7Hjf8/1pFfdV
 4vq8ztjJUhHFhaF7lBTFx1HcnakrnLrXEtLI/Y1ADX7IEUZwsei/61zu6xBeoP8pkM2NHkhqx
 H+97tW4IAk0Qv9oRbQRYla0B47ns8U2fTTw8BRlhu3by5UdGqrfRlTATk2OVNLvz6vENNtowX
 z/M8oqqA4ez9PiGooCSmg4/1fMUuxPvOIcwPUpqNL3KaURYyYBxH7UuwJ03NKlcdUPUemhKqj
 oplgrAjefdjGori1AtsA221rxBdKBZXJKusNjcJ8oi1/wU+tY5n9oqTfy89jY+ki9pvksSzI9
 sfsDU3dqlkfIttC73O4gZp7ORfn+F+rJDnDLggYjSPpssaPJ55esVecuFegj0DnXywUk3YHeF
 ShBOXFw4BSL4ySQiY3UGfk2iUIqku//BerbMkB3Coi18ef7b0jG7BNb4w0bUO2XbrS7eMcCEj
 3+Pok4xAMx9GhkSJAYYS7kMf33sQ/d2Fz2yFEBtni3+1S5i2c5JG96IFxRabibb18BEjDbSxY
 kap4rmattjEFYZV/0uU2Mtxi/DMuL5g2DXM7FurabijDyfZZmX2eSfX+b3Jzzh/ZS2aVssJN+
 GPO3NMFDeaWVbKmWREgBB10WP2vnHIb1EBvLKgBiCY3LbNC9KO0yBtC4cGng6v+omZtbdNUPR
 diuLvfa48bsktgdugInk654e0SHWpYY42lJbYlrv+oz8XnI+6vsmpaxEBZrJ/9kPYWh287APe
 cl2X4U03PhIn/3DcsVpJVrkuM5P1pHaoXa3cedNqAX3bZAITVv2+1
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YIfZZQ2t;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.06.19 15:37, Jan Kiszka wrote:
> On 03.01.19 19:06, Ralf Ramsauer wrote:
>> by discovering its features.
>>
>> The first step is to check the PSCI version. Don't even try to do any
>> SMCCC calls without having checked the proper PSCI version (current QEMU
>> horribly crashes).
>>
>> Probe if SMCCC_ARCH_FEATURES is available. If so, probe for
>> SMCCC_ARCH_WORKAROUND_1 and expose its availability by setting a flag
>> inside the percpu structure.
>>
>> The availability is stored per-cpu, as we might have big.LITTLE systems,
>> where only a subset of cores need mitigations.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 .../arch/arm-common/include/asm/percpu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++
>> =C2=A0 .../arch/arm-common/include/asm/smccc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +++
>> =C2=A0 hypervisor/arch/arm-common/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>> =C2=A0 hypervisor/arch/arm-common/smccc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++
>> =C2=A0 .../arch/arm/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../arch/arm64/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 6 files changed, 45 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h
>> b/hypervisor/arch/arm-common/include/asm/percpu.h
>> index b9278117..4b37e1be 100644
>> --- a/hypervisor/arch/arm-common/include/asm/percpu.h
>> +++ b/hypervisor/arch/arm-common/include/asm/percpu.h
>> @@ -15,6 +15,9 @@
>>
>> =C2=A0 #define STACK_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE
>>
>> +#define ARM_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 bool smccc_has_workaround_1;
>> +
>> =C2=A0 #define ARCH_PUBLIC_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long mpidr;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>> diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h
>> b/hypervisor/arch/arm-common/include/asm/smccc.h
>> index 563ab9ef..6c490fad 100644
>> --- a/hypervisor/arch/arm-common/include/asm/smccc.h
>> +++ b/hypervisor/arch/arm-common/include/asm/smccc.h
>> @@ -12,6 +12,8 @@
>>
>> =C2=A0 #define SMCCC_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x80000000
>> =C2=A0 #define SMCCC_ARCH_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x80000001
>> +#define SMCCC_ARCH_WORKAROUND_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80008000
>> +#define SMCCC_ARCH_WORKAROUND_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80007fff
>>
>> =C2=A0 #define ARM_SMCCC_OWNER_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT_MASK(29, 24)
>> =C2=A0 #define ARM_SMCCC_OWNER_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 24
>> @@ -33,4 +35,7 @@
>>
>> =C2=A0 #define SMCCC_IS_CONV_64(function_id)=C2=A0=C2=A0=C2=A0 !!(functi=
on_id & (1 << 30))
>>
>> +struct trap_context;
>> +
>> +void smccc_discover(void);
>> =C2=A0 enum trap_return handle_smc(struct trap_context *ctx);
>> diff --git a/hypervisor/arch/arm-common/setup.c
>> b/hypervisor/arch/arm-common/setup.c
>> index 4cc045ec..2a04cdb7 100644
>> --- a/hypervisor/arch/arm-common/setup.c
>> +++ b/hypervisor/arch/arm-common/setup.c
>> @@ -14,6 +14,7 @@
>> =C2=A0 #include <jailhouse/paging.h>
>> =C2=A0 #include <jailhouse/processor.h>
>> =C2=A0 #include <asm/setup.h>
>> +#include <asm/smccc.h>
>>
>> =C2=A0 static u32 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_=
SIZE / 4] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM_PARKING_CODE
>> @@ -42,5 +43,7 @@ int arm_cpu_init(struct per_cpu *cpu_data)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_paging_vcpu_init(&root_cell.arch.mm);
>>
>> +=C2=A0=C2=A0=C2=A0 smccc_discover();
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irqchip_cpu_init(cpu_data);
>> =C2=A0 }
>> diff --git a/hypervisor/arch/arm-common/smccc.c
>> b/hypervisor/arch/arm-common/smccc.c
>> index 211d6cd7..37c05b42 100644
>> --- a/hypervisor/arch/arm-common/smccc.c
>> +++ b/hypervisor/arch/arm-common/smccc.c
>> @@ -11,10 +11,42 @@
>> =C2=A0=C2=A0 */
>>
>> =C2=A0 #include <jailhouse/control.h>
>> +#include <jailhouse/printk.h>
>> =C2=A0 #include <asm/psci.h>
>> =C2=A0 #include <asm/traps.h>
>> +#include <asm/smc.h>
>> =C2=A0 #include <asm/smccc.h>
>>
>> +void smccc_discover(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D smc(PSCI_0_2_FN_VERSION);
>> + > +=C2=A0=C2=A0=C2=A0 /* We need >=3DPSCIv1.0 for SMCCC */
>> +=C2=A0=C2=A0=C2=A0 if (PSCI_VERSION_MAJOR(ret) < 1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>
> This breaks on ARMv7, at least on sunxi (Orange Pi Zero). I first thought=
 it was
> because U-Boot returning -1, instead "0.2". But then it turns out that th=
e smc
> itself does not return. I'm starting to believe we do not get the call th=
rough
> the hyp stub of the kernel, which is still active during smccc_discover o=
n ARMv7
> (in contrast to ARMv8, where we take over first).

Hmm, not quite: We are past switch_exception_level() at that point, ie. in =
EL2.
I guess I need to dig deeper...

Jan

>
> Do we support fixing on ARMv7 at all? Otherwise, the invocation of this s=
hould
> be moved to ARMv8 only.
>
> Jan
>
> PS: This change was untested on the Orange Pi until today and my attempt =
to
> demonstrate jailhouse next during a live demo at MiniDebConf...
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/26dfebf4-9b80-2a77-910c-7bf846b65e17%40web.de.
For more options, visit https://groups.google.com/d/optout.
