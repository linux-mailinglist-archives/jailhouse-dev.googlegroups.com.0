Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBDHIYCSAMGQEQJB47WQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740073544E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 12:55:11 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id 38308e7fff4ca-2b465ab1cc0sf12850931fa.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 03:55:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1687172110; cv=pass;
        d=google.com; s=arc-20160816;
        b=en+8pgG4+zo08zcE0nwhciwhIhLDrkMuDslmz30PFbyyAONmZ3BOqNf/Mo4PM8HDqL
         Gd1b8mWp8yCpf+3m/xdh/6W1XT3OCO7wMgs5zdIGkkh3Z6V9gYAOXg58Tpcxh4DV940A
         pc1sjrixStywq9lIg5TQ4CeFt2ySFE5EgZii7/MXRA7dcQX6UPJT9IGtzwdWlGei0iLp
         QKL1e+9viFPUkz+eIqa+UBjoC/+ddO1GRWnllgflAQQ/PINss46X5luMpw3NhxhWWtfG
         4MVwyUSXyc6fv8qpzQnpoUK6KfUkmuEOVL5iHoic9hVQeETTbyCCLF7DAP5mM9RD61cL
         mjZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=yEM5m6W7yVpHYii/Q64G8nMKF2IKIJgrV77jO8uYxto=;
        b=vZRw9uQ7wlEJhPyAQbY7gIbg1dcNjJdBHCeuReu695iw0mE5nZmH75yVmZ6gFD9XhD
         DNRuhL2f0NYTS3VuHGLOyTdFW0aHVNXGiLthWHV5OgWHyhjutKVC4Clv34axRh2Yb6j7
         3D+Ws0+1jhNvTWcSsqS8v8qPmkG75KuaZgax5b6XKLobXFS2JPNqkHP4kq0CLYHDDeqq
         wAjkA0l4QfO5ZWqozNU/ab7/Q7AByn5XrE1KLrQpgf/ItvQW88aqWHVjTZBgizrbrT1j
         Ji1Uy6Ldn2rHnxxAr1M+kaWvvsDq8Wdbv7hcNGo+IPGa4tdeMCZ33M894JJWWJXPUfS4
         0kjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mwW9XGzx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687172110; x=1689764110;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yEM5m6W7yVpHYii/Q64G8nMKF2IKIJgrV77jO8uYxto=;
        b=PvupqKqvIQCZ/NjwOQZhpf5YsXp0i41H99TC1GW2h1N2Ot2HC1AEI9EV6oKVQ/X0hv
         FdqjH2Xp962f9pbJZGIFQJbtah0OCNoRscppI8qJw6zgTaArfAkTY72nUFCEyr4mvJAZ
         rzMeI6seiVfVGwzT4ifWwSJF4ctyuvpguioyGnV4QHK+5ti48kPe71eY1ArPcZ1eAj1W
         B4IecmA2h5O6JM4hg/pfGD7nSfVqvcjWpBGlQmVsyIMo4HLGcTo5B8u7NtJqtHbEauH+
         r0uSMQG2s/lBWQM4bTKpS2/HVxirKExqI7HQEaSwRvk1l4KNtNcnk05gvB+ZPKcNDROi
         pAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687172110; x=1689764110;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEM5m6W7yVpHYii/Q64G8nMKF2IKIJgrV77jO8uYxto=;
        b=aZAO2BJ0Rk/yhSMuA7KdDSElLrkRBTizMpnfXa4CMjJ8WybAqlVMjOL6Ly7rYJSJyQ
         0pZ6YiXaB3H0jkCMNcmhbQ1Pa8jPSs3QeqFKGgzmODLSrCkKIcbgiesPeU0AROOkmUT/
         U5edU4QFFKVn2OBY0U5K5w3rgQ8P0mWd9SxnGHIQyKuuNj50j/kg17iEWPkN/zi20jX5
         GChVSh4Nz2f1JWJPB6C2w1wkQexIzpYX51RfF4sNP8OA3Ax8VCmBjCN2LQH581P6SENF
         RTHmSJ6C+aLDcUl2HWka8DSW9gZfvyO2Q/WFp5FEuSLEro8VQUWDVGmL7M3wD8TX8cRH
         Ajog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxLuso92VyBpJJCDL86kVKhlaLkIEnec2z5wAulkfFxwTZxvAvA
	fHc//2FWTRPB9okeOzmTlE0=
X-Google-Smtp-Source: ACHHUZ6FHbwsklurLX6tw0soKQlPui1MAC8LiimNi3vetso4qj5ZIh2xZF9u9yISgjV2fMjfvr42Bg==
X-Received: by 2002:a2e:9dcf:0:b0:2b4:6504:3279 with SMTP id x15-20020a2e9dcf000000b002b465043279mr3435254ljj.47.1687172109271;
        Mon, 19 Jun 2023 03:55:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc15:0:b0:2b4:5c8d:cc68 with SMTP id b21-20020a2ebc15000000b002b45c8dcc68ls69180ljf.0.-pod-prod-08-eu;
 Mon, 19 Jun 2023 03:55:07 -0700 (PDT)
X-Received: by 2002:a2e:7819:0:b0:2b4:7fc5:21ab with SMTP id t25-20020a2e7819000000b002b47fc521abmr855034ljc.51.1687172107173;
        Mon, 19 Jun 2023 03:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687172107; cv=none;
        d=google.com; s=arc-20160816;
        b=TvyPJmvR9vdVG5K5cmm19y07Y4AliPbVypU9ivKVRcqecnHxcAlCKIvb7q2L2LJDMI
         Oh47RmwjYiaY5fUntjaNUKxbgr1+KcF4QPaLIxU/UKO9Eal7U+TWonjz0k6rjNgBfTdv
         vFmouEz7/GpS6N1SuoMHo4EgR5nJKoxchyAokMUteqzhNZEC2L1YB1dLMbPB17fhem8V
         nNIEeMChbQJzUfgdVTl5oU+AeLMvpvaEz8ZSdJo4O4kLrN+XUJdyEDEqRUkIzieIreaG
         26/U122xQOq9cG3aX/zwcf/jGZulMdCcHl4IhNevOf+7mq3gQZCV7o+uFRxZmH38MAyU
         piOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RtJ42S6zzyrcJ5UvGl2WS7i9ctUgWHCrmzCudhGA1fw=;
        b=xye3pl8fTz0rsXpjtA0KszmWn1HXEfeKqpLc3t3/MpAhh4esrYJpN66JYBfYgZZp3V
         aAbeptNdOk7PnfHPgf3zp9nqLHzeb8stWrjosk8yeYenMx99/OAT6xloEf9+LJV5J4m9
         rO0OLFGI6ULEh3cK6323djgq+YifjWg1hslbEO3PTaUhnXg2hFQkehObZ/BqhAt/kKbe
         2JAZzMkwM4nvFMuwCwPyOlJPcsiIC5GxAYsp0Rid9wz4QC0FEbOTPArWOud6SDrmaijk
         Xs9bOu2FGzbUamD5XaNUfWniyn0oWH4q06XrnZ68Ji+YGbl7YK9t9757F3qDn9QBhnS6
         Ttig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mwW9XGzx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x10-20020a2ea7ca000000b002b481b84f4bsi48303ljp.7.2023.06.19.03.55.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Ql69Q1SqZzxw2;
	Mon, 19 Jun 2023 12:55:06 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Jun
 2023 12:55:05 +0200
Message-ID: <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
Date: Mon, 19 Jun 2023 12:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
Content-Language: en-US
To: sai krishna Allu <saikrishna.allu@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mwW9XGzx;
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



On 19/06/2023 12:23, sai krishna Allu wrote:
> Hi Ralf,
>=20
> I have attached the hypervisor.o and I have taken the dump of that which=
=20
> is also attached too.
> I have below command to extract, let me know is it ok or not.
>=20
> ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d=20
> jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
>=20
> ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
> *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400282 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
> ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
>  =C2=A0 =C2=A0 =C2=A0 patch+0x218>
>  =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=A0 =C2=A0 f9400282 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
>  =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=A0 =C2=A0 f9400842 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #16]
>  =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=A0 =C2=A0 8a130042 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x19
>  =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=A0 =C2=A0 f90a4002 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0, #5248]
> *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400282 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
>  =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=A0 =C2=A0 f9400c42 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2, #24]
>  =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=A0 =C2=A0 8a130053 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x19
>  =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=A0 =C2=A0 52800022 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
>=20
> The instruction at=C2=A0ffffc0203820=C2=A0means it Load x2 from contents =
of x20=20
> register.
> Please suggest how to fix this.

Keep calm, I'm still trying to figure out where the problem exactly is.

Now I know the line of code, where the exception exactly happens. It's=20
in hypervisor/arch/arm-common/psci.c:39

ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only variant=20
how this could fail is that ctx points to somewhere. Here we're inside=20
the routine psci_emulate_cpu_on, which shouldn't even be called when=20
enabling the hypervisor. I don't know yet what could be the issue.

Before we keep on debugging: I saw that you use Jailhouse v0.12.

Could you please switch to the master and/or next branch of jailhouse,=20
and see if the error still occurs there?

Thanks,
   Ralf

>=20
> Regards,
> Sai Krishna
>=20
> On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf Ramsauer w=
rote:
>=20
>     Hi,
>=20
>     On 15/06/2023 10:11, sai krishna Allu wrote:
>      > Hi Team,
>      >
>      > I have=C2=A0Raspberry Pi 4, which is installed with Ubuntu 20.04.5=
 LTS
>     64 bit.
>      > after loading the jailhouse.ko file, when I gave following
>     command I am
>      > getting the exception.
>      >
>      > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
>     configs/arm64/rpi4.cell
>      >
>      > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
>      > Code location: 0x0000ffffc0200800
>      > Page pool usage after early setup: mem 39/994, remap 0/131072
>      > Initializing processors:
>      > =C2=A0CPU 0...
>      > FATAL: Unhandled HYP exception: synchronous abort from EL2
>=20
>     Synchronous abort from EL2 means that we have a fatal error inside
>     Jailhouse (e.g., segfault).
>=20
>      > =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc020380c spsr: 80000=
3c9 =C2=A0 =C2=A0 EL2
>=20
>     Could you please disassemble your hypervisor binary, and see where th=
e
>     exception exactly occurs? Do this with:
>=20
>     aarch64-objdump -d hypervisor/hypervisor.o
>=20
>     And see what code executes behind 0x0000ffffc0203820. Alternatively,
>     you
>     can also attach the hypervisor.o.
>=20
>     Thanks,
>     Ralf
>=20
>      > =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
>      > =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000008 =C2=A0 x2: =
0000000080003580
>      > =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000014 =C2=A0 x5: =
000003ffffffffff
>      > =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219d30 =C2=A0 x8: =
000000000000002a
>      > =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: =
0000000000000001
>      > x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0x14: 0000f=
fffc0219000
>      > x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=A0x17: ffffb=
cae22826688
>      > x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =C2=A0x20: 0000f=
fffc0219000
>      > x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =C2=A0x23: 00000=
00000000000
>      > x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =C2=A0x26: 0000f=
fffc021f000
>      > x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =C2=A0x29: 0000f=
fffc021ee40
>      >
>      > Hypervisor stack before exception Stopping CPU 0 (Cell:
>     "Raspberry-Pi4")
>      >
>      >
>      > Please suggest how to fix this problem.
>      >
>      > Regards,
>      > Sai Krishna
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-96=
66-9093a0b76300n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76=
300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-8=
12557f8162an%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0f73d59b-4574-17c9-e2da-68c52222be44%40oth-regensburg.de.
