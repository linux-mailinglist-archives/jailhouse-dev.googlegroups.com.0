Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBKNYXCOAMGQE65QNOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D33642CC7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Dec 2022 17:28:26 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id y19-20020a05651c221300b00279958f353fsf2987652ljq.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 08:28:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670257706; cv=pass;
        d=google.com; s=arc-20160816;
        b=GwXE3eWfcbTshM0D7p7oYwLg7vjaQFwF9FgRC0BhiSrDJQ9hBILQX2Bg3+uYqjlDfi
         gVC+8P8g5SbFU/Qm97vnMgErj+JIb/t2ADOXjwmCFQJ3QI4XbhIfgqvVTeZM3feJQC/7
         Mr1+Kl0bArgu/G6W9jJmjCQCTg2GNDUdcab7/wm0Zb2YtJT32FB6p+mt/dbUyb1NROlg
         x1O3pr4vyB9GdXRAhPNPbaaAYtGftuW54jWUaSoiyuj3+tFq7E3FUa5ohy1wPEKkyoTG
         6YyLaJ1bej8M/MNOIen8t0Ni8RUvRiyjiEAr5zV2eZpWhq3VsaXyq8lwsS9PhdLNpR+8
         9AVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=u5y3rVivWeravYQPK1Trd6z/NjDmzOUri4/wDplcgo4=;
        b=nWd8iESqj05HZlgp9w20B5w76v0qyFhya7rTTZt69SQkboTR4t7RguwOhN3cEZW0ux
         nVN0DdeZNH5BY7/Q3JwL/gCVVWmRGPI+q8oMw7nGH8iU3Gk9uF7l1sN5cPDuS/E7tjSx
         1DA0GGT3DwKYbq0+4tyaEO3ak9QRzeViVgvQFYnBXwr+T33NhtvM/QCvT+jXn2AXvKdL
         YhVnJyFcVNfye/slCZm/DiNBZG4YBVfMdz0K61HFLykESDaUdh9/BYZ11NLkzEA6SHdK
         ZwHpiPb5hATammmn5YmmMLaHho/RmIUCwbfS51kdq6ORUeSDJ6Ik/YRQaBa4jR49OJCV
         r0NA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta02-20211122 header.b=0zjLZVQA;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:content-language:references:cc
         :to:subject:user-agent:mime-version:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5y3rVivWeravYQPK1Trd6z/NjDmzOUri4/wDplcgo4=;
        b=QhTLI1Bq9pUuWtx0M/vQgi8X0Lj/MD7BPYsnKX8M855SJsJLZdSzyqpyUgjZepRciH
         wnNQC/kbV6GnJQUCVAPAhXlhg2BUT4yN0s8GMgNAVa9RbNYjfasbV0R11sZ0TGE8EImk
         l7dmHYnzAytsLSrXjvccZV3rRbPXoT4WhH8jxoehzXAlweMm1QP4E/N1rt/RjWCXlBSf
         D0I5snC0zLn7UYU2b+15kAwDlQFOhNhzVtNGUhXn15UANQkT4snkNPFmBm6Knxjt/KDO
         3h17dE/eczfilcOX8vn0GMJQpE+0xJTtWtEk/hUwgvRs6I5g0EZQyPAxO66wqUKkKNzo
         pHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5y3rVivWeravYQPK1Trd6z/NjDmzOUri4/wDplcgo4=;
        b=tpFuihMxPeT9Hc5k7U1KNsXLH7/e6/HuGo7tOdewiTRsewcOpb4IaF8lbAHBWN7hmx
         zwGut63KOxrpv1stDVgttWcKefIbGOx+cADAifeBF4CgNmavUuF97A4oPqvWS6TDM892
         R50Nee/rqCzyCYCjVh/OdFEx0KvpX98b0QCIqysoPukmXVgBzbFnJMz3vPOy2f8m0Ttj
         rAnw3fNYsTt0skVdxnAEb1dvMK7ZF9/5IVIM2XlA70PLQ+mTB3j68SvyE4ad5bHjcn2e
         A4WzEVo/EGatgfAyuAGKuP73AODbR4rbj3116Gb7wq5zwyNMw1Q0ICPWcdPKkFD2Chvu
         +Osw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkFvi6qaHBjbLaq0wz7YUjLGkfEcWllqCmZD73HQ415MMv3QsHb
	Mndq7HynvhVxzUbWnLJPGio=
X-Google-Smtp-Source: AA0mqf5LPeQ6cqGVBKy+gjC+Xph/MnMV5eEEU35PvHxvrVUt2EwXapBanIL5LL7zFyl+kG0IIZtzdQ==
X-Received: by 2002:a19:3853:0:b0:4a2:3955:109a with SMTP id d19-20020a193853000000b004a23955109amr31977246lfj.73.1670257706374;
        Mon, 05 Dec 2022 08:28:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1144:b0:48b:2227:7787 with SMTP id
 m4-20020a056512114400b0048b22277787ls908471lfg.3.-pod-prod-gmail; Mon, 05 Dec
 2022 08:28:24 -0800 (PST)
X-Received: by 2002:a05:6512:13a7:b0:4ad:5f5c:2b26 with SMTP id p39-20020a05651213a700b004ad5f5c2b26mr26487426lfa.626.1670257704342;
        Mon, 05 Dec 2022 08:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670257704; cv=none;
        d=google.com; s=arc-20160816;
        b=li3MzgRUWSBTh7WrNRBalVK4mHMKBgnWUjhSRt49X0L7jh2BIJ/vD97ciUWku1GG93
         dgC0rK169JBgIpxihtz3NtA2qO0+2aIiXvIgyuHLt+sztRx5w6wXTGzfl5SH/M31bqat
         wt5J3ZpJ2IrFua+A9BwqXGlQe0lWGcOwxnnJ3XtHIMSaINPZ2ZZf7wkBfif71TmzQ5+q
         360Bu5gKKHPzUWD4rcuOM9nD1YoCyAS0KetvJ0easDxQ2fctXwQ4O2E7OeCmdCyKTdY1
         zoUHUqfi2S6+WoC/TKwznwHul4ptoBt+8Z6N8P5LnRiRom+hR4ycy0JtTMiVpo7APNqu
         p46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a/m8txOtkRx8jivf6k5n89st2KTOIyNhSgOmZJXOMxA=;
        b=aQ1FwjnttXphPPxpmsZJTEPt/gSP0AXJr8CSUj38LEkYb7oXagf2Up3yb+GNhaRvPh
         uKPMmVHcBdBF0DPCpvyTdHjrDAkdfyH7gjXbe/Agl+0dBfsHspEuZvprVIjsuh1ipDiv
         QNUs5oHlVmplGuTXvhbqXx5IZDjjZoqh0Fc1ZWGvrwoOUxBSwo8wWrH/2Uhs76FbDYVf
         HZj0vdG1z6lJ9MgA96GZjchz8zuD7G7UW4DZjrdpTaD97to5WQWP6Dt/bguQUu1oUG3Y
         7UXe5H16P8raejUoNGm/ldaQVyijZXizfhvN1rnMWyd0j/qwqNQIRxCNkwZOC4Llau1/
         6OhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta02-20211122 header.b=0zjLZVQA;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id u11-20020a05651220cb00b004a222ff195esi677331lfr.11.2022.12.05.08.28.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:28:24 -0800 (PST)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NQprR2dWzzxsh;
	Mon,  5 Dec 2022 17:28:23 +0100 (CET)
Received: from [10.24.0.104] (194.95.106.226) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 5 Dec
 2022 17:28:23 +0100
Content-Type: multipart/mixed;
	boundary="------------jg0DefHyPjVZmYbBvxavdkmq"
Message-ID: <b48f1252-a6b7-a183-7f37-080b95043ad6@st.oth-regensburg.de>
Date: Mon, 5 Dec 2022 17:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [EXT] Jailhouse: unhandled APIC access when booting a Linux guest
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Karim Manaouil
	<Karim.Manaouil@ed.ac.uk>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Henning
 Schild <henning.schild@siemens.com>
References: <AM0PR05MB601814D935B73250E59EA696A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <06f03e95-7ff4-3822-aeba-be48e5006b15@oth-regensburg.de>
Content-Language: de-CH
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
In-Reply-To: <06f03e95-7ff4-3822-aeba-be48e5006b15@oth-regensburg.de>
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta02-20211122 header.b=0zjLZVQA;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

--------------jg0DefHyPjVZmYbBvxavdkmq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

On 05.12.22 15:41, Ralf Ramsauer wrote:
> [Adding Andrej]
>=20
> Hi Karim,
>=20
> On 05/12/2022 13:30, Karim Manaouil wrote:
>> Hi Ralf,
>>
>> I am trying to boot a Linux guest (based on=20
>> configs/x86/linux-x86-demo.c).
>> I tried to debug and solve this issue for a while but no success so far.
>>
>> The cell is created, and the guest starts booting, but then fails when
>> initialising the APIC. A write to an APIC register is intercepted by
>> Jailhouse and it decides that the guest is trying to set an invalid LVT
>> delivery mode. I checked the x86 documentation, it seems that it
>> should not be invalid, but I am not knowledgeable enough.
>=20
> Sound familiar=E2=80=A6 I remember that Andrej and I have hit this one on=
 an AMD=20
> machine some years ago:
>=20
> https://groups.google.com/g/jailhouse-dev/c/1wRKIiGN0GA/m/_p_NSIBpDwAJ
>=20
> Andrej, do you know how we finally (quick?)-fixed that issue back then?=
=20
> Did we really have hardware misbehavior? It's been a while, but as far=20
> as I remember that was the case.

Afaik it was a CPU bug.
We had to apply the attached patch to the kernel to make it boot as guest.

Thanks,
Andrej

> Thanks,
>  =C2=A0 Ralf
>=20
>>
>> Here is, pasted below, the log output from Jailhouse and the booting=20
>> guest kernel.
>>
>> PS: I am following the steps in Documentation/non-root-linux.txt and
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 using the patched kernel in q=
ueues/jailhouse branch.
>>
>> Cheers
>> Karim
>>
>> ---
>> Jailhouse:
>>
>> Cell "linux-x86-demo" can be loaded
>> Started cell "linux-x86-demo"
>> CPU 2 received SIPI, vector 100
>> CPU 3 received SIPI, vector 100
>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>> RIP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246
>> RAX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x0000000000000000
>> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000406b0
>> EFER: 0x0000000000001d01
>> Parking CPU 2 (Cell: "linux-x86-demo")
>> Cell "linux-x86-demo" can be loaded
>> Closing cell "linux-x86-demo"
>> Page pool usage after cell destruction: mem 2972/32211, remap=20
>> 65703/131072
>> CPU 2 received SIPI, vector 96
>> CPU 3 received SIPI, vector 96
>>
>> Linux demo guest (last few lines from kernel boot log on the serial=20
>> console):
>>
>> init, 1176K bss, 73676K reserved, 0K cma-reserved)
>> [ =C2=A0 =C2=A02.960440] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0=
, CPUs=3D2, Nodes=3D1
>> [ =C2=A0 =C2=A03.040332] Dynamic Preempt: voluntary
>> [ =C2=A0 =C2=A03.083151] rcu: Preemptible hierarchical RCU implementatio=
n.
>> [ =C2=A0 =C2=A03.151749] rcu: =C2=A0 =C2=A0 RCU event tracing is enabled=
.
>> [ =C2=A0 =C2=A03.205830] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR=
_CPUS=3D64 to=20
>> nr_cpu_ids=3D2.
>> [ =C2=A0 =C2=A03.284872] =C2=A0Trampoline variant of Tasks RCU enabled.
>> [ =C2=A0 =C2=A03.345191] rcu: RCU calculated value of scheduler-enlistme=
nt delay=20
>> is 100 jiffies.
>> [ =C2=A0 =C2=A03.436710] rcu: Adjusting geometry for rcu_fanout_leaf=3D1=
6,=20
>> nr_cpu_ids=3D2
>> [ =C2=A0 =C2=A03.518471] NR_IRQS: 4352, nr_irqs: 424, preallocated irqs:=
 0
>> [ =C2=A0 =C2=A03.585483] rcu: srcu_init: Setting srcu_struct sizes based=
 on=20
>> contention.
>> [ =C2=A0 =C2=A03.667665] Console: colour dummy device 80x25
>> [ =C2=A0 =C2=A03.720639] Enabling UART0 (port 0x3f8)
>> [ =C2=A0 =C2=A03.766423] printk: console [ttyS0] enabled
>> [ =C2=A0 =C2=A03.766423] printk: console [ttyS0] enabled
>> [ =C2=A0 =C2=A03.866333] printk: bootconsole [earlyser0] disabled
>> [ =C2=A0 =C2=A03.866333] printk: bootconsole [earlyser0] disabled
>> [ =C2=A0 =C2=A03.985019] APIC: Switch to symmetric I/O mode setup
>> [ =C2=A0 =C2=A04.046377] Switched APIC routing to physical flat.
>>
>>
>> The University of Edinburgh is a charitable body, registered in=20
>> Scotland, with registration number SC005336. Is e buidheann=20
>> carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=
=A0raichte an Alba,=20
>> =C3=A0ireamh cl=C3=A0raidh SC005336.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b48f1252-a6b7-a183-7f37-080b95043ad6%40st.oth-regensburg.de.

--------------jg0DefHyPjVZmYbBvxavdkmq
Content-Type: text/x-patch; charset="UTF-8"; name="amd-apic-lvt-bug.patch"
Content-Disposition: attachment; filename="amd-apic-lvt-bug.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9hcGljL2FwaWMuYyBiL2FyY2gveDg2L2tl
cm5lbC9hcGljL2FwaWMuYwppbmRleCAwNDI4YWQyODk4OTkuLjgzNjQzNmNlMDViYSAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2FwaWMvYXBpYy5jCisrKyBiL2FyY2gveDg2L2tl
cm5lbC9hcGljL2FwaWMuYwpAQCAtMTY5OSw2ICsxNjk5LDE0IEBAIHN0YXRpYyB2b2lkIHNl
dHVwX2xvY2FsX0FQSUModm9pZCkKIAl2YWx1ZSB8PSBTUFVSSU9VU19BUElDX1ZFQ1RPUjsK
IAlhcGljX3dyaXRlKEFQSUNfU1BJViwgdmFsdWUpOwogCisJLy8gSEFDSzogc29tZSBDUFVz
IChlLmcuIHRoZSBBTUQgUnl6ZW4gZmFtaWx5KSBmYWlsIHRvIHJlc2V0IExWVF9MSU5UCisJ
Ly8gcmVnaXN0ZXJzIGFjY29yZGluZyB0byBzcGVjaWZpY2F0aW9uLCBzbyB3ZSBoZWxwIHRo
ZW0gZG8gdGhhdAorCWlmICgoKHZhbHVlID0gYXBpY19yZWFkKEFQSUNfTFZUMCkpICYgQVBJ
Q19MVlRfTUFTS0VEKSA9PSAwKQorCQlhcGljX3dyaXRlKEFQSUNfTFZUMCwgdmFsdWUgfCBB
UElDX0xWVF9NQVNLRUQpOworCisJaWYgKCgodmFsdWUgPSBhcGljX3JlYWQoQVBJQ19MVlQx
KSkgJiBBUElDX0xWVF9NQVNLRUQpID09IDApCisJCWFwaWNfd3JpdGUoQVBJQ19MVlQxLCB2
YWx1ZSB8IEFQSUNfTFZUX01BU0tFRCk7CisKIAlwZXJmX2V2ZW50c19sYXBpY19pbml0KCk7
CiAKIAkvKgo=

--------------jg0DefHyPjVZmYbBvxavdkmq--
