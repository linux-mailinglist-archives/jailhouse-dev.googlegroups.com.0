Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYPHWOEQMGQE6FPEUNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7E3FB8BE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 17:06:15 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id q62-20020a2e2a41000000b001d37080f948sf5214228ljq.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 08:06:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630335970; cv=pass;
        d=google.com; s=arc-20160816;
        b=GpKHn/TskJ5w4cPztv+umVYDT17M02x0g8Qn2ttC/lG1XZqQI6eCybX85N3di5MrRv
         9OVl1uzKds6Qawt2mrHVoA2Oj5MyebJDJq4d/VbKTjSq3dk1KexdV0PKtDvO4RqwIhGP
         Py3hikTJW4axH/9ibANyVibTVog9g09GlWi45OGityJG7kvzxAt9w+B43wmmL8rwZbAs
         x4G4niV8yL52UordHid5ZHXouiMRrYTXfyJyXPJ0F1Kh7S3fulVzegCXPuZqBpLUjd6T
         HSMy6U+Q4ntFn63FQwGARYSHxllkT+VnXRp5K4aUWa/S7K340suUPK+M0bgodGgK8yu9
         H7+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=1+3mFKzOAfJp6jacMatDvJ7FKdq8/SXkI1OklyG2s8s=;
        b=mnPXg+hIZtGLx3P5ykNsNY1EPoRrU+Z600ZvJXKoP1v8SZhoN8N9PMXqI2rQc2OefZ
         M7mzuX8G/dP5akhhtqlR6CluAG6hjKUbCd0nF+zTwtSfSdlVdoJZUbwlia2wxd3I/+WA
         f1wyYado2ICoRZ3G/o8BXpcqBcK8ozbf8g168F+1F03ToKXmijnzWOFBYP+qA357oQn1
         hMG+9n94vhi0Jkj/mewqEIF0m2d2CNfUDOfd8HBdJEn2sf32gDmpFIbJvVEjSFxm1B3O
         YvcYKBxCfdEyWUfQ9l0QpTC6/qsDUrPZiZXxQpRyT05/FGLA/8mn1ZRmMWf5zkmwIXW9
         wi+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wsq8lQNS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1+3mFKzOAfJp6jacMatDvJ7FKdq8/SXkI1OklyG2s8s=;
        b=nBHRa9PYzEcjz5KAEGBD95re5v7S00oKqwAM78THCLyvqzvunfHEDbeFb3vASFmOpL
         W5OzpEDipRQR15It5dFYoOfsWP66fr5MT9kEyxwXNLlreKON2FirGA2YJNXhdTfr0gQt
         ccVxcFiuJn1YLRHL0gVHb7VDnLiipX16TcUFRWD0SBpYGXkv09KvGq92TrrkojHC9mNB
         vjBv7rNXOklJzLN/eZIi87QYBcYZtJa0/CXComX8Z5WsiZmKO1lCypW9AAlM2CTZWxyP
         QIT5rTnFqBGkQ0NGAg2vaO3NkEy9iSGBzdi11zhVyyZ3JX5VT+FvGVPytCys/gdJMzSR
         F/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1+3mFKzOAfJp6jacMatDvJ7FKdq8/SXkI1OklyG2s8s=;
        b=ePQVV9fYkIbDn7fNab87z1k8gw3qYt44njhr3kBEgACPEzPDcrjlHD9KtshJJzlH2b
         WA9vilVj4jtWcqRb3lmCVeoZEsuItIQwfxzjNEaE6T/JdM/pGZlJQI3yOI49A5aa49bU
         MZrJM4Yw+3tsCyNccyfhUUOhrqiHlO9jSNlyiA+rScXIZS5j7jAZbihQdjCYBkaJ1Hgd
         exq5LUdFcpMHDIRybzowhxdBnRzKOrq+ZNt3BdJebib5d+1Vr8/22wM1+w4hODMFN11i
         MCBWPVoueivx8aNrzdIy8JYSS3zw9cbW6LW4BnCnx2sv+3crKhgEP4QbMnCZD0o94zql
         vNSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312mOs6S4TA6bnq6LCtoZST2AT1xxNGqv3D0HPwmVx7GIjpXeLL
	1ZfyxWbNi1XoxigGnVA/3KU=
X-Google-Smtp-Source: ABdhPJxIKn/ufWrEYN1rMYHc8gfDE2O/G7DINHnqsDvRHYsiYnQ6iD1R2KfCwOWj2G7p1hmi8QAnQQ==
X-Received: by 2002:a2e:8858:: with SMTP id z24mr20696441ljj.129.1630335970071;
        Mon, 30 Aug 2021 08:06:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1783:: with SMTP id bn3ls3140773ljb.10.gmail; Mon,
 30 Aug 2021 08:06:08 -0700 (PDT)
X-Received: by 2002:a05:651c:3d9:: with SMTP id f25mr20390705ljp.334.1630335968684;
        Mon, 30 Aug 2021 08:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630335968; cv=none;
        d=google.com; s=arc-20160816;
        b=PSi3umnvfiJz+/lvZd2sWZZWTJ20bdjJlH5cMztcheIg9qp4GmS8wQt+5vszR2foDq
         R70f+x4NXEhScaGVUDDCdix+kQ8QMBOYq56ugDlhSn3V3+EN0ucGlsN1bOjEDtog/uGs
         4s264fDXoT1S+19qB4x+vO0TZordmWb3uFJE+8lbwT5o5/+YJ40vFM/7zbzNVgB0+i2S
         Bq4L/UnFPWLqpoMVy6VrAsm2tfA9Rd+/l21Hb+3UQ/sOkQqhxAurA0LkzJ72wP4lml06
         rf8ZaPhlRFAMcyrCauDP97oh7EVuxy96tPBakaGMrLBPVfxZyIa7+71RnZ2/zuzUb2z0
         BQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=jDDItw1UowJ/PRg8GVtFLnyG4BnEH4d8FrrZP8Ghn1I=;
        b=sIub/0OE5KAtSY7ifUm/9zs5Er08I5PEgGC3YQ6PJrBsPGs02J4GRoKTjhsiYnp2g/
         dYNPuIbApEdut0tLMcMkudzSTs84cvwrOJuxQNP5y+nHi2TgnGb2u0k1bIF0oIoiuzgZ
         MOmtpTTaIqS3z4yZbH9DfRRhDG3ghDDXefdffX9/uP2wMWk913/hN6C4Vhix/qXJbsh5
         K95uw9a7VLHPuvTdDUmfOV7U8GAQ3g2psYqKzclCOTLKzoF0TqkZ7gnreoPTYNmFV5o+
         ev8PTeTY+UjknMIS0n3NLDmlBpce8+n4pURCSriH+WErWP0xHxbtX4l3LKwuZLLmwUXp
         5cmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wsq8lQNS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id a9si634146lfj.12.2021.08.30.08.06.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Aug 2021 08:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Gyttl37dtzyBT;
	Mon, 30 Aug 2021 17:06:07 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 30 Aug
 2021 17:06:07 +0200
Subject: Re: FreeRTOS on Raspberry Pi 4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
 <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
 <6c30c54f-7dff-b8f0-f4fe-6da67ab97fc9@siemens.com>
 <69e5e06f-3483-45b8-819b-3e7f54653138n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <6ec1fe77-5054-1d2b-debb-dabda5ed76c2@oth-regensburg.de>
Date: Mon, 30 Aug 2021 17:06:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <69e5e06f-3483-45b8-819b-3e7f54653138n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Wsq8lQNS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 26/08/2021 22:35, Moustafa Nofal wrote:
>>>Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.=C2=A0=
=C2=A0
> I added this flag to rpi4.c
> .header =3D {
> .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE | JAILHOUSE_CELL_AARCH32,

Yes, but this won't change the compiler for your inmate code, this is
just the definition that the cell will be resetted in AARCH32 mode. For
FreeRTOS, it is probably the best to compile it out-of-tree.

>=20
> I am just wondering, if it possible to do a bare metal context switching
> in assembly?

Why should that not be possible?=E2=80=A6 But in the end, it depends on wha=
t
you're trying to achieve.

  Ralf

>=20
> On Thursday, 26 August 2021 at 22:10:22 UTC+2 j.kiszka...@gmail.com wrote=
:
>=20
>     On 26.08.21 21:38, Ralf Ramsauer wrote:
>     > Moustafa,
>     >
>     > On 26/08/2021 12:14, Moustafa Nofal wrote:
>     >> Hello,=C2=A0
>     >> I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and
>     jailhouse
>     >> forked from:
>     >> https://github.com/siemens/jailhouse.git
>     <https://github.com/siemens/jailhouse.git>
>     >>
>     >> Fork Link:
>     >> https://github.com/mustafa13e09940/jailhouse.git
>     <https://github.com/mustafa13e09940/jailhouse.git>
>     >>
>     >> I edited string.h and added FreeRTOS source code to
>     inmates/lib/include=C2=A0
>     >> The problem that I have now is compiling, I got these errors
>     >>
>     >> I tried previously to make my own scheduler on assembly, but I
>     though
>     >> FreeRTOS would be more feasible.=C2=A0
>     >>
>     >> I am not sure what modification, that I require to enable Free
>     RTOS on a
>     >> jailhouse cell.
>     >>
>     >> =C2=A0CC=C2=A0 =C2=A0 =C2=A0
>     >>
>     /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo=
.o
>     >> /tmp/ccm8j1fg.s: Assembler messages:
>     >> /tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb
>     SP!,{R0}'
>     >> /tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer
>     register --
>     >> `mrs R0,CPSR'
>     >> /tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector
>     register --
>     >> `orr R0,R0,#0xC0'
>     >> /tmp/ccm8j1fg.s:1666: Error: unknown or missing system register
>     name at
>     >> operand 1 -- `msr CPSR,R0'
>     >> /tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ldmia
>     SP!,{R0}'
>     >> /tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `swi 0'
>     >> /tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi 0'
>     >> make[4]: *** [scripts/Makefile.build:281:
>     >>
>     /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo=
.o]
>=20
>     >> Error 1
>     >> make[3]: *** [scripts/Makefile.build:497:
>     >> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
>     >> make[2]: *** [scripts/Makefile.build:497:
>     >> /home/pi/repo_jailhouse/jailhouse/inmates] Error 2
>     >> make[1]: *** [Makefile:1629:
>     _module_/home/pi/repo_jailhouse/jailhouse]
>     >> Error 2
>     >> make: *** [Makefile:40: modules] Error 2
>     >
>     > This is where you took the source from, right?
>     > https://github.com/jameswalmsley/RaspberryPi-FreeRTOS
>     <https://github.com/jameswalmsley/RaspberryPi-FreeRTOS>
>     >
>     > This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit
>     ARMv8
>     > on the RPi4.
>     >
>     > I don't know if it's possible to switch back to 32-bit mode is
>     possible,
>     > I guess Jan knows.
>     >
>=20
>     Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/69e5e06f-3483-45b8-819b-3=
e7f54653138n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/69e5e06f-3483-45b8-819b-=
3e7f54653138n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6ec1fe77-5054-1d2b-debb-dabda5ed76c2%40oth-regensburg.de.
