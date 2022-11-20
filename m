Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBKWY5KNQMGQEQYI63UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51A6316E1
	for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Nov 2022 23:37:31 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id v188-20020a1cacc5000000b003cf76c4ae66sf8305904wme.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Nov 2022 14:37:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668983851; cv=pass;
        d=google.com; s=arc-20160816;
        b=sB0vixBz8WgFOXrXogoJaX+INRG6NTi2Ls59h/h2N5jVO+o0KT6e+6TOOGqXvYcyP0
         JtbfByH9v0m0Jxva7N23tVH5nR8JNMKDecGIW9oEBxUDORBSeuffVm5R7x40Bgy0Lc14
         FaHt9k5UhfyjzHV/2yQSiOcTSyOaUis8gq+REV9SI45/Y7dkJ5GL90z/Zth9Wpekh2dx
         9pNx8dVvWfku1tl0FHaFTI3AB6yyWLVBiRhen22ou10RJa6V7C1z3gQkJ4pUTHMtWG2l
         HKz5kFMRAs5u5DJVs8xcKq1/53zQ+yDLyjeTb7V1ovyxCLj1xS+DCzdXhUXtLdkmMm3D
         Gjwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=W0mAq7pZIWZGNMRaLeSWew9WW8XhCgsVe6hM5kecyfA=;
        b=vlcCvApQTrI7NxpwMa72KhPRvo5fM6/MQt/A6z8nDwJWpcslmD1SKAqV0cDa0bm933
         4Z/h0yqgSkK94Cu1t/UMVIHuxQCN4DoOR2STZfCUmZ7Qpu+tZstbBIDPm70RzcvCaaf6
         FvNZqcIeU74yMB0rTHfjQy+yijSdTpqSO6cFGbd28uQop4t0oInc8aZ8J7qUvqC7Dm0F
         1DHumeaQi6rOwJh9FfTr0r+sFHm4LLIgzRx7YJ8rtKv4GPHpb1HrPcD4VGMfoPYaMoz2
         fJQQN2YlmYqhXf2qNXF910MpFM6FZ7XC+MEsxaAPkVHwvTF6upoA2ReU/97kvDKelXe0
         5Mtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=i692AWwI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=W0mAq7pZIWZGNMRaLeSWew9WW8XhCgsVe6hM5kecyfA=;
        b=WlG6ZSkK2xys0d8qxp9vrWe6dgqqyDW/NVhwBJ/d6dRp0SendvfZuBsykZUvysW592
         pR1Ct6mqZDJFXnOUzfVpOoZ/L+fllfy7qFZzHofRTisonluaN35+WCtuDul66+QaZVyb
         WQyHVotMnSFpkuU2pwPBm92KCbivokeBwjNV70OOeaug/pc9oy72Fdadee/ixN0HjFJ0
         VvLx7Q+GEglcHfNAJ1/IRrJaxN4uIzqcWWxc4kYOnRWd0MmXE8b+YVtaLBU5ckd+9J5d
         ssiSVqsCwyYYnzqa0EiU/7D2ghuRXQCGFm20Kow6LVUJ6rj/czgNmcQcvwxrY/XEDzqr
         PGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0mAq7pZIWZGNMRaLeSWew9WW8XhCgsVe6hM5kecyfA=;
        b=kwbNUWSqAlrVFM0xtBDcLDkS5r5t4F5lyzg5psAq5p+eR2xMxvrXwlCP5V3oeeG7TZ
         cGpa6QL60azHOPBmenHmuc/FDD+pXSYk7gj5FsvAaSZg6BxkHVIOirI3/4yJk/VgrYvW
         4wzZyAj+d4A6CR2cKZcWOIgJ57k/K5I1Glfcj3A33BNvz9DI4vDi9ApEvuJYHoyigPr8
         0NPHl/1+xAS347GEvuBwiMXYofEj7peEs7Hl/bC8k/ldcdAhlTetd5nCqL1zaHu1RMOj
         tGZ4KnrZ/YZbDNSOVp0iHGlENVWBa9FFumn1+6kAx3FvWkcWJLmSc7BT1BUlwnwvOnnF
         x2Ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkL7jacaFeJHOkwLlM4J+/MSscChBGKNhemx7FgC6e8HuGCA3jx
	M3dVpMlzddtrd0/nFsuiC6o=
X-Google-Smtp-Source: AA0mqf4F6lZxWdEN1luMiTZJgshOWinc1rTv6tFbNaQ3PUyVooX3qGbsOyAkppOo8gNzKPRDon1DUQ==
X-Received: by 2002:a05:600c:42d2:b0:3cf:c907:a05a with SMTP id j18-20020a05600c42d200b003cfc907a05amr13926407wme.177.1668983851067;
        Sun, 20 Nov 2022 14:37:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1f9a:b0:225:6559:3374 with SMTP id
 bw26-20020a0560001f9a00b0022565593374ls12824835wrb.2.-pod-prod-gmail; Sun, 20
 Nov 2022 14:37:29 -0800 (PST)
X-Received: by 2002:a05:6000:124c:b0:236:2314:6d4b with SMTP id j12-20020a056000124c00b0023623146d4bmr1755650wrx.112.1668983849124;
        Sun, 20 Nov 2022 14:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668983849; cv=none;
        d=google.com; s=arc-20160816;
        b=oUs/rSKGXsntdPOo/7dFD//sg6F3AeFL9j5ntI6ZqRUwliHtEP9W5d5/6ZIARIGh+q
         BDUlmNyiWUt4fKHpW206BgFTv1yqe7BmITAlYtuAfqWrctPdi3A0TxM2CBz44SzOAZ8M
         QAHKET0IKv4NSG1Y5vYqPLWYNTchIh88+FBboXjv/jbTctQprWcS8gxg7fxX8xWZjMBr
         ACWamsxc97ONRszH30BcMu9zelCMwKoPkUFhZiwI3JxIA+fg6+72efeLFQOElE/HACLk
         2FQd/oYC4w48253YiUTpGIuq2Wca93gf1XTgACYRjoBvYmug+WcYCbgibKqXKrriYDHA
         zCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qb7atME67NzS6peko4BoEP2Bamrly7TpV5LyEWn/PPQ=;
        b=ti1Yy8jazvgBkHjj1JSQsIUpmgbwug98rKK92l2Qx6gyW+MgirHzkb6GodLH0smac+
         vmTuc0CeffGOP5ZfY/zwPWR9WQsGqbMiIr6Uu+z8T/WsILUoMuEhTst/SRorGzVqu+Am
         8DEdr5pzYsWJIS05+mG3pbsvhTq/1Kyf8drEJ6F0NDdx4F2qdj+MvgpjyaJbHKEKXZw7
         kCsOw0U4/hFC8Oi42TKOdK/BPR2b//FF6J5dBPEy90JbhU3otK4wR0JhAYKRdL/7x9Pv
         rBp/dd/UukLguSSzmDObrkJWJ8GcsA7gETzABaVpfrGwkyUwkySUVRp5cTcTykrYkbdr
         YVkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=i692AWwI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id q22-20020a7bce96000000b003c4ecff4e2bsi368266wmj.1.2022.11.20.14.37.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 14:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NFllD41DJzxqr;
	Sun, 20 Nov 2022 23:37:28 +0100 (CET)
Received: from [IPV6:2001:16e0:201:f776:eba4:bbc1:a6a3:3bd3]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 20 Nov
 2022 23:37:28 +0100
Message-ID: <22e926f8-c036-0e15-81a8-154eb74bb6f9@oth-regensburg.de>
Date: Sun, 20 Nov 2022 23:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Content-Language: en-US
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
CC: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, Henning Schild
	<henning.schild@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
 <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
 <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <79cf1f00-9c20-404e-150b-42142c804d3e@oth-regensburg.de>
 <DB8PR05MB602623B1DA27CE3A1662FD72A9099@DB8PR05MB6026.eurprd05.prod.outlook.com>
 <08d3ca0e-9f82-cc84-f70a-0b0c8000326a@oth-regensburg.de>
 <AM0PR05MB60188F8CE4254465566F345BA90B9@AM0PR05MB6018.eurprd05.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <AM0PR05MB60188F8CE4254465566F345BA90B9@AM0PR05MB6018.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=i692AWwI;
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

Hi Karim,

On 20/11/2022 19:47, Karim Manaouil wrote:
> Hi Ralf,
>=20
> Thanks a lot for the help!
>=20
> The missing entries are for AMD IOMMU (they appear
> in /proc/iommu tree, but for some reason the jailhouse
> config script is not adding them to sysconfig.c).
>=20
> I also had to add amd_iommu=3Dfalse to the kernel cmdline.
> Now the jailhouse is correctly created with no issues, and
> the Linux on the root cell works perfectly.

Perfect, sounds good! Yep, that's required. Afair, we don't have support=20
for the AMD IOMMU yet.

>=20
> I wanted to try creating another cell using the demo provided
> by configs/x86/apic-demo.c (since it's very simple), but it always
> generates a PIO read error.
>=20
> The PIO address is for UART (0x2f9). This address exists in a
> PIO_RANGE in apic-demo.c and it also exists on the root cell's
> sysconfig.c, so it should work, but here we are.

When you create a non-root cell, you take away that PIO_RANGE from the=20
root cell. If the root cell now tries to further access that port,=20
Jailhouse will stop that cell due to port access violation. This is=20
exactly what happened and in fact it works as intended.

What you need to do is to ensure that Linux won't claim that port, but I=20
wonder why Linux actually accesses that port=E2=80=A6 0x2f8 is the secondar=
y=20
UART (0x3f8 is the primary, also used by Jailhouse for its debug=20
output). Maybe there's a TTY allocated on that port?

There are two solutions to address your issue (you should do both, just=20
to have your system under control):

1. You can, limit the number of uarts with the nr_uarts
    kernel parameter, or/and, identify and stop the application that
    accesses the UART. 'lsof | grep ttyS1' or checking systemd's services
    (via systemctl) might be a good starting point.

2. Don't assign PIO_RANGE(0x2f8, ...) to the non-root cell if you (a)
    don't have a secondary UART at all (which I would expect), and (b) if
    you don't need it inside that cell. You can use the primary UART for
    the non-root cell.

As far as I remember, the non-root cell will use the primary UART in any=20
case by default.

   Ralf

>=20
> Here is the log that I get after running:
> jailhouse cell create configs/x86/apic-demo.cell
> it shows both hypervisor and Linux output. I also
> attached apic-demo.c for reference.
>=20
> Page pool usage after late setup: mem 1934/7635, remap 65703/131072
> Activating hypervisor
> [ =C2=A0698.582280] jailhouse: enter_hypvisor called on every cpu
> [ =C2=A0698.587918] jailhouse: console unmapped
> [ =C2=A0698.591942] jailhouse: firmware released
> [ =C2=A0698.595998] jailhouse: root cell registered
> [ =C2=A0698.600313] jailhouse: pci virtual root device added
> [ =C2=A0698.604973] hpet_rtc_timer_reinit: 5 callbacks suppressed
> [ =C2=A0698.604977] hpet: Lost 5719 RTC interrupts
> [ =C2=A0698.605434] The Jailhouse is opening.
> [ =C2=A0733.204370] jailhouse: pci setup done
> [ =C2=A0733.283290] IRQ fixup: irq 789 move in progress, old vector 39
> [ =C2=A0733.289163] IRQ 789: no longer affine to CPU3
> [ =C2=A0733.294892] smpboot: CPU 3 is now offline
> Created cell "apic-demo"
> Page pool usage after cell creation: mem 1949/7635, remap 65703/131072
> AFATAL: Invalid PIO read, port: 2f9 size: 1
> RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d627c98 FLAGS: 6
> RAX: 0xffffffff999b2670 RBX: 0x0000000000000247 RCX: 0x0000000000000000
> RDX: 0x00000000000002f9 RSI: 0x0000000000000001 RDI: 0xffffffff9b3da9f8
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000003082bea000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 29 (Cell: "RootCell")
> FATAL: Invalid PIO read, port: 2fa size: 1
> RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d450f08 FLAGS: 6
> RAX: 0xffffffff999b2670 RBX: 0xffffffff9b3da9f8 RCX: 0x0000000000000000
> RDX: 0x00000000000002fa RSI: 0x0000000000000002 RDI: 0xffffffff9b3da9f8
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000002085c36000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 64 (Cell: "RootCell")
>=20
>=20
> Cheers
> Karim
> ------------------------------------------------------------------------
> *From:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> *Sent:* 18 November 2022 20:18
> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
> *Cc:* jan.kiszka@siemens.com <jan.kiszka@siemens.com>; Henning Schild=20
> <henning.schild@siemens.com>; jailhouse-dev@googlegroups.com=20
> <jailhouse-dev@googlegroups.com>
> *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that=20
> the email is genuine and the content is safe.
>=20
> Hi Karim,
>=20
> On 18/11/2022 19:27, Karim Manaouil wrote:
>> Hi Ralf,
>>
>> Thanks! I appreciate your help!
>>
>> I disabled MCE to get rid of the unhandled MSR read error. It works.
>>
>> I also fixed the PCIe 04:00.0 invalid write to reg 0xb4 by manually addi=
ng
>=20
> Okay, take care that if you manually add an entry that you need to
> adjust the array size and their references.
>=20
>> a capability entry to sysconfig.c giving it write permissions (btw, the
>> entry
>> for that register was not generated by the config tool).
>=20
> Not everything is covered by the generator, some parts require manual
> inspection.
>=20
>>
>> Now, I am still getting the invalid MMIO/RAM read and write (see log bel=
ow).
>> I first get the read error immediately after the page pool message
>> is printed. Then after a little while, the write error follows up.
>=20
> Now we need to inspect /proc/iomem. You need to check what is behind
> address 0x90482020, and add an appropriate memory region entry to your
> config.
>=20
>  =C2=A0=C2=A0 Ralf
>=20
>>
>> Always same case, immediate read error followed by a write error.
>> it happens every time (but the addresses change).
>>
>> Here is below the last log from jailhouse copy pasted.
>> I also attached the output of lspci -vvv as well as sysconfig.c.
>>
>> Cheers
>> Karim
>>
>> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
>> FATAL: Invalid MMIO/RAM read, addr: 0x0000000090482020 size: 4
>> RIP: 0xffffffff915d1735 RSP: 0xffffa9b08e97be18 FLAGS: 296
>> RAX: 0xffffa9b080780000 RBX: 0xffff934f4262a7c0 RCX: 0x0000000000000000
>> RDX: 0xffff934f47e32f10 RSI: 0xffff934f4004e800 RDI: 0x0000000000000021
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x00000020c2682000 CR4: 0x00000000003506a0
>> EFER: 0x0000000000001d01
>> Parking CPU 7 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>> FATAL: Invalid MMIO/RAM write, addr: 0x0000000093a82008 size: 4
>> RIP: 0xffffffff915ccce7 RSP: 0xffffa9b08db54da0 FLAGS: 2
>> RAX: 0xffffa9b080380000 RBX: 0x0000000000000001 RCX: 0x0000000000001a70
>> RDX: 0xffff9376c0004000 RSI: 0x3000004500000000 RDI: 0x7ffffffffffff003
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x00000001267d0000 CR4: 0x00000000003506a0
>> EFER: 0x0000000000001d01
>> Parking CPU 81 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>> Ignoring NMI IPI to CPU 88
>>
>>
>> ------------------------------------------------------------------------
>> *From:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> *Sent:* 18 November 2022 16:23
>> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>; Henning Schild
>> <henning.schild@siemens.com>
>> *Cc:* jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>> *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
>> This email was sent to you by someone outside the University.
>> You should only click on links or attachments if you are certain that
>> the email is genuine and the content is safe.
>>
>> Hi,
>>
>> On 18/11/2022 02:19, Karim Manaouil wrote:
>>> Hi Henning,
>>>
>>> I spent some more time debugging the issue.
>>> I am getting a "FATAL: Invalid MMIO/RAM write".
>>> Probably it's happening right after the first cpu that
>>> calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().
>>>
>>> Not sure why, but maybe you have some pointers.
>>>
>>> Here is the jailhouse output copy-pasted below.
>>>
>>> Cheers
>>>
>>> Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
>>> Code location: 0xfffffffff0000050
>>> Using xAPIC
>>> Page pool usage after early setup: mem 813/7635, remap 1/131072
>>> Initializing processors:
>>
>> Ok, having read your log, you have (at the moment) at least two issues:
>>
>> First:
>>
>>=C2=A0=C2=A0 > FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4=
, size: 2
>>
>> For the moment, go to your config and allow write access to that
>> capability. I could maybe help you with this if you share your config.
>> Please also attach lspci -vvv.
>>
>> I can send you the config diff, and in the long run, you need to
>> understand what the changes mean.
>>
>> Second:
>>
>>=C2=A0=C2=A0 > FATAL: Unhandled MSR read: c0002001
>>
>> That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine Check
>> Events (MCE) in your kernel config or add appropriate parameters to your
>> kernel to disable them.
>>
>> Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=3Doff t=
o
>> your kernel parameters.
>>
>> HTH,
>>
>>=C2=A0=C2=A0=C2=A0=C2=A0 Ralf
>>
>>>=C2=A0=C2=A0 CPU 6... (APIC ID 48) OK
>>>=C2=A0=C2=A0 CPU 64... (APIC ID 1) OK
>>>=C2=A0=C2=A0 CPU 0... (APIC ID 0) OK
>>>=C2=A0=C2=A0 CPU 16... (APIC ID 2) OK
>>>=C2=A0=C2=A0 CPU 112... (APIC ID 7) OK
>>>=C2=A0=C2=A0 CPU 104... (APIC ID 13) OK
>>>=C2=A0=C2=A0 CPU 40... (APIC ID 12) OK
>>>=C2=A0=C2=A0 CPU 72... (APIC ID 9) OK
>>>=C2=A0=C2=A0 CPU 8... (APIC ID 8) OK
>>>=C2=A0=C2=A0 CPU 56... (APIC ID 14) OK
>>>=C2=A0=C2=A0 CPU 120... (APIC ID 15) OK
>>>=C2=A0=C2=A0 CPU 110... (APIC ID 61) OK
>>>=C2=A0=C2=A0 CPU 46... (APIC ID 60) OK
>>>=C2=A0=C2=A0 CPU 14... (APIC ID 56) OK
>>>=C2=A0=C2=A0 CPU 78... (APIC ID 57) OK
>>>=C2=A0=C2=A0 CPU 94... (APIC ID 59) OK
>>>=C2=A0=C2=A0 CPU 30... (APIC ID 58) OK
>>>=C2=A0=C2=A0 CPU 126... (APIC ID 63) OK
>>>=C2=A0=C2=A0 CPU 62... (APIC ID 62) OK
>>>=C2=A0=C2=A0 CPU 2... (APIC ID 16) OK
>>>=C2=A0=C2=A0 CPU 66... (APIC ID 17) OK
>>>=C2=A0=C2=A0 CPU 18... (APIC ID 18) OK
>>>=C2=A0=C2=A0 CPU 82... (APIC ID 19) OK
>>>=C2=A0=C2=A0 CPU 114... (APIC ID 23) OK
>>>=C2=A0=C2=A0 CPU 50... (APIC ID 22) OK
>>>=C2=A0=C2=A0 CPU 98... (APIC ID 21) OK
>>>=C2=A0=C2=A0 CPU 34... (APIC ID 20) OK
>>>=C2=A0=C2=A0 CPU 12... (APIC ID 40) OK
>>>=C2=A0=C2=A0 CPU 76... (APIC ID 41) OK
>>>=C2=A0=C2=A0 CPU 60... (APIC ID 46) OK
>>>=C2=A0=C2=A0 CPU 124... (APIC ID 47) OK
>>>=C2=A0=C2=A0 CPU 44... (APIC ID 44) OK
>>>=C2=A0=C2=A0 CPU 108... (APIC ID 45) OK
>>>=C2=A0=C2=A0 CPU 92... (APIC ID 43) OK
>>>=C2=A0=C2=A0 CPU 28... (APIC ID 42) OK
>>>=C2=A0=C2=A0 CPU 26... (APIC ID 26) OK
>>>=C2=A0=C2=A0 CPU 90... (APIC ID 27) OK
>>>=C2=A0=C2=A0 CPU 74... (APIC ID 25) OK
>>>=C2=A0=C2=A0 CPU 10... (APIC ID 24) OK
>>>=C2=A0=C2=A0 CPU 106... (APIC ID 29) OK
>>>=C2=A0=C2=A0 CPU 42... (APIC ID 28) OK
>>>=C2=A0=C2=A0 CPU 58... (APIC ID 30) OK
>>>=C2=A0=C2=A0 CPU 122... (APIC ID 31) OK
>>>=C2=A0=C2=A0 CPU 20... (APIC ID 34) OK
>>>=C2=A0=C2=A0 CPU 84... (APIC ID 35) OK
>>>=C2=A0=C2=A0 CPU 36... (APIC ID 36) OK
>>>=C2=A0=C2=A0 CPU 100... (APIC ID 37) OK
>>>=C2=A0=C2=A0 CPU 116... (APIC ID 39) OK
>>>=C2=A0=C2=A0 CPU 52... (APIC ID 38) OK
>>>=C2=A0=C2=A0 CPU 4... (APIC ID 32) OK
>>>=C2=A0=C2=A0 CPU 68... (APIC ID 33) OK
>>>=C2=A0=C2=A0 CPU 96... (APIC ID 5) OK
>>>=C2=A0=C2=A0 CPU 32... (APIC ID 4) OK
>>>=C2=A0=C2=A0 CPU 88... (APIC ID 11) OK
>>>=C2=A0=C2=A0 CPU 55... (APIC ID 118) OK
>>>=C2=A0=C2=A0 CPU 119... (APIC ID 119) OK
>>>=C2=A0=C2=A0 CPU 87... (APIC ID 115) OK
>>>=C2=A0=C2=A0 CPU 23... (APIC ID 114) OK
>>>=C2=A0=C2=A0 CPU 71... (APIC ID 113) OK
>>>=C2=A0=C2=A0 CPU 7... (APIC ID 112) OK
>>>=C2=A0=C2=A0 CPU 39... (APIC ID 116) OK
>>>=C2=A0=C2=A0 CPU 103... (APIC ID 117) OK
>>>=C2=A0=C2=A0 CPU 47... (APIC ID 124) OK
>>>=C2=A0=C2=A0 CPU 111... (APIC ID 125) OK
>>>=C2=A0=C2=A0 CPU 15... (APIC ID 120) OK
>>>=C2=A0=C2=A0 CPU 79... (APIC ID 121) OK
>>>=C2=A0=C2=A0 CPU 31... (APIC ID 122) OK
>>>=C2=A0=C2=A0 CPU 95... (APIC ID 123) OK
>>>=C2=A0=C2=A0 CPU 127... (APIC ID 127) OK
>>>=C2=A0=C2=A0 CPU 63... (APIC ID 126) OK
>>>=C2=A0=C2=A0 CPU 86... (APIC ID 51) OK
>>>=C2=A0=C2=A0 CPU 22... (APIC ID 50) OK
>>>=C2=A0=C2=A0 CPU 38... (APIC ID 52) OK
>>>=C2=A0=C2=A0 CPU 102... (APIC ID 53) OK
>>>=C2=A0=C2=A0 CPU 118... (APIC ID 55) OK
>>>=C2=A0=C2=A0 CPU 54... (APIC ID 54) OK
>>>=C2=A0=C2=A0 CPU 70... (APIC ID 49) OK
>>>=C2=A0=C2=A0 CPU 109... (APIC ID 109) OK
>>>=C2=A0=C2=A0 CPU 45... (APIC ID 108) OK
>>>=C2=A0=C2=A0 CPU 93... (APIC ID 107) OK
>>>=C2=A0=C2=A0 CPU 29... (APIC ID 106) OK
>>>=C2=A0=C2=A0 CPU 13... (APIC ID 104) OK
>>>=C2=A0=C2=A0 CPU 77... (APIC ID 105) OK
>>>=C2=A0=C2=A0 CPU 61... (APIC ID 110) OK
>>>=C2=A0=C2=A0 CPU 125... (APIC ID 111) OK
>>>=C2=A0=C2=A0 CPU 5... (APIC ID 96) OK
>>>=C2=A0=C2=A0 CPU 101... (APIC ID 101) OK
>>>=C2=A0=C2=A0 CPU 37... (APIC ID 100) OK
>>>=C2=A0=C2=A0 CPU 85... (APIC ID 99) OK
>>>=C2=A0=C2=A0 CPU 21... (APIC ID 98) OK
>>>=C2=A0=C2=A0 CPU 117... (APIC ID 103) OK
>>>=C2=A0=C2=A0 CPU 53... (APIC ID 102) OK
>>>=C2=A0=C2=A0 CPU 69... (APIC ID 97) OK
>>>=C2=A0=C2=A0 CPU 49... (APIC ID 70) OK
>>>=C2=A0=C2=A0 CPU 1... (APIC ID 64) OK
>>>=C2=A0=C2=A0 CPU 65... (APIC ID 65) OK
>>>=C2=A0=C2=A0 CPU 81... (APIC ID 67) OK
>>>=C2=A0=C2=A0 CPU 17... (APIC ID 66) OK
>>>=C2=A0=C2=A0 CPU 97... (APIC ID 69) OK
>>>=C2=A0=C2=A0 CPU 33... (APIC ID 68) OK
>>>=C2=A0=C2=A0 CPU 113... (APIC ID 71) OK
>>>=C2=A0=C2=A0 CPU 25... (APIC ID 74) OK
>>>=C2=A0=C2=A0 CPU 89... (APIC ID 75) OK
>>>=C2=A0=C2=A0 CPU 41... (APIC ID 76) OK
>>>=C2=A0=C2=A0 CPU 105... (APIC ID 77) OK
>>>=C2=A0=C2=A0 CPU 9... (APIC ID 72) OK
>>>=C2=A0=C2=A0 CPU 73... (APIC ID 73) OK
>>>=C2=A0=C2=A0 CPU 121... (APIC ID 79) OK
>>>=C2=A0=C2=A0 CPU 57... (APIC ID 78) OK
>>>=C2=A0=C2=A0 CPU 3... (APIC ID 80) OK
>>>=C2=A0=C2=A0 CPU 67... (APIC ID 81) OK
>>>=C2=A0=C2=A0 CPU 35... (APIC ID 84) OK
>>>=C2=A0=C2=A0 CPU 99... (APIC ID 85) OK
>>>=C2=A0=C2=A0 CPU 115... (APIC ID 87) OK
>>>=C2=A0=C2=A0 CPU 51... (APIC ID 86) OK
>>>=C2=A0=C2=A0 CPU 19... (APIC ID 82) OK
>>>=C2=A0=C2=A0 CPU 83... (APIC ID 83) OK
>>>=C2=A0=C2=A0 CPU 107... (APIC ID 93) OK
>>>=C2=A0=C2=A0 CPU 43... (APIC ID 92) OK
>>>=C2=A0=C2=A0 CPU 11... (APIC ID 88) OK
>>>=C2=A0=C2=A0 CPU 75... (APIC ID 89) OK
>>>=C2=A0=C2=A0 CPU 123... (APIC ID 95) OK
>>>=C2=A0=C2=A0 CPU 59... (APIC ID 94) OK
>>>=C2=A0=C2=A0 CPU 27... (APIC ID 90) OK
>>>=C2=A0=C2=A0 CPU 24... (APIC ID 10) OK
>>>=C2=A0=C2=A0 CPU 80... (APIC ID 3) OK
>>>=C2=A0=C2=A0 CPU 48... (APIC ID 6) OK
>>>=C2=A0=C2=A0 CPU 91... (APIC ID 91) OK
>>> Initializing unit: AMD IOMMU
>>> AMD IOMMU @0xa1700000/0x80000
>>> Initializing unit: IOAPIC
>>> Initializing unit: PCI
>>> Adding PCI device 00:00.0 to cell "RootCell"
>>> Adding PCI device 00:01.0 to cell "RootCell"
>>> Adding PCI device 00:01.1 to cell "RootCell"
>>> Adding PCI device 00:01.3 to cell "RootCell"
>>> Adding PCI device 00:01.4 to cell "RootCell"
>>> Adding PCI device 00:02.0 to cell "RootCell"
>>> Adding PCI device 00:03.0 to cell "RootCell"
>>> Adding PCI device 00:04.0 to cell "RootCell"
>>> Adding PCI device 00:07.0 to cell "RootCell"
>>> Adding PCI device 00:07.1 to cell "RootCell"
>>> Adding PCI device 00:08.0 to cell "RootCell"
>>> Adding PCI device 00:08.1 to cell "RootCell"
>>> Adding PCI device 00:14.0 to cell "RootCell"
>>> Adding PCI device 00:14.3 to cell "RootCell"
>>> Adding PCI device 00:18.0 to cell "RootCell"
>>> Adding PCI device 00:18.1 to cell "RootCell"
>>> Adding PCI device 00:18.2 to cell "RootCell"
>>> Adding PCI device 00:18.3 to cell "RootCell"
>>> Adding PCI device 00:18.4 to cell "RootCell"
>>> Adding PCI device 00:18.5 to cell "RootCell"
>>> Adding PCI device 00:18.6 to cell "RootCell"
>>> Adding PCI device 00:18.7 to cell "RootCell"
>>> Adding PCI device 00:19.0 to cell "RootCell"
>>> Adding PCI device 00:19.1 to cell "RootCell"
>>> Adding PCI device 00:19.2 to cell "RootCell"
>>> Adding PCI device 00:19.3 to cell "RootCell"
>>> Adding PCI device 00:19.4 to cell "RootCell"
>>> Adding PCI device 00:19.5 to cell "RootCell"
>>> Adding PCI device 00:19.6 to cell "RootCell"
>>> Adding PCI device 00:19.7 to cell "RootCell"
>>> Adding PCI device 00:1a.0 to cell "RootCell"
>>> Adding PCI device 00:1a.1 to cell "RootCell"
>>> Adding PCI device 00:1a.2 to cell "RootCell"
>>> Adding PCI device 00:1a.3 to cell "RootCell"
>>> Adding PCI device 00:1a.4 to cell "RootCell"
>>> Adding PCI device 00:1a.5 to cell "RootCell"
>>> Adding PCI device 00:1a.6 to cell "RootCell"
>>> Adding PCI device 00:1a.7 to cell "RootCell"
>>> Adding PCI device 00:1b.0 to cell "RootCell"
>>> Adding PCI device 00:1b.1 to cell "RootCell"
>>> Adding PCI device 00:1b.2 to cell "RootCell"
>>> Adding PCI device 00:1b.3 to cell "RootCell"
>>> Adding PCI device 00:1b.4 to cell "RootCell"
>>> Adding PCI device 00:1b.5 to cell "RootCell"
>>> Adding PCI device 00:1b.6 to cell "RootCell"
>>> Adding PCI device 00:1b.7 to cell "RootCell"
>>> Adding PCI device 00:1c.0 to cell "RootCell"
>>> Adding PCI device 00:1c.1 to cell "RootCell"
>>> Adding PCI device 00:1c.2 to cell "RootCell"
>>> Adding PCI device 00:1c.3 to cell "RootCell"
>>> Adding PCI device 00:1c.4 to cell "RootCell"
>>> Adding PCI device 00:1c.5 to cell "RootCell"
>>> Adding PCI device 00:1c.6 to cell "RootCell"
>>> Adding PCI device 00:1c.7 to cell "RootCell"
>>> Adding PCI device 00:1d.0 to cell "RootCell"
>>> Adding PCI device 00:1d.1 to cell "RootCell"
>>> Adding PCI device 00:1d.2 to cell "RootCell"
>>> Adding PCI device 00:1d.3 to cell "RootCell"
>>> Adding PCI device 00:1d.4 to cell "RootCell"
>>> Adding PCI device 00:1d.5 to cell "RootCell"
>>> Adding PCI device 00:1d.6 to cell "RootCell"
>>> Adding PCI device 00:1d.7 to cell "RootCell"
>>> Adding PCI device 00:1e.0 to cell "RootCell"
>>> Adding PCI device 00:1e.1 to cell "RootCell"
>>> Adding PCI device 00:1e.2 to cell "RootCell"
>>> Adding PCI device 00:1e.3 to cell "RootCell"
>>> Adding PCI device 00:1e.4 to cell "RootCell"
>>> Adding PCI device 00:1e.5 to cell "RootCell"
>>> Adding PCI device 00:1e.6 to cell "RootCell"
>>> Adding PCI device 00:1e.7 to cell "RootCell"
>>> Adding PCI device 00:1f.0 to cell "RootCell"
>>> Adding PCI device 00:1f.1 to cell "RootCell"
>>> Adding PCI device 00:1f.2 to cell "RootCell"
>>> Adding PCI device 00:1f.3 to cell "RootCell"
>>> Adding PCI device 00:1f.4 to cell "RootCell"
>>> Adding PCI device 00:1f.5 to cell "RootCell"
>>> Adding PCI device 00:1f.6 to cell "RootCell"
>>> Adding PCI device 00:1f.7 to cell "RootCell"
>>> Adding PCI device 01:00.0 to cell "RootCell"
>>> Adding PCI device 01:00.1 to cell "RootCell"
>>> Adding PCI device 02:00.0 to cell "RootCell"
>>> Adding PCI device 03:00.0 to cell "RootCell"
>>> Adding PCI device 04:00.0 to cell "RootCell"
>>> Adding PCI device 04:00.1 to cell "RootCell"
>>> Adding PCI device 05:00.0 to cell "RootCell"
>>> Adding PCI device 05:00.2 to cell "RootCell"
>>> Adding PCI device 05:00.3 to cell "RootCell"
>>> Adding PCI device 06:00.0 to cell "RootCell"
>>> Adding PCI device 06:00.1 to cell "RootCell"
>>> Adding PCI device 06:00.2 to cell "RootCell"
>>> Adding PCI device 20:00.0 to cell "RootCell"
>>> Adding PCI device 20:00.2 to cell "RootCell"
>>> Adding PCI device 20:01.0 to cell "RootCell"
>>> Adding PCI device 20:01.1 to cell "RootCell"
>>> Adding PCI device 20:02.0 to cell "RootCell"
>>> Adding PCI device 20:03.0 to cell "RootCell"
>>> Adding PCI device 20:04.0 to cell "RootCell"
>>> Adding PCI device 20:07.0 to cell "RootCell"
>>> Adding PCI device 20:07.1 to cell "RootCell"
>>> Adding PCI device 20:08.0 to cell "RootCell"
>>> Adding PCI device 20:08.1 to cell "RootCell"
>>> Adding PCI device 21:00.0 to cell "RootCell"
>>> Adding PCI device 21:00.1 to cell "RootCell"
>>> Adding PCI device 22:08.0 to cell "RootCell"
>>> Adding PCI device 23:00.0 to cell "RootCell"
>>> Adding PCI device 24:00.0 to cell "RootCell"
>>> Adding PCI device 24:00.2 to cell "RootCell"
>>> Adding PCI device 24:00.3 to cell "RootCell"
>>> Adding PCI device 25:00.0 to cell "RootCell"
>>> Adding PCI device 25:00.1 to cell "RootCell"
>>> Adding PCI device 40:00.0 to cell "RootCell"
>>> Adding PCI device 40:00.2 to cell "RootCell"
>>> Adding PCI device 40:01.0 to cell "RootCell"
>>> Adding PCI device 40:02.0 to cell "RootCell"
>>> Adding PCI device 40:03.0 to cell "RootCell"
>>> Adding PCI device 40:03.1 to cell "RootCell"
>>> Adding PCI device 40:04.0 to cell "RootCell"
>>> Adding PCI device 40:07.0 to cell "RootCell"
>>> Adding PCI device 40:07.1 to cell "RootCell"
>>> Adding PCI device 40:08.0 to cell "RootCell"
>>> Adding PCI device 40:08.1 to cell "RootCell"
>>> Adding PCI device 41:00.0 to cell "RootCell"
>>> Adding PCI device 41:00.1 to cell "RootCell"
>>> Adding PCI device 42:00.0 to cell "RootCell"
>>> Adding PCI device 42:00.2 to cell "RootCell"
>>> Adding PCI device 43:00.0 to cell "RootCell"
>>> Adding PCI device 43:00.1 to cell "RootCell"
>>> Adding PCI device 60:00.0 to cell "RootCell"
>>> Adding PCI device 60:00.2 to cell "RootCell"
>>> Adding PCI device 60:01.0 to cell "RootCell"
>>> Adding PCI device 60:02.0 to cell "RootCell"
>>> Adding PCI device 60:03.0 to cell "RootCell"
>>> Adding PCI device 60:03.1 to cell "RootCell"
>>> Adding PCI device 60:04.0 to cell "RootCell"
>>> Adding PCI device 60:07.0 to cell "RootCell"
>>> Adding PCI device 60:07.1 to cell "RootCell"
>>> Adding PCI device 60:08.0 to cell "RootCell"
>>> Adding PCI device 60:08.1 to cell "RootCell"
>>> Adding PCI device 61:00.0 to cell "RootCell"
>>> Adding PCI device 62:00.0 to cell "RootCell"
>>> Adding PCI device 62:00.2 to cell "RootCell"
>>> Adding PCI device 63:00.0 to cell "RootCell"
>>> Adding PCI device 63:00.1 to cell "RootCell"
>>> Adding PCI device 80:00.0 to cell "RootCell"
>>> Adding PCI device 80:00.2 to cell "RootCell"
>>> Adding PCI device 80:01.0 to cell "RootCell"
>>> Adding PCI device 80:02.0 to cell "RootCell"
>>> Adding PCI device 80:03.0 to cell "RootCell"
>>> Adding PCI device 80:04.0 to cell "RootCell"
>>> Adding PCI device 80:07.0 to cell "RootCell"
>>> Adding PCI device 80:07.1 to cell "RootCell"
>>> Adding PCI device 80:08.0 to cell "RootCell"
>>> Adding PCI device 80:08.1 to cell "RootCell"
>>> Adding PCI device 81:00.0 to cell "RootCell"
>>> Adding PCI device 81:00.2 to cell "RootCell"
>>> Adding PCI device 82:00.0 to cell "RootCell"
>>> Adding PCI device 82:00.1 to cell "RootCell"
>>> Adding PCI device a0:00.0 to cell "RootCell"
>>> Adding PCI device a0:00.2 to cell "RootCell"
>>> Adding PCI device a0:01.0 to cell "RootCell"
>>> Adding PCI device a0:02.0 to cell "RootCell"
>>> Adding PCI device a0:03.0 to cell "RootCell"
>>> Adding PCI device a0:04.0 to cell "RootCell"
>>> Adding PCI device a0:07.0 to cell "RootCell"
>>> Adding PCI device a0:07.1 to cell "RootCell"
>>> Adding PCI device a0:08.0 to cell "RootCell"
>>> Adding PCI device a0:08.1 to cell "RootCell"
>>> Adding PCI device a1:00.0 to cell "RootCell"
>>> Adding PCI device a1:00.2 to cell "RootCell"
>>> Adding PCI device a2:00.0 to cell "RootCell"
>>> Adding PCI device a2:00.1 to cell "RootCell"
>>> Adding PCI device c0:00.0 to cell "RootCell"
>>> Adding PCI device c0:00.2 to cell "RootCell"
>>> Adding PCI device c0:01.0 to cell "RootCell"
>>> Adding PCI device c0:02.0 to cell "RootCell"
>>> Adding PCI device c0:03.0 to cell "RootCell"
>>> Adding PCI device c0:03.1 to cell "RootCell"
>>> Adding PCI device c0:03.2 to cell "RootCell"
>>> Adding PCI device c0:03.3 to cell "RootCell"
>>> Adding PCI device c0:03.4 to cell "RootCell"
>>> Adding PCI device c0:04.0 to cell "RootCell"
>>> Adding PCI device c0:07.0 to cell "RootCell"
>>> Adding PCI device c0:07.1 to cell "RootCell"
>>> Adding PCI device c0:08.0 to cell "RootCell"
>>> Adding PCI device c0:08.1 to cell "RootCell"
>>> Adding PCI device c1:00.0 to cell "RootCell"
>>> Adding PCI device c2:00.0 to cell "RootCell"
>>> Adding PCI device c3:00.0 to cell "RootCell"
>>> Adding PCI device c4:00.0 to cell "RootCell"
>>> Adding PCI device c5:00.0 to cell "RootCell"
>>> Adding PCI device c5:00.2 to cell "RootCell"
>>> Adding PCI device c6:00.0 to cell "RootCell"
>>> Adding PCI device c6:00.1 to cell "RootCell"
>>> Adding PCI device e0:00.0 to cell "RootCell"
>>> Adding PCI device e0:00.2 to cell "RootCell"
>>> Adding PCI device e0:01.0 to cell "RootCell"
>>> Adding PCI device e0:02.0 to cell "RootCell"
>>> Adding PCI device e0:03.0 to cell "RootCell"
>>> Adding PCI device e0:04.0 to cell "RootCell"
>>> Adding PCI device e0:07.0 to cell "RootCell"
>>> Adding PCI device e0:07.1 to cell "RootCell"
>>> Adding PCI device e0:08.0 to cell "RootCell"
>>> Adding PCI device e0:08.1 to cell "RootCell"
>>> Adding PCI device e1:00.0 to cell "RootCell"
>>> Adding PCI device e1:00.2 to cell "RootCell"
>>> Adding PCI device e2:00.0 to cell "RootCell"
>>> Adding PCI device e2:00.1 to cell "RootCell"
>>> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
>>> FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4
>>> RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6
>>> RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000000000030
>>> RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffffff003
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 76 (Cell: "RootCell")
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> Ignoring NMI IPI to CPU 76
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> Ignoring NMI IPI to CPU 76
>>> Ignoring NMI IPI to CPU 1
>>> Ignoring NMI IPI to CPU 2
>>> Ignoring NMI IPI to CPU 3
>>> Ignoring NMI IPI to CPU 4
>>> Ignoring NMI IPI to CPU 5
>>> FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
>>> RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46
>>> RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000000b4
>>> RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa9401790
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 24 (Cell: "RootCell")
>>> Ignoring NMI IPI to CPU 6
>>> Ignoring NMI IPI to CPU 7
>>> FATAL: Unhandled MSR read: c0002001
>>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246
>>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c0002001
>>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c0002001
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 68 (Cell: "RootCell")
>>> FATAL: Unhandled MSR read: c0002001
>>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246
>>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c0002001
>>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c0002001
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003506e0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 44 (Cell: "RootCell")
>>>
>>> -----------------------------------------------------------------------=
-
>>> *From:* Henning Schild <henning.schild@siemens.com>
>>> *Sent:* 14 November 2022 09:22
>>> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
>>> *Cc:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>;
>>> jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
>>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>>> *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM
>>> This email was sent to you by someone outside the University.
>>> You should only click on links or attachments if you are certain that
>>> the email is genuine and the content is safe.
>>>
>>> Am Sun, 13 Nov 2022 22:24:45 +0000
>>> schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:
>>>
>>>> Hi Ralf,
>>>>
>>>> Thanks for the reply!
>>>>
>>>> >Did you use jailhouse-config-create?
>>>>
>>>> I am using `jailhouse config create` to generate the sysconfig.c file.
>>>>
>>>> >You can use the --mem-hv option to
>>>> increate the memory. Try, for example, 32MiB and see if it works.
>>>>
>>>> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
>>>> The driver prints "The Jailhouse is opening" on dmesg. However, right
>>>> after that the CPUs get stuck, and I get rcu_sched detected stalls.
>>>> The system is completely irresponsive.
>>>>
>>>> I attached a text file containing the full output from dmesg. Here is
>>>> the initial part:
>>>
>>> I guess the output of the hypervisor might also be valuable here.
>>> According to its spec that machine should have a serial port, and with
>>> that default config from the generate script you should see logs coming
>>> out of there. With the usual 115200 8n1
>>>
>>> Henning
>>>
>>>> [=C2=A0 434.792008] The Jailhouse is opening.
>>>> [=C2=A0 455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks=
:
>>>> [=C2=A0 455.793303] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 1-...0: (839 GPs behi=
nd)
>>>> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [=C2=A0 4=
55.802292]
>>>> rcu:=C2=A0=C2=A0=C2=A0=C2=A0 2-...0: (144 GPs behind) idle=3D812/1/0x4=
000000000000000
>>>> softirq=3D905/905 fqs=3D1827 [=C2=A0 455.811276] rcu:=C2=A0=C2=A0=C2=
=A0=C2=A0 3-...0: (144 GPs
>>>> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
>>>> 455.820266] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 4-...0: (1 GPs behind)
>>>> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
>>>> 455.829252] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 5-...0: (144 GPs behind)
>>>> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [=C2=A0 4=
55.838238]
>>>> rcu:=C2=A0=C2=A0=C2=A0=C2=A0 6-...0: (144 GPs behind) idle=3D912/1/0x4=
000000000000000
>>>> softirq=3D777/777 fqs=3D1827 [=C2=A0 455.847218] rcu:=C2=A0=C2=A0=C2=
=A0=C2=A0 7-...0: (144 GPs
>>>> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827=
 [
>>>> 455.856404]=C2=A0 (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D36=
4) [
>>>> 455.862170] Sending NMI from CPU 87 to CPUs 1: [=C2=A0 465.776884] Sen=
ding
>>>> NMI from CPU 87 to CPUs 2: [=C2=A0 467.182686] watchdog: BUG: soft loc=
kup
>>>> - CPU#0 stuck for 23s! [kworker/0:1:7] [=C2=A0 467.189857] Modules lin=
ked
>>>> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
>>>> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
>>>> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
>>>> 467.189928]=C2=A0 binfmt_misc configfs efivarfs ip_tables x_tables aut=
ofs4
>>>> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
>>>> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
>>>> raid6_pq ] [=C2=A0 467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted=
: G
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5.10.0 #3 [=C2=A0 467.328767] Hardware name: Dell Inc.
>>>> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [=C2=A0 467.337154]
>>>> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
>>>> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
>>>> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
>>>> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
>>>> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
>>>> [=C2=A0 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
>>>> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
>>>> 0000000000000001 [=C2=A0 467.385123] RDX: ffff964f1fa31280 RSI:
>>>> 0000000000000000 RDI: 0000000000000001 [=C2=A0 467.393024] RBP:
>>>> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
>>>> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
>>>> 0000000000000000 [=C2=A0 467.408836] R13: 000000000000007f R14:
>>>> ffff962f1f42c9c0 R15: 0000000000000080 [=C2=A0 467.416737] FS:
>>>> 0000000000000000(0000) GS:ffff962f1f400000(0000)
>>>> knlGS:0000000000000000 [=C2=A0 467.425604] CS:=C2=A0 0010 DS: 0000 ES:=
 0000
>>>> CR0: 0000000080050033 [=C2=A0 467.432127] CR2: 0000000000000000 CR3:
>>>> 00000010987ea000 CR4: 00000000003506f0 [=C2=A0 467.440045] Call Trace:=
 [
>>>> 467.443289]=C2=A0 ? tlbflush_read_file+0x70/0x70 [=C2=A0 467.448266]=
=C2=A0 ?
>>>> tlbflush_read_file+0x70/0x70 [=C2=A0 467.453242]=C2=A0 on_each_cpu+0x2=
b/0x60 [
>>>> 467.457437]=C2=A0 __purge_vmap_area_lazy+0x5d/0x680 [=C2=A0 467.462679=
]=C2=A0 ?
>>>> _cond_resched+0x16/0x40 [=C2=A0 467.467224]=C2=A0 ?
>>>> unmap_kernel_range_noflush+0x2fa/0x380 [=C2=A0 467.473072]
>>>> free_vmap_area_noflush+0xe7/0x100 [=C2=A0 467.478315]
>>>> remove_vm_area+0x96/0xa0 [=C2=A0 467.482770]=C2=A0 __vunmap+0x8d/0x290=
 [
>>>> 467.486792]=C2=A0 drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [=C2=A0 467.492=
299]
>>>> drm_client_buffer_vunmap+0x16/0x20 [drm] [=C2=A0 467.498144]
>>>> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [=C2=A0 467.5051=
18]
>>>> process_one_work+0x1b6/0x350 [=C2=A0 467.509912]=C2=A0 worker_thread+0=
x53/0x3e0
>>>> [=C2=A0 467.514361]=C2=A0 ? process_one_work+0x350/0x350 [=C2=A0 467.5=
19338]
>>>> kthread+0x11b/0x140 [=C2=A0 467.523342]=C2=A0 ? __kthread_bind_mask+0x=
60/0x60 [
>>>>=C2=A0 467.528389]=C2=A0 ret_from_fork+0x22/0x30
>>>>
>>>> Cheers
>>>> Karim
>>>> ________________________________
>>>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> Sent: 12 November 2022 17:47
>>>> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
>>>> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
>>>> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
>>>> enter_hypervisor returns -ENOMEM
>>>>
>>>> This email was sent to you by someone outside the University.
>>>> You should only click on links or attachments if you are certain that
>>>> the email is genuine and the content is safe.
>>>>
>>>> On 12/11/2022 18:15, Karim Manaouil wrote:
>>>> > Hi Jan,
>>>> >
>>>> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
>>>> > nodes), running Linux kernel v5.10 (same version used by jailhouse
>>>> > CI with same patches applied).
>>>> >
>>>> > `jailhouse hardware check` return that everything is ok and that
>>>> > "Check passed!".
>>>> >
>>>> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>>>> >
>>>> > However, enter_hypervisor() [1] fails when entry() is called on
>>>> > every cpu and return -ENOMEM as error_code.
>>>>
>>>> Try to reserve more memory. Maybe the default size of 6MiB for HV
>>>> memory is insufficient for 128 CPUs.
>>>>
>>>> Did you use jailhouse-config-create? You can use the --mem-hv option
>>>> to increate the memory. Try, for example, 32MiB and see if it works.
>>>>
>>>>=C2=A0=C2=A0=C2=A0 Ralf
>>>>
>>>> >
>>>> > Do you possibly know where could the issue come from?
>>>> >
>>>> > Best
>>>> > Karim
>>>> >
>>>> > [1]
>>>> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9b=
ef6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blo=
b/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251> <https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>> <https://github.com/siemens/j=
ailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 <=
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b=
6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>>
>>>> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9=
bef6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/bl=
ob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 <https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>>>
>>>> >
>>>> > The University of Edinburgh is a charitable body, registered in
>>>> > Scotland, with registration number SC005336. Is e buidheann
>>>> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=
=C3=A0raichte an Alba,
>>>> > =C3=A0ireamh cl=C3=A0raidh SC005336.
>>>> >
>>>> > --
>>>> > You received this message because you are subscribed to the Google
>>>> > Groups "Jailhouse" group.
>>>> > To unsubscribe from this group and stop receiving emails from it,
>>>> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
>>>> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>>>>.
>>>> > To view this discussion on the web visit
>>>> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663AB=
E61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://group=
s.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%4=
0AM0PR05MB6018.eurprd05.prod.outlook.com> <https://groups.google.com/d/msgi=
d/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurp=
rd05.prod.outlook.com <https://groups.google.com/d/msgid/jailhouse-dev/AM0P=
R05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.co=
m>> <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups.=
google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40A=
M0PR05MB6018.eurprd05.prod.outlook.com <https://groups.google.com/d/msgid/j=
ailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd0=
5.prod.outlook.com>>>
>>>> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663A=
BE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3D=
email&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/=
AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outloo=
k.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/m=
sgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.e=
urprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter <https://gr=
oups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A903=
9%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=
=3Dfooter>>>>.
>>>> >
>>>>
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/22e926f8-c036-0e15-81a8-154eb74bb6f9%40oth-regensburg.de.
