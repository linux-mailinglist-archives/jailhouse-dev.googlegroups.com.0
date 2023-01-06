Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBYOW4COQMGQEGHPBVWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 760496601C9
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 15:08:35 +0100 (CET)
Received: by mail-yb1-xb3b.google.com with SMTP id k204-20020a256fd5000000b007b8b040bc50sf536955ybc.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TIWYNy74vDWV9cfK+ZOHiduEh8wbnuSgqNm/rwxOFAw=;
        b=hjSOFWzUZPQeUwWxLxH9izK/Fy8KL6cTZhJU6IZb1geuY7IAI4CFK7eq02zM+BfCeI
         GTG9P/xs//NnI4gfuBZ2ephm2Wd6FsYVyg7DMyXKlioxiydraL7kALQw1dcRDi2Rm0wj
         r5eNMe+NK191vt/EeQaTBqOEtOR12SAX0kcm4/c84r3R0kZe7wEIe060TpJlgTrzb6Y4
         t3lcP6XyZ6qoVRfj5OULAoMBoDc+CLfkdGKCDWvzNWo7mkApOO09rMxiLYyu2C6EHg/D
         4g1t6hj6SEHViSFEWsQXUphMk8Dnxg8JiczfRZfQGYCRcRyo2CstjKU/E3sXcKn7cJHL
         NSSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIWYNy74vDWV9cfK+ZOHiduEh8wbnuSgqNm/rwxOFAw=;
        b=ONL4F+6bUky/IDNHdIRlDmctg1LBuG7tFy9SKRBZHk4CkVN1BztMUj0KzpPC2Y/Zl2
         +Z9DTP479MDVAaLA0JtqgA6B+KTTetpTwZ0aifuamKL1hfhO2bDswobqwcjvsXQkp7Sv
         ZLA63jS4TK2BFU3yjuByIX6AVS6pQ4vnT/tIQ5LP+EOPnTfO1Q4X1MsUMQ4kd84RaLuV
         Ta89geCklCpY7JCCw+D2iSMlfQSrr5w/RZk3sm1RmkeOKvC8lUoaAOyg6IsWebhxuINm
         AjRq79RauiswyRYCtyXbEyAmCJRGpaed/cv6BnDV6WlgrGONppMLAOY0m5XmQ6RKa7hD
         kJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIWYNy74vDWV9cfK+ZOHiduEh8wbnuSgqNm/rwxOFAw=;
        b=7mCcO87JudeiEhfBw+X6Oa1jpGOBpbKQ76TOx8IMJojQYoQnMXjLrW/9jxYAzkWmCi
         dMntQBGZ+sC56tiTPBnwDXjMiGGD/WIsBSl5S05AV1ip7kcsPT/lKM4Amzats/UcTraH
         UBt2Fb2Tfgs2krljb/0iLD5KuZo7JKumIrePTuHAxHe2rHrcu7lUldkxCg+3P4o5qaQv
         4VALwR3HRiN9WLuH/TL/cdH1Cuk9wHrElGaTMgpLptbdoSig9zNFYch+qDMBbKqwwEEe
         O6OQ2LPXQHOrRW2P3U45DoQVi2ciy0zIILrgyhMa19JRjnpvAiIQojfBXBTCdkS6MyxF
         kbXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koaC6IoNQxHjEldllbc3u0yuO/hV7JUPgT8rtR9QFT/6+EQmYcK
	rz7gYDKqKI5rkhEvpqfrHNA=
X-Google-Smtp-Source: AMrXdXvWSD6p9b4XSr9XtnemkBcLjSaUO31sKWBYgtW+aLeZXugkS1TKKdlis2CVUA/XhbcvDXCYqQ==
X-Received: by 2002:a81:6f54:0:b0:393:d465:565d with SMTP id k81-20020a816f54000000b00393d465565dmr7682775ywc.514.1673014114412;
        Fri, 06 Jan 2023 06:08:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a067:0:b0:77f:4194:3ddc with SMTP id x94-20020a25a067000000b0077f41943ddcls15380041ybh.4.-pod-prod-gmail;
 Fri, 06 Jan 2023 06:08:33 -0800 (PST)
X-Received: by 2002:a25:2403:0:b0:7b8:8206:1f75 with SMTP id k3-20020a252403000000b007b882061f75mr115010ybk.166.1673014113263;
        Fri, 06 Jan 2023 06:08:33 -0800 (PST)
Date: Fri, 6 Jan 2023 06:08:32 -0800 (PST)
From: Tommi Parkkila <tommi.parkkila@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com>
In-Reply-To: <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
 <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
 <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com>
 <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
 <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_942_1723021758.1673014112563"
X-Original-Sender: Tommi.Parkkila@gmail.com
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

------=_Part_942_1723021758.1673014112563
Content-Type: multipart/alternative; 
	boundary="----=_Part_943_291080662.1673014112563"

------=_Part_943_291080662.1673014112563
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan and Ralf - It looks like I have something wrong with the IRQ/GIC. When=
=20
I get root cell up successfully, and if I press a button (that presumably=
=20
is assigned to a IRQ routine) I get the error print below and the whole=20
system hangs. Is there any documentation on how I should specify IRQ/GIC on=
=20
root cell configuration or jailhouse configuration for the target?

Thanks,
-tommi






















































*[   84.080587] irq 74: nobody cared (try booting with the "irqpoll"=20
option)[   84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G        =
=20
  OE     5.15.24-dirty #3[   84.094144] Hardware name: STM32 (Device Tree=
=20
Support)[   84.099236] Workqueue: events dbs_work_handler[   84.103724]=20
[<c0110d3c>] (unwind_backtrace) from [<c010c6c0>] (show_stack+0x10/0x14)[  =
=20
84.111377] [<c010c6c0>] (show_stack) from [<c0bb3c50>]=20
(dump_stack_lvl+0x40/0x4c)[   84.118918] [<c0bb3c50>] (dump_stack_lvl) from=
=20
[<c0baf750>] (__report_bad_irq+0x3c/0xc0)[   84.126986] [<c0baf750>]=20
(__report_bad_irq) from [<c0185b8c>] (note_interrupt+0x2a8/0x2f4)[  =20
84.135265] [<c0185b8c>] (note_interrupt) from [<c0181fd8>]=20
(handle_irq_event_percpu+0x80/0x88)[   84.143964] [<c0181fd8>]=20
(handle_irq_event_percpu) from [<c0182018>] (handle_irq_event+0x38/0x5c)[  =
=20
84.152769] [<c0182018>] (handle_irq_event) from [<c0186614>]=20
(handle_edge_irq+0xc4/0x218)[   84.161046] [<c0186614>] (handle_edge_irq)=
=20
from [<c073c8b4>] (stm32_pwr_handle_irq+0x118/0x190)[   84.169650]=20
[<c073c8b4>] (stm32_pwr_handle_irq) from [<c018165c>]=20
(handle_domain_irq+0x7c/0xb0)[   84.178348] [<c018165c>]=20
(handle_domain_irq) from [<c063ff04>] (gic_handle_irq+0x7c/0x90)[  =20
84.186522] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
(__irq_svc+0x5c/0x90)[   84.193950] Exception stack(0xced55bb8 to=20
0xced55c00)[   84.199040] 5ba0:                                            =
=20
          00000000 00000000[   84.207198] 5bc0: 1d624000 c105fe80 c105fe80=
=20
00000000 c1810800 00000080 ced54000 ced55ca8[   84.215356] 5be0: ced55ca8=
=20
ced55c08 ced54000 ced55c08 c0101254 c0101268 20010113 ffffffff[  =20
84.223509] [<c0100afc>] (__irq_svc) from [<c0101268>]=20
(__do_softirq+0xc0/0x430)[   84.230833] [<c0101268>] (__do_softirq) from=20
[<c012c8e0>] (irq_exit+0xd4/0x110)[   84.238157] [<c012c8e0>] (irq_exit)=20
from [<c0181660>] (handle_domain_irq+0x80/0xb0)[   84.245797] [<c0181660>]=
=20
(handle_domain_irq) from [<c063ff04>] (gic_handle_irq+0x7c/0x90)[  =20
84.253965] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
(__irq_svc+0x5c/0x90)[   84.261392] Exception stack(0xced55ca8 to=20
0xced55cf0)[   84.266383] 5ca0:                   df858000 df858004=20
00000000 c1b6cb80 c1b6cb80 c1b3cec0[   84.274541] 5cc0: c1bf8074 c120b400=
=20
c1b3cf40 c1b3cf48 c1986010 cf0ba580 c205ac44 ced55cf8[   84.282695] 5ce0:=
=20
c09a38d8 c09a34fc 60010013 ffffffff[   84.287781] [<c0100afc>] (__irq_svc)=
=20
from [<c09a34fc>] (shmem_tx_prepare+0xcc/0xdc)[   84.295422] [<c09a34fc>]=
=20
(shmem_tx_prepare) from [<c09a38d8>] (smc_send_message+0x24/0x120)[  =20
84.303696] [<c09a38d8>] (smc_send_message) from [<c099ae50>]=20
(do_xfer+0x98/0x464)[   84.311234] [<c099ae50>] (do_xfer) from [<c099f40c>]=
=20
(scmi_clock_rate_get+0x70/0xc4)[   84.318983] [<c099f40c>]=20
(scmi_clock_rate_get) from [<c067f358>] (scmi_clk_recalc_rate+0x3c/0x70)[  =
=20
84.327791] [<c067f358>] (scmi_clk_recalc_rate) from [<c0677004>]=20
(clk_recalc+0x34/0x74)[   84.331653] sched: RT throttling activated[  =20
84.339991] [<c0677004>] (clk_recalc) from [<c0679e18>]=20
(clk_change_rate+0xf8/0x544)[   84.347653] [<c0679e18>] (clk_change_rate)=
=20
from [<c067a3f4>] (clk_core_set_rate_nolock+0x190/0x1d8)[   84.356687]=20
[<c067a3f4>] (clk_core_set_rate_nolock) from [<c067a46c>]=20
(clk_set_rate+0x30/0x88)[   84.365300] [<c067a46c>] (clk_set_rate) from=20
[<c095a910>] (_set_opp+0x2d0/0x5f0)[   84.372647] [<c095a910>] (_set_opp)=
=20
from [<c095acc0>] (dev_pm_opp_set_rate+0x90/0x16c)[   84.380508]=20
[<c095acc0>] (dev_pm_opp_set_rate) from [<c095ff8c>]=20
(__cpufreq_driver_target+0x110/0x2f8)[   84.389840] [<c095ff8c>]=20
(__cpufreq_driver_target) from [<c0962f94>] (od_dbs_update+0xb4/0x160)[  =
=20
84.398540] [<c0962f94>] (od_dbs_update) from [<c0963b18>]=20
(dbs_work_handler+0x2c/0x58)[   84.406499] [<c0963b18>] (dbs_work_handler)=
=20
from [<c0141dec>] (process_one_work+0x1dc/0x588)[   84.414881] [<c0141dec>]=
=20
(process_one_work) from [<c01421e4>] (worker_thread+0x4c/0x520)[  =20
84.422940] [<c01421e4>] (worker_thread) from [<c0149df8>]=20
(kthread+0x170/0x1a0)[   84.430367] [<c0149df8>] (kthread) from=20
[<c0100130>] (ret_from_fork+0x14/0x24)[   84.437481] Exception=20
stack(0xced55fb0 to 0xced55ff8)[   84.442571] 5fa0:                        =
=20
            00000000 00000000 00000000 00000000[   84.450726] 5fc0:=20
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000[  =
=20
84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000[  =
=20
84.465448] handlers:[   84.467682] [<716ecdd6>] irq_default_primary_handler=
=20
threaded [<63fec1af>] regmap_irq_thread[   84.476083] Disabling IRQ #74*

torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti:

> Ralf - Not sure what you mean by your note.
>
> Jan - root cell configuration is now fixed what comes to overlapped memor=
y=20
> regions. However, the both issues: *1. Terminal hangs*, and *2. Issue=20
> with setting CPU clock* still exists. I am not familiar with clock=20
> configurations on the target, but yes TF-A is in use.
>
> -tommi
>
> to 5. tammik. 2023 klo 12.54 Ralf Ramsauer (ralf.r...@oth-regensburg.de)=
=20
> kirjoitti:
>
>>
>>
>> On 05/01/2023 18:24, Jan Kiszka wrote:
>> > On 05.01.23 18:21, Tommi Parkkila wrote:
>> >> Oh, I was missing *.cell from the point 2. Now fixed and no complaint=
s.
>> >>
>> >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila (tommi.p...@gmail.com
>> >> <mailto:tommi.p...@gmail.com>) kirjoitti:
>> >>
>> >>      Jan - Just ran the config check on the host PC and on target.
>> >>
>> >>      1. On host, it identified some memregion overlappings that were=
=20
>> due
>> >>      my own copy/paste errors. It also complained a missing resource
>> >>      interception for architecture x86:
>> >>      */In cell 'STM32MP1-Root', region 1
>> >>        phys_start: 0x00000000f7600000
>> >>        virt_start: 0x00000000f7600000
>> >>        size:       0x0000000009a00000
>> >>        flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> >>      JAILHOUSE_MEM_EXECUTE
>> >>      overlaps with xAPIC
>> >=20
>> > Another detail when running cross: "-a arm" - you don't have to worry
>> > about x86 resources on your target.
>>
>> Side note: We should store the architecture in the configuration. Just=
=20
>> for the same reason why we introduced the magic byte at the beginning=E2=
=80=A6
>>
>>    Ralf
>>
>> >=20
>> > Jan
>> >=20
>> >>        phys_start: 0x00000000fee00000
>> >>        virt_start: 0x00000000fee00000
>> >>        size:       0x0000000000001000
>> >>        flags:  /*
>> >>      I fixed the copy paste mem overlappings, do I need to worry abou=
t
>> >>      the xAPIC overlapping?
>> >>      */
>> >>      /*
>> >>      2. On target, the check complained the configuration is not root
>> >>      cell configuration???
>> >>      */root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
>> >>      jailhouse/configs/stm32mp157.c
>> >>      Reading configuration set:
>> >>      Not a root cell configuration:=20
>> jailhouse/configs/arm/stm32mp157.c/*
>> >>      The config here is the same as ran on the host PC. What causes i=
t=20
>> to
>> >>      complain the above?
>> >>
>> >>      to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.k...@siemens.com
>> >>      <mailto:jan.k...@siemens.com>) kirjoitti:
>> >>
>> >>          On 05.01.23 17:53, Tommi Parkkila wrote:
>> >>          > Jan - Thanks again. I have not tried the config check yet.
>> >>          Actually, it
>> >>          > does not work on hw currently, it does not find pyjailhous=
e
>> >>          module. I'll
>> >>          > check whats going wrong with it and let you know.
>> >>
>> >>          You can also run it offline, even directly from the source=
=20
>> folder
>> >>          (tools/jailhouse-config-check ...).
>> >>
>> >>          Jan
>> >>
>> >>          > -tommi
>> >>          >
>> >>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
>> >>          (jan.k...@siemens.com <mailto:jan.k...@siemens.com>
>> >>          > <mailto:jan.k...@siemens.com
>> >>          <mailto:jan.k...@siemens.com>>) kirjoitti:
>> >>          >
>> >>          >     On 05.01.23 15:34, Tommi Parkkila wrote:
>> >>          >     > Thanks for your reply, Jan. I managed to get forward
>> >>          from the 'hang'
>> >>          >     > condition. There were several misdefinitions on my=
=20
>> root-cell
>> >>          >     > configuration. Now I get the root-cell started
>> >>          sometimes, but more
>> >>          >     often
>> >>          >     > I get two types of issues after enable command. Any=
=20
>> help
>> >>          or ideas
>> >>          >     where
>> >>          >     > to continue my debugging would be greatly appreciate=
d.
>> >>          Please, see the
>> >>          >     > issues explained below.
>> >>          >
>> >>          >     Already tried "jailhouse config check"?
>> >>          >
>> >>          >     >
>> >>          >     > Thanks,
>> >>          >     > -tommi
>> >>          >     >
>> >>          >     > +++++++++++++++++++++++++++++++++
>> >>          >     >
>> >>          >     > 1. Terminal hangs
>> >>          >     > -- After the enable command for the root cell,=20
>> jailhouse
>> >>          gets started
>> >>          >     > but then the terminal goes unresponsive. Below,=20
>> example
>> >>          log, where I
>> >>          >     > give ls cmd, which then causes terminal to go
>> >>          unresponsive...:
>> >>          >     >
>> >>          >
>> >>          >     Missing interrupts could be one reason. Or something i=
s
>> >>          completely
>> >>          >     broken with memory mapping so that a kernel device=20
>> driver
>> >>          gets stuck on
>> >>          >     waiting for some register bit to flip, e.g. But most
>> >>          frequent are
>> >>          >     interrupt issues, specifically around GIC resources=20
>> being
>> >>          improperly
>> >>          >     passed through. The config checker may find that.
>> >>          >
>> >>          >     > /*root@stm32mp1:~# modprobe jailhouse
>> >>          >     > [ 1315.034414] jailhouse: loading out-of-tree module
>> >>          taints kernel.
>> >>          >     > root@stm32mp1:~# jailhouse enable
>> >>          >     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
>> >>          >     >
>> >>          >     > Initializing Jailhouse hypervisor v0.12
>> >>          (314-gc7a1b697-dirty) on CPU 0
>> >>          >     > Code location: 0xf0000040
>> >>          >     > Page pool usage after early setup: mem 28/1514, rema=
p
>> >>          0/131072
>> >>          >     > Initializing processors:
>> >>          >     >  CPU 0... OK
>> >>          >     >  CPU 1... OK
>> >>          >     > Initializing unit: irqchip
>> >>          >     > Initializing unit: PCI
>> >>          >     > Page pool usage after late setup: mem 50/1514, remap
>> >>          5/131072
>> >>          >     > [0] Activating hypervisor
>> >>          >     > [ 1355.352714] The Jailhouse is opening.
>> >>          >     > root@stm32mp1:~# ls*/
>> >>          >     >
>> >>          >     > 2. Issue with setting CPU clock
>> >>          >     > -- The second issue I see is related to i2c bus and
>> >>          system clock.
>> >>          >     > Terminal starts printing error statements infinitely
>> >>          after Jailhouse
>> >>          >     > opening. Below, is a snippet of an example logs.
>> >>          >     >
>> >>          >     > */[   85.322027] The Jailhouse is opening.
>> >>          >     > [   85.322648] stm32f7-i2c 5c002000.i2c: failed to
>> >>          prepare_enable
>> >>          >     clock
>> >>          >     > root@stm32mp1:~# [   85.339233] cpu cpu0:
>> >>          _set_opp_voltage: failed to
>> >>          >     > set voltage (1350000 1350000 1350000 mV): -22
>> >>          >     > [   85.350413] cpufreq: __target_index: Failed to=20
>> change cpu
>> >>          >     frequency: -22
>> >>          >     > [   85.357706] cpu cpu0: _set_opp_voltage: failed to=
=20
>> set
>> >>          voltage
>> >>          >     > (1350000 1350000 1350000 mV): -22
>> >>          >     > [   85.365124] cpufreq: __target_index: Failed to=20
>> change cpu
>> >>          >     frequency: -22
>> >>          >     > [   85.381985] cpu cpu0: _set_opp_voltage: failed to=
=20
>> set
>> >>          voltage
>> >>          >     > (1350000 1350000 1350000 mV): -22
>> >>          >     > /*- - -
>> >>          >     > +++++++++++++++++++++++++++++++++
>> >>          >
>> >>          >     Same possible reasons as above. Or do you know how clo=
ck
>> >>          control happens
>> >>          >     on that platform? Is there firmware (TF-A?) involved?
>> >>          >
>> >>          >     Jan
>> >>          >
>> >>          >     --
>> >>          >     Siemens AG, Technology
>> >>          >     Competence Center Embedded Linux
>> >>          >
>> >>
>> >>          --
>> >>          Siemens AG, Technology
>> >>          Competence Center Embedded Linux
>> >>
>> >=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com.

------=_Part_943_291080662.1673014112563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan and Ralf - It looks like I have something wrong with the IRQ/GIC. When =
I get root cell up successfully, and if I press a button (that presumably i=
s assigned to a IRQ routine) I get the error print below and the whole syst=
em hangs. Is there any documentation on how I should specify IRQ/GIC on roo=
t cell configuration or jailhouse configuration for the target?<div><br></d=
iv><div>Thanks,</div><div>-tommi<br><div><br></div><div><b><i>[ &nbsp; 84.0=
80587] irq 74: nobody cared (try booting with the "irqpoll" option)<br>[ &n=
bsp; 84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; OE &nbsp; &nbsp; 5.15.24-dirty #3<br>[ &nbsp; 84.09414=
4] Hardware name: STM32 (Device Tree Support)<br>[ &nbsp; 84.099236] Workqu=
eue: events dbs_work_handler<br>[ &nbsp; 84.103724] [&lt;c0110d3c&gt;] (unw=
ind_backtrace) from [&lt;c010c6c0&gt;] (show_stack+0x10/0x14)<br>[ &nbsp; 8=
4.111377] [&lt;c010c6c0&gt;] (show_stack) from [&lt;c0bb3c50&gt;] (dump_sta=
ck_lvl+0x40/0x4c)<br>[ &nbsp; 84.118918] [&lt;c0bb3c50&gt;] (dump_stack_lvl=
) from [&lt;c0baf750&gt;] (__report_bad_irq+0x3c/0xc0)<br>[ &nbsp; 84.12698=
6] [&lt;c0baf750&gt;] (__report_bad_irq) from [&lt;c0185b8c&gt;] (note_inte=
rrupt+0x2a8/0x2f4)<br>[ &nbsp; 84.135265] [&lt;c0185b8c&gt;] (note_interrup=
t) from [&lt;c0181fd8&gt;] (handle_irq_event_percpu+0x80/0x88)<br>[ &nbsp; =
84.143964] [&lt;c0181fd8&gt;] (handle_irq_event_percpu) from [&lt;c0182018&=
gt;] (handle_irq_event+0x38/0x5c)<br>[ &nbsp; 84.152769] [&lt;c0182018&gt;]=
 (handle_irq_event) from [&lt;c0186614&gt;] (handle_edge_irq+0xc4/0x218)<br=
>[ &nbsp; 84.161046] [&lt;c0186614&gt;] (handle_edge_irq) from [&lt;c073c8b=
4&gt;] (stm32_pwr_handle_irq+0x118/0x190)<br>[ &nbsp; 84.169650] [&lt;c073c=
8b4&gt;] (stm32_pwr_handle_irq) from [&lt;c018165c&gt;] (handle_domain_irq+=
0x7c/0xb0)<br>[ &nbsp; 84.178348] [&lt;c018165c&gt;] (handle_domain_irq) fr=
om [&lt;c063ff04&gt;] (gic_handle_irq+0x7c/0x90)<br>[ &nbsp; 84.186522] [&l=
t;c063ff04&gt;] (gic_handle_irq) from [&lt;c0100afc&gt;] (__irq_svc+0x5c/0x=
90)<br>[ &nbsp; 84.193950] Exception stack(0xced55bb8 to 0xced55c00)<br>[ &=
nbsp; 84.199040] 5ba0: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00000000 0000=
0000<br>[ &nbsp; 84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810=
800 00000080 ced54000 ced55ca8<br>[ &nbsp; 84.215356] 5be0: ced55ca8 ced55c=
08 ced54000 ced55c08 c0101254 c0101268 20010113 ffffffff<br>[ &nbsp; 84.223=
509] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c0101268&gt;] (__do_softirq+0=
xc0/0x430)<br>[ &nbsp; 84.230833] [&lt;c0101268&gt;] (__do_softirq) from [&=
lt;c012c8e0&gt;] (irq_exit+0xd4/0x110)<br>[ &nbsp; 84.238157] [&lt;c012c8e0=
&gt;] (irq_exit) from [&lt;c0181660&gt;] (handle_domain_irq+0x80/0xb0)<br>[=
 &nbsp; 84.245797] [&lt;c0181660&gt;] (handle_domain_irq) from [&lt;c063ff0=
4&gt;] (gic_handle_irq+0x7c/0x90)<br>[ &nbsp; 84.253965] [&lt;c063ff04&gt;]=
 (gic_handle_irq) from [&lt;c0100afc&gt;] (__irq_svc+0x5c/0x90)<br>[ &nbsp;=
 84.261392] Exception stack(0xced55ca8 to 0xced55cf0)<br>[ &nbsp; 84.266383=
] 5ca0: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; df85=
8000 df858004 00000000 c1b6cb80 c1b6cb80 c1b3cec0<br>[ &nbsp; 84.274541] 5c=
c0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010 cf0ba580 c205ac44 ced55cf8=
<br>[ &nbsp; 84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff<br>[ &nbs=
p; 84.287781] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c09a34fc&gt;] (shmem=
_tx_prepare+0xcc/0xdc)<br>[ &nbsp; 84.295422] [&lt;c09a34fc&gt;] (shmem_tx_=
prepare) from [&lt;c09a38d8&gt;] (smc_send_message+0x24/0x120)<br>[ &nbsp; =
84.303696] [&lt;c09a38d8&gt;] (smc_send_message) from [&lt;c099ae50&gt;] (d=
o_xfer+0x98/0x464)<br>[ &nbsp; 84.311234] [&lt;c099ae50&gt;] (do_xfer) from=
 [&lt;c099f40c&gt;] (scmi_clock_rate_get+0x70/0xc4)<br>[ &nbsp; 84.318983] =
[&lt;c099f40c&gt;] (scmi_clock_rate_get) from [&lt;c067f358&gt;] (scmi_clk_=
recalc_rate+0x3c/0x70)<br>[ &nbsp; 84.327791] [&lt;c067f358&gt;] (scmi_clk_=
recalc_rate) from [&lt;c0677004&gt;] (clk_recalc+0x34/0x74)<br>[ &nbsp; 84.=
331653] sched: RT throttling activated<br>[ &nbsp; 84.339991] [&lt;c0677004=
&gt;] (clk_recalc) from [&lt;c0679e18&gt;] (clk_change_rate+0xf8/0x544)<br>=
[ &nbsp; 84.347653] [&lt;c0679e18&gt;] (clk_change_rate) from [&lt;c067a3f4=
&gt;] (clk_core_set_rate_nolock+0x190/0x1d8)<br>[ &nbsp; 84.356687] [&lt;c0=
67a3f4&gt;] (clk_core_set_rate_nolock) from [&lt;c067a46c&gt;] (clk_set_rat=
e+0x30/0x88)<br>[ &nbsp; 84.365300] [&lt;c067a46c&gt;] (clk_set_rate) from =
[&lt;c095a910&gt;] (_set_opp+0x2d0/0x5f0)<br>[ &nbsp; 84.372647] [&lt;c095a=
910&gt;] (_set_opp) from [&lt;c095acc0&gt;] (dev_pm_opp_set_rate+0x90/0x16c=
)<br>[ &nbsp; 84.380508] [&lt;c095acc0&gt;] (dev_pm_opp_set_rate) from [&lt=
;c095ff8c&gt;] (__cpufreq_driver_target+0x110/0x2f8)<br>[ &nbsp; 84.389840]=
 [&lt;c095ff8c&gt;] (__cpufreq_driver_target) from [&lt;c0962f94&gt;] (od_d=
bs_update+0xb4/0x160)<br>[ &nbsp; 84.398540] [&lt;c0962f94&gt;] (od_dbs_upd=
ate) from [&lt;c0963b18&gt;] (dbs_work_handler+0x2c/0x58)<br>[ &nbsp; 84.40=
6499] [&lt;c0963b18&gt;] (dbs_work_handler) from [&lt;c0141dec&gt;] (proces=
s_one_work+0x1dc/0x588)<br>[ &nbsp; 84.414881] [&lt;c0141dec&gt;] (process_=
one_work) from [&lt;c01421e4&gt;] (worker_thread+0x4c/0x520)<br>[ &nbsp; 84=
.422940] [&lt;c01421e4&gt;] (worker_thread) from [&lt;c0149df8&gt;] (kthrea=
d+0x170/0x1a0)<br>[ &nbsp; 84.430367] [&lt;c0149df8&gt;] (kthread) from [&l=
t;c0100130&gt;] (ret_from_fork+0x14/0x24)<br>[ &nbsp; 84.437481] Exception =
stack(0xced55fb0 to 0xced55ff8)<br>[ &nbsp; 84.442571] 5fa0: &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00000000 00000000 00000000 00000000<br=
>[ &nbsp; 84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 00000000<br>[ &nbsp; 84.458880] 5fe0: 00000000 00000000 0000=
0000 00000000 00000013 00000000<br>[ &nbsp; 84.465448] handlers:<br>[ &nbsp=
; 84.467682] [&lt;716ecdd6&gt;] irq_default_primary_handler threaded [&lt;6=
3fec1af&gt;] regmap_irq_thread<br>[ &nbsp; 84.476083] Disabling IRQ #74</i>=
</b><br><br></div></div><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkil=
a kirjoitti:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
<div dir=3D"ltr">Ralf - Not sure what you mean by your note.<div><br></div>=
<div>Jan - root cell configuration is now fixed what comes to overlapped me=
mory regions. However, the=C2=A0both issues: <b><i>1. Terminal hangs</i></b=
>, and <b><i>2. Issue with setting CPU clock</i></b> still exists. I am not=
 familiar with clock configurations on the target, but yes TF-A is in use.<=
/div><div><br></div><div>-tommi</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">to 5. tammik. 2023 klo 12.54 Ralf Rams=
auer (<a href data-email-masked rel=3D"nofollow">ralf.r...@oth-regensburg.d=
e</a>) kirjoitti:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 05/01/2023 18:24, Jan Kiszka wrote:<br>
&gt; On 05.01.23 18:21, Tommi Parkkila wrote:<br>
&gt;&gt; Oh, I was missing *.cell from the point 2. Now fixed=C2=A0and no c=
omplaints.<br>
&gt;&gt;<br>
&gt;&gt; to 5. tammik. 2023 klo 12.20 Tommi Parkkila (<a href data-email-ma=
sked rel=3D"nofollow">tommi.p...@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">tommi.p...@g=
mail.com</a>&gt;) kirjoitti:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Jan - Just ran the config check on the host PC=
 and on target.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. On host, it identified some memregion overl=
appings that were due<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 my own copy/paste errors. It also complained a=
 missing resource<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 interception for architecture x86:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */In cell &#39;STM32MP1-Root&#39;, region 1<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000f7600000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000f7600000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009=
a00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_EXECUTE<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 overlaps with xAPIC<br>
&gt; <br>
&gt; Another detail when running cross: &quot;-a arm&quot; - you don&#39;t =
have to worry<br>
&gt; about x86 resources on your target.<br>
<br>
Side note: We should store the architecture in the configuration. Just <br>
for the same reason why we introduced the magic byte at the beginning=E2=80=
=A6<br>
<br>
=C2=A0 =C2=A0Ralf<br>
<br>
&gt; <br>
&gt; Jan<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000fee00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000fee00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000=
001000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags:=C2=A0=C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I fixed the copy paste mem=C2=A0overlappings, =
do I need to worry about<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 the xAPIC overlapping?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. On target, the check complained the configu=
ration is not root<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cell configuration???<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */root@stm32mp1:~# jailhouse/tools/jailhouse-c=
onfig-check<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 jailhouse/configs/stm32mp157.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Reading configuration set:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Not a root cell configuration: jailhouse/confi=
gs/arm/stm32mp157.c/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 The config here is the same as ran on the host=
 PC. What causes it to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 complain the above?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 to 5. tammik. 2023 klo 11.55 Jan Kiszka (<a hr=
ef data-email-masked rel=3D"nofollow">jan.k...@siemens.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href data-email-masked rel=3D"no=
follow">jan.k...@siemens.com</a>&gt;) kirjoitti:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 05.01.23 17:53, Tommi Parkkil=
a wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Jan - Thanks again. I have =
not tried the config check yet.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Actually, it<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; does not work on hw current=
ly, it does not find pyjailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module. I&#39;ll<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; check whats=C2=A0going wron=
g with it and=C2=A0let you know.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can also run it offline, eve=
n directly from the source folder<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools/jailhouse-config-check ..=
.).<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Jan<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; -tommi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; to 5. tammik. 2023 klo 10.2=
1 Jan Kiszka<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<a href data-email-masked rel=
=3D"nofollow">jan.k...@siemens.com</a> &lt;mailto:<a href data-email-masked=
 rel=3D"nofollow">jan.k...@siemens.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href data-ema=
il-masked rel=3D"nofollow">jan.k...@siemens.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href data-email-ma=
sked rel=3D"nofollow">jan.k...@siemens.com</a>&gt;&gt;) kirjoitti:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 05.01=
.23 15:34, Tommi Parkkila wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Tha=
nks for your reply, Jan. I managed to get forward<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from the &#39;hang&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; con=
dition. There were several misdefinitions on my root-cell<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; con=
figuration. Now I get the root-cell started<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sometimes, but more<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0often<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; I g=
et two types of issues after enable command. Any help<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or ideas<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0where<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; to =
continue my debugging would be greatly appreciated.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please, see the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; iss=
ues explained below.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Already =
tried &quot;jailhouse config check&quot;?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Tha=
nks,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -to=
mmi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++=
++++++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. =
Terminal hangs<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- =
After the enable command for the root cell, jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets started<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; but=
 then the terminal goes unresponsive. Below, example<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log, where I<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; giv=
e ls cmd, which then causes terminal to go<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresponsive...:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Missing =
interrupts could be one reason. Or something is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completely<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0broken w=
ith memory mapping so that a kernel device driver<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets stuck on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0waiting =
for some register bit to flip, e.g. But most<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frequent are<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0interrup=
t issues, specifically around GIC resources being<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 improperly<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0passed t=
hrough. The config checker may find that.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*r=
oot@stm32mp1:~# modprobe jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1=
315.034414] jailhouse: loading out-of-tree module<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taints kernel.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# jailhouse enable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; ~/j=
ailhouse/configs/arm/itron_stm32mp157.cell<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing Jailhouse hypervisor v0.12<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (314-gc7a1b697-dirty) on CPU 0<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Cod=
e location: 0xf0000040<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Pag=
e pool usage after early setup: mem 28/1514, remap<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0/131072<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing processors:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=
=A0CPU 0... OK<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=
=A0CPU 1... OK<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing unit: irqchip<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing unit: PCI<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Pag=
e pool usage after late setup: mem 50/1514, remap<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5/131072<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [0]=
 Activating hypervisor<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1=
355.352714] The Jailhouse is opening.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# ls*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. =
Issue with setting CPU clock<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- =
The second issue I see is related to i2c bus and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system clock.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ter=
minal starts printing error statements infinitely<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 after Jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; ope=
ning. Below, is a snippet of an example logs.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; */[=
 =C2=A0 85.322027] The Jailhouse is opening.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: failed to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_enable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0clock<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _set_opp_voltage: failed to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; set=
 voltage (1350000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.350413] cpufreq: __target_index: Failed to change cpu<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequenc=
y: -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.357706] cpu cpu0: _set_opp_voltage: failed to set<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (13=
50000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.365124] cpufreq: __target_index: Failed to change cpu<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequenc=
y: -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.381985] cpu cpu0: _set_opp_voltage: failed to set<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (13=
50000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*-=
 - -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++=
++++++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Same pos=
sible reasons as above. Or do you know how clock<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 control happens<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on that =
platform? Is there firmware (TF-A?) involved?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Siemens =
AG, Technology<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Competen=
ce Center Embedded Linux<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Siemens AG, Technology<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Competence Center Embedded Linux=
<br>
&gt;&gt;<br>
&gt; <br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.co=
m</a>.<br />

------=_Part_943_291080662.1673014112563--

------=_Part_942_1723021758.1673014112563--
