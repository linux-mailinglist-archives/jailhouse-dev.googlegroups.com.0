Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7XP3TUQKGQEIKTMPQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7971D04
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 18:38:22 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id w25sf28561106edu.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 09:38:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563899902; cv=pass;
        d=google.com; s=arc-20160816;
        b=RWDrYhxZPM35ucHjfnOq0lGbkQWD+S01MNc/Vhi8Yn2N7xEChsK+xP5zmfY6Uf/r2c
         7PcLOaG8EExcjpWPHeADB+Tx1E1V5GnR30J+iDgZXUdTESRw0cB99WiaxA6zfMnLXEO7
         2gaRaYJTsZcReB/+lemyld9kHoLESkyf0u8PXhLsBkvX4X7QwTfu/DAL1lM8ozsjF8Ft
         tWwg4xLg3U3a4eG4vfiXAdt43d9FANd2xWE0g70px4GDA//eGUnxWhiOQOr7yGRLQQd2
         ydw5B6UNp7IL8erP3CKyZJAhHbuM3sNm8Cgkw39MsJbK7d4w/Khl0zR6HD5DUNPh+YzW
         Ij0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=2qfRpQfkmJu5v9HLQH9ahln429xsHp03dVZ4rRPYgQE=;
        b=SLosgQfHC8QzRJHbluOdVbXQbJSE9qldIt6GvLfpIUZucYFgbTj0YLZXdRdn6YftZ2
         cVgiKb4BdPqOY7Uowo7PCbBIHtSdI0VWGkB484hMhqmuAPK1Rlooakp07Neu0pIUAPaq
         C3iWNTsveLQqIldDNJzVvnZzz0/YHXXAuiIPOBzmKamw3Drffh/NL/QGLkJGo8vm9KVb
         5i7t0dFLCKTdQGw9+PeKzb9MyhRVSyZNZXSSxePOvkTaB0jNk3+0h1bo5WYaH+Y1uVvg
         T+rgOE0FJHLgd5v1BeMoEbRuEC3k/nA9WcrHdTl07IG2iYdqp0A6wLvaIi9Pz+1NZ2F7
         lY8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="owg/6sDF";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2qfRpQfkmJu5v9HLQH9ahln429xsHp03dVZ4rRPYgQE=;
        b=pW4va7GbYAlswDJ5xQrAQMPpjJ7nXBbSCJjA5xFSJMuvD5yr0bmmE5LHwNirHaM1PC
         5n0VHZoHIl1R9aDJJmWtVF2sKKPz+u9cqDw/sH/Cq05EFGpRSKM86jynevjT28zkMOkf
         7wb4jCxOvQsLvDZtH9vSXToFfzMovMJ/PGhGGV4VQRs2ri504skvshvquP/MEMUQ42We
         VsiNSA9eCB4ggSri9yLYN04eoyPJSf8TIabIHr1w5Vh/QxHva/yM+4T3QbCtaIbv7hrF
         y2MZ8dASsEMTSMs+xdLTxy010NEhz7SSFFHxgL4VcomEpJX6t3/LNxxdFTskNBoa3LoM
         2kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2qfRpQfkmJu5v9HLQH9ahln429xsHp03dVZ4rRPYgQE=;
        b=Vo7T/ycxpUTJYRGPMVitrA1Kzuyvdxu3zTO5C8IFyYiLm5yduQsJBm1FhBfg7bEnLd
         AODicy3fWXA7apgRdJ0mXQveZNJPqtYxKZFTFEvUMTtOhbnPkgejk7fmv6uXaDsWvyEq
         dGeUIoVwHjsMKM2GJ1reHjIaq2YWq82+o6m3A+1ZW2I7Fzxw3dr5Stp+K6rh8QnCw1VJ
         CBP1o2TGCcLxLL1pde+AFVOG6a7z+2t3b0SxqHBQ6P2DlZjr2QWObSUcKyhAiO7ESRoh
         vtwMtZ85M2OuOc7q2JimWnj55LI5HwqCrBf3CZM+AN5Dtme0Dl0ul0iX43b17rGApKkF
         QbUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXR7dtJDE2JfixTavMKSyq2myMoLAGDGmNOcgfvgI3/RVCxK/rm
	iK0DbExE5Iq7UL8I5loXZxw=
X-Google-Smtp-Source: APXvYqzIZJmkI+o1uPcFmYvhRxCQR24isBaxQHj4Tzs5dl/jdAMHLrDP6+/UH+mwf7FoUYzK5GySZA==
X-Received: by 2002:a50:b4cb:: with SMTP id x11mr68107688edd.284.1563899902506;
        Tue, 23 Jul 2019 09:38:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9583:: with SMTP id w3ls10235208eda.5.gmail; Tue, 23 Jul
 2019 09:38:21 -0700 (PDT)
X-Received: by 2002:a05:6402:782:: with SMTP id d2mr67435204edy.80.1563899901932;
        Tue, 23 Jul 2019 09:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563899901; cv=none;
        d=google.com; s=arc-20160816;
        b=mDlm50KiLozKppI9MPYG2k95Cutrw7EKFc0jYWRj54l93pELuT10vnurTzsBpod10i
         nsvvaFSonqQPvoqEz9nOKDKsyUzXRD2dSWiWIEB/X+waF3WIP0daXCBB5gIWM9iRAq1u
         EnJjhND7s+EHolHgYzebdFOsOLFbAGywnzJTAirIkmSBE41m2dAaCGQ49cQPTFG78E6T
         m1ZlD4HL1Ps3tg1RNTvVRMMFfSL1XGxuR7ytsxNZTmF4l1QkLOXAsHptJ3hrh+vJ7M/W
         jXwwv2v/Yh0Fm6Qf3rJZHrRyksdacEFeLPtvbHPvaMkXUjUjE78UDrgJ/QnTe2d6LnLv
         dylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=TlTn0nXHdVwH5wN5ceJJl8fVAVUGyM3R3qOweDvjVtI=;
        b=NgXunDnT72RmBIp796b0AeJZZ0IsuRyjndgcSM0sv9QyJAX8VGnaWQKt8w3uCMuNwt
         QtxmlURuXCsg0o0OWEyM1XPpJJ1Y6bLnd6rpv3RFFLMH1bygW2i62S7iHogiYI1Cu79M
         XTWjSb8TcRfxakvftd6m7toOuBL+elxncHxmewV6aR8xmme5wl0fS5/3lcx6ld1LY4Tn
         hY78Gh34lrObx/vJLIhWxUNrXhy5ixgKsJgtXfVFLMaM1linIsnljA0LsuUr/XFvs9Lu
         tkLkww17fM682kRMPyzG5nCUiIUNLCPDK3CGzVxr16P0qyNZYEpnkoR8h1gztQZB5nW5
         C4gQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="owg/6sDF";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id t15si2076918ejq.1.2019.07.23.09.38.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 09:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45tPL52SmrzyBK;
	Tue, 23 Jul 2019 18:38:21 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 18:38:20 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
 <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
Date: Tue, 23 Jul 2019 18:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="owg/6sDF";
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



On 7/23/19 5:35 PM, Jan Kiszka wrote:
> On 23.07.19 17:19, Jan Kiszka wrote:
>> On 23.07.19 16:50, Ralf Ramsauer wrote:
>>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>>> parameter like 8250.platform=disable to disable the probing for platform
>>> uarts. Why?
>>>
>>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>>> restricted ports. It does touch those ports, as it lacks ACPI platform
>>> information and assumes 'any' platform UART is present.
>>
>> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
>> propagated the information "this is Jailhouse, you may not find platform UARTs"
>> to the driver. But that was a hack, so I didn't propose that upstream along with
>> the other x86 changes. Plus, there are cases where we do want to use a platform
>> uart in the non-root cell.
>>
>>>
>>> I.e.:
>>>   8250.nr_uarts=1 only touches 0x3f8
>>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>>
>>> In addition to that I have a PCI device. And Linux won't probe it until
>>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>>
>>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>>> to all ports. Yikes. At least I now know that the PCI device basically
>>> works, but still, this needs to be patched.
>>>
>>
>> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
>> card, but that machine also had no platform UARTs IIRC.
>>
>> If there no other way to tell Linux the number of platform UARTs, we will have
>> to introduce one, for the sake of this use case already.
>>
> 
> Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the

Thanks for the pointer.

> platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
> boot protocol to provide Linux with the information about available platform UARTs.

Hm. We do have the comm region... It will hold the config's struct
jailhouse_console. We could use this in combination with
serial8250_set_isa_configurator.

This won't enable all platform uarts, but with this we could
automatically enable at least one platform uart + hypervisor debug
output. This should be sufficient for most cases.

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/11ec656b-e07f-f6cc-12b4-87e20085924f%40oth-regensburg.de.
