Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2W34COQMGQEN4TTB2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E80166601F2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 15:19:23 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id by6-20020a05651c1a0600b0027fc191dd12sf444835ljb.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 06:19:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673014763; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yz1dP9I71XwSr0IuQDO5ZX5SV80c7GmkuP2hJoiP95NW7Pc1voWJIspRkCcKjAfatn
         lzJPtfsy++nJ3UAeh1VMoiXuSF6EqxxIcMLeOf0W59mSd6UJ8oY7K65nQoVz+aUf0pkO
         4npmqnJPeAg9xxKnwkt4sOgdjL+c3UBvsyXBIJcQDdbeAhzAjs/5T9gPiadVZl2rnKcn
         i/JZRF3/Pol4Ogoh+I4noo1lARHKTmwPIjS2YpIOg8Z5uWaFlWddQPHK9ExqPPrpgng4
         FsSPeNTBxIv78zV18tbV73dRslVj8IKeYxk4V26DOsrb/+gfIVAsjbpl4xrVVnu5I/DE
         9Lbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=5OEdvevKHpYAYHn7SoEXNYj32nXOGymkmGbXk9Nz1Qg=;
        b=xpSkebvfrvoNhm8U1PjeRB4aEKjO+0ucptamhovhFz15VimTMqbUEixtWNWt+qDHlm
         XFu+V21flVlKyP6a86++DXAydM1mNKgEU1FGs6VyvHNggHif3GrtVwInSdEqd87RMmyi
         YuvJW/E96JYVM8AaeXak0Z36+JfnbMHasYgKiyW8h14XXjS+2AF4KOFkFAwvuIS6mJCq
         yH0hvJxO5LPacmvhKtcFDZ0MnyBe1zxN+p76KY/qez1yZYyzXKph1BPrzp6JKx90Z71O
         aJCsnqIi1SA20mCkvY0muB43ViXosdaELhLM2HBlO0xrnN8tyZsTOq/Hk9rL3TL5Vbxx
         7YUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WjykCQbQ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5OEdvevKHpYAYHn7SoEXNYj32nXOGymkmGbXk9Nz1Qg=;
        b=DDoWIH9M5ZKYssjNTBwGs08xu+5S603BQF7N5Hj8AemaxZx0ooAZZw1TpYm/gZfOT6
         XMxiJOBGC14N4N+XUMVUp3hxhihhFPDTFcOiwQhwWt1V8eIDgBitIcm6x5l234HzMxSU
         qsbtLv3ioDYjikpHJSBdR9K7SWKgDzyuqBWPNdp4zYNfOiCrqfk2uHawXJ98LYi1Wkbq
         JRqYvkr30HDpM10UvDKtaBS748/Z6UlCrYEfusATorHnWe/nfihvlF+tggWpkRbwPhk9
         ya3Rb199/u/K2K5D1f0GpWJxMNC3HZf06voFiUvDsd5y1uIrrM9es3NwL2UJq4gCnrm5
         zRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OEdvevKHpYAYHn7SoEXNYj32nXOGymkmGbXk9Nz1Qg=;
        b=mJorDmmGyc+Y/3VHrlD/R9UF6r2hoZuCVMgCMwjm5NvMMWTh3nLYk242hOfo6JVCzv
         VRrozs2Amk8a8nJxVWaUV5RhggsMyKWfHprGvRAt93e1k695sjJrRVY+RpnY4AChgaxk
         dHTdpP2nifV8Kxs0PMJ8LNSNs4zpbvr+V8NZNe1KZ5sah0ASoTXYwvJvt+f8ZM5Xc4cG
         6HKKLjXOecZDSPeZA23WkTvnN2ndoklOzlpA84NoFOyCV867QhNtfJIie35J8iwh/ZF7
         SWvUIPuBrvhSvUWe69kDejvMOVRA/Rgb0Fmmn92a32+XzJv0i5pBZs+sKQkjo3oUu2F7
         faNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpRda/WGZ0r8dn2Rb2hESUe3hgUQF9tWcHRJm87BivxlwDshiVb
	4HCWV0uDDHwy9WHwc0ZUCYY=
X-Google-Smtp-Source: AMrXdXtN1M6hz+p1UoEmEVn5UBcvwhJjiggJF9jPuKc7e/aTZ2S9Pzn44A3m9q+M5ur+t8S0k/m3bQ==
X-Received: by 2002:a05:6512:3d92:b0:4b5:a1b5:f571 with SMTP id k18-20020a0565123d9200b004b5a1b5f571mr2809579lfv.496.1673014763287;
        Fri, 06 Jan 2023 06:19:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1945:b0:27f:af13:20e2 with SMTP id
 bs5-20020a05651c194500b0027faf1320e2ls4653789ljb.11.-pod-prod-gmail; Fri, 06
 Jan 2023 06:19:21 -0800 (PST)
X-Received: by 2002:a05:651c:2046:b0:27f:c157:8ed7 with SMTP id t6-20020a05651c204600b0027fc1578ed7mr14903250ljo.15.1673014761088;
        Fri, 06 Jan 2023 06:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673014761; cv=none;
        d=google.com; s=arc-20160816;
        b=Zey/q83u2+gWF/4DuFXeHitZeSu/Y5+egDAKSr9PrlHW/ImHJMTj6dZRYiVjrJPvvC
         lq7Rd3tYPxWEmCSNGrMwjmnwUBDT9wLiKe8qok0nD5iMkit2TXy2OgeQ6dbX/Oq5K34M
         dx823lEYMU51flKNRlRdo7mU/jWeko3/ACeQn9Gg/R3Jv7AsopwE6tQYGtyKVGJbh/YV
         LBplVuoONpl+tmwzRkspPxegpbSnuEhGO1s8uHAcsvx9anO95VYvAT93mlRgA4zSJU8X
         mtJb+PdGERmgh7crfx0qkmnpx1PBXgWlchLlnHtE+eF/I4bpfec6lqkaKW8irK8XdlfO
         ZlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p3pD7ZbpA5ccro1WwBy5iZfNtIjvOaBYGKVd++kkGvw=;
        b=xnToILE0SsTSbpdhxp2+sRkXVRymQ5/dM2CB1MdDO5g7Se1gUQloRKR0/+lP82B21q
         67NY3eheeQ8Pig4ssQBB4MiNrHbKqKXIJlyqyFil+cnjeWYiIEs4ERuhIjjtwSWOJ3Yq
         b8PYhAJKO4u7dEImejNZh/bKiXfsTuAQHWFkJnhRnrgikCZK32VMpMwDwwSwLzRNKVB6
         lMrn1sWoJunYrFg1rHhBqN5N2Kg0KHV2GJU0mvxR62cEOp14l/2i9kDluriy3/QJVzDr
         157iQXm4EpwvSe/Rf1mgYj1KVm8cJi40lORZ1VnFK+u9H13wT8X8W6npQW4TeIj4AR4V
         fKfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WjykCQbQ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id be40-20020a05651c172800b00280049699f1si40534ljb.1.2023.01.06.06.19.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 06:19:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NpQSm1NbZzyJ2;
	Fri,  6 Jan 2023 15:19:20 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 6 Jan
 2023 15:19:19 +0100
Message-ID: <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
Date: Fri, 6 Jan 2023 15:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Tommi Parkkila <tommi.parkkila@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
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
 <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WjykCQbQ;
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



On 06/01/2023 15:08, Tommi Parkkila wrote:
> Jan and Ralf - It looks like I have something wrong with the IRQ/GIC.=20
> When I get root cell up successfully, and if I press a button (that=20
> presumably is assigned to a IRQ routine) I get the error print below and=
=20
> the whole system hangs. Is there any documentation on how I should=20
> specify IRQ/GIC on root cell configuration or jailhouse configuration=20
> for the target?

Interesting. What's behind IRQ 74? Would you please share=20
/proc/interrupts, /proc/iomem and the configuration of your root cell?=20
And also maybe the full device tree using
$ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts

Thanks
   Ralf


>=20
> Thanks,
> -tommi
>=20
> */[ =C2=A0 84.080587] irq 74: nobody cared (try booting with the "irqpoll=
"=20
> option)
> [ =C2=A0 84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OE=20
>  =C2=A0 =C2=A0 5.15.24-dirty #3
> [ =C2=A0 84.094144] Hardware name: STM32 (Device Tree Support)
> [ =C2=A0 84.099236] Workqueue: events dbs_work_handler
> [ =C2=A0 84.103724] [<c0110d3c>] (unwind_backtrace) from [<c010c6c0>]=20
> (show_stack+0x10/0x14)
> [ =C2=A0 84.111377] [<c010c6c0>] (show_stack) from [<c0bb3c50>]=20
> (dump_stack_lvl+0x40/0x4c)
> [ =C2=A0 84.118918] [<c0bb3c50>] (dump_stack_lvl) from [<c0baf750>]=20
> (__report_bad_irq+0x3c/0xc0)
> [ =C2=A0 84.126986] [<c0baf750>] (__report_bad_irq) from [<c0185b8c>]=20
> (note_interrupt+0x2a8/0x2f4)
> [ =C2=A0 84.135265] [<c0185b8c>] (note_interrupt) from [<c0181fd8>]=20
> (handle_irq_event_percpu+0x80/0x88)
> [ =C2=A0 84.143964] [<c0181fd8>] (handle_irq_event_percpu) from [<c018201=
8>]=20
> (handle_irq_event+0x38/0x5c)
> [ =C2=A0 84.152769] [<c0182018>] (handle_irq_event) from [<c0186614>]=20
> (handle_edge_irq+0xc4/0x218)
> [ =C2=A0 84.161046] [<c0186614>] (handle_edge_irq) from [<c073c8b4>]=20
> (stm32_pwr_handle_irq+0x118/0x190)
> [ =C2=A0 84.169650] [<c073c8b4>] (stm32_pwr_handle_irq) from [<c018165c>]=
=20
> (handle_domain_irq+0x7c/0xb0)
> [ =C2=A0 84.178348] [<c018165c>] (handle_domain_irq) from [<c063ff04>]=20
> (gic_handle_irq+0x7c/0x90)
> [ =C2=A0 84.186522] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
> (__irq_svc+0x5c/0x90)
> [ =C2=A0 84.193950] Exception stack(0xced55bb8 to 0xced55c00)
> [ =C2=A0 84.199040] 5ba0:                                                =
    =20
>  =C2=A0 00000000 00000000
> [ =C2=A0 84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810800=20
> 00000080 ced54000 ced55ca8
> [ =C2=A0 84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c0101254=20
> c0101268 20010113 ffffffff
> [ =C2=A0 84.223509] [<c0100afc>] (__irq_svc) from [<c0101268>]=20
> (__do_softirq+0xc0/0x430)
> [ =C2=A0 84.230833] [<c0101268>] (__do_softirq) from [<c012c8e0>]=20
> (irq_exit+0xd4/0x110)
> [ =C2=A0 84.238157] [<c012c8e0>] (irq_exit) from [<c0181660>]=20
> (handle_domain_irq+0x80/0xb0)
> [ =C2=A0 84.245797] [<c0181660>] (handle_domain_irq) from [<c063ff04>]=20
> (gic_handle_irq+0x7c/0x90)
> [ =C2=A0 84.253965] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
> (__irq_svc+0x5c/0x90)
> [ =C2=A0 84.261392] Exception stack(0xced55ca8 to 0xced55cf0)
> [ =C2=A0 84.266383] 5ca0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 df858000 df858004 00000000=20
> c1b6cb80 c1b6cb80 c1b3cec0
> [ =C2=A0 84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010=20
> cf0ba580 c205ac44 ced55cf8
> [ =C2=A0 84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff
> [ =C2=A0 84.287781] [<c0100afc>] (__irq_svc) from [<c09a34fc>]=20
> (shmem_tx_prepare+0xcc/0xdc)
> [ =C2=A0 84.295422] [<c09a34fc>] (shmem_tx_prepare) from [<c09a38d8>]=20
> (smc_send_message+0x24/0x120)
> [ =C2=A0 84.303696] [<c09a38d8>] (smc_send_message) from [<c099ae50>]=20
> (do_xfer+0x98/0x464)
> [ =C2=A0 84.311234] [<c099ae50>] (do_xfer) from [<c099f40c>]=20
> (scmi_clock_rate_get+0x70/0xc4)
> [ =C2=A0 84.318983] [<c099f40c>] (scmi_clock_rate_get) from [<c067f358>]=
=20
> (scmi_clk_recalc_rate+0x3c/0x70)
> [ =C2=A0 84.327791] [<c067f358>] (scmi_clk_recalc_rate) from [<c0677004>]=
=20
> (clk_recalc+0x34/0x74)
> [ =C2=A0 84.331653] sched: RT throttling activated
> [ =C2=A0 84.339991] [<c0677004>] (clk_recalc) from [<c0679e18>]=20
> (clk_change_rate+0xf8/0x544)
> [ =C2=A0 84.347653] [<c0679e18>] (clk_change_rate) from [<c067a3f4>]=20
> (clk_core_set_rate_nolock+0x190/0x1d8)
> [ =C2=A0 84.356687] [<c067a3f4>] (clk_core_set_rate_nolock) from [<c067a4=
6c>]=20
> (clk_set_rate+0x30/0x88)
> [ =C2=A0 84.365300] [<c067a46c>] (clk_set_rate) from [<c095a910>]=20
> (_set_opp+0x2d0/0x5f0)
> [ =C2=A0 84.372647] [<c095a910>] (_set_opp) from [<c095acc0>]=20
> (dev_pm_opp_set_rate+0x90/0x16c)
> [ =C2=A0 84.380508] [<c095acc0>] (dev_pm_opp_set_rate) from [<c095ff8c>]=
=20
> (__cpufreq_driver_target+0x110/0x2f8)
> [ =C2=A0 84.389840] [<c095ff8c>] (__cpufreq_driver_target) from [<c0962f9=
4>]=20
> (od_dbs_update+0xb4/0x160)
> [ =C2=A0 84.398540] [<c0962f94>] (od_dbs_update) from [<c0963b18>]=20
> (dbs_work_handler+0x2c/0x58)
> [ =C2=A0 84.406499] [<c0963b18>] (dbs_work_handler) from [<c0141dec>]=20
> (process_one_work+0x1dc/0x588)
> [ =C2=A0 84.414881] [<c0141dec>] (process_one_work) from [<c01421e4>]=20
> (worker_thread+0x4c/0x520)
> [ =C2=A0 84.422940] [<c01421e4>] (worker_thread) from [<c0149df8>]=20
> (kthread+0x170/0x1a0)
> [ =C2=A0 84.430367] [<c0149df8>] (kthread) from [<c0100130>]=20
> (ret_from_fork+0x14/0x24)
> [ =C2=A0 84.437481] Exception stack(0xced55fb0 to 0xced55ff8)
> [ =C2=A0 84.442571] 5fa0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 00000000=20
> 00000000 00000000 00000000
> [ =C2=A0 84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000=20
> 00000000 00000000 00000000
> [ =C2=A0 84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013 00=
000000
> [ =C2=A0 84.465448] handlers:
> [ =C2=A0 84.467682] [<716ecdd6>] irq_default_primary_handler threaded=20
> [<63fec1af>] regmap_irq_thread
> [ =C2=A0 84.476083] Disabling IRQ #74/*
>=20
> torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti:
>=20
>     Ralf - Not sure what you mean by your note.
>=20
>     Jan - root cell configuration is now fixed what comes to overlapped
>     memory regions. However, the=C2=A0both issues: */1. Terminal hangs/*,=
 and
>     */2. Issue with setting CPU clock/* still exists. I am not familiar
>     with clock configurations on the target, but yes TF-A is in use.
>=20
>     -tommi
>=20
>     to 5. tammik. 2023 klo 12.54 Ralf Ramsauer
>     (ralf.r...@oth-regensburg.de) kirjoitti:
>=20
>=20
>=20
>         On 05/01/2023 18:24, Jan Kiszka wrote:
>          > On 05.01.23 18:21, Tommi Parkkila wrote:
>          >> Oh, I was missing *.cell from the point 2. Now fixed=C2=A0and=
 no
>         complaints.
>          >>
>          >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila
>         (tommi.p...@gmail.com
>          >> <mailto:tommi.p...@gmail.com>) kirjoitti:
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 Jan - Just ran the config check on the ho=
st PC and on
>         target.
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 1. On host, it identified some memregion =
overlappings
>         that were due
>          >>=C2=A0 =C2=A0 =C2=A0 my own copy/paste errors. It also complai=
ned a missing
>         resource
>          >>=C2=A0 =C2=A0 =C2=A0 interception for architecture x86:
>          >>=C2=A0 =C2=A0 =C2=A0 */In cell 'STM32MP1-Root', region 1
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000f7600000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000f7600000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x00000=
00009a00000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE |
>          >>=C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_EXECUTE
>          >>=C2=A0 =C2=A0 =C2=A0 overlaps with xAPIC
>          >
>          > Another detail when running cross: "-a arm" - you don't have
>         to worry
>          > about x86 resources on your target.
>=20
>         Side note: We should store the architecture in the
>         configuration. Just
>         for the same reason why we introduced the magic byte at the
>         beginning=E2=80=A6
>=20
>          =C2=A0 =C2=A0Ralf
>=20
>          >
>          > Jan
>          >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000fee00000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000fee00000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x00000=
00000001000
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags:=C2=A0=C2=A0/*
>          >>=C2=A0 =C2=A0 =C2=A0 I fixed the copy paste mem=C2=A0overlappi=
ngs, do I need to
>         worry about
>          >>=C2=A0 =C2=A0 =C2=A0 the xAPIC overlapping?
>          >>=C2=A0 =C2=A0 =C2=A0 */
>          >>=C2=A0 =C2=A0 =C2=A0 /*
>          >>=C2=A0 =C2=A0 =C2=A0 2. On target, the check complained the co=
nfiguration is
>         not root
>          >>=C2=A0 =C2=A0 =C2=A0 cell configuration???
>          >>=C2=A0 =C2=A0 =C2=A0 */root@stm32mp1:~# jailhouse/tools/jailho=
use-config-check
>          >>=C2=A0 =C2=A0 =C2=A0 jailhouse/configs/stm32mp157.c
>          >>=C2=A0 =C2=A0 =C2=A0 Reading configuration set:
>          >>=C2=A0 =C2=A0 =C2=A0 Not a root cell configuration:
>         jailhouse/configs/arm/stm32mp157.c/*
>          >>=C2=A0 =C2=A0 =C2=A0 The config here is the same as ran on the=
 host PC. What
>         causes it to
>          >>=C2=A0 =C2=A0 =C2=A0 complain the above?
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 to 5. tammik. 2023 klo 11.55 Jan Kiszka
>         (jan.k...@siemens.com
>          >>=C2=A0 =C2=A0 =C2=A0 <mailto:jan.k...@siemens.com>) kirjoitti:
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 05.01.23 17:53, Tommi Pa=
rkkila wrote:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > Jan - Thanks again. I hav=
e not tried the config
>         check yet.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Actually, it
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > does not work on hw curre=
ntly, it does not find
>         pyjailhouse
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module. I'll
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > check whats=C2=A0going wr=
ong with it and=C2=A0let you know.
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can also run it offline=
, even directly from the
>         source folder
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools/jailhouse-config-che=
ck ...).
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Jan
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > -tommi
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > to 5. tammik. 2023 klo 10=
.21 Jan Kiszka
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (jan.k...@siemens.com <mail=
to:jan.k...@siemens.com>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > <mailto:jan.k...@siemens.=
com
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <mailto:jan.k...@siemens.co=
m>>) kirjoitti:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0On 05.=
01.23 15:34, Tommi Parkkila wrote:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Than=
ks for your reply, Jan. I managed to
>         get forward
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from the 'hang'
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> cond=
ition. There were several
>         misdefinitions on my root-cell
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> conf=
iguration. Now I get the root-cell started
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sometimes, but more
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0often
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> I ge=
t two types of issues after enable
>         command. Any help
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or ideas
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0where
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> to c=
ontinue my debugging would be greatly
>         appreciated.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please, see the
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> issu=
es explained below.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Alread=
y tried "jailhouse config check"?
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Than=
ks,
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -tom=
mi
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> ++++=
+++++++++++++++++++++++++++++
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> 1. T=
erminal hangs
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -- A=
fter the enable command for the root
>         cell, jailhouse
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets started
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> but =
then the terminal goes unresponsive.
>         Below, example
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log, where I
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> give=
 ls cmd, which then causes terminal to go
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresponsive...:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Missin=
g interrupts could be one reason. Or
>         something is
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completely
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0broken=
 with memory mapping so that a kernel
>         device driver
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets stuck on
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0waitin=
g for some register bit to flip, e.g.
>         But most
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frequent are
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0interr=
upt issues, specifically around GIC
>         resources being
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 improperly
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0passed=
 through. The config checker may find that.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> /*ro=
ot@stm32mp1:~# modprobe jailhouse
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ 13=
15.034414] jailhouse: loading
>         out-of-tree module
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taints kernel.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root=
@stm32mp1:~# jailhouse enable
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> ~/ja=
ilhouse/configs/arm/itron_stm32mp157.cell
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Init=
ializing Jailhouse hypervisor v0.12
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (314-gc7a1b697-dirty) on CP=
U 0
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Code=
 location: 0xf0000040
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Page=
 pool usage after early setup: mem
>         28/1514, remap
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0/131072
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Init=
ializing processors:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> =C2=
=A0CPU 0... OK
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> =C2=
=A0CPU 1... OK
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Init=
ializing unit: irqchip
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Init=
ializing unit: PCI
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Page=
 pool usage after late setup: mem
>         50/1514, remap
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5/131072
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [0] =
Activating hypervisor
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ 13=
55.352714] The Jailhouse is opening.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root=
@stm32mp1:~# ls*/
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> 2. I=
ssue with setting CPU clock
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -- T=
he second issue I see is related to i2c
>         bus and
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system clock.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Term=
inal starts printing error statements
>         infinitely
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 after Jailhouse
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> open=
ing. Below, is a snippet of an example
>         logs.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> */[ =
=C2=A0 85.322027] The Jailhouse is opening.
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =
=C2=A0 85.322648] stm32f7-i2c 5c002000.i2c:
>         failed to
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_enable
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0clock
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root=
@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _set_opp_voltage: failed to
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> set =
voltage (1350000 1350000 1350000 mV): -22
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =
=C2=A0 85.350413] cpufreq: __target_index:
>         Failed to change cpu
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0freque=
ncy: -22
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =
=C2=A0 85.357706] cpu cpu0: _set_opp_voltage:
>         failed to set
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> (135=
0000 1350000 1350000 mV): -22
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =
=C2=A0 85.365124] cpufreq: __target_index:
>         Failed to change cpu
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0freque=
ncy: -22
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =
=C2=A0 85.381985] cpu cpu0: _set_opp_voltage:
>         failed to set
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> (135=
0000 1350000 1350000 mV): -22
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> /*- =
- -
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> ++++=
+++++++++++++++++++++++++++++
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Same p=
ossible reasons as above. Or do you
>         know how clock
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 control happens
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0on tha=
t platform? Is there firmware (TF-A?)
>         involved?
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Jan
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0--
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Siemen=
s AG, Technology
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Compet=
ence Center Embedded Linux
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >>
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Siemens AG, Technology
>          >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Competence Center Embedded =
Linux
>          >>
>          >
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56643ee7-2f74-39a2-dfa7-ad2abf603bd5%40oth-regensburg.de.
