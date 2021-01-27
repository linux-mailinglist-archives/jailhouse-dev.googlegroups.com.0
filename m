Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEHEYWAAMGQE74PHYOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E1305DB5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 15:00:49 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id q24sf974962wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 06:00:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611756048; cv=pass;
        d=google.com; s=arc-20160816;
        b=NHdV4a+N5CwiYO7FPq8N8ToqgaEoRGBI21uHxbryp8unKECaSU0L6KU4MlYuUnoatW
         MxDwiLM7XyCwQgJqzmEPVLXCJSnZ4v1XyUnQ9BaIf33/Fbc1Xne4Tq37MQLqGbdTbPPG
         YLTmYqr8VCiCvAFd59FLdibqaWfFB4fSh4rPi0dKoTOS0mo7viboE7FNsxYHw1k0bqjU
         cUhcT/HcGyREQwvksvZsbsjySXcQEEgPvi/iQ4uXfUOvo1xMZwhLPB1te60Y5+SfNF8y
         9Yn+zNthOsTt13irpx2Y6nCAqkIq9tqJxdSGw79Ke7I2fvVOE+ZtLXetWNiLjb/Jz+R+
         2sMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=cO2QYmE17tSjRhNa7461eucIvjPw0PJCI3/pDEgbKN0=;
        b=E7Y94m1WEDflrUL/NKrmmVTzNX7KecZeyrrd1VXRewJjyj91uQ5sGaEYfmPkAlYBVo
         xag/wJVhEXbbcJUvOBattcHspOtrJUmCHx/URHYzRA3vRpyaKfPrzPYcKuP863MShFTk
         olK6xzOOPp8KdGm2LghJtXBECVgkJLzIM0wTRaZxQ9zcQIWti/MN8oQ4yM/+Ax0sr+oF
         w5hfw+eeOmX4ALBdee64B5iiH7QOoqdTQ8KQtk64r99rLEY3B07iuGGiAM18jlynSgzJ
         emfQd35ajTtUq+4cKRIbKNqZefFt/htBMYZAIjQ/QloFM21HlIVzCIB/l3TsoKs0BChT
         dYKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AXHPQTLs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cO2QYmE17tSjRhNa7461eucIvjPw0PJCI3/pDEgbKN0=;
        b=gxgjhoGMCoYemqsB2Ur0Ze9AQekNe1vtHYeBDjYbs9sVWGv4xibolLslp5hTh/JVx5
         5OVrnzsyuy7AoJGGyPdpNhK8YOFYPaAefvXZPl1c6iE4mLcIWKIILdDCrMdnzQhKoCGn
         KKNhaph21b1rWj1xvlBMJnHNHuWQUZjuJQp0lRWgR4SSu+HMA8QBEntDr8RFsiW8ovW4
         okbBxzXtoHDS2DjG4h1ijG6CjV/wZswRKCi7pHHPV2enklNhGugABOnjNtSYPvz00wBB
         BzgDnV4YYFU3u93mvhl4ObFPip39KOvKbRWl6zZH4oQlzrG0dyq+UqtRNku4E2SnC14q
         uB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cO2QYmE17tSjRhNa7461eucIvjPw0PJCI3/pDEgbKN0=;
        b=UB+9tUV8ITCyU8DPPmoQu1LMoct5iRuvLrqVuZINN1Zt+HM76aHZitayLB2QZL6Rjt
         i2J3tBst9MmwneJY54aCzFpVHEn5COj1iQeLLTJ53bA+AbZL5ZcuQGxRBDipm0tS5J5U
         etAmTXPRxQJ3EE01SkBj19lBydVm9uOmf4ynXs0fKDgCEVgcJ8HyicJFCZp1fAU2SEuQ
         2vcF9hNM4kDEvj1xgCXKEFcoMxPwYszz41x9NqPosul6i+QWF+3bzc7nbvR5ox/tYdt1
         DvwiWqtfpzWGzzwR3Jmy2yNQvYoCSZY4BHF6wsjlHLn8yRIc3iMY4AoTsw1XtbYC2jev
         V9bA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qmg1rDXDyJY21h8/3TUQ+LXumQP83OoHxA6lanjpPLlOnNzbn
	ZnP3TwEqC+8h6ZnAVfrk9sk=
X-Google-Smtp-Source: ABdhPJySSfw9LfZW7W2s9xoDWkVoK07uGKFo7FkKS09jNbg2nbgApx+DPZFtBZgfjFLWwmPzncOxLg==
X-Received: by 2002:a05:6000:104:: with SMTP id o4mr11291905wrx.419.1611756048769;
        Wed, 27 Jan 2021 06:00:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:208f:: with SMTP id g137ls1030520wmg.1.gmail; Wed, 27
 Jan 2021 06:00:47 -0800 (PST)
X-Received: by 2002:a1c:f212:: with SMTP id s18mr4369061wmc.107.1611756047874;
        Wed, 27 Jan 2021 06:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611756047; cv=none;
        d=google.com; s=arc-20160816;
        b=OjpMWV9U5oSS/R37A4iV6NgE/zLDr+8lGVB1W2f7GaAZcmBcYAun9ywttkjKqu3z27
         qtXUBe2JjWl0tgep2infJfqgpzWlRYv03AclIBfUeFK+Drsivtbtlf+Yr8A1ncMBoSsV
         GpiAmf6JHlHbiLN/NGQVUGGf1eUuJaZrtbYUWhv1cjjL/55wk8V36TPfvMnFMYXGoBAY
         cYsrLJiqWNVxxdy0S83gilIxxXhaS0lh7yfohFRT4CtpK6lqoEZCwdahaiDuqebUNq4p
         iIn5sZ5FSrSjV4WBWRERcqrdWhfrnKr7Y5TXGOp8lfEoxVH5nYByNw74mOkcf+h5VTZp
         zSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Oq6jcmL+FdADqHRidSU4GSH3OMFiqKN64uPnpVs+Jxc=;
        b=O2LzN06xgPTqYilgg5ZIHbRJEdCOvVpFAKBFjbmRQkjfEHkJ5VhjjkI4iYKIK/CJPf
         GFrXd/cHSqyHAm8+QVyycvRcAydXqxn5zso1ExdlUuU+BdsUL5pCrVbK7R/ju/uziNm+
         C1CMtePHVUUBcVY9yL5Muspz0MmIy2QOrxIBS/1EaaUhZbCVZu/UURmYoWL+kb8s486c
         Ld7o+NbWH1ltxWT9eJ4yMEupUi1KxeW6gT1WkdL3scwzO2Kdeu+Wyk+2WK+86lZoe3bF
         YflJNEqsqslw82IenJNOk2bf8i9kKE0LKVaCeXd6o2PUwVDeCsbtlObxTDm0gkJLXfj4
         iG+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AXHPQTLs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id w11si143964wrv.0.2021.01.27.06.00.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 06:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4DQlcb3ZGyzxtb;
	Wed, 27 Jan 2021 15:00:47 +0100 (CET)
Received: from [192.168.179.73] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 27 Jan
 2021 15:00:47 +0100
Subject: Re: MMIO APEI issues
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663AEA8ADC5EE631F76496BB6BB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <3570d529-ff10-da30-9b23-384a8b30cfe1@oth-regensburg.de>
Date: Wed, 27 Jan 2021 15:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663AEA8ADC5EE631F76496BB6BB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AXHPQTLs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Bram,

On 27/01/2021 11:46, Bram Hooimeijer wrote:
> Dear Jailhouse community,=20
>=20
> Currently I am experiencing issues with the MMIO virtualization in Jailho=
use, which interacts with the BIOS. I am hoping any of you can shed some li=
ght on the issue:
>=20
> Jailhouse reports the following after running for some while:
>> FATAL: unable to get MMIO instruction

Where does RIP point to?

>=20
> The region listed has previously reported illegal MMIO accesses. These ha=
ve been resolved by adding the region to the system config. This requires a=
ll sub-64 access widths, as the region is apparently byte accessed. The BIO=
S vendor has indicated that this region implements APEI according to the AC=
PI specification.=20

Could you please try the following region:
{
		.phys_start =3D 0x86dff000,
		.virt_start =3D 0x86dff000,
		.size =3D       0x0b700000,
		.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
			 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA
},

the size 0x0b700000 will make the page aligned, and the hypervisor
doesn't need to trap. In that case, JH_MEM_IO_{8,16,32,64} is not required.

Thanks
  Ralf


>=20
> By adding some printk() statements to the hypervisor, I could derive wher=
e the error exactly originates. Apparently the function ctx_update(&ctx, &p=
c, 0, pg_structs) returns null. Jan, could you shed any light on what this =
function does? Could it be that the paging structs for the APEI interface a=
re incorrect?=20
>=20
> All snippets are listed below. The system runs Linux Kernel 5.4.73, from =
Ubuntu 20.04 LTS, modified to remove kernel RDT support (conflicts with Jai=
lhouse). Any directions are welcome!
>=20
> Many thanks,=20
>=20
> Kind regards,
>=20
> Bram Hooimeijer=20
>=20
> Issue reported over ipmi (see attached log.txt):
>> FATAL: unable to get MMIO instruction
>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000870a9998 size: 0
>> RIP: 0xfffffffeec8a9998 RSP: 0xffffb52400177d78 FLAGS: 10282
>> RAX: 0x0000000000000246 RBX: 0xffffb5240dc8fe50 RCX: 0xffff9cef966f4000
>> RDX: 0xffff9cef966f4400 RSI: 0xffff9cef966f4000 RDI: 0xfffffffeec8a9998
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x0000002ff2842001 CR4: 0x00000000007626f0
>> EFER: 0x0000000000000d01
>> Parking CPU 0 (Cell: "RootCell")
>=20
> Modification required to root cell configuration for APEI ERST region (se=
e attached sysconfig_dual256M.c)=20
>> {
>> 	.phys_start =3D 0x86dff000,
>> 	.virt_start =3D 0x86dff000,
>> 	.size =3D       0x0b6fffff,
>> 	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 		JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_UNALIGNED |
>> 		JAILHOUSE_MEM_ROOTSHARED | JAILHOUSE_MEM_IO_8 |
>> 		JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 |
>> 		JAILHOUSE_MEM_IO_64 | JAILHOUSE_MEM_EXECUTE
>> },
>=20
> Point of failure (see hypervisor/arch/x86/mmio.c:108--121)
>> struct mmio_instruction  x86_mmio_parse(const struct guest_paging_struct=
ures *pg_structs, bool is_write)
>> {
>>           struct parse_context ctx =3D { .remaining =3D X86_MAX_INST_LEN=
,
>>                                                             .count =3D 1=
 };
>>           union registers *guest_regs =3D &this_cpu_data()->guest_regs;
>>           struct mmio_instruction inst =3D { 0 };
>>           u64 pc =3D vcpu_vendor_get_rip();
>>           unsigned int n, skip_len =3D 0;
>>           union opcode op[4] =3D { };
>>
>>           if (!ctx_update(&ctx, &pc, 0, pg_structs)){
>>                   printk("ctx update failed\n"); 						<<--- FAILS HERE.=
=20
>>                   goto error_noinst;
>>           }
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3570d529-ff10-da30-9b23-384a8b30cfe1%40oth-regensburg.de.
