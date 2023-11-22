Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB4N67CVAMGQE66GXETY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7E7F4A88
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 16:34:12 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id 38308e7fff4ca-2c89230b1fdsf9678901fa.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 07:34:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700667251; cv=pass;
        d=google.com; s=arc-20160816;
        b=qhNMqtfs9+0lVMXlPvdqURAvJIy8PqAPbTCT8ayIYWBOnxW0glSlVzlofcvsY/HEgB
         GbK43ZM3hER0R/XPWeWIB/xT9E1u9IbRmQymBBuN8SCLiIsQcrsJobhBxJS6CByS/l2o
         11/1Pq0QnlFKCiLQkppqyU1nvgI9VY8qGVTp/v7MqqNAlyBAUXrMZWYPMcMJBSnKj7qU
         BobtIe+kNE7hTUhyF92mhcQ03zat2/2mvMMqrrF8otJjtYK0+ZLb4QYLTqWSdMs33Ipp
         VLYVStwzpb9KvFHyKE4mkBYX2/B0WOaFL+poTitNYWTPjUVlTlIyOdTuCUrWa4BX0A/i
         QXrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=n4weeC1DQY1bzSMxy0QWEPjgZtcZ92e7U6sT5is0NOg=;
        fh=ogMYmmuK14CtR8PDOMv+TTh7crRjDfcIGXLDcowfATk=;
        b=voRauHI/SyZKl4WEaQX6u1zHOlftN0+J+A7LWJPYNxnLsCKTf7v3mDc62CemcbbBp8
         VXhsebL8ryWE21f+VV9eGir7nGLxQBlRfjN6sdNHjtancRkuVib0N0d6GqI4+h/WKOEc
         5knKRL6WgfH0vlYoWdVmZ795baefU6IDuKc1k/C5755Yw3Q3oz6Fn9iP79mua3gmzPUB
         EptBgnUWFlyLHo2yRgMRWAxx++vFzFvEqLP2iLr+PmjjdAXq7dFsBettqFG1BE97w7mA
         FgAX/z3r21jQkrKa7zcmBZZdAo/1LEaBw3sZZGvfA4/d2LNxRdZsUgDXBXiMdKvUoqNW
         WJ5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=q8Ymw9dk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700667251; x=1701272051; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n4weeC1DQY1bzSMxy0QWEPjgZtcZ92e7U6sT5is0NOg=;
        b=TBnMi5f7pnVdlUwhqpsPev0DGVkcuYkdRbFuIDUSuyb95oDLmOVmdZlW2th11Gu+1X
         wgLlOuZjvaLXQUk6WRSC1cZEFK065Z6+6mQB1eanu+i35NJx0QaMe0G2O5v8ePU6vP9o
         ycVSbhTjxnwFSE5sUG59QuT9/CcqJvyelOQ3b0mJzIf22Rpqn0Sz7vybljBMbGmi3Ofx
         hDJAfvs09L2ZLG8S275FjzcAgWrvc4lJfVLdBubXvfHA5Og/5fU3X8w9oGhUi1RDsRYS
         KccAYVzzf/AuPm9fGL1/95vGclhjOFfwbAyBOhXBnwt5u/zYCLmKYjpjRA/nlmCl/gNU
         aNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700667251; x=1701272051;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4weeC1DQY1bzSMxy0QWEPjgZtcZ92e7U6sT5is0NOg=;
        b=JxhzO+EbZBjjhoTiRpP/xxQmezJm74VnTRVw6YCY+23xpo9sWiRCUrQKpXl8xmolqS
         dnlU6F9oKH87fLAxaGFPDqW3Te2e/dn8hCfKdvSfSMF6rrmMvBfppj9cgwsDncALJnGR
         FbikZhyen2/H9UibEq4SrEOaOnkFttyFSK42NybuhqdSD8LIZLArc7z6Zx1u8Mas/tcK
         2YmYxZ/nsW43oEoiEcqHW63GWuj5iUtmLddWAyuPp9kr2NgOvk3SSEjoUl/UY1MsXFfF
         ZT/ylz2EmGz9f1JPtMdP4lOpZ1lveeBF0IP9ttn2+jSj8lq4TxUosBrMbtH1u+JiEwdr
         2kYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwUGTibUFgx+1dRiHJeuLboALbZFOEEGcqE5sgzFsf9REQyto81
	+G16FdYr9lyQbSLDBLE5FtM=
X-Google-Smtp-Source: AGHT+IG2WQPMG9u4tUC7E6qP/WZxFwhsIeHeirxnbBDRpM+HF3y8JErKsUox1mou/twhhsjQysKWow==
X-Received: by 2002:a05:6512:3ba5:b0:509:4645:b78b with SMTP id g37-20020a0565123ba500b005094645b78bmr2597775lfv.10.1700667250262;
        Wed, 22 Nov 2023 07:34:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3083:b0:50a:68f4:6371 with SMTP id
 z3-20020a056512308300b0050a68f46371ls22976lfd.2.-pod-prod-04-eu; Wed, 22 Nov
 2023 07:34:07 -0800 (PST)
X-Received: by 2002:ac2:5159:0:b0:50a:a991:7942 with SMTP id q25-20020ac25159000000b0050aa9917942mr2198007lfd.43.1700667247385;
        Wed, 22 Nov 2023 07:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700667247; cv=none;
        d=google.com; s=arc-20160816;
        b=j0pG4jUSlyahKM3nzNEivox4uuGZEbs34fMLxZUBfn5i1UTfwoloiHCRShDg5TAfdh
         afYodVlpNvGXGxbx8I6fMCspVkm08RGdgIdA7foib0KEBWCBlI9oVkHbdPt1Tq8hkduT
         8o1k708KFZRA8ipW1qQJ8mlOtpkm4V1qp8U19kEVnFY/zjgEUwMb7dGwuUnEzG7VlPHB
         mgfbsccdatLWaWiI5j2Z1VhqRJF6M2qb1vxhq2cREqACU/XtvTiNWNofp61ZiQSBIRMC
         r10HXeYW5UQcifYg9ocp7iDddmEEyleUXfvwMnurHHL9X0RperMbDzUiiRjg1LnGhsWn
         vuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+iz4w7yv37WTRGVZlJ+s9YHmaz+hSbd7FuMd2KNLtQY=;
        fh=ogMYmmuK14CtR8PDOMv+TTh7crRjDfcIGXLDcowfATk=;
        b=VJeVHGZkNDkvxjJL2AMjNWMsUdIgUtXOZPCOHw49CxbOkSeePnimvQSnNvtqvk4SIu
         jnfgsi3Cdkkyhaox2hF+noFaLrMKmqnnXbPvdPbJSfxdsYBX5QhUQvzVlKgFxm3QNmvs
         1fOkUjFZKKInZOMPiCElJUxxGBhOq0NhnA+EimsCPvwIUuA326OxZZw5kuYjZaCzcLmD
         gSRcvWIJj9jancfku+6Swqdps4r83UM19cNx/j+cV1vlvllD8B9VuwdnL7dg3LB83zpL
         fIZU7LLjdPMbwDhGCfjODCuNE/+TL6GjU19xCj5N62EuUztYwywba5sT6LtNM7E1MEQ6
         6M5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=q8Ymw9dk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id g4-20020a0565123b8400b0050aa77fac93si489522lfv.2.2023.11.22.07.34.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id A54FC3E0101;
	Wed, 22 Nov 2023 16:34:05 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Sb4zK2RJ7zxr0;
	Wed, 22 Nov 2023 16:34:05 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 Nov
 2023 16:34:05 +0100
Message-ID: <b3eeb148-9b47-4798-9201-043f3e258ccd@oth-regensburg.de>
Date: Wed, 22 Nov 2023 16:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse on LX2160ardb
Content-Language: en-US
To: Laurent Corbin <laucorbin78@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <18173bdd-0873-4774-a664-ba03be4bd7a3n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <18173bdd-0873-4774-a664-ba03be4bd7a3n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=q8Ymw9dk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
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

Hi,

On 22/11/2023 16:14, Laurent Corbin wrote:
> Hi all,
>=20
> I'm trying to run jailhouse on LX2160ardb (NXP board). To do that,
> 1. I wrote a cell file for my root cell.
> 2. I built a Linux 6.1 and a jailhouse (branch lf-6.1.36_2.1.0 from nxp=
=20
> mirror) with yocto.
> 3. I loaded the jailhouse driver as a kernel module.
>=20
> But when I try to "enable" jailhouse I get this error :

okay, I think i have seen a similar error before. Would you please try=20
to apply this patch, and see if there is some output on the console:

diff --git a/hypervisor/arch/arm-common/smccc.c=20
b/hypervisor/arch/arm-common/smccc.c
index 65639b59..afa26e53 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -83,6 +83,7 @@ static inline long handle_arch_features(u32 id)
                 return this_cpu_data()->smccc_feat_workaround_2;

         default:
+               printk("Unknown SMCCC!\n");
                 return ARM_SMCCC_NOT_SUPPORTED;
         }
  }
@@ -129,6 +130,7 @@ enum trap_return handle_smc(struct trap_context *ctx)
         case ARM_SMCCC_OWNER_SIP:
                 stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC]++;
                 regs[0] =3D ARM_SMCCC_NOT_SUPPORTED;
+               printk("Unknown SMCCC (SIP)!\n");
                 break;

         case ARM_SMCCC_OWNER_STANDARD:


If you get an output here, then we need to probably forward those calls.=20
Please get back to me in that case.

Thanks
   Ralf

>=20
>=20
>=20
> root@lx2160ardb-rev2:~# insmod jailhouse.ko
> root@lx2160ardb-rev2:~#
> root@lx2160ardb-rev2:~#
> root@lx2160ardb-rev2:~#
> root@lx2160ardb-rev2:~# cat /sys/module/jailhouse/sections/.text
> 0xffffc45e1113e000
> root@lx2160ardb-rev2:~# jailhouse enable lx2160a-rdb.cell
>=20
> Initializing Jailhouse hypervisor v0.12 (369-g6a87b739) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 151/993, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 1... OK
>  =C2=A0CPU 5... OK
>  =C2=A0CPU 4... OK
>  =C2=A0CPU 2... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 9... OK
>  =C2=A0CPU 8... OK
>  =C2=A0CPU 15... OK
>  =C2=A0CPU 13... OK
>  =C2=A0CPU 12... OK
>  =C2=A0CPU 7... OK
>  =C2=A0CPU 10... OK
>  =C2=A0CPU 11... OK
>  =C2=A0CPU 6... OK
>  =C2=A0CPU 14... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: ARM SMMU
> ARM MMU500 at 0x5000000 with:
>  =C2=A0stream matching with 128 SMR groups
>  =C2=A064 context banks (0 stage-2 only)
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "lx2160a"
> Adding virtual PCI device 00:01.0 to cell "lx2160a"
> Page pool usage after late setup: mem 228/993, remap 2576/131072
> Activating hypervisor
> [ =C2=A0173.577969] SError Interrupt on CPU0, code 0x00000000bf000000 -- =
SError
> [ =C2=A0173.577985] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 O    =20
>  =C2=A0 6.1.22+g66e442bc7fdc #1
> [ =C2=A0173.577993] Hardware name: NXP Layerscape LX2160ARDB (DT)
> [ =C2=A0173.577996] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS=
=20
> BTYPE=3D--)
> [ =C2=A0173.578002] pc : enter_hypervisor+0x44/0xa4 [jailhouse]
> [ =C2=A0173.578025] lr : enter_hypervisor+0x44/0xa4 [jailhouse]
> [ =C2=A0173.578040] sp : ffff800008003f10
> [ =C2=A0173.578042] x29: ffff800008003f10 x28: ffffc45e51736c40 x27:=20
> 00000000fbd0ea70
> [ =C2=A0173.578052] x26: 0000000000000001 x25: 00000028652e0c1e x24:=20
> 00000028652b7617
> [ =C2=A0173.578060] x23: 0000000000000000 x22: 0000000000000000 x21:=20
> 0000000000000000
> [ =C2=A0173.578067] x20: 0000000000000000 x19: ffffc45e11144000 x18:=20
> 0000000000000000
> [ =C2=A0173.578074] x17: 0000000000000000 x16: 0000000000000000 x15:=20
> 0000000000000000
> [ =C2=A0173.578080] x14: 0000000000000000 x13: 0000000000000000 x12:=20
> 0000000000000000
> [ =C2=A0173.578086] x11: 0000000000000000 x10: 0000000000000000 x9 :=20
> 0000000000000000
> [ =C2=A0173.578092] x8 : 0000000000000000 x7 : 0000000000000000 x6 :=20
> 0000000000000000
> [ =C2=A0173.578098] x5 : 0000000000000000 x4 : 0000000000000000 x3 :=20
> 0000000000000000
> [ =C2=A0173.578104] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
> 0000000000000000
> [ =C2=A0173.578111] Kernel panic - not syncing: Asynchronous SError Inter=
rupt
> [ =C2=A0173.578115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 O    =20
>  =C2=A0 6.1.22+g66e442bc7fdc #1
> [ =C2=A0173.578120] Hardware name: NXP Layerscape LX2160ARDB (DT)
> [ =C2=A0173.578122] Call trace:
> [ =C2=A0173.578124] =C2=A0dump_backtrace.part.0+0xe0/0xf0
> [ =C2=A0173.578140] =C2=A0show_stack+0x18/0x30
> [ =C2=A0173.578148] =C2=A0dump_stack_lvl+0x64/0x80
> [ =C2=A0173.578158] =C2=A0dump_stack+0x18/0x34
> [ =C2=A0173.578166] =C2=A0panic+0x188/0x340
> [ =C2=A0173.578173] =C2=A0nmi_panic+0xac/0xb0
> [ =C2=A0173.578179] =C2=A0arm64_serror_panic+0x6c/0x7c
> [ =C2=A0173.578184] =C2=A0do_serror+0x58/0x5c
> [ =C2=A0173.578188] =C2=A0el1h_64_error_handler+0x30/0x4c
> [ =C2=A0173.578193] =C2=A0el1h_64_error+0x64/0x68
> [ =C2=A0173.578198] =C2=A0enter_hypervisor+0x44/0xa4 [jailhouse]
> [ =C2=A0173.578213] =C2=A0__flush_smp_call_function_queue+0xd0/0x250
> [ =C2=A0173.578223] =C2=A0generic_smp_call_function_single_interrupt+0x14=
/0x20
> [ =C2=A0173.578232] =C2=A0ipi_handler+0x98/0x160
> [ =C2=A0173.578239] =C2=A0handle_percpu_devid_irq+0x84/0x130
> [ =C2=A0173.578245] =C2=A0generic_handle_domain_irq+0x2c/0x4c
> [ =C2=A0173.578251] =C2=A0gic_handle_irq+0x50/0x130
> [ =C2=A0173.578258] =C2=A0call_on_irq_stack+0x2c/0x5c
> [ =C2=A0173.578263] =C2=A0do_interrupt_handler+0x80/0x84
> [ =C2=A0173.578270] =C2=A0el1_interrupt+0x34/0x6c
> [ =C2=A0173.578278] =C2=A0el1h_64_irq_handler+0x18/0x2c
> [ =C2=A0173.578283] =C2=A0el1h_64_irq+0x64/0x68
> [ =C2=A0173.578287] =C2=A0cpuidle_enter_state+0x130/0x2fc
> [ =C2=A0173.578296] =C2=A0cpuidle_enter+0x38/0x50
> [ =C2=A0173.578302] =C2=A0do_idle+0x22c/0x2c0
> [ =C2=A0173.578308] =C2=A0cpu_startup_entry+0x28/0x30
> [ =C2=A0173.578313] =C2=A0kernel_init+0x0/0x12c
> [ =C2=A0173.578319] =C2=A0arch_post_acpi_subsys_init+0x0/0x18
> [ =C2=A0173.578326] =C2=A0start_kernel+0x668/0x6a8
> [ =C2=A0173.578331] =C2=A0__primary_switched+0xbc/0xc4
> [ =C2=A0173.578337] SMP: stopping secondary CPUs
> [ =C2=A0173.578370] Kernel Offset: 0x445e47000000 from 0xffff800008000000
> [ =C2=A0173.578373] PHYS_OFFSET: 0xffffd3bc00000000
> [ =C2=A0173.578376] CPU features: 0x20000,2012c084,0000421b
> [ =C2=A0173.578380] Memory Limit: none
> [ =C2=A0173.853682] ---[ end Kernel panic - not syncing: Asynchronous SEr=
ror=20
> Interrupt ]---
>=20
>=20
> It seems that my Linux panic when it has to jump from the hypervisor to t=
he
> driver (in arch_cpu_activate_vmm function in=20
> hypervisor/arch/arm64/setup.c file).
>=20
> Do you have any idea why my Linux panic ?
>=20
> Thanks in advance,
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/18173bdd-0873-4774-a664-b=
a03be4bd7a3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/18173bdd-0873-4774-a664-ba03be4bd7a3n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b3eeb148-9b47-4798-9201-043f3e258ccd%40oth-regensburg.de.
