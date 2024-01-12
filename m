Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBF7TQWWQMGQEGEXSCUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC882C4D8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 18:40:41 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-50e55a909basf5475568e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 09:40:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705081241; cv=pass;
        d=google.com; s=arc-20160816;
        b=qHTJCiJwpfu90hDRObM+MgaSBOmYHQTKt6qqLrRp3OMZm3wXsD84zine3wBVfyWcqD
         MIohAzNxAS2Od3Hs3+aXD0WLGf+1A+Spr8L3teca9H5aCjLHRNzmOqgjM5Sv/Nlwuwcc
         ZFTgVyJGFe6dm2X9JgOdlpvLWOZ3w2Ah5wo4fmSbAd4NOUMebWDjokN2/DVYkh6bZiIk
         u6TfrIb9eo1fHrKRTf2nNlo+LrUYCSXnOwDjk2yRMmjZOkQrdI061z6Ty6AjAeD/ZN/P
         COUCxm1+BNTlohuACZR3E3judJ9XbktclKb3UGet4SJrf/AMoZ2zVjeqz+nOz2KNxJUz
         IXSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:cc:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=8PPFl6RmFotiBXyUDAhhdfcGBg1WNseen7r0B9rKmcE=;
        fh=i1rPVbNASveBIt+/8YQuCfJlKRxz9Ggyord7WAHufHA=;
        b=B8rm7CLF/ka4FoVh2zhpBPfnCkl5HNJZCLziceoJVLTUJg2+098qhfZ4giy7NHLp+v
         Eyo8naBiWGbCh6Qx5prFMlzyZ7qxgopptO8Zwbb8ctL/t7YPCuJFORhuPKywbfx8s7Bi
         6in4Kihplsv+SI/X79YOqcvLrYP82KGH4eJRLdbO2auDU4ttxjMLTVYxtiWYOG/UZXq7
         OcbXP46XC9TkkmCedJljlCpthCe71ZiTVkR3dpHyiXMzROyRp0YapvxtrEhGvFQOehLE
         0jWQ7gma8Ozy42XfYWHY9gWuqbbhBA9KjIW+YEWceqr/NxPNukq6i8bKJ6uW+TUP6yzZ
         p8Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=gS8aWY0T;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705081241; x=1705686041; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:cc:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8PPFl6RmFotiBXyUDAhhdfcGBg1WNseen7r0B9rKmcE=;
        b=fzXRbKBX42FiQ+FdMT8cnchuB2tDyyhGHDAIfLlePSHWz9ZdzOTZsIjMIbxn8tgddJ
         VgWeUfwgbg4NS3xqjGUk77YdLQBM8CnDHGJPp4M12rLi04PxeHmnbOxKxO/cIDLNYxNg
         Xj+HkVnG1/xtBkRsZ8Pw2sgJugrhWcjiHYTRMCMm1HuKqkjqaZzLuD9PCHrHNa9yZWjn
         M0pUe16oJCnX3teNAyZT+JEAmA77Xv/9FD6ekSm+uUAGjZx4VA/NLd/8EJUhL10OjKL/
         qoi6nW1v4xH5+RDie69kOMzxyMLaP0igL2vkJS4QxYjon1Y0vfqTsqLY/i//9vgTk0ja
         xmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705081241; x=1705686041;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PPFl6RmFotiBXyUDAhhdfcGBg1WNseen7r0B9rKmcE=;
        b=sTgm7T9OxbSVlDUQ06jPFgN25YY/zrood5vO6LDDOpi9EGmr8gOQ7BJUXEHuKofcYg
         XG8ETXJQmzw2jBR05ybdlFxPZ7o4Bj9nv6VA8ODDt8sKqcS73F+U/CryGrUPmZI2KVIW
         F8+80gTO1PLGa65fRPJsa/0PVdiHCWTjkIYWA+7yMgLKSZRBiLxPs4E8WgNpRaBeH5CG
         zbI3T9gyFNwqqwuYZqzxa4yPlIdC/9MUztAeG3+9SGy0mIZrID/qTYDlkc/lqJj/kRM5
         4eNa5jqiFtUvBcHgh980e8SxW8Dxo+XAiw4Ld+vLHYz9ow69zLepHKGPt39DfpGqJwoS
         GZmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwFngsIYLiMyjAs1W+8VqC/uvhyvqqkyLUvRwhsOWPuwz/Uz32g
	+eqm+KwpMYfhFRUW8r5+EVM=
X-Google-Smtp-Source: AGHT+IG/lG4Ol+Oh+jG00ZkmuCCRmHaPV6WgSRfMq3mcFN7r3w9MkZu4Fjcj04RUk3YWHjFrclYF3Q==
X-Received: by 2002:a05:6512:3042:b0:50e:6958:c8a7 with SMTP id b2-20020a056512304200b0050e6958c8a7mr733556lfb.46.1705081239931;
        Fri, 12 Jan 2024 09:40:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1310:b0:50e:7b04:a7a2 with SMTP id
 x16-20020a056512131000b0050e7b04a7a2ls302365lfu.0.-pod-prod-02-eu; Fri, 12
 Jan 2024 09:40:37 -0800 (PST)
X-Received: by 2002:ac2:5999:0:b0:50e:b2ac:82a8 with SMTP id w25-20020ac25999000000b0050eb2ac82a8mr552727lfn.108.1705081236748;
        Fri, 12 Jan 2024 09:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705081236; cv=none;
        d=google.com; s=arc-20160816;
        b=ggrFoGcVRZvsAO83TygYQnytw5VdnLgsp7ajC+TJaYrv4Im3cV9RxhWSq+EfL9Jr/x
         9FZW2LAyVxjC56DuGQzEglsDoO4KDEnlrWrdvkEdPIQjS7xkkSEE4kTFfDsVbexrAQ/7
         pBt/iGXeUb7wYU/5RL9hjSwkDCkcR0DaruDU3kY1b9ACSLUHVrChuzITvmUWiUikSVFq
         F06owuUcRpvWGWg5EwgXl/qCSbAOg8kyxSJ2zNwBoDq0D5JyQcIVrUa2su4YtOi0hYMF
         cCmkGFpUP46zaBIZ447gxgm5LKfe32SdhSHx+ufKOU0mjJ4ZDtloufoutUqlTmxjCypY
         h7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=smwZL/PdgFwx3Wwte3qZBFo1Ll2ZXFJTqT4rmSxOBYM=;
        fh=i1rPVbNASveBIt+/8YQuCfJlKRxz9Ggyord7WAHufHA=;
        b=HMWzDda5UgoDjzwlBOuVLuUSXreqRkoyYMQ0w2Aq4f2Kj9aXFz0KYVy8nh4uSJlcRq
         lGPhzMNhjyTYWO5NVpLjIDDEN85jt8SKcR1tg3H1PKLLkpe0RBSTPuoSQ2JddG4blmah
         Z3F1tyjSkcfOukspxEpHVhI++oBsoFh3o3JIQ59ciWSca/EEL7EQjvk+eSf10k4VepXt
         uIVB6V+1gbjAGq4LBN9doCdX/Fu31wlLYbSHo64l551oRUIrtYYwpbTYaC62jTmUUlHu
         lrRrRzhREQVdf5uWenC//ME1xM8nE5efiJvCJ7HWyWFfPatbgcWI8ifTxQ3VwYk2DsJi
         8pAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=gS8aWY0T;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id y2-20020a0565123f0200b0050e9f50087esi141599lfa.1.2024.01.12.09.40.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 09:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 784DC2A0492;
	Fri, 12 Jan 2024 18:40:34 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4TBTMk1r5wzxsV;
	Fri, 12 Jan 2024 18:40:34 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Jan
 2024 18:40:33 +0100
Message-ID: <0b19f9a0-4f13-46d1-a851-3a0b57deeefb@oth-regensburg.de>
Date: Fri, 12 Jan 2024 18:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
In-Reply-To: <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=gS8aWY0T;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
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

[+Cc'ed Stefan, a colleague of mine who recently used non-root Linux on=20
x86 systems]

Hi

On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> The config is the correct one. Nothing from dmesg except
>=20
> [ 8254.074890] smpboot: CPU 8 is now offline
> [ 8254.206652] smpboot: CPU 9 is now offline
> [ 8254.254775] Created Jailhouse cell "linux-2"
>=20
> The hypervisor only reports:
>=20
> CPU 9 received SIPI, vector 96 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (this is the l=
ast line of the=20
> output from the previous attempt)
> Created cell "linux-2"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (first l=
ine after issuing the cell linux=20
> command)
> Page pool usage after cell creation: mem 272/32211, remap 16392/131072
> Cell "linux-2" can be loaded
>=20
>=20
> I tried using the -w flag, this is what it said when using :
>=20
> jailhouse cell create configs/x86/linux_guest2.cell
> jailhouse cell load linux-2 linux-loader.bin -a 0x0=20
> ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters -a 0x10=
00
> jailhouse cell start linux-2
>=20
> I take it the kernel is loaded at 0xffbe00 which is right at the edge of=
=20
> the low ram region. In fact after issuing the cell load command and=20

Exactly, bzImage won't fit in here - that's the culprit. And I don't=20
know why cell-linux places it there.

Stefan, CC'ed, recently enabled non-root Linux on one of our test=20
machines. Stefan, we finally got non-root Linux running, right?

We had other issues -- but why didn't we have that issue here?

Even if I try to use the qemu-demo config, I basically have the same issue:

$ ./tools/jailhouse-cell-linux \
     -w test.params -a x86 ./configs/x86/linux-x86-demo.cell \
     bzImage -c "console=3Dfoobar"

gives:
jailhouse cell create ./configs/x86/linux-x86-demo.cell
jailhouse cell load linux-x86-demo linux-loader.bin -a 0x0=20
/home/ralf/workspace/linux/O/x86-qemu/arch/x86/boot/bzImage -a 0xffc800=20
test.params -a 0x1000
jailhouse cell start linux-x86-demo

And same here: 0xffc800 is odd. What does our machine (dodecarya) print=20
here?

> adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Invalid=20
> argument.
> Nothing is said from dmesg, the hypervisor only says "Cell "linux-2" can=
=20
> be loaded".
>=20
> At this point I tried pointing the address for the kernel in the cell=20
> load command to the high ram region by giving -a 0x42300000 as the addres=
s.

Dont' try to work around, we need to get the loader script working, the=20
error is somewhere here. Manually adjusting the load address makes=20
things worse, as on x86, the params file contains the so-called=20
zero-page, and adresses that are encoded there must fit. That's why we=20
have the cell-linux helper script that simplifies things.

We don't have to do that ugly zero-page dance on other architectures.

I'll try to do some testing with our machine when I find some time.

Thanks
   Ralf

>=20
> I get the following output when starting the cell:
>=20
> Created cell "linux-2"
> Page pool usage after cell creation: mem 270/32211, remap 16392/131072
> Cell "linux-2" can be loaded
> Started cell "linux-2"
> CPU 9 received SIPI, vector 100
> CPU 8 received SIPI, vector 100
> FATAL: unable to get MMIO instruction
> FATAL: Invalid MMIO/RAM read, addr: 0x0000000001000000 size: 0
> RIP: 0x0000000001000200 RSP: 0x0000000000009fe8 FLAGS: 46
> RAX: 0x0000000001000200 RBX: 0x000000000000427d RCX: 0x00000000000000ff
> RDX: 0x0000000000000000 RSI: 0x0000000000001000 RDI: 0x0000000000000000
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080010011 CR3: 0x0000000000005000 CR4: 0x0000000000040220
> EFER: 0x0000000000001500
> Parking CPU 9 (Cell: "linux-2")
> FATAL: Unexpected #VMEXIT, exitcode 7f, exitinfo1 0x0000000000000000=20
> exitinfo2 0x0000000000000000
> RIP: 0x000000000000000f RSP: 0x0000000000009fe8 FLAGS: 2
> RAX: 0x0000000001000201 RBX: 0x000000000000427d RCX: 0x00000000000000ff
> RDX: 0x0000000000000000 RSI: 0x0000000000001000 RDI: 0x0000000000000000
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000001000201 CR3: 0x0000000000005000 CR4: 0x0000000000040220
> EFER: 0x0000000000001500
>=20
> And then it continues to display the vmexit error without stopping if=20
> the cell isn't destroyed. I can avoid this by increasing the size of the=
=20
> low ram region to 0x00200000.
>=20
> That allows me to proceed and starting the cell with cell start, the=20
> hypervisor output being:
>=20
> Created cell "linux-2"
> Page pool usage after cell creation: mem 272/32211, remap 16392/131072
> Cell "linux-2" can be loaded
> Started cell "linux-2"
> CPU 9 received SIPI, vector 100
> CPU 8 received SIPI, vector 100
>=20
> but without any other sign.
>=20
> I still need to decrease the kernel size, i only reduced it by 1MB.
> I'll attach again the non root config, however it isn't much different=20
> than the other I sent, i only fixed the weird alignment and changed a=20
> bit the start addresses of the comm region and the high ram region.
>=20
> Thanks,
> Michele
>=20
> Il giorno gioved=C3=AC 11 gennaio 2024 alle 21:55:47 UTC+1 Ralf Ramsauer =
ha=20
> scritto:
>=20
>     Hi,
>=20
>     On 11/01/2024 13:57, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > after changing the virt_start to match the phys_start for that
>     memory
>      > region I got an invalid argument error when starting the cell
>      >
>      > Traceback (most recent call last):
>      > =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", l=
ine
>     739,
>      > in <module>
>      > =C2=A0 =C2=A0 cell.load(arch.kernel_image, arch.kernel_address())
>      > =C2=A0 File
>     "/usr/local/lib/python3.10/dist-packages/pyjailhouse/cell.py",
>      > line 44, in load
>      > =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev>,
>     self.JAILHOUSE_CELL_LOAD, load)
>      > OSError: [Errno 22] Invalid argument
>=20
>     Are you sure that you created the cell with the correct config? What
>     does dmesg say? Any output on the hypervisor console when this error
>     happens?
>=20
>      >
>      > Printing the arch.kernel_address() returned 16760320 (should be
>      > 0xffbe00), so I thought that the bzImage was too big for the low
>     ram region.
>=20
>     jailhouse-cell-linux won't load the bzImage to the low ram region. Yo=
u
>     can use the -w option to dump a file that prints the commands that
>     jailhouse-cell-linux would invoke.
>=20
>      > I increased the size to .size =3D 0x04000000 and shifted the virt =
and
>      > phys_start of the other two regions to match the change
>     (virt_start =3D
>      > 0x04000000 for the comm region and virt=3Dphys_start =3D 0x4600000=
0
>     for the
>      > third region) .
>      > No issues were reported by config check but after starting the
>     cell i
>      > got no output even using earlyprintk.
>      >
>      > I also tried using an initrd but I got a similar issue, invalid
>     argument
>      > when starting the cell, this time it was the arch.ramdisk_address(=
)
>      > which was 107327488 (0x665b000).
>      > So i tried increasing even more the size of the first region to
>     size =3D
>      > 0x0a000000 (comm region now starts at .virt_start =3D 0x0a000000,
>     and the
>      > third region starts at=C2=A0 virt=3D.phys_start =3D 0x4c000000 wit=
h size =3D
>      > 0x6000000).
>      > Again, no config check issues so I started it but no output
>     again, the
>      > hypervisor only reports:
>      >
>      > Created cell "linux-1"
>      > Page pool usage after cell creation: mem 268/32211, remap
>     16392/131072
>      > Cell "linux-1" can be loaded
>      > CPU 5 received SIPI, vector 100
>      > CPU 4 received SIPI, vector 100
>      > Started cell "linux-1"
>      >
>      > My bzImage is 12,9MB and the rootfs.cpio is 23.1MB if that matters=
.
>=20
>     Try starting without the ramdisk. We can later take care of the
>     ramdisk,
>     but first the kernel needs to start.
>=20
>     For a compressed image, your kernel is really huge. I bet you can boi=
l
>     it down to a few MBs. With a kernel of that size, you might want to
>     play
>     around with jailhouse-cell-linux -k.
>=20
>     Ralf
>=20
>      >
>      > Thanks,
>      > Michele
>      >
>      >
>      >
>      > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 20:58:03 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi Michele,
>      >
>      > On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
>      > > Hi,
>      > >
>      > > I'm attaching the configurations I'm currently using. I'll try
>      > disabling
>      > > KASLR.
>      >
>      > [=E2=80=A6]
>      > /* high RAM */
>      > {
>      > .phys_start =3D 0x42100000,
>      > .virt_start =3D 0x00101000,
>      > .size =3D 0x8000000,
>      > [=E2=80=A6]
>      >
>      > Alignment of your high ram is odd. Virt & Phys should have the sam=
e
>      > alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that sho=
uld
>     help.
>      >
>      > Thanks,
>      > Ralf
>      >
>      >
>      > >
>      > > Thank you for your help,
>      > > Michele
>      > >
>      > > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ral=
f
>      > Ramsauer ha
>      > > scritto:
>      > >
>      > > Hi,
>      > >
>      > > On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
>      > > > Hi,
>      > > >
>      > > > Just an update, I was able to get the following output by
>      > adding -c
>      > > > "earlyprintk=3DttyS0,115200" to the command line:
>      > > >
>      > > > Started cell "linux-1"
>      > > >
>      > > >
>      > > > Invalid physical address chosen!
>      > >
>      > > could you please share your system and non-root cell
>     configuration?
>      > >
>      > > It smells like you have an overlap with the communication region=
.
>      > You
>      > > can check that with tools/jailhouse-config-check.
>      > >
>      > > >
>      > > >
>      > > >
>      > > >
>      > > > Physical KASLR disabled: no suitable memory region!
>      > >
>      > > Disable KASLR in your kernel for the moment. You don't need it
>     while
>      > > ramping up your system.
>      > >
>      > > Thanks,
>      > > Ralf
>      > >
>      > > >
>      > > > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINU=
X-DESKTOP)
>      > > > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11)
>      > > 12.3.0, GNU
>      > > > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =C2=A07
>      > > 18:35:23 CET 2024
>      > > > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115=
200
>      > > > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > > > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > > > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
01: 'x87
>      > > floating
>      > > > point registers'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
02: 'SSE
>      > > registers'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
04: 'AVX
>      > > registers'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576,=
 xstate_sizes[2]:
>      > > =C2=A0256
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7,=
 context
>     size
>      > > is 832
>      > > > bytes, using 'compacted' format.
>      > > > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
>      > > > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > > > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>      > > 0x0000000000000000-0x000000000009efff] usable
>      > > > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabl=
ed
>      > > > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: acti=
ve
>      > > > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x0000000000000000-0x0000000000001fff] usable
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x0000000000002000-0x000000000000212b] usable
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x000000000000212c-0x000000000009efff] usable
>      > > > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > > > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      > > > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > > > [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E8=
20_TYPE_RAM!
>      > > > [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn =3D =
0x400000000
>      > > > [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: WB =C2=
=A0WC =C2=A0UC- UC =C2=A0WB
>      > > =C2=A0WP =C2=A0UC- WT
>      > > > Memory KASLR using RDRAND RDTSC...
>      > > > [ =C2=A0 =C2=A00.032374] Using GB pages for direct mapping
>      > > > [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc_low=
_pages: can
>      > not
>      > > > alloc memory
>      > > > [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not taint=
ed
>      > 6.2.0-rc3 #2
>      > > > [ =C2=A0 =C2=A00.049702] Call Trace:
>      > > > [ =C2=A0 =C2=A00.052134] =C2=A0<TASK>
>      > > > [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
>      > > > [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
>      > > > [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
>      > > > [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0
>      > > > [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
>      > > > [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
>      > > > [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
>      > > > [ =C2=A0 =C2=A00.079135] =C2=A0?
>      > > __raw_callee_save___native_queued_spin_unlock+0x15/0x30
>      > > > [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_init+=
0x11e/0x29a
>      > > > [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+0x=
f/0x20
>      > > > [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273/0x410
>      > > > [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping+0xec/=
0x150
>      > > > [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x2e7
>      > > > [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
>      > > > [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f
>      > > > [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
>      > > > [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations+0x24/=
0x2c
>      > > > [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff
>      > > > [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_verify+=
0xe5/0xeb
>      > > > [ =C2=A0 =C2=A00.133400] =C2=A0</TASK>
>      > > > [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syncing:
>      > > alloc_low_pages: can
>      > > > not alloc memory ]---
>      > > > Closing cell "linux-1"
>      > > > Page pool usage after cell destruction: mem 254/32211, remap
>      > > 16392/131072
>      > > > CPU 4 received SIPI, vector 96
>      > > > CPU 5 received SIPI, vector 96
>      > > >
>      > > > This happens both with and without the initrd in the command,
>      > > i'll try
>      > > > to solve this and see what happens.
>      > > >
>      > > > By the way, is it possible that the new cell starts transmitti=
ng
>      > > with a
>      > > > baud rate different than the root cell? Without specifying the
>      > > speed in
>      > > > the command above the serial console stopped receiving anythin=
g
>      > > until I
>      > > > disabled and re-enabled the hypervisor. If not I may have
>      > something
>      > > > wrong on my end to solve
>      > > >
>      > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Mich=
ele
>      > > Pescap=C3=A8 ha
>      > > > scritto:
>      > > >
>      > > > I stand corrected, the freeze happens when i do not set
>      > > > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
>      > > >
>      > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Mich=
ele
>      > Pescap=C3=A8
>      > > > ha scritto:
>      > > >
>      > > > Hi, thank you for replying.
>      > > >
>      > > > ttyS0 is indeed whitelisted in the inmate and the number of
>      > > > pio_regions is set accordingly.
>      > > >
>      > > > As for the crash after disable/shutdown, I think it was relate=
d
>      > > > to the PCI device, after commenting that and the corresponding
>      > > > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUES=
T
>      > and
>      > > > CONFIG_JAILHOUSE_DBCON were already set in the kernel
>      > > > configuration I'm using for the non root linux; still, I
>      > > > recompiled it just in case.
>      > > >
>      > > > Michele
>      > > >
>      > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
>      > > > Ramsauer ha scritto:
>      > > >
>      > > > Hi,
>      > > >
>      > > > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
>      > > > > Hi all,
>      > > > >
>      > > > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
>      > > > is to run two
>      > > > > non root linux cells, however, as of right now, I'm not
>      > > > able to start
>      > > > > any non root linux cells.
>      > > > > First of all I don't receive an output from the cell (I
>      > > > do get output
>      > > > > from the apic-demo though), therefore I don't really know
>      > > > if they're
>      > > > > even crashing or not; this is the output I get from the
>      > > > hypervisor after
>      > > > > enabling the root cell and issuing the following command:
>      > > > >
>      > > > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
>      > > > > ../buildroot-2023.11/output/images/bzImage -i
>      > > > > ../buildroot-2023.11/output/images/rootfs.cpio
>      > > >
>      > > > for the first few tries, simply don't load a ramdisk. Try to
>      > > > get the
>      > > > kernel booting. It will crash with "cannot mount rootfs". If
>      > > > we get so
>      > > > far, then you can continue specifying the ramdisk. But
>      > > > first, we have to
>      > > > get that far.
>      > > >
>      > > > >
>      > > > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
>      > > > > Created cell "linux-x86-demo"
>      > > > > Page pool usage after cell creation: mem 336/32211, remap
>      > > > 16392/131072
>      > > > > Cell "linux-x86-demo" can be loaded
>      > > > > CPU 4 received SIPI, vector 100
>      > > > > CPU 3 received SIPI, vector 100
>      > > > > Started cell "linux-x86-demo"
>      > > > >
>      > > > > After this the cell appears to be running in cell list,
>      > > > however I can't
>      > > > > seem to get any output to confirm that (I even set
>      > > > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
>      > > > appears on the vrtual
>      > > > > console accessed via "jailhouse console -f"). I also
>      > > > tried adding -c
>      > > > > "console=3DttyS0,115200".
>      > > >
>      > > > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
>      > > > configuration?
>      > > > Actually, your cmdline is correct.
>      > > >
>      > > > > At this point if I try to disable/shutdown the cell, the
>      > > > system freezes
>      > > > > requiring a hard reset.
>      > > >
>      > > > Okay, is the guest Linux compiled with Jailhouse guest
>      > > > support? Please
>      > > > ensure that non-root Linux is compiled with
>      > > > CONFIG_JAILHOUSE_GUEST and
>      > > > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
>      > > > Linux guests.
>      > > >
>      > > > >
>      > > > > Also, there seems to be a mismatch between the PCI bdf
>      > > > value in the log
>      > > > > above and the one in the cell's configuration. In both
>      > > > root and non root
>      > > > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
>      > > > and the Root
>      > > > > cell correctly reports that ("Adding virtual PCI device
>      > > > 00:0f.0 to cell
>      > > > > "RootCell"").
>      > > >
>      > > > First things first. Let's try to get Linux kicked off before
>      > > > diving into
>      > > > PCI. Comment it out for the moment, let's do that later.
>      > > >
>      > > > Ralf
>      > > >
>      > > > >
>      > > > > If I understood correctly, once the cell works properly I
>      > > > won't need to
>      > > > > set the console anymore as I can assign an ip (-c "ip
>      > > > x.x.x.x" in the
>      > > > > cell linux command) and ssh to the cell, right?
>      > > > >
>      > > > > I attach the root and non root cells' configurations in
>      > > > case they're
>      > > > > needed. I can provide both the root and non root cell's
>      > > > kernel .conf and
>      > > > > the buildroot configuration I used if needed.
>      > > > >
>      > > > > Thank you for your time,
>      > > > > Michele
>      > > > >
>      > > > > --
>      > > > > You received this message because you are subscribed to
>      > > > the Google
>      > > > > Groups "Jailhouse" group.
>      > > > > To unsubscribe from this group and stop receiving emails
>      > > > from it, send
>      > > > > an email to jailhouse-de...@googlegroups.com
>      > > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > > To view this discussion on the web visit
>      > > > >
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-87=
8e-7203214b4fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4=
fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae=
-47c9-878e-7203214b4fc3n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com <https://=
groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc=
3n%40googlegroups.com> <https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com <https://groups.googl=
e.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googleg=
roups.com>> <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-=
47c9-878e-7203214b4fc3n%40googlegroups.com <https://groups.google.com/d/msg=
id/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com> =
<https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-72=
03214b4fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse=
-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com>>>> <https://=
groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc=
3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://group=
s.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40=
googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter>> <https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/ms=
gid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?=
utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/=
jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_=
medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailh=
ouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter>>> <https://groups.google.com/d/msgid/jailhou=
se-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-d=
ev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Dem=
ail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/8=
24bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&=
utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_s=
ource=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-=
b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_sour=
ce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-=
47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3D=
footer> <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9=
-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfoot=
er <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e=
-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>>=
>>.
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to the
>     Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails from
>     it,
>      > > send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f=
9f-699daf338843n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338=
843n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/22=
02bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c=
-45ea-9f9f-699daf338843n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/2202b=
f30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30=
-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c=
-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-4=
5ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>>.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-93=
51-be2c3e999446n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999=
446n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/9a=
021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
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
>     https://groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-95=
89-697904becac4n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904bec=
ac4n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/bbd32aa2-053e-40a2-b4d5-2=
326238d0793n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/bbd32aa2-053e-40a2-b4d5-2326238d0793n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b19f9a0-4f13-46d1-a851-3a0b57deeefb%40oth-regensburg.de.
