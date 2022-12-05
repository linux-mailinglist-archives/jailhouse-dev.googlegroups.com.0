Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBC4GXCOAMGQE4TNGXSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59A642A89
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Dec 2022 15:41:16 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id r67-20020a1c4446000000b003d09b0fbf54sf3846358wma.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 06:41:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670251276; cv=pass;
        d=google.com; s=arc-20160816;
        b=nvdqs4vTQ2aRze8k7M2lWh83KWEvU66EdWS5C0tXLU/fGMCAzDd6fwGytWblGwnmCq
         NF/FpShL3kEu1gpR7fOwzEqIneV24C39hnQUJtKrYbKBL6q+W6auv4OiS8xSnyW6PuZQ
         9jHJho3410FJ3or0sWc/JQ/EJm2gcqcD+iQoyeVM7BglEU9YopyzmZJijU1FArZmVQ9K
         EUyPmBB+cNQjQpNWM9Kd3JLgxk7xfw5WWkdCcxGMteX/4hWGhrJ7ywMAgthHtvBQ8l5Y
         H9r5kZ5ZLEgrb52ph1Nt2/Gffc1mJ6RTsNX2nGyw/sH4zEoSsIasF2yINGjGt2hNNKf4
         betg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=quRSg8qD1g4Majn4PdCGlfriDYV+DtZbWTaQAh/G9Cs=;
        b=h9DzWNP12EdmJZXheHbYDmu8tIu2/lv8bFayeCuzqprTHpnz6pXAK9bwkGpuE3RRX4
         Ahx6+dH1o7/KBu9/f5QACx4FSfvTOdee8YI2TQ41ABjyDzdsazwtJhchErJ5u9anLFB2
         GRTJoSQSWb+CPUdY5DyQN2QV2lcA3sFITjEGCCj2XQ6IQqRXQ+1svhtnhZ4+JikxCi7a
         PYsdnKN5BfmjS9goclE3MuW3/7P+4PQ1EcBIEnIpVA4VuadCU4vuT239p8ZRCLYCwQU4
         nx7+6erokMet43wa5EOjjaZW1sHcEwNoyHwNuHM/Mm0zOSXhJlberKxKuCAcV1S8Dmg7
         AgWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="a5S7S/Oo";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=quRSg8qD1g4Majn4PdCGlfriDYV+DtZbWTaQAh/G9Cs=;
        b=ZqG2n7bjGoH+6kz7/jM30NdQXP/wyRkApoVz4KaE8M0FSXz0c3AeFXSGJYp7ljpze3
         tIBQ5d5ohU6tTLUraHDJP7cFcrfTkzGF4PooQ7Fp9sHE0t6cw/pS59l+DPEO78LpLo9S
         gTvBK852hJe1Wv62ta31AwWr6wDjd384hAmQpRdElXXFHLVN21mkWK14PTmMuNkl957G
         6iUeFGyyGidYJR/2MVoDxmh4F83yQffFivOkIq9gwTCp63jxvHMf2Bkp1/YKbRHKWU40
         D5YNkmiIQDZ+6+0qi4HiLniWbZsAZx92oZtPaour4wMmdfPf20NhR38yonN8jUQrlvNd
         HpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quRSg8qD1g4Majn4PdCGlfriDYV+DtZbWTaQAh/G9Cs=;
        b=Vq4v2Y3c5DoXpTozgnNecLAwMYUh71itgUVsBB+R6NtE5LwylNGMM13TbWdeeIEB3O
         3SB9PQ9bYBNvH9QEETy1c7M1WF5KocCWPGmxRl+5jOvIdaIn7gIoOv96dLt/8JAQVvfy
         PpcBal5PHm2WCIGEdjhnGM00oVpF+Uu2cEhYTqHbDoU+Y640VKAePKUquq3kn054rPDq
         OPZXkkEnh+vJaeaFIRSJAA3iJ/j0AGAM9taxZhIXFHWzm7LjEiDYvX/XYm8DR9MKFWWE
         z2Tk1UJ9da+7Ri5C+CUbiLeiR4p17403oSquIotzBuI0j+p69LyAnTR/NW0/IV2/2INO
         fKhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pl/+qyhP87NBGhCJP5eLc9cgIMtHobuQb1Cbp3/lQSVLBFMGezR
	NR7sWF3/dXsk/ScZQPrjUlk=
X-Google-Smtp-Source: AA0mqf5aR7ykB980XQXlVROzqOPhY6gGSXh2d1xlSnJHxCf4O/1jtXYPsWG365kl5qihc440+7HyOQ==
X-Received: by 2002:adf:fd48:0:b0:242:174f:a68c with SMTP id h8-20020adffd48000000b00242174fa68cmr22464612wrs.581.1670251276282;
        Mon, 05 Dec 2022 06:41:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6f1d:0:b0:225:6559:3374 with SMTP id ay29-20020a5d6f1d000000b0022565593374ls1436788wrb.2.-pod-prod-gmail;
 Mon, 05 Dec 2022 06:41:14 -0800 (PST)
X-Received: by 2002:a05:6000:1b01:b0:242:395c:54a2 with SMTP id f1-20020a0560001b0100b00242395c54a2mr11942732wrz.436.1670251274471;
        Mon, 05 Dec 2022 06:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670251274; cv=none;
        d=google.com; s=arc-20160816;
        b=I++S5r3XValAB+i0SRiW0bhXNN6cJZDH7q5sDJFiJmmh421cMvNnTOxsMExqKEj4DZ
         1vulcBDbtnO3saIZP9WuXRvXMUNGaz/5xDBf4qtmRFKYoeb1j1gSbo2+r2xEXwZLpqXo
         sNCXZFWsMx+e/cKENubgKvKXGxBftSDfVu/dDda7Slb1CyTMRLZlRQe5I2hEQZg3Fmju
         8yP3jGU3BF9Rkillssq0yHuQUblJmG4ShdWhb96IsJLokq1w0uwZ9qebzwi4g3SqtzGI
         d+9+hLB5FXIorxKT60Xew26PdZ7FoJ25zi7U4e7F4gN7ZgAa7DW3WrWUd3KiLmz9YKwS
         Z9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+utddN9Y4dvyYxVGxUGyeJpkpM1sfH17nKltX3Kfs14=;
        b=HAfmyrF3j/7mUpi9OByds7G/f6F4pyYuH8MICYuB3hdcwXep2o9Sxa+dIjGMQoOtQL
         0TSArkOlYfDNXxoLgBZAPgyrSDWrlGoOzJckurqOaShzQ2Kp8ZcraiP1BjNqhDjoSMXb
         ijGEXyb6SUmsPPjfqaLQ6LThkwf3gLgqjaoCSUTLpgyntoU3W+aI13+IU8ztYSN4E6OL
         91iDUipHKa65vEElHBdrHa034NIzJ/xRBW6xQI6WtwbmoOOt0ObwQYPE3IEV7EKFPN+v
         bGa7rxFG7N7jhrdysLYHo6HE6npShFc3lfMd7roLiIlw5eLuyhuubKoaDjMljzvwvaBU
         w+xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="a5S7S/Oo";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id ba3-20020a0560001c0300b0023677081f0esi685704wrb.7.2022.12.05.06.41.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 06:41:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NQmSp0MhszxsH;
	Mon,  5 Dec 2022 15:41:14 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 5 Dec
 2022 15:41:13 +0100
Message-ID: <06f03e95-7ff4-3822-aeba-be48e5006b15@oth-regensburg.de>
Date: Mon, 5 Dec 2022 15:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [EXT] Jailhouse: unhandled APIC access when booting a Linux guest
Content-Language: en-US
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Henning
 Schild <henning.schild@siemens.com>
References: <AM0PR05MB601814D935B73250E59EA696A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <AM0PR05MB601814D935B73250E59EA696A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="a5S7S/Oo";
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

[Adding Andrej]

Hi Karim,

On 05/12/2022 13:30, Karim Manaouil wrote:
> Hi Ralf,
>=20
> I am trying to boot a Linux guest (based on configs/x86/linux-x86-demo.c)=
.
> I tried to debug and solve this issue for a while but no success so far.
>=20
> The cell is created, and the guest starts booting, but then fails when
> initialising the APIC. A write to an APIC register is intercepted by
> Jailhouse and it decides that the guest is trying to set an invalid LVT
> delivery mode. I checked the x86 documentation, it seems that it
> should not be invalid, but I am not knowledgeable enough.

Sound familiar=E2=80=A6 I remember that Andrej and I have hit this one on a=
n AMD=20
machine some years ago:

https://groups.google.com/g/jailhouse-dev/c/1wRKIiGN0GA/m/_p_NSIBpDwAJ

Andrej, do you know how we finally (quick?)-fixed that issue back then?=20
Did we really have hardware misbehavior? It's been a while, but as far=20
as I remember that was the case.

Thanks,
   Ralf

>=20
> Here is, pasted below, the log output from Jailhouse and the booting=20
> guest kernel.
>=20
> PS: I am following the steps in Documentation/non-root-linux.txt and
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 using the patched kernel in queues/=
jailhouse branch.
>=20
> Cheers
> Karim
>=20
> ---
> Jailhouse:
>=20
> Cell "linux-x86-demo" can be loaded
> Started cell "linux-x86-demo"
> CPU 2 received SIPI, vector 100
> CPU 3 received SIPI, vector 100
> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
> FATAL: Unhandled APIC access, offset 848, is_write: 1
> RIP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246
> RAX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x0000000000000000
> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000406b0
> EFER: 0x0000000000001d01
> Parking CPU 2 (Cell: "linux-x86-demo")
> Cell "linux-x86-demo" can be loaded
> Closing cell "linux-x86-demo"
> Page pool usage after cell destruction: mem 2972/32211, remap 65703/13107=
2
> CPU 2 received SIPI, vector 96
> CPU 3 received SIPI, vector 96
>=20
> Linux demo guest (last few lines from kernel boot log on the serial=20
> console):
>=20
> init, 1176K bss, 73676K reserved, 0K cma-reserved)
> [ =C2=A0 =C2=A02.960440] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0,=
 CPUs=3D2, Nodes=3D1
> [ =C2=A0 =C2=A03.040332] Dynamic Preempt: voluntary
> [ =C2=A0 =C2=A03.083151] rcu: Preemptible hierarchical RCU implementation=
.
> [ =C2=A0 =C2=A03.151749] rcu: =C2=A0 =C2=A0 RCU event tracing is enabled.
> [ =C2=A0 =C2=A03.205830] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_=
CPUS=3D64 to=20
> nr_cpu_ids=3D2.
> [ =C2=A0 =C2=A03.284872] =C2=A0Trampoline variant of Tasks RCU enabled.
> [ =C2=A0 =C2=A03.345191] rcu: RCU calculated value of scheduler-enlistmen=
t delay=20
> is 100 jiffies.
> [ =C2=A0 =C2=A03.436710] rcu: Adjusting geometry for rcu_fanout_leaf=3D16=
, nr_cpu_ids=3D2
> [ =C2=A0 =C2=A03.518471] NR_IRQS: 4352, nr_irqs: 424, preallocated irqs: =
0
> [ =C2=A0 =C2=A03.585483] rcu: srcu_init: Setting srcu_struct sizes based =
on=20
> contention.
> [ =C2=A0 =C2=A03.667665] Console: colour dummy device 80x25
> [ =C2=A0 =C2=A03.720639] Enabling UART0 (port 0x3f8)
> [ =C2=A0 =C2=A03.766423] printk: console [ttyS0] enabled
> [ =C2=A0 =C2=A03.766423] printk: console [ttyS0] enabled
> [ =C2=A0 =C2=A03.866333] printk: bootconsole [earlyser0] disabled
> [ =C2=A0 =C2=A03.866333] printk: bootconsole [earlyser0] disabled
> [ =C2=A0 =C2=A03.985019] APIC: Switch to symmetric I/O mode setup
> [ =C2=A0 =C2=A04.046377] Switched APIC routing to physical flat.
>=20
>=20
> The University of Edinburgh is a charitable body, registered in=20
> Scotland, with registration number SC005336. Is e buidheann carthannais=
=20
> a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an =
Alba, =C3=A0ireamh cl=C3=A0raidh=20
> SC005336.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/06f03e95-7ff4-3822-aeba-be48e5006b15%40oth-regensburg.de.
