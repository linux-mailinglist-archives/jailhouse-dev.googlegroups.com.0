Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNMXV6MAMGQE2U52GKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF45A3F92
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 22:10:30 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id c66-20020a1c3545000000b003a5f6dd6a25sf7411619wma.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 13:10:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661717430; cv=pass;
        d=google.com; s=arc-20160816;
        b=nh+UtnDavZ0+syaFbym1QyPD4LdcNB4lc61UI5XsM2TecmE8XldIKwr6xwyG/PhoR4
         76KxSyrw+TARM/zWcahnMdQzcHirF+spWB2raVIrroDEcJjxToNODRhOd/Ci2+enBlWd
         9LHwocZgaiAkr6VAooWPqP7Z1hxuSSRUC63NG+dr/ZV9wEZkkv1DC9V4S2PTu1LE6KRD
         XQgAMntigZYG6wCpZcS/UJjBIYlAsU7SVVR4EK1ffCDoOUhctt4y0xPlyg0DVO7SvXHB
         EpCNO6rrcQavjplk8hG9Pw4QemTddxr0aeeZPHwjleQ5Rf9dbY+xPS6U5yFg6oOlpPpE
         kQ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=IesC6yTFM7JBbKdsi+pktGXcKk8mXyd2SJy4N0wZ+5Q=;
        b=F6wMd5kMcmhWIN3cYla4ZZpnZ5iiKMZ40+7MZyGXCFZk5+In9puhhIQb0M0BbaAnkH
         GgYfVTpvqoygkysllYo9eyyv3dIe8XVX9RIyE8Cba2vfRvcbVZV2mEa2DXw2FD9j4Mhx
         PFIeAT+Q5ZmTU907mpyU7GPCjS6XVV4Kmcng2L3ehIUVJ3Y6dgNrjju+q25ErOSJwWsp
         wa8DO+MZecYqeRfyYQYDzxmYe0FngWUTAaz7dC63GXk5nI8YD8Pwvi/HTqRewnQLWr+d
         0BT48INjxsspC9G2S5kAqYquSRAJyBQ0AuGdLyKmHsviDi1Z2fml7ofzOp6Fkh+kb70c
         Daog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=PPpXagii;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=IesC6yTFM7JBbKdsi+pktGXcKk8mXyd2SJy4N0wZ+5Q=;
        b=efFS0PXVD3I+ftJYxXHq2I+Mm29WNkeplGtHK1AaJ76taGgYiV5lZmQiKrCVOXa3rk
         /q4J5TLMXw71TKUoq2eCXmh7EB32FiAWrVDd6saK4X8rbBiCxEPu5IjsZomcaFwWyZ84
         2v+ZMM8nM3zygAEGDThBwsTTrTptYwjN5G8is4zC/Pc+FdmI8q+qa6zo0KcIKREgPIFo
         8t3Vfv6Eqo5mjN6mncW0mSa8pj8wroXA3MiSVbxjGApupnIYmz+1sXRvuQsU00xON3PT
         sS/OFBLvkmbrlQWjaULrqjpQx/d2mzM0Zu9MmMHTyMWyjs9HmDUBN/6VCUU69iSIXLzC
         qXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc;
        bh=IesC6yTFM7JBbKdsi+pktGXcKk8mXyd2SJy4N0wZ+5Q=;
        b=JYLwVVrrvMMQxbmX2i0iA5DKufUX8eYaNGQQhEiR/+x55XY0FuCAlpJgpJjIWPNbFN
         BgzK+bq52tJDGzzfIFMuxXGW/OvHTMOk3uFoPTDkeQSRI1qw7toWu51Sskb+VbCn9Mqx
         N6FtagWWJzWA8Ub66nnxhRyWXc3G0A+YAc8FkifYEPmiGOTwDULIOzbBabns+za2cQFg
         vIl5Bh9IXHKd0OiLIzteQfvlzDsH1jakx6UXEmfm1R+bR+CWstpd5UI5ULEj2D7nlO09
         5bC8OsdkfXiXc4gNpYjPYv+C/PXVabF9HrximH+mMU2WubcVBstUjskm1bmHNdqxF/3Q
         IyEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2DgPqg7aCp7qevfC07nYoRQmSyoftlqcMLnehE3AoGPobbZ+3j
	+ZL5tqRYFgqztyLcYcekJ9U=
X-Google-Smtp-Source: AA6agR6b0dBjqrs7vOtr1lAqREd7Ow+tDrWZRaAytYuhGyhEpQ4aAXCyhBIyr8d0hdHqJCY4kZXnUA==
X-Received: by 2002:a05:600c:418a:b0:3a5:168e:a918 with SMTP id p10-20020a05600c418a00b003a5168ea918mr5149690wmh.31.1661717430480;
        Sun, 28 Aug 2022 13:10:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4848:0:b0:225:58db:7886 with SMTP id n8-20020a5d4848000000b0022558db7886ls6794651wrs.1.-pod-prod-gmail;
 Sun, 28 Aug 2022 13:10:28 -0700 (PDT)
X-Received: by 2002:adf:db85:0:b0:225:2d24:9455 with SMTP id u5-20020adfdb85000000b002252d249455mr4836793wri.711.1661717428698;
        Sun, 28 Aug 2022 13:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661717428; cv=none;
        d=google.com; s=arc-20160816;
        b=LIOoiGN+j+w8CJ09u7zYCnF60SK/cp3VrpbHNM11a8GWLQGtimnTvUoQjNTFhpRgSY
         dpzipwOKhFQ6uVG0peVNj0c0hRgMMVh8AR5wtNDTySfgE5iGpDnqV2YggqwJ1fQWjMFi
         aFwxuNBF1KYT6Zu757oo3eEwUUIjZ0ZzoMw1FRbSOi0YZN2UdtEUbcNTMVz9wxJBhYeH
         obNF0ynDn+1mDuUs+FKLQkXriM313NbBodkT15zZ3Jqf3BNZEXfR4JwlQNLe3CUBP4ui
         ySudTToAgUa/X7ba7Jwxg7+pyBQYziZlId4rkjgiD6A+iYAe5sV5rV+wkMZWUp2Ck8O9
         q/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h6StnKN7If+k5w+UzpBwjwRe2ADaKQEzrioOSZYPDUg=;
        b=JQepNXtdON88Wq1fLUno6FuITdff1wMwAlyaKv/erJosN/I/b7PrQTZIRGI6JMwCfV
         MqPktI4lHkHlVdCtBFpemSl9MUdidPOvsDPPG5981N9KSGrp18jfhhkhzqNDkAonwiQQ
         WKr2Fj2zfNInwNue2Jb24H0iIs7U5O2YkGf2ZHCDAmld4wZ3avo0vUao1ypLiShHxpgi
         g9SnqhF+r7FE2LQVcwaIGhSN5bp8eIQy0UlCUkYgcyjPN7+i6dHcYwy1amVXfuy/BeWb
         PgEzkKSpnf+TnstBfhy8xuO5HY4hVXpqTkYT+d3WysOn6s70VxubjL9Lw2xRnAxn/ViZ
         uqJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=PPpXagii;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id bj16-20020a0560001e1000b00225378eb94asi207053wrb.7.2022.08.28.13.10.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 13:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4MG4SN27tBzxrr;
	Sun, 28 Aug 2022 22:10:28 +0200 (CEST)
Received: from [172.23.3.44] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sun, 28 Aug
 2022 22:10:27 +0200
Message-ID: <ca828813-6b16-7b8e-567e-933a9ca6e113@oth-regensburg.de>
Date: Sun, 28 Aug 2022 22:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [EXT] Re: [PATCH] configs: arm64: qemu: move virtual PCI
 controller
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
 <d6e6b2bc-706b-22d1-c36f-15caff0aff3a@web.de>
 <b8f4fb91-a747-0c86-1737-75cc44059879@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <b8f4fb91-a747-0c86-1737-75cc44059879@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=PPpXagii;
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



On 28/08/2022 20:22, Jan Kiszka wrote:
> On 28.08.22 20:11, Jan Kiszka wrote:
>> On 23.06.22 23:20, Ralf Ramsauer wrote:
>>> With recent QEMU versions, the GICR grew:
>>>
>>> $ cat /proc/iomem
>>> 08000000-0800ffff : GICD
>>> 080a0000-08ffffff : GICR
>>> [...]
>>>
>>> Hence, we can't place the virtual PCI controller at 0x08e00000 any
>>> longer. It will collide with the GICR. Move the pci controller to an
>>> empty spot: 0x81000000 provides enough space for the controller.
>>>
>>> 0x80000000 can't be used, as it is reserved for the commregion.
>>>
>>> Note that pci_mmconfig_base must be within a 32-bit range at the
>>> moment and can't be placed at a higher address.
>>>
>>
>> This is just papering over the underlying issue: QEMU now emulates ITS,
>> and that resource moves more things around. But Jailhouse does not
>> support ITS yet, so we better disable it in QEMU (machine attribute
>> "its=off"). But we will also need to tell the user which minimal QEMU
>> version this implies.
>>
> 
> In fact, you already contributed that. It's just missing in
> jailhouse-images.

Argh, right, I remember. I overlooked that.

Thanks
   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca828813-6b16-7b8e-567e-933a9ca6e113%40oth-regensburg.de.
