Return-Path: <jailhouse-dev+bncBAABBAEL4HUQKGQEKNOFZMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FA72E14
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 13:48:17 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id e14sf9842317ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 04:48:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563968897; cv=pass;
        d=google.com; s=arc-20160816;
        b=vB6rBuVdl0kX84FDEB0/9WlfrED7/Q933uSPEzB5KevjA/XKeLfkXq1Tx4PKKLPJ7z
         m/yd7lnnl5u3y3Y6PHvjb2EPzd32ONkWVi/bP4LoxvxBIPe1adZxg/P6ZNfAQ1u6kGgL
         xGE/3zRWMCCyrK6DBTbvaZhSOiDBLDor4oZL3315sOJOkktKjNll9bELr41742/ggZj1
         9QWaPkZLJPQpiBzWKYlQgRuf9sbjepkYOYQ/Z+sAGCWEbM8qLiq5ULW8wo2iMeAgQ9jb
         WDSisna57SAoR1o2+ZtbKgW7FE7lkZzschyidjncGYYiEku4SzmhDkfJXhWyZ5ZmLz3c
         bKbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from:sender
         :dkim-signature;
        bh=siBeDEmrHx7VstHyyEhL8rKK1JRgtl/v6wf5GCVMtek=;
        b=Bsn7zTB9kwSJQ8EuXtzaV+37R5V5pZcQvHC8BR9mDwiGck7Y4SMGpKJuNeVzSIKkkq
         L3FkbtLZWCDyeew0CFDN5bGB9OzhOm+eeKgbuyOaADZkdPCdWjEPDKN+Uu4FNc2Zy7HB
         nHdfXbZB26QCSZVE9iuishGhGJXiPig0c14dCK7p2ng/pGJfCTvkfMlg1XJblh7SNgpz
         umxi5HwKN//6IDLXPA1QMyxV48Oiu9OSAnQMehlGQ+Xg61FzpJaNFAYODSBunojFBOTy
         7OJC5y1mSe3fyKQOOg/oLKi9kJCk+TeBzqbCg6ko6LMJLUul8QAh+8VyxB+AIcOuc57a
         uS5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=siBeDEmrHx7VstHyyEhL8rKK1JRgtl/v6wf5GCVMtek=;
        b=KE94B8LHCr6GiXxBYmuvMpvCvNWfj23M9uKtBsR4h8ZxujcwUd7nb0j+VM4vqPR1rN
         W5Gc2bRxnWq6NavZcEHQ2eYBAn4yfXANl76uFTMj5qT/pUr854aHQQsfkJ4IocUDVNz3
         bq3h/NmVeo9crmZwrRnu1/jI/NcrZamKW5L27DZFkBF4yflCWI2w9S9MjECH6tSaWXkr
         maUOjc6a185zujjSYU9COcJNxxEibzrG9/4hgTlYgUPyEyz7K6ImSGqBV7yoUrPvjUQl
         WYItsst9ImtnTBiXfAHIZlb+4IEGUl6D4zv+I3H4U2cMUEkNLDgOx98KQKagO+OKQxSJ
         DMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=siBeDEmrHx7VstHyyEhL8rKK1JRgtl/v6wf5GCVMtek=;
        b=lFt+fLb6+3wGOXZ6xbDQV2Wn8a+9/cTlarWnvAHN8pbvDbxdVIy6QA78lVQf/rFYLv
         ilgnV3YI7yQt/sGcjOTGAa8YH2rVf7NNl30Bsbu5y+JsEhiX0McmbNbQAqhqMmwaoAhF
         ggxWw5yysWR2OZS4qO+miUof9lGivVYOjhfVqSmQGDzyLGh443JACf/l0CLxDVjnXiUe
         jqdjkCtm26nnI/DEQcs8HZV3EkpZJUmfUTA0EbI6yvO9KRN1khBxVyjHiOT3ARZkTPnN
         7bLAU6uUxNOZfuu2E5+T+uGvCK6txaqaKr3TiGKvJtUcM4GrB7ZwQ2CZyWpJ9+7FiLo9
         Jdqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXa1rMr1nP4tIcO70kFJeqPILNvVna1qw4pAcv4/bWFKlrDyDWQ
	3HKS85/cmbT4mA8YJn4dbgo=
X-Google-Smtp-Source: APXvYqxnRHinyBUvRbnryVGvkd+5hhu/IjCzsPV6gMTTciGpaZkwTrEOqrTHV5AS4bXW+LQ4d2Tkwg==
X-Received: by 2002:a2e:980a:: with SMTP id a10mr43160780ljj.40.1563968896906;
        Wed, 24 Jul 2019 04:48:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls5252943lji.14.gmail; Wed, 24
 Jul 2019 04:48:15 -0700 (PDT)
X-Received: by 2002:a2e:7604:: with SMTP id r4mr20322201ljc.225.1563968895793;
        Wed, 24 Jul 2019 04:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563968895; cv=none;
        d=google.com; s=arc-20160816;
        b=C5r1Zp/VEuV6/n4g53EsIxKfsfmNAu1lnK3IGupSoX++3FvdzzRUhOfU5M25QSB/Ql
         wUqsxFfg50PoE4cb/Ns/Nx3xtDnUGuPJJ3PaR00p+mmbhCjB7rZEpcNaqoypY+Xt6dYt
         wXjb5m4HfX54I0S/q96+KdczXooy+9e2W+bIoLUJDfsQMGJFBdyOfg1OAfDsAbmOLenF
         58Jiti9IZoWYVY/b9CurAslp+ZtjkhUKZDgz4eRLfunoE33RJTawYzYkVr4mOB9dkyT/
         45DdUMKdnBCDNfrMbTfXeZzfKaKlsoklMb0GVUu35QtNS1Jf4U/iAtTIkGaj7614l4NE
         fa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:acceptlanguage:content-language:accept-language
         :in-reply-to:references:message-id:thread-index:thread-topic:subject
         :date:cc:to:from;
        bh=UNl0YI+qX+9wa7mnHFs7Z762FTidYBlCA4TcS+kfFAY=;
        b=FAAqvtQb6QHedoeg1VpP+XuPyEEjeYXZsz4inRksjSzjCYc6K+UaZKssh9N67HsK8j
         je7h0fPSWG4D6LXzYqLMowFIFcbKB7FFKSmv5y6ljlIlYw2j9is9a5W2KINpopOwAASd
         iZ9OZJ872tZZJ6YTmmi9forHiuQSg0u0SnGFE8Wi4CvI6m+sbM9hXSzPwMRVINCO3G4s
         sNXI807+LvxNNujceMJH0yfhPb27E66mOPkEwuhOpZkzg4zTLAaRrBVv+eqy4BpP0kG0
         eumi82WxNeKfzN8x28gEa0nvzdautFmjgKIynqYPQ7mtGHDmEmtVJeOrhQqJ7qjz+B87
         lN0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
Received: from mail3.emtrion.de (mail3.emtrion.de. [80.150.99.69])
        by gmr-mx.google.com with ESMTPS id q25si2190692lfp.0.2019.07.24.04.48.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 24 Jul 2019 04:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) client-ip=80.150.99.69;
Received: from BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0]) by
 BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0%10]) with mapi; Wed, 24
 Jul 2019 13:48:03 +0200
Content-Type: multipart/mixed;
	boundary="_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3E80BMK019S01emtr_"
From: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
Date: Wed, 24 Jul 2019 13:47:58 +0200
Subject: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Topic: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Index: AdVBQD4R1sVykNk/RpKcGrhqiiHCFgA1TJjw
Message-ID: <95F51F4B902CAC40AF459205F6322F01C4EE0E3E80@BMK019S01.emtrion.local>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
 <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
 <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
In-Reply-To: <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
Accept-Language: de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <95F51F4B902CAC40AF459205F6322F01C4EE0E3E80@BMK019S01.emtrion.local>
acceptlanguage: de-DE
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-24792.000
x-tm-as-result: No--6.920700-8.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-703655-705161-701593-704053-7
	00759-701124-702156-186035-701589-703286-703028-704625-702754-188199-188019
	-702617-700698-703093-853813-853550-853702-702887-850298-705249-139010-7051
	53-701058-704074-704498-700278-704328-705155-702975-702852-701432-701443-70
	5220-703949-705022-702600-780022-704718-702147-702500-704714-702146-704599-
	105700-701667-702877-105250-701803-701075-700786-703300-702301-700492-70240
	9-702798-701901-701111-704673-700762-701576-148004-148133-20043-29997-42000
	-42003-63
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Original-Sender: jan.vonwiarda@emtrion.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as
 permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
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

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3E80BMK019S01emtr_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently I have a problem when enabling the root cell in QEMU, which I cou=
ldn't investigate further yet. Hardware Debugger should be available soon, =
though.

root@imx8mm:~# jailhouse enable /opt/jailhouse/configs/imx8mm.cell
[   77.686189] Synchronous External Abort: synchronous external abort (0x96=
000050) at 0xffff00000f800000
[   77.688767] Internal error: : 96000050 [#1] PREEMPT SMP
[   77.690225] Modules linked in: jailhouse(O) crc32_ce crct10dif_ce ip_tab=
les x_tables
[   77.694196] CPU: 2 PID: 3069 Comm: jailhouse Tainted: G           O    4=
.14.78-05595-g94da7bdc489b #4
[   77.697023] Hardware name: linux,dummy-virt (DT)
[   77.698221] task: ffff800020543600 task.stack: ffff00000f410000
[   77.701799] PC is at __memcpy+0x110/0x180
[   77.703481] LR is at jailhouse_cmd_enable+0x2e0/0x6c8 [jailhouse]
[   77.705048] pc : [<ffff000008f34890>] lr : [<ffff000000fbd898>] pstate: =
20000145
[   77.706912] sp : ffff00000f413b50
[   77.707701] x29: ffff00000f413b50 x28: ffff800020543600=20
[   77.709647] x27: 00000000000003be x26: ffff00000f535000=20
[   77.710734] x25: ffff0000097e1188 x24: ffff000000fc2880=20
[   77.712065] x23: ffff000000fc2c10 x22: ffff000000fc2070=20
[   77.713320] x21: 00000000ffffffea x20: 0000000033b51010=20
[   77.714700] x19: 0000000000000004 x18: 0000000000040e4e=20
[   77.715616] x17: 0000000000413048 x16: ffff000008279c00=20
[   77.717309] x15: 000000000000066f x14: 0000000000000000=20

3: 0000000000000000 x12: 0000000000000000 3 13:.7189728:31 .5].. x1

 kernel:[[   77.723158] x1  1: 0000000000015000 77.688767] Inter x10: 0000n=
a000000004000=20
l error: : 96000050 [#1] PREEMPT SMP
[   77.726580] x9 : 0000000000004000 x8 : 000000000001d000=20
[   77.731462] x7 : 53554f484c49414a x6 : ffff00000f800000=20
[   77.731987] x5 : ffff00000fc00000 x4 : 0000000000000000=20
[   77.733828] x3 : ffff00000fbfffff x2 : 0000000000015788=20
[   77.735039] x1 : ffff00000f535040 x0 : ffff00000f800000=20
[   77.736373] Process jailhouse (pid: 3069, stack limit =3D 0xffff00000f41=
0000)
[   77.737641] Call trace:
[   77.738452] Exception stack(0xffff00000f413a10 to 0xffff00000f413b50)
[   77.739382] 3a00:                                   ffff00000f800000 fff=
f00000f535040
[   77.741931] 3a20: 0000000000015788 ffff00000fbfffff 0000000000000000 fff=
f00000fc00000
[   77.743681] 3a40: ffff00000f800000 53554f484c49414a 000000000001d000 000=
0000000004000
[   77.745714] 3a60: 0000000000004000 0000000000015000 0000000000000000 000=
0000000000000
[   77.746888] 3a80: 0000000000000000 000000000000066f ffff000008279c00 000=
0000000413048
[   77.747905] 3aa0: 0000000000040e4e 0000000000000004 0000000033b51010 000=
00000ffffffea
[   77.749358] 3ac0: ffff000000fc2070 ffff000000fc2c10 ffff000000fc2880 fff=
f0000097e1188
[   77.750481] 3ae0: ffff00000f535000 00000000000003be ffff800020543600 fff=
f00000f413b50
[   77.751226] 3b00: ffff000000fbd898 ffff00000f413b50 ffff000008f34890 000=
0000020000145
[   77.752980] 3b20: ffff00000f413b50 ffff000000fbd874 0000ffffffffffff 000=
0000033b51010
[   77.754323] 3b40: ffff00000f413b50 ffff000008f34890
[   77.755333] [<ffff000008f34890>] __memcpy+0x110/0x180
[   77.756909] [<ffff000000fbdd0c>] jailhouse_ioctl+0x8c/0x118 [jailhouse]
[   77.758048] [<ffff000008291d30>] do_vfs_ioctl+0xb0/0x868
[   77.758584] [<ffff00000829257c>] SyS_ioctl+0x94/0xa8
[   77.759050] Exception stack(0xffff00000f413ec0 to 0xffff00000f414000)
[   77.760369] 3ec0: 0000000000000003 0000000040080000 0000000033b51010 000=
0000000000000
[   77.761450] 3ee0: 0000000033b51010 00000000000003d1 0000ffff8b4460d0 000=
0000033b72fff
[   77.762404] 3f00: 000000000000001d 0000ffff8b4469f0 0101010101010101 000=
0000000000018
[   77.763412] 3f20: 00000000000003f3 0000000000000000 0000000000000000 000=
000000000051b
[   77.765363] 3f40: 0000ffff8b3c3150 0000000000413108 0000000000040e4e 000=
0ffffe934fee3
[   77.766389] 3f60: 0000000033b51010 0000000000000003 0000000000000000 000=
0000000000000
[   77.767384] 3f80: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000
[   77.769682] 3fa0: 0000000000000000 0000ffffe934f420 0000000000401014 000=
0ffffe934f420
[   77.770469] 3fc0: 0000ffff8b3c315c 0000000080000000 0000000000000003 000=
000000000001d
[   77.770915] 3fe0: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000
[   77.771350] [<ffff000008083ac0>] el0_svc_naked+0x34/0x38
[   77.772570] Code: a8c12027 a8c12829 a8c1302b a8c1382d (a88120c7)=20
[   77.773509] ---[ end trace b45069ae9849cd95 ]---
Segmentation fault

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka [mailto:jan.kiszka@siemens.com]=20
Gesendet: Dienstag, 23. Juli 2019 12:20
An: von Wiarda, Jan; Antonios Motakis (Tony); Mark Rutland
Cc: JailhouseMailingListe
Betreff: Re: 64 bit Hypervisor crash at 32 bit WFI instruction

On 23.07.19 12:14, von Wiarda, Jan wrote:
> Hi!
>=20
> With
>=20
> asm volatile("nop" : : : "memory");
>=20
> instead of
>=20
> asm volatile("wfi" : : : "memory");
>=20
> it runs just fine.
>=20
>> Is the root cell cpu (CPU 0) specifically crashing with an unexpected sy=
nchronous exit to Jailhouse? What is the output?
>=20
> No, CPU 0 does not crash with any kind of console output, which makes deb=
ugging even more difficult. What I observe is, that after hitting WFI, it c=
ontinues to run for a 1-2 seconds and then it stops. Last thing I see from =
the instrumented code is a printk() from arch_skip_instruction(), which mea=
ns it was handling a SYS64 exit.

Maybe interrupts get stalled for the root cell - for whatever reason. Do yo=
u
have a hardware debugger to analyze the state of the CPUs? Or use QEMU...

Jan

>=20
>> This is a far shot, but maybe the code generated around the WFI is the c=
ulprit?
>=20
> You might be right, when I place WFI right after inmate_main(), CPU 0 doe=
s not starve. But it's completely strange and undefined behaviour, sometime=
s it crashes if I put the WFI right after a printk(), whereas right before =
the printk() it doesn't crash.
>=20
> Works:
>=20
> void inmate_main(void)
> {
> 		...
> 		asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		//asm volatile("wfi" : : : "memory");
> }
>=20
> Does not work:
>=20
> void inmate_main(void)
> {
> 		...
> 		//asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		asm volatile("wfi" : : : "memory");
> }
>=20
> I know this sounds completely strange but I reproduced this multiple time=
s, compiler is this:
>=20
> gcc version 6.3.0 20170516 (Debian 6.3.0-18)
>=20
> BR,
> Jan
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Antonios Motakis (Tony) [mailto:antonios.motakis@huawei.com]=20
> Gesendet: Dienstag, 23. Juli 2019 06:40
> An: von Wiarda, Jan; Mark Rutland
> Cc: JailhouseMailingListe; Jan Kiszka
> Betreff: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
>=20
> Hi Jan,
>=20
> On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
>> Hi Mark,
>>
>> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the=
 same for 64 bit and 32 bit inmates when the crash happens, except for HCR_=
RW_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>>
>=20
> It's quite an interesting crash that you have there; I wouldn't expect th=
is to happen.
>=20
> The idea with trapping WFI/WFE is to be able to suspend a VM that is just=
 waiting for something to happen. Since Jailhouse is a partitioning hypervi=
sor, you shouldn't need to trap it, nor should its use normally influence t=
he other cores. Yet something is amiss here.
>=20
> Is the root cell cpu (CPU 0) specifically crashing with an unexpected syn=
chronous exit to Jailhouse? What is the output?
>=20
> I don't remember what event 0x28001B maps to, I would check the ARM ARM f=
irst to figure out what the unexpected event in CPU 0 was, for a clue to mo=
tivate further investigation.
>=20
> Additionally, this WFI code instructs the compiler that memory contents m=
ay change, so ordering of generated instructions, inserted barriers etc, ar=
e influenced. This is a far shot, but maybe the code generated around the W=
FI is the culprit? Maybe not, but I would try to rule it out:
> (a) First I'd try replacing the WFI with a nop, to observe the behavior w=
ithout the WFI but without changing compiler behavior and maintaining any c=
ompiler barriers.
> (b) I would also try replacing it with an infinite loop ("b .") to get th=
e inmate to wait forever at this position, and see what happens.
>=20
> Happy debugging :)
>=20
> Best regards,
> Tony
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95F51F4B902CAC40AF459205F6322F01C4EE0E3E80%40BMK019S01.emtrio=
n.local.

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3E80BMK019S01emtr_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
7fMhaRQwmmFmrYAsk38wu4IQGSFnToMvD/fRZIKg/46SMoKEYltBAKKMBAD1owX/5WaEg940hiNO
UeQxkpA8If+r4q2iCsGhMIyxM0B/caFo3wDphFEA4YPwNFJiWbDvEHPn0YHwdGP2EJhyK6dk/1eQ
nv+gD6Efoi+jOfkxkqL/ffFQRDu2X0AysIbTf/H+wdOAIWZoKGGNEEY9YwlQf1V041GmwSQjUrUz
ZH3hcP+EYUpRg9UwYq0VlbFoYT5S/1KmUGJb1knDGUPlZltHiGL/qIL14H8wkJN+8V4oTVVD2Pwo
Yo0QO7aT8EpBWDyP0u8zdSuhX+EYYWyU4CmAanD/0BFwwDWSk5KK9KgyNZLZsu+HMpYTPrMUkXDw
8CajTgH/rEGKYjnjEQVD3wKREREysP2BaDrqP/1ScrH9oENw+KD/hFAd2PHBbQ7s5e+AtVYlEPM5
YY+hQUeo4YJgaNBR0ltPEDIgaFoAZWBnRbFDUlT5gERBMCBPdABT4EVTLURF7OVymHKQt+Hgq1El
MkOLoodgRTmRL0UQNGH70IaAeOzlfX0D7TB4wAAfAEIAAQAAACAAAAB2AG8AbgAgAFcAaQBhAHIA
ZABhACwAIABKAGEAbgAAAB8AZQABAAAAMgAAAEoAYQBuAC4AdgBvAG4AVwBpAGEAcgBkAGEAQABl
AG0AdAByAGkAbwBuAC4AZABlAAAAAAAfAGQAAQAAAAoAAABTAE0AVABQAAAAAAACAUEAAQAAAHQA
AAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIB2AG8AbgAgAFcAaQBhAHIAZABhACwAIABKAGEAbgAA
AFMATQBUAFAAAABKAGEAbgAuAHYAbwBuAFcAaQBhAHIAZABhAEAAZQBtAHQAcgBpAG8AbgAuAGQA
ZQAAAB8AGgwBAAAAIAAAAHYAbwBuACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAHwAfDAEAAAAy
AAAASgBhAG4ALgB2AG8AbgBXAGkAYQByAGQAYQBAAGUAbQB0AHIAaQBvAG4ALgBkAGUAAAAAAB8A
HgwBAAAACgAAAFMATQBUAFAAAAAAAAIBGQwBAAAAdAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAA
gHYAbwBuACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAUwBNAFQAUAAAAEoAYQBuAC4AdgBvAG4A
VwBpAGEAcgBkAGEAQABlAG0AdAByAGkAbwBuAC4AZABlAAAAHwAxQAEAAAACAAAAAAAAAAsAQDoB
AAAAHwAwQAEAAAACAAAAAAAAAB8AGgABAAAAEgAAAEkAUABNAC4ATgBvAHQAZQAAAAAAAwDxPwcE
AAALAEA6AQAAAAMA/T/kBAAAAgELMAEAAAAQAAAAII0fRfgJJUuSPOR6MVDD7wMAFwABAAAAQAA5
AACrX6MVQtUBQAAIMJ2hZKYVQtUBCwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAALACsA
AAAAAAMALgAAAAAAAwA2AAAAAAAfAHAAAQAAAGQAAAA2ADQAIABiAGkAdAAgAEgAeQBwAGUAcgB2
AGkAcwBvAHIAIABjAHIAYQBzAGgAIABhAHQAIAAzADIAIABiAGkAdAAgAFcARgBJACAAaQBuAHMA
dAByAHUAYwB0AGkAbwBuAAAAAgFxAAEAAAAbAAAAAdVBQD4R1sVykNk/RpKcGrhqiiHCFgA1TJjw
AB8ANRABAAAAigAAADwAOQA1AEYANQAxAEYANABCADkAMAAyAEMAQQBDADQAMABBAEYANAA1ADkA
MgAwADUARgA2ADMAMgAyAEYAMAAxAEMANABFAEUAMABFADMARQA4ADAAQABCAE0ASwAwADEAOQBT
ADAAMQAuAGUAbQB0AHIAaQBvAG4ALgBsAG8AYwBhAGwAPgAAAAAAHwA5EAEAAADOAgAAPAA5ADUA
RgA1ADEARgA0AEIAOQAwADIAQwBBAEMANAAwAEEARgA0ADUAOQAyADAANQBGADYAMwAyADIARgAw
ADEAQwA0AEUARQAwAEUAMwBDAEIANABAAEIATQBLADAAMQA5AFMAMAAxAC4AZQBtAHQAcgBpAG8A
bgAuAGwAbwBjAGEAbAA+ACAAPAAyADAAMQA5ADAANwAyADIAMAA5ADQANwA1ADIALgBHAEIAMgA4
ADQAMAAwAEAAbABhAGsAcgBpAGQAcwAuAGMAYQBtAGIAcgBpAGQAZwBlAC4AYQByAG0ALgBjAG8A
bQA+ACAAPAA5ADUARgA1ADEARgA0AEIAOQAwADIAQwBBAEMANAAwAEEARgA0ADUAOQAyADAANQBG
ADYAMwAyADIARgAwADEAQwA0AEUARQAwAEUAMwBEADEANABAAEIATQBLADAAMQA5AFMAMAAxAC4A
ZQBtAHQAcgBpAG8AbgAuAGwAbwBjAGEAbAA+ACAAPAA1ADUAMQA4AGEAYgA4ADkALQAxADUAYwA3
AC0AYwAxAGMAMgAtAGMANQA2AGUALQBmADgANAAwAGMAYwAyADkANgBjAGUAYwBAAGgAdQBhAHcA
ZQBpAC4AYwBvAG0APgAgADwAOQA1AEYANQAxAEYANABCADkAMAAyAEMAQQBDADQAMABBAEYANAA1
ADkAMgAwADUARgA2ADMAMgAyAEYAMAAxAEMANABFAEUAMABFADMARABCAEQAQABCAE0ASwAwADEA
OQBTADAAMQAuAGUAbQB0AHIAaQBvAG4ALgBsAG8AYwBhAGwAPgAgADwANgA3ADQAYwA2AGMAYgAy
AC0ANgAyAGEAYwAtADQANQA2AGMALQAyAGEANQBlAC0AYQBjADAAOABlADkANABlADAAMgA2ADIA
QABzAGkAZQBtAGUAbgBzAC4AYwBvAG0APgAAAAAAHwBCEAEAAABmAAAAPAA2ADcANABjADYAYwBi
ADIALQA2ADIAYQBjAC0ANAA1ADYAYwAtADIAYQA1AGUALQBhAGMAMAA4AGUAOQA0AGUAMAAyADYA
MgBAAHMAaQBlAG0AZQBuAHMALgBjAG8AbQA+AAAAAAADAIAQ/////x8A8xABAAAAeAAAAEEAVwAl
ADMAQQAgADYANAAgAGIAaQB0ACAASAB5AHAAZQByAHYAaQBzAG8AcgAgAGMAcgBhAHMAaAAgAGEA
dAAgADMAMgAgAGIAaQB0ACAAVwBGAEkAIABpAG4AcwB0AHIAdQBjAHQAaQBvAG4ALgBFAE0ATAAA
AAsA9BAAAAAACwD1EAAAAAALAPYQAAAAAEAABzB/21+mFULVAQIBEDABAAAARgAAAAAAAACrz3ah
ydfzQrBY9HUopEQsBwCV9R9LkCysQK9FkgX2Mi8BALSd1wkBAABGsFVF9zmqTbt7/FmeXR1MALfa
anvCAAAAAAMA3j/p/QAAHwD4PwEAAAAgAAAAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBhAG4A
AAACAfk/AQAAAIQAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089RklSU1QgT1JHQU5J
WkFUSU9OL09VPUVYQ0hBTkdFIEFETUlOSVNUUkFUSVZFIEdST1VQIChGWURJQk9IRjIzU1BETFQp
L0NOPVJFQ0lQSUVOVFMvQ049SkFOLlZPTldJQVJEQQAfAPo/AQAAACAAAAB2AG8AbgAgAFcAaQBh
AHIAZABhACwAIABKAGEAbgAAAAIB+z8BAAAAhAAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAA
AAAvTz1GSVJTVCBPUkdBTklaQVRJT04vT1U9RVhDSEFOR0UgQURNSU5JU1RSQVRJVkUgR1JPVVAg
KEZZRElCT0hGMjNTUERMVCkvQ049UkVDSVBJRU5UUy9DTj1KQU4uVk9OV0lBUkRBAAMAGUAAAAAA
AwAaQAAAAAADAAlZAQAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAAAAAACwAAgAggBgAA
AAAAwAAAAAAAAEYAAAAAA4UAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAABgQAAAAAAAAUA
AIADIAYAAAAAAMAAAAAAAABGAAAAAAKBAAAAAAAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAA
ABOBAAABAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAHIEAAAAAAAALAACAAyAGAAAAAADAAAAA
AAAARgAAAAAmgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAABCBAAAAAAAAAwAAgAMgBgAA
AAAAwAAAAAAAAEYAAAAAEYEAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAAqgQAAAAAAAAMA
AIADIAYAAAAAAMAAAAAAAABGAAAAACmBAAAAAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAJIEA
AAAAAAALAACAAyAGAAAAAADAAAAAAAAARgAAAAAsgQAAAAAAAB8AAIADIAYAAAAAAMAAAAAAAABG
AAAAACeBAAABAAAAAgAAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAASgQAAAQAAAB8AAIAD
IAYAAAAAAMAAAAAAAABGAAAAACGBAAABAAAAAgAAAAAAAAALAACAAyAGAAAAAADAAAAAAAAARgAA
AAADgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAACOBAAD///9/CwAAgAggBgAAAAAAwAAA
AAAAAEYAAAAADoUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAAMAAIAIIAYA
AAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAAL
AACACCAGAAAAAADAAAAAAAAARgAAAACChQAAAAAAAAMADTT5PwAAAgEUNAEAAAAQAAAAVJShwCl/
EBulhwgAKyolFx8APQABAAAACgAAAEEAVwA6ACAAAAAAAB8ANwABAAAAbAAAAEEAVwA6ACAANgA0
ACAAYgBpAHQAIABIAHkAcABlAHIAdgBpAHMAbwByACAAYwByAGEAcwBoACAAYQB0ACAAMwAyACAA
YgBpAHQAIABXAEYASQAgAGkAbgBzAHQAcgB1AGMAdABpAG8AbgAAAB8AAICGAwIAAAAAAMAAAAAA
AABGAQAAAB4AAABhAGMAYwBlAHAAdABsAGEAbgBnAHUAYQBnAGUAAAAAAAEAAAAMAAAAZABlAC0A
RABFAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAIAAAAHgALQBtAHMALQBoAGEAcwAtAGEAdAB0
AGEAYwBoAAAAAQAAAAIAAAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAKAAAAHgALQB0AG0A
LQBhAHMALQBwAHIAbwBkAHUAYwB0AC0AdgBlAHIAAAABAAAATAAAAFMATQBFAFgALQAxADEALgAw
AC4AMAAuADQAMgA4ADMALQA4AC4AMQAwADAALgAxADAANgAyAC0AMgA0ADcAOQAyAC4AMAAwADAA
AAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAeAAAAeAAtAHQAbQAtAGEAcwAtAHIAZQBzAHUAbAB0
AAAAAAABAAAAMgAAAE4AbwAtAC0ANgAuADkAMgAwADcAMAAwAC0AOAAuADAAMAAwADAAMAAwAC0A
MwAxAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAkAAAAeAAtAHQAbQAtAGEAcwAtAG0AYQB0
AGMAaABlAGQAaQBkAAAAAQAAABgEAAA3ADAAMAAyADIANQAtADcAMAAzADEANAAwAC0ANwAwADEA
MAA5ADAALQA3ADAAMwA1ADAAMwAtADcAMAAzADYANQA1AC0ANwAwADUAMQA2ADEALQA3ADAAMQA1
ADkAMwAtADcAMAA0ADAANQAzAC0ANwAJADAAMAA3ADUAOQAtADcAMAAxADEAMgA0AC0ANwAwADIA
MQA1ADYALQAxADgANgAwADMANQAtADcAMAAxADUAOAA5AC0ANwAwADMAMgA4ADYALQA3ADAAMwAw
ADIAOAAtADcAMAA0ADYAMgA1AC0ANwAwADIANwA1ADQALQAxADgAOAAxADkAOQAtADEAOAA4ADAA
MQA5AAkALQA3ADAAMgA2ADEANwAtADcAMAAwADYAOQA4AC0ANwAwADMAMAA5ADMALQA4ADUAMwA4
ADEAMwAtADgANQAzADUANQAwAC0AOAA1ADMANwAwADIALQA3ADAAMgA4ADgANwAtADgANQAwADIA
OQA4AC0ANwAwADUAMgA0ADkALQAxADMAOQAwADEAMAAtADcAMAA1ADEACQA1ADMALQA3ADAAMQAw
ADUAOAAtADcAMAA0ADAANwA0AC0ANwAwADQANAA5ADgALQA3ADAAMAAyADcAOAAtADcAMAA0ADMA
MgA4AC0ANwAwADUAMQA1ADUALQA3ADAAMgA5ADcANQAtADcAMAAyADgANQAyAC0ANwAwADEANAAz
ADIALQA3ADAAMQA0ADQAMwAtADcAMAAJADUAMgAyADAALQA3ADAAMwA5ADQAOQAtADcAMAA1ADAA
MgAyAC0ANwAwADIANgAwADAALQA3ADgAMAAwADIAMgAtADcAMAA0ADcAMQA4AC0ANwAwADIAMQA0
ADcALQA3ADAAMgA1ADAAMAAtADcAMAA0ADcAMQA0AC0ANwAwADIAMQA0ADYALQA3ADAANAA1ADkA
OQAtAAkAMQAwADUANwAwADAALQA3ADAAMQA2ADYANwAtADcAMAAyADgANwA3AC0AMQAwADUAMgA1
ADAALQA3ADAAMQA4ADAAMwAtADcAMAAxADAANwA1AC0ANwAwADAANwA4ADYALQA3ADAAMwAzADAA
MAAtADcAMAAyADMAMAAxAC0ANwAwADAANAA5ADIALQA3ADAAMgA0ADAACQA5AC0ANwAwADIANwA5
ADgALQA3ADAAMQA5ADAAMQAtADcAMAAxADEAMQAxAC0ANwAwADQANgA3ADMALQA3ADAAMAA3ADYA
MgAtADcAMAAxADUANwA2AC0AMQA0ADgAMAAwADQALQAxADQAOAAxADMAMwAtADIAMAAwADQAMwAt
ADIAOQA5ADkANwAtADQAMgAwADAAMAAJAC0ANAAyADAAMAAzAC0ANgAzAAAAHwAAgIYDAgAAAAAA
wAAAAAAAAEYBAAAAOgAAAHgALQB0AG0ALQBhAHMALQB1AHMAZQByAC0AYQBwAHAAcgBvAHYAZQBk
AC0AcwBlAG4AZABlAHIAAAAAAAEAAAAGAAAATgBvAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AAA4AAAAeAAtAHQAbQAtAGEAcwAtAHUAcwBlAHIALQBiAGwAbwBjAGsAZQBkAC0AcwBlAG4AZABl
AHIAAAABAAAABgAAAE4AbwAAAAAAfKk=

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3E80BMK019S01emtr_--
