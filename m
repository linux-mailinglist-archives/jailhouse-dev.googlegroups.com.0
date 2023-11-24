Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBEFRQKVQMGQESMHD3FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A717F73E5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 13:35:31 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id 38308e7fff4ca-2c852ade108sf2623881fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 04:35:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700829330; cv=pass;
        d=google.com; s=arc-20160816;
        b=SQ1dXREcTUmWg5A+UE589H6ovCq8gsvA4Y3oxoi8xTT2ESq+qFkcF/u1nozM2u+eQS
         QWyhLyYLybrHiyklbo4yIwGyuLuaYb/uwrS8dmeu3g5lGZZF5JL7Urk2Gg2WAVOBqwrD
         JsmxjX2K44hht+OhxeClmyWp59VslymjoxY4dTjVP+fgIGKidelLAIm/SAtC+C700f5x
         SpMDmpqj0YUuC+uCThzl+vXOFEtH356OJbQvi58MNyL7I/efE8eMVDjI+rQayhzpoF6H
         K30DWrRH/VYcfMyrJ4EsLvRUyVmGRV8otq6HGHnwG1Pho9KipjZmOaJOWBT01FOjgHvq
         yZMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=gAY+lPyHHpZUkA185R3eEmL8ilPvyKpS2vBm2rGUy1c=;
        fh=ogMYmmuK14CtR8PDOMv+TTh7crRjDfcIGXLDcowfATk=;
        b=f2XNBQ0/2UavdyqgYASgcB7itMVu04C0RJSw+6gYqIqJ2LaIa/7azXTr/SSXKl+S54
         CjkqTKHTXNixWI/UX+Ft1sdco0u2Bg8GnsaXV4imLcnygqAJUxDsLrfVE+GNGeODLeeh
         87P+cZ0fS+ioEFGGTkR1qIe4IOjndvqyytlAqBST9h3Y5UoBLcJUMuCR9+DHevrqby4j
         zKB6ABgwuSpgZlfVQv/kbTTooLD6iggs4kgGnWLCleEcv8MgtfJzL+ElSCt/D9djo+mf
         tPx8k8REaHZ9Rkonklg8UWkXG1dZwIDHnm5q8TmyYIGUmyk4rHF8rSx2NkEf5XwWAoe5
         qU0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=HcckjFx7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700829330; x=1701434130; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gAY+lPyHHpZUkA185R3eEmL8ilPvyKpS2vBm2rGUy1c=;
        b=Le5a3/Tp0FtaDzcRwpwYnZqr69sk8LYUrfnVfybqPII3SvLtGdM2LaawpjhpIazuUP
         3nUJM/vbZFaKuC+RNWNQT5Q8pIKHzCoem8Y9Az+zkhwgDCxF5Yx2R8s2MlvaXqAOg2Ng
         fnLxCo+8Y44ZWZj39N2bq8dPepFSkw77ALpGjnSr2QV7TfFAbQjEiWutYmupICjcfruN
         sTCElHQAq7zg7RalkYZgiQ1gRPS3qyIOHGN66La1XCKiJ9vvO9+OiCpNs3KRa6+9CK97
         xOH1aiTk7Lni6inGrrg7ZPO4ppWzH2m0NFMfnKrsOpS2C1bAQVmoIe08Dwm0Gx7gp7XH
         Smgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829330; x=1701434130;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAY+lPyHHpZUkA185R3eEmL8ilPvyKpS2vBm2rGUy1c=;
        b=EAQ45+yOtKP0axZVJZ7xpDNEmEOsqUNdtE8hGpF85oQ6Hfx0hgfVHSn+1QhU3y7yB3
         TQQ57SKHqFxbcqIMuEDdZ44nPaxSedjSvGyEUC7quKTjcxMkcqk2UiQKyoflY6Hh7Kvh
         Rpip3k4qRSDRNzIC0v9id7vq18c9H7rgp3/KPt2rTW1YYCLyjaO+d37F6lT9NY/ld2yT
         SXfImLnOGcaP7ewmcrEmXgU5r/yhS6FgnTjnvUyMbFS4UZJTxBy8iu49+6jZB0E1VWWh
         uHsHodnm4c8b9KZnJ5ohQyvwvKTzMtQWq08yjx9VJW3AQUU6Vl6RhZDEN1+nO+31ibmn
         SL4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy7c2pNqDzlxEAVW8wXpdSu1WLj0WdYsDS7uQ8BI8c29crYCh5d
	zU7dhkgc08ENBzSSGh7YRI4=
X-Google-Smtp-Source: AGHT+IFQnSLAieDZKIxwhHoqM/Kq9qcV+cj3zl4XW8lhgeN0eW+f0xZYesn8MaHuoqnM+05ZPKNZwQ==
X-Received: by 2002:a2e:5412:0:b0:2c4:ff24:b02e with SMTP id i18-20020a2e5412000000b002c4ff24b02emr1905123ljb.3.1700829329583;
        Fri, 24 Nov 2023 04:35:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a693:0:b0:2c2:9016:aa8f with SMTP id q19-20020a2ea693000000b002c29016aa8fls77043lje.2.-pod-prod-07-eu;
 Fri, 24 Nov 2023 04:35:27 -0800 (PST)
X-Received: by 2002:a2e:bd11:0:b0:2c9:9243:b215 with SMTP id n17-20020a2ebd11000000b002c99243b215mr407789ljq.44.1700829326796;
        Fri, 24 Nov 2023 04:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700829326; cv=none;
        d=google.com; s=arc-20160816;
        b=zQaySB5se6Q5lTg1uOxUL4k4swi0zpD830OD9LEQpcCZIEeZwFas86L6P0JD1Q4VDK
         nEglUwwrj5popo2aPCaAoFgmj/Yd0DVOd6ot75BiF/Wkp3CYfeqWzW2ydyYzVOzqkt0S
         Bv3WeCkoAOJbKfRjCMrOTReJ77omztk+4G+pEyqjYVLGdlXtoJSw5tIIhj68SmVTJ7As
         MMcJkZ3TsalXlYMMIao9w3KF5/cMvuAWBSRQwYde9nr1znxrC/7tEh2fS2j3VcTafems
         kfV/SHjFm+lljKGfE7IBOqJsmlzKb5rMCGLXhNOTnhBt0RzRqwAt4/TZ+IL/qB6rCzfP
         yooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3LUYkkaZ0pWmywmVtrgK+BuI05qACox/1hBHJNkSStE=;
        fh=ogMYmmuK14CtR8PDOMv+TTh7crRjDfcIGXLDcowfATk=;
        b=F+Aakp0pIy5azCphrm/b8Sa2HSW7d+0EGqORotpXYycSn+WTHVzBYJWlzgPg400hiH
         Qux/ZzyIvfwTXyjuwymO/PH49WWHaQ3ruiDl98E1G0hISF9S1PDSpsxt/6VFMLQGtVw7
         RKiK5nYLIvGSf4tq2cO2hF1xxXcrPNqbZsVyeyjUMG+oZ3lPh+1nfVzq/R538Qo3Bacb
         7dHpsgyG9pYlNRMHMXvb9BDrLE9q3XJg/5NC0n7PXLSX2BuMreOYh1050Em4kqShJAT4
         iF02cyqt3OlA5E6kIX5a4/lpFFQ8N/6CkboKlt8EEhtUJW9x7QlGM6U/Ch3GhhvZNdZi
         uyOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=HcckjFx7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id b2-20020a2ebc02000000b002c28192fe0fsi159119ljf.0.2023.11.24.04.35.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id E9FF52E00EC;
	Fri, 24 Nov 2023 13:35:24 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4ScDwD4cgZzxr7;
	Fri, 24 Nov 2023 13:35:24 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 Nov
 2023 13:35:24 +0100
Message-ID: <ff542993-b385-432a-8000-6d4c6e193f84@oth-regensburg.de>
Date: Fri, 24 Nov 2023 13:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse on LX2160ardb
To: Laurent Corbin <laucorbin78@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <18173bdd-0873-4774-a664-ba03be4bd7a3n@googlegroups.com>
 <b3eeb148-9b47-4798-9201-043f3e258ccd@oth-regensburg.de>
 <ce75d57a-5bf7-44b7-95ae-2a494d6a9132n@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <ce75d57a-5bf7-44b7-95ae-2a494d6a9132n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=HcckjFx7;
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



On 24/11/2023 09:18, Laurent Corbin wrote:
> Hi,
>=20
>=20
> Thanks for your responsiveness. Unfortunately, I have not any output when=
 I
> apply your patch. With more traces, I can see that only PSCI for CPU=20
> suspend is
> used. I'm continuing my research to find out more about this kernel panic=
.
> Do you have any new suggestions or hypotheses ?

One further thought, see below.

>=20
> Thanks in advance,
>=20
> Le mercredi 22 novembre 2023 =C3=A0 16:34:10 UTC+1, Ralf Ramsauer a =C3=
=A9crit=C2=A0:
>=20
>     Hi,
>=20
>     On 22/11/2023 16:14, Laurent Corbin wrote:
>      > Hi all,
>      >
>      > I'm trying to run jailhouse on LX2160ardb (NXP board). To do that,
>      > 1. I wrote a cell file for my root cell.
>      > 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.36_2.1.0
>     from nxp
>      > mirror) with yocto.
>      > 3. I loaded the jailhouse driver as a kernel module.
>      >
>      > But when I try to "enable" jailhouse I get this error :
>=20
>     okay, I think i have seen a similar error before. Would you please tr=
y
>     to apply this patch, and see if there is some output on the console:
>=20
>     diff --git a/hypervisor/arch/arm-common/smccc.c
>     b/hypervisor/arch/arm-common/smccc.c
>     index 65639b59..afa26e53 100644
>     --- a/hypervisor/arch/arm-common/smccc.c
>     +++ b/hypervisor/arch/arm-common/smccc.c
>     @@ -83,6 +83,7 @@ static inline long handle_arch_features(u32 id)
>     return this_cpu_data()->smccc_feat_workaround_2;
>=20
>     default:
>     + printk("Unknown SMCCC!\n");
>     return ARM_SMCCC_NOT_SUPPORTED;
>     }
>     }
>     @@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_context
>     *ctx)
>     case ARM_SMCCC_OWNER_SIP:
>     stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
>     regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
>     + printk("Unknown SMCCC (SIP)!\n");
>     break;
>=20
>     case ARM_SMCCC_OWNER_STANDARD:
>=20
>=20
>     If you get an output here, then we need to probably forward those
>     calls.
>     Please get back to me in that case.
>=20
>     Thanks
>     Ralf
>=20
>      >
>      >
>      >
>      > root@lx2160ardb-rev2:~# insmod jailhouse.ko
>      > root@lx2160ardb-rev2:~#
>      > root@lx2160ardb-rev2:~#
>      > root@lx2160ardb-rev2:~#
>      > root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sections/.text
>      > 0xffffc45e1113e000
>      > root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.cell
>      >
>      > Initializing Jailhouse hypervisor v0.12 (369-g6a87b739) on CPU 0
>      > Code location: 0x0000ffffc0200800
>      > Page pool usage after early setup: mem 151/993, remap 0/131072
>      > Initializing processors:
>      > =C2=A0CPU 0... OK
>      > =C2=A0CPU 1... OK
>      > =C2=A0CPU 5... OK
>      > =C2=A0CPU 4... OK
>      > =C2=A0CPU 2... OK
>      > =C2=A0CPU 3... OK
>      > =C2=A0CPU 9... OK
>      > =C2=A0CPU 8... OK
>      > =C2=A0CPU 15... OK
>      > =C2=A0CPU 13... OK
>      > =C2=A0CPU 12... OK
>      > =C2=A0CPU 7... OK
>      > =C2=A0CPU 10... OK
>      > =C2=A0CPU 11... OK
>      > =C2=A0CPU 6... OK
>      > =C2=A0CPU 14... OK
>      > Initializing unit: irqchip
>      > Initializing unit: ARM SMMU v3
>      > Initializing unit: ARM SMMU
>      > ARM MMU500 at 0x5000000 with:
>      > =C2=A0stream matching with 128 SMR groups
>      > =C2=A064 context banks (0 stage-2 only)
>      > Initializing unit: PVU IOMMU
>      > Initializing unit: PCI
>      > Adding virtual PCI device 00:00.0 to cell "lx2160a"
>      > Adding virtual PCI device 00:01.0 to cell "lx2160a"
>      > Page pool usage after late setup: mem 228/993, remap 2576/131072
>      > Activating hypervisor
>      > [ =C2=A0173.577969] SError Interrupt on CPU0, code 0x00000000bf000=
000
>     -- SError

SError is a "System Error". See [1] what triggers a SError. I wonder why=20
this happens behind address 0xbf000000, right after enabling Jailhouse=20
(which works correctly). What is behind that physical address? Is this=20
the Jailhouse physical location?

Do you have all Jailhouse patches applied on your kernel? Are memory=20
regions reserved (via mem=3D option or device tree)?

   Ralf

[1]=20
https://developer.arm.com/documentation/102412/0103/Exception-types/Asynchr=
onous-exceptions

>      > [ =C2=A0173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O
>      > =C2=A0 6.1.22+g66e442bc7fdc #1
>      > [ =C2=A0173.577993] Hardware name: NXP Layerscape LX2160ARDB (DT)
>      > [ =C2=A0173.577996] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DI=
T -SSBS
>      > BTYPE=3D--)
>      > [ =C2=A0173.578002] pc : enter_hypervisor+0x44/0xa4 [jailhouse]
>      > [ =C2=A0173.578025] lr : enter_hypervisor+0x44/0xa4 [jailhouse]
>      > [ =C2=A0173.578040] sp : ffff800008003f10
>      > [ =C2=A0173.578042] x29: ffff800008003f10 x28: ffffc45e51736c40 x2=
7:
>      > 00000000fbd0ea70
>      > [ =C2=A0173.578052] x26: 0000000000000001 x25: 00000028652e0c1e x2=
4:
>      > 00000028652b7617
>      > [ =C2=A0173.578060] x23: 0000000000000000 x22: 0000000000000000 x2=
1:
>      > 0000000000000000
>      > [ =C2=A0173.578067] x20: 0000000000000000 x19: ffffc45e11144000 x1=
8:
>      > 0000000000000000
>      > [ =C2=A0173.578074] x17: 0000000000000000 x16: 0000000000000000 x1=
5:
>      > 0000000000000000
>      > [ =C2=A0173.578080] x14: 0000000000000000 x13: 0000000000000000 x1=
2:
>      > 0000000000000000
>      > [ =C2=A0173.578086] x11: 0000000000000000 x10: 0000000000000000 x9=
 :
>      > 0000000000000000
>      > [ =C2=A0173.578092] x8 : 0000000000000000 x7 : 0000000000000000 x6=
 :
>      > 0000000000000000
>      > [ =C2=A0173.578098] x5 : 0000000000000000 x4 : 0000000000000000 x3=
 :
>      > 0000000000000000
>      > [ =C2=A0173.578104] x2 : 0000000000000000 x1 : 0000000000000000 x0=
 :
>      > 0000000000000000
>      > [ =C2=A0173.578111] Kernel panic - not syncing: Asynchronous SErro=
r
>     Interrupt
>      > [ =C2=A0173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O
>      > =C2=A0 6.1.22+g66e442bc7fdc #1
>      > [ =C2=A0173.578120] Hardware name: NXP Layerscape LX2160ARDB (DT)
>      > [ =C2=A0173.578122] Call trace:
>      > [ =C2=A0173.578124] =C2=A0dump_backtrace.part.0+0xe0/0xf0
>      > [ =C2=A0173.578140] =C2=A0show_stack+0x18/0x30
>      > [ =C2=A0173.578148] =C2=A0dump_stack_lvl+0x64/0x80
>      > [ =C2=A0173.578158] =C2=A0dump_stack+0x18/0x34
>      > [ =C2=A0173.578166] =C2=A0panic+0x188/0x340
>      > [ =C2=A0173.578173] =C2=A0nmi_panic+0xac/0xb0
>      > [ =C2=A0173.578179] =C2=A0arm64_serror_panic+0x6c/0x7c
>      > [ =C2=A0173.578184] =C2=A0do_serror+0x58/0x5c
>      > [ =C2=A0173.578188] =C2=A0el1h_64_error_handler+0x30/0x4c
>      > [ =C2=A0173.578193] =C2=A0el1h_64_error+0x64/0x68
>      > [ =C2=A0173.578198] =C2=A0enter_hypervisor+0x44/0xa4 [jailhouse]
>      > [ =C2=A0173.578213] =C2=A0__flush_smp_call_function_queue+0xd0/0x2=
50
>      > [ =C2=A0173.578223] =C2=A0generic_smp_call_function_single_interru=
pt+0x14/0x20
>      > [ =C2=A0173.578232] =C2=A0ipi_handler+0x98/0x160
>      > [ =C2=A0173.578239] =C2=A0handle_percpu_devid_irq+0x84/0x130
>      > [ =C2=A0173.578245] =C2=A0generic_handle_domain_irq+0x2c/0x4c
>      > [ =C2=A0173.578251] =C2=A0gic_handle_irq+0x50/0x130
>      > [ =C2=A0173.578258] =C2=A0call_on_irq_stack+0x2c/0x5c
>      > [ =C2=A0173.578263] =C2=A0do_interrupt_handler+0x80/0x84
>      > [ =C2=A0173.578270] =C2=A0el1_interrupt+0x34/0x6c
>      > [ =C2=A0173.578278] =C2=A0el1h_64_irq_handler+0x18/0x2c
>      > [ =C2=A0173.578283] =C2=A0el1h_64_irq+0x64/0x68
>      > [ =C2=A0173.578287] =C2=A0cpuidle_enter_state+0x130/0x2fc
>      > [ =C2=A0173.578296] =C2=A0cpuidle_enter+0x38/0x50
>      > [ =C2=A0173.578302] =C2=A0do_idle+0x22c/0x2c0
>      > [ =C2=A0173.578308] =C2=A0cpu_startup_entry+0x28/0x30
>      > [ =C2=A0173.578313] =C2=A0kernel_init+0x0/0x12c
>      > [ =C2=A0173.578319] =C2=A0arch_post_acpi_subsys_init+0x0/0x18
>      > [ =C2=A0173.578326] =C2=A0start_kernel+0x668/0x6a8
>      > [ =C2=A0173.578331] =C2=A0__primary_switched+0xbc/0xc4
>      > [ =C2=A0173.578337] SMP: stopping secondary CPUs
>      > [ =C2=A0173.578370] Kernel Offset: 0x445e47000000 from 0xffff80000=
8000000
>      > [ =C2=A0173.578373] PHYS_OFFSET: 0xffffd3bc00000000
>      > [ =C2=A0173.578376] CPU features: 0x20000,2012c084,0000421b
>      > [ =C2=A0173.578380] Memory Limit: none
>      > [ =C2=A0173.853682] ---[ end Kernel panic - not syncing: Asynchron=
ous
>     SError
>      > Interrupt ]---
>      >
>      >
>      > It seems that my Linux panic when it has to jump from the
>     hypervisor to the
>      > driver (in arch_cpu_activate_vmm function in
>      > hypervisor/arch/arm64/setup.c file).
>      >
>      > Do you have any idea why my Linux panic ?
>      >
>      > Thanks in advance,
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
>     https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a6=
64-ba03be4bd7a3n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd=
7a3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/ce75d57a-5bf7-44b7-95ae-2=
a494d6a9132n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/ce75d57a-5bf7-44b7-95ae-2a494d6a9132n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ff542993-b385-432a-8000-6d4c6e193f84%40oth-regensburg.de.
