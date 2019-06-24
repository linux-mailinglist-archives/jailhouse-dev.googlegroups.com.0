Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBFMKYXUAKGQEZIC4SZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764D51D5D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 23:48:07 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id t11sf18584685qtc.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 14:48:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561412886; cv=pass;
        d=google.com; s=arc-20160816;
        b=eG3iRCRPwr6MYpGavnFPXxuYAQqFiJoymlCUjNsgageGFZQQnuFa6i2jfcdwp54Cwj
         oGQGEOa4C5+lWR1UadtWb5EawcWP6sPk+ckgBh6PlFrG3eh8BTJ+iJhMiKYOGC/JlxJf
         iodmrdstpjmT/BodbkifmYcnwnJN6qMeQ8NLFXJrx4Pj809QVgWXUAIW9dAzzAXeC2Qe
         ovJZLbmJR9IwozlCWmBbJn2t9oC5Nfb2fWzbVbBWK4g4lxNXoTAa9199z92J3AnCxNsH
         OSFWHWeES5yYLC93UlQQ4ZaKyVT/cCHMatPEE3lJldmSEmr/z8fFYRLPUgL73pJhXIKk
         cvUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iGiD9c5rAgY/Q4lnaWM2Hhm5vqwpYSSUcAKY+nikGok=;
        b=CyvmKknQQUC4w4Hb18J9hhsDThqeEgKPageDyQ1yZz2VE2mhqQDLNZjUe6jS0zrFWO
         MsHkT522NaDY8ikFtiw5+TWULNDp5jYs0+oKTP2nP811EuUU1hUM9CP+QhKxJBpmIJkr
         D5ynzePrifWliu4Pfw6WFESVcp0vcL/orFuy7Vzw42PaVCruFg7dfP/tPFjP29HLB5W8
         8QZ/RpJFZcI+t8zQpgM71vlirCbEzy7LDL53r4oPsfNKgJFXercSZF9nw6FgqSwuGiRo
         tC0yZKztmTJV/Bng9v7bmVJ1hajZROho4T/7hEzvKopLmdq2bln7A3UQYrqBgc6LT4o1
         +3Ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eBO8YM5T;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iGiD9c5rAgY/Q4lnaWM2Hhm5vqwpYSSUcAKY+nikGok=;
        b=SupbSf3dKcgK17OdyeoSlaKtQX39HfIxiPcvaBpFLCFNFmvVoEz+/uOa6KbbIo4zCV
         cYFJsF6HC664jRhtzhQhhqGCG1IiquxwmlEp2UF/NeFVClPekhXp5jIITsMPORu6leOZ
         Rl4EEujHnsTtTzw1hAmciQFkEMF5Wo+J+74OAOAu0pIbh42mu83DvmnnQ2JyG8ZeR4v4
         AVJbJ63wY4oehFfbJLXSSJQ9s+Vr2LmvKVODCpaNxe99PvYMz1fg1vTKIrxUPOpL4z0b
         jTD7rz7J70/qVJKPZxOxxTZ14smmXoOGcWm1XnsOH837SvdUKRkd2wqXGUlrRY0AGSHi
         hm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iGiD9c5rAgY/Q4lnaWM2Hhm5vqwpYSSUcAKY+nikGok=;
        b=BPt0SlxH76EuFoQvtYssM30pKr0QoSoGt4bCwhnsupvr6pBneP2YOSAYUxYKu1GAaj
         M9e9ox1WCZcE2uFfWkvdnRSbBlSFGIY9K5iuExV1ZDKFJdi+SXFOdy67JA3Ekcz34NM6
         DrloPlvmfptbQnHpJtWYx5duUjsXAsvnYV7xQVxzoO6KW4zcNcUxLOkmH2GZRCxkIqEZ
         KoHNIXw/XXP2ji+oWCszKV+iwfpzkFgXWwVyOZvb17QTNdDul0LnK8v+CjAKt4JMY+Yp
         xCpkYpSt8POUN6ZTjrGSjdHkAshtql19nx53tNkLMxuMwkA2ru7ntIerTwM7DpmiCEvo
         CTww==
X-Gm-Message-State: APjAAAV/309RsfyvW1AAwzqbMMlmtpN/Xvx7LBB60YnmCmvZV8GVNnNA
	4K6H63qeJWgsd2ECEoUER3A=
X-Google-Smtp-Source: APXvYqyL9Ws8iRrziFAG+p0GLNN3DammVBj+0l9Y32xHK34lltjFU4J3OwdfhNMyaN+lALh+PYzdOQ==
X-Received: by 2002:a0c:ad76:: with SMTP id v51mr36454650qvc.232.1561412885954;
        Mon, 24 Jun 2019 14:48:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:10b:: with SMTP id e11ls5071026qtg.2.gmail; Mon, 24 Jun
 2019 14:48:05 -0700 (PDT)
X-Received: by 2002:ac8:3794:: with SMTP id d20mr80875185qtc.392.1561412885651;
        Mon, 24 Jun 2019 14:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561412885; cv=none;
        d=google.com; s=arc-20160816;
        b=nU8CY/QWswAdBOx7lpgDNn3Sdctaoya5sqH6VXwwLkANECeKJFncxH0n45iSTyyd70
         L+a4lN/IU+zyOclH5aS2Ae9ZM8MD0UfytS2z4fXe4uXLAxk3D7SnYBmWf2UHeYlG9MHD
         hRdOSYKlMHKOGeDZet9J3mHOEMuefSM8wG12cHCIcnu9VSG+8dqY1zo77sGoovpHSahQ
         EVhyYR8ZLjEL2DKD3bTFMa5MwD1ZGlz74oXUOEsYclaYA+9ELvm2McnjJoAhLMIzb2HJ
         1KDj9ZjDzW5xKoXIARUmK/UHwpe+dFuOZNPORzGOn4b4tTWSIF2h5nRgNNwq9X/SObTu
         A+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=seAPK8OYDNl3+GV0UJ/rH/xoFqBTxLwWiSyrXMQq0xo=;
        b=JvebBEobbOmUaabraSNhlkstgWwVKEnr2TTTj7rQDg6869D3WqY2aky7+j0TClim4m
         2gPHgfakwaHxWXouTAGcn3KwV9sohlYVLOdWzt5kRo5MhFF9CAlec/hUZzyJ2RZZ8QvY
         P1fS5NHZ7Niv7TrmlKsf5t6r4Ko+E+aXM46HoeMjPGX4QjoPNlVNkt0H3zweJ2DqHwdz
         0AsLNbod3ubQtbr5z79h9Q//SrqHGuxNqx3mJursjiGd8mVgd5v61HWqtBaVNju4V+OP
         sc1otyz3XYw2/KczGm2IH1ela+jjKNeEGqwqha5X1+MMRMfYKBwYQtR1LrpRVRCdXIey
         8dVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eBO8YM5T;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id u124si886264qkb.5.2019.06.24.14.48.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 14:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OLm5UX012536;
	Mon, 24 Jun 2019 16:48:05 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OLm5Qr018330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2019 16:48:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 16:48:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 16:48:04 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OLm4g6057134;
	Mon, 24 Jun 2019 16:48:04 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
Date: Mon, 24 Jun 2019 17:44:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=eBO8YM5T;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/24/2019 12:27 PM, Jan Kiszka wrote:
> On 24.06.19 15:29, Vitaly Andrianov wrote:
>> On 06/24/2019 09:23 AM, Jan Kiszka wrote:
>>> On 24.06.19 14:27, Vitaly Andrianov wrote:
>>>> Hi Jan, Ralf,
>>>>
>>>> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>> Hi Ralf,
>>>>> Thanks you for the quick response.
>>>>>
>>>>
>>>> [skip]
>>>>
>>>>>>>
>>>>>>> so, I have to implement the corresponding am57xx_init() and
>>>>>>> am57xx_cell_exit().
>>>>>>>
>>>>>>> Here is the old mach_cell_exit function, but many of the functions =
it
>>>>>>> uses disappeared in the v0.10 version.
>>>>>>>
>>>>>>> void mach_cell_exit(struct cell *cell)
>>>>>>> {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->=
cpu_set) {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm=
io_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu *=
 4);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> }
>>>>>>>
>>>>
>>>> I have implemented the am57xx unit. At the am57xx_cell_exit() I set cp=
u_on_entry to=20
>>>> omap5_secondary_hyp_startup() - physical address. That was in the work=
ing v0.8 mach_cell_exit().
>>>> But I'm not sure what shall I do with the remaining 3 calls:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>
>>>> When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu1=
 online and it still in=20
>>>> the hypervisor's WFI loop.
>>>>
>>>> Any advise?
>>>
>>> Can you share the code?
>>>
>>> But, again, we will likely need more redesign anyway because the previo=
us approach was already=20
>>> hacky. E.g. it was rather fishy to pass through the WakeupGen page and =
issuing smc calls.
>>>
>>> Can you describe the CPU boot flow from OS perspective, or refer to a d=
escription? Back then, I=20
>>> implemented it via Linux reverse engineering.
>>>
>>> Jan
>>>
>>
>> I just made suspend_cpu() not static and called from am57xx_exit_cell().=
 I got cpu_up() working=20
>> after that. Now I have the both uart-demo and git-demo working now. Let =
me clean the code and I=20
>> push it to the temporally branch to TI external git repo. After that we =
can discuss what I need to=20
>> do to implement the correct way.
>>
>=20
> OK, sounds good!
>=20
> Jan
>=20
Jan,

I pushed the sources to my private branch=20
https://git.ti.com/processor-sdk/jailhouse/commits/am57xx-next-va. I have u=
art-demo and gic-demo=20
working, but non of my other inmates works. All accesses to peripheral addr=
esses causes data aborts.=20
I guess that is because I have not implemented am57xx_mmio_count_regions(),=
 but I don't understand=20
how I have to implement this function.
Please can you explain what the function shall do?

Regarding the CPU boot. As I understand when the cpu_down() is called, CPU1=
 is not shutdown, but go=20
to omap_do_wfi(), where it is waiting for SMC. When we destroy a cell, CPU0=
 calls cpu_up(1) =3D>=20
omap4_boot_secondary() =3D> arch_send_wakeup_ipi_mask() and CPU1 got awaken=
 from wfi. As I understand=20
the am57xx_cell_exit() shall assign cpu_on_entry address of the omap_do_wfi=
(). Is that correct?

Thanks,
-Vitaly




--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b96fd4e8-686d-2df9-d4f3-32a2bc472630%40ti.com.
For more options, visit https://groups.google.com/d/optout.
