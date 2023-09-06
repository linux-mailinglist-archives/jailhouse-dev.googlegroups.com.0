Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBRMS4KTQMGQENT6VVMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F784793E79
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 16:14:31 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id 2adb3069b0e04-501ce5902fasf150587e87.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Sep 2023 07:14:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694009671; cv=pass;
        d=google.com; s=arc-20160816;
        b=fXqGfXfTCfCXOWShxtaYbyV/vuPe0YErKS2HRgmcRph3DDXqE4MY8Yp9k5vH+YytVA
         2PZ7M4U39nPY3jxe12dcJF5kNYoH2VgQR54gI4uJ6RKl8Hd1VKr7/ItqmBiPfEAaFz36
         z8iFT+c7wIYRm1BLbajeFr6xLPJYUV4HLzEBfhkBNQynVt1KrZv9CwiESx6tNG6kHpbJ
         LwUSbmrHiIRoZIRMKfW5Y354c6sF/gfxxpEdYyztbsm+qvHDPBFjETWBcU9RM1nD6T6a
         nRVh/mGk4tek5lAWrpzmAJSyhK/HV2R74zZFGuENgzEggH9erXEGw65xsuFZeRN7En5F
         YBDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=cUBHRY6L840ddTptBvcYqtfTW1r7j+LmF0ZXoF8W/OE=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=SCMFeS42aBgOeK5izKJQbPQyedWl09WSdPngxC3Rg2bUYTPhkA3nbbPgjf36IrD6pi
         Y7Hr36BYn/32MQuhAVBtOEW9W2ZrWsowAAkz5xrAnZWZQG7aIajoUJf13qCC9HRFw187
         s4bKbu7n33EJ77PmFZyWnZ3SYxeZCJzMiX1mcii2gDDE1ljWbbIdT1ypwMkMryuTLzqO
         AYDcIeuPJEztzR+degMro2CB2a/mgYn0EIRuhrxsqu8/e9ds/t6ejBxWTTZ7MSB7jQcz
         bgCL6v5LkpBLV/2ZDGqbo7mrR535vvQ5niVEUATXsueYlwhy2VLum1TChlEwJBPbd+nj
         ZL7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Dxs3/SUc";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694009671; x=1694614471; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cUBHRY6L840ddTptBvcYqtfTW1r7j+LmF0ZXoF8W/OE=;
        b=OoSlqtcMid2iww/TclVw+y8bm66KoFe5jcs+s214wO7sgTz/+OCv90LBkoZjo7BeS4
         5ucITpEvNgrksqHCJIH2jNcyFCO58lUmPQTPQikUcvwJMUjG32y8H7zW/e/KvsAfM7x1
         NWylLVlDGo7BE5UektVY3m1e2tju/pVbg9SZQIfvyfl/xFuzL4RCCsvLMlDQD0GhPtc4
         kgj4+uFNhKhANVAJ2TgxVZ9zRqzpz4suLYeJLPuYPvZvKgXMoFG8KOIXm6NN4mr9NcRl
         4t7AeaQ+hSYzip4qz/mBfKsXQhrQRjFNTwDtlxgntQ0aWfzgbCf9B5w0hXlXNzt1/eHG
         2l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694009671; x=1694614471;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUBHRY6L840ddTptBvcYqtfTW1r7j+LmF0ZXoF8W/OE=;
        b=iTbm13mlNLC2RSWZj37vtf4XQNOfxYT9wNHJ1AYmKhy8qjSoo2OoOs/PnD5GRcn48t
         HGA7Tuql5qAjFjyBMO/VcgevqWFQekA8ibLymwCHy9S1TDKEK1FnmhngplBrBsnAlVTR
         PGOp2TCETMniIS6lCLVtW3aKtzSTIaQJzT25i6Y2UyM8g+zg0FC2i/9eLnK5PbnTNlhN
         G50YELtQuOCkL2DOQBmtSxrHTfALL2+HIT5ebc0UZqsKjpzVdaSWQu485p4gV/8qKu94
         fWIuqWP89KsACGKygBcxiGHe0I5ugRAAgY9Ztd4/urzrZzfB+jGQrAIr51aNj4nwu14e
         PdHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yx/OZnUnE2lYRmHngLhGns+gddda1gjrqYtW2AjjEaP4p7WFI1s
	MKEnL9BcifA3P9dW/aZ66Os=
X-Google-Smtp-Source: AGHT+IGLsfANziPhqnrpyPmtHw+l5ka86uQKHkEo/hxv5UHCSQK3+u1F2c9mb/O4bj0PPc53QJyMJw==
X-Received: by 2002:ac2:58d0:0:b0:4fe:3724:fdb6 with SMTP id u16-20020ac258d0000000b004fe3724fdb6mr1095790lfo.30.1694009670591;
        Wed, 06 Sep 2023 07:14:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4651:0:b0:4ff:9bbc:f4b6 with SMTP id s17-20020ac24651000000b004ff9bbcf4b6ls106689lfo.2.-pod-prod-00-eu;
 Wed, 06 Sep 2023 07:14:27 -0700 (PDT)
X-Received: by 2002:a05:6512:158f:b0:4ff:af21:442b with SMTP id bp15-20020a056512158f00b004ffaf21442bmr1719322lfb.23.1694009667529;
        Wed, 06 Sep 2023 07:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694009667; cv=none;
        d=google.com; s=arc-20160816;
        b=CSBiBmc0bOmW0LDMBBcIV8JVHMo34O6MplmMMVQAg+iBkC5jgpIKWcucITiXi3/V/o
         7eSzcq7tmPeZzqUZTh0Qbqhrui8vB9BqVRjtGBxJLW9mkSDFvl4p6+ZZBMyngr5CaJWd
         +gpCHHC+njHk6kRo2jgzKAT4EvRvscM8jbZO7yLDabbmk6V+rp+JV5mIR/tFuXu7bCRi
         cJ3kDL3P9Rd9AVG++KTcN2Iv2RKjToPhv3ViD9H0TdvWDs9wxmjqpoSYTGS8G2J9V6nJ
         jEnqAkS2fRE4RK2Vc4cxxREe0XyeG0IgWBfDoENnF9vLpVVEncz7e1sbj6FHzXGAnamB
         Vw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=E1diivh6NVmpK5TBdWmMK34lwK42lC0U9ZsiuxTHEs4=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=Il386mUo7K0agT5lZS6HXf3v/SD00v8vyeXGReO2YtUu/jSWMVwlUHBN7rdbgi3pnQ
         XNqqka55wLe4THtVQT8uR6hWplYx0J7/1H92uVv51wdqg1UPgRKPNKWLw/LFWDO4hwUI
         cyKbApUyNidcLUKadPnev813s9vWKFRdy4kClT/FzfulLNuDvrQmgIi8BQXJjTskiqdt
         D4MBxDiyijaCRzhhRID80XU3lJKGiaTSACpqiRpiJIbFtTv6mbWvghC0MoQN1wIQwUkk
         d6f96lzW261FAWibNmq6FOkwF0Ye55F0CrhYJoPhLp+mrIOAzfvJYDM8H695qxfMCtvv
         8pvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Dxs3/SUc";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id d12-20020a056512368c00b004fbcd4b8b84si939755lfs.0.2023.09.06.07.14.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 07:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 092882E00CA;
	Wed,  6 Sep 2023 16:14:26 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Rgkrx58YBzxr6;
	Wed,  6 Sep 2023 16:14:25 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 6 Sep
 2023 16:14:25 +0200
Message-ID: <556c7680-b856-4791-a782-e42b05540ae2@oth-regensburg.de>
Date: Wed, 6 Sep 2023 16:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add new system register macro definition in arm64?
Content-Language: en-US
To: bot crack <unintialized@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="Dxs3/SUc";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 06/09/2023 03:40, bot crack wrote:
> Hi
>=20
>  1. I want to add some register definitions.
>  2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64
>     *has only two arguments*, but it can be expanded into assembly "MRS
>     X0, #3, c14, c0, #1"

oh yeah, that's finest macro magic!


#define CNTPCT_EL0      SYSREG_64(0, c14)

#define SYSREG_64(...)	64, __VA_ARGS__

leads to the equivalent:

#define CNTPCT_EL0	64, 0, c14

Usage of CNTPCT_EL0:

arm_read_sysreg(CNTPCT_EL0, pct64);

with

#define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)

So here, we, in fact, have

_arm_read_sysreg(64, 0, c14, pct64)

Which is defined as:

#define _arm_read_sysreg(size, ...) arm_read_sysreg_ ## size(__VA_ARGS__)

So we get

arm_read_sysreg_64(0, c14, pct64)

which is defined as:

#define arm_read_sysreg_64(op1, crm, val) \
         asm volatile ("mrrc     p15, "#op1", %Q0, %R0, "#crm"\n" \
                         : "=3Dr" ((u64)(val)))

The rest is done by the assembler.



>  3. I didn=E2=80=99t understand the definition in
>     inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t fi=
nd how
>     to expand the macro definition SYSREG_64

#define SYSREG_64(...) 64, __VA_ARGS__

SYSREG_64(1,2,foo) =3D> 64, 1, 2, foo

These can be used as arguments in further macros.


>  4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b011,
>     CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?

I don't know, but have a look at the Linux kernel to see how others did=20
it in a pretty similar way:

https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/vdso/cp=
15.h#L32

HTH,

   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/556c7680-b856-4791-a782-e42b05540ae2%40oth-regensburg.de.
