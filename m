Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB4HY3KFQMGQEJBYDRKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B5840439859
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Oct 2021 16:17:21 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id d13-20020a2e810d000000b002117419160csf1046522ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Oct 2021 07:17:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635171441; cv=pass;
        d=google.com; s=arc-20160816;
        b=AJhGqaLyjdycamO02atF6Iu0+wEF6jcHAvUSuptrrwQj9YaWsWrxzJDciRUcaw0ujo
         7U3GH8y6YBgv8onoIy8oU3VR462ClNxI4TOE3TqPT0xCgEfC1tPdpQ84JXXhf5/sC21J
         MZj7Roegmim5hhCwqmtjsasnphr9lW7bMf1d3jKvq/nqrBTkzirR06q/nos45o6c0Y5W
         qjdlTVXwjbDuTFVZ3mp9JvbKoEv+0yvn6tL/wGxBy0jIvrJAoRd0Bt+bi9TiYKH3qRw6
         4cSd5c/t6vanjQ4icxwDgtMF7VE9WBWLXD9UGnk0hkrQAPkB3zv9fhJrGCaEtOEhGasz
         LhDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=0UFolzbLmDXCG/Ymyr5PHxZng42pdcD8gFuAQ3peF4s=;
        b=wi7fSVsqDQUKLXTaY2tyYYk2Pg4G3HGw18bt2qClppjcVratxziw2vO+xLx8sAMZGM
         e7zqm5PWMSbbH9uM/+snMi38oqHw4mIBfAcgBrbDIBbvSmPDz0pchZUJFyxFiZuxPIXE
         PT5DKpGvUZxaJ1Sgn4RIBps2yvyzECwstH2tImAlpdc4i1z+e61U++SnVCCoiIKNk4Vd
         lKf54J9ipkJB4IMDziYRKrH/MS0td3eM9Z5WXhizOu5xG6qZY8BLV33fJU8fa3brxwgy
         GXzzl/Ty9B7H7BSjRWOEjoI/uheLS3w5B1hU4hLJA6sRp9Thyxtis1SllRsAn9H7Aq5x
         yDjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UFolzbLmDXCG/Ymyr5PHxZng42pdcD8gFuAQ3peF4s=;
        b=quQJJ/Z5sXoDc8hjarr3AtsRqtKuId4miKwcxd9nwZZxYZg4BR+voDHNA40Tg/z1oF
         b/AhiUbsJV5dKEjVBShTWTnPnG2JQlQcSQ11ciJMM3n5CWp1OJVEpJOTt4zWlkp0yNOn
         Ex1q9ufjPPu5NkDRpj03ht86xfa2LCJVZlmLv2cfJUzMiFdn4fmsLXWaaeVpWCAkoSsd
         7zvh+LjzXoo79OO/N5Xooa2PinL+OBiHlG0cpTYvkn06b7f1mEMhOo6VonGeTCBBWulM
         uraMxJKIdA2mLljOmAIc3XQoWj/cuvMOo6l3i3lzZdMHok2JX88Fb7oXsrKEd9WT/sCb
         DU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UFolzbLmDXCG/Ymyr5PHxZng42pdcD8gFuAQ3peF4s=;
        b=sdTE7rG6bhQSsKfRNiICa5eB895NLg153C5BHulKPFgyXNm6PN7H5vEhLpOKJmTtVW
         5tbDVSdpFSdZnoZ5U4WQXJL3CmM4q9M4RUg5dNMgm1hVzyy6gk54D+d96DBIrrzGjSXp
         5wZMWHwTtksCt2m66DTHwFeGJX2ctsJxtCKhKRkaMDH5HSIFPwgnX2KFwFE3BPvDt5y1
         muuy6IUpfVCeL2s4j64NWDkGBIMMappZzZIIjxWqCvOyi5RJM8sIiBtNy9Dt4KAdlYLt
         pTGlowh/a0N2WAhiaXKHGbHdsxU3z8Zy52k/M7cwGKcVdVhKqff7b9uh+0VDu/B696i2
         OBAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531fYEoC6lDz/JhIXQbxMLK5oYewL8oW1NRYhhvQN9djUskhFvI1
	ssFI/hqzauPBX3MO4C7vE7U=
X-Google-Smtp-Source: ABdhPJxOqSmsklUjh7sFJ9ZKfOR710HzaHvz8DKNkpnW9nE4+eJuchjFbgrSU41qP1nBL3cbrIRChw==
X-Received: by 2002:a2e:b748:: with SMTP id k8mr19531652ljo.358.1635171441228;
        Mon, 25 Oct 2021 07:17:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8949:: with SMTP id b9ls2893073ljk.2.gmail; Mon, 25 Oct
 2021 07:17:20 -0700 (PDT)
X-Received: by 2002:a2e:7306:: with SMTP id o6mr18317774ljc.381.1635171440011;
        Mon, 25 Oct 2021 07:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635171440; cv=none;
        d=google.com; s=arc-20160816;
        b=CO4V7GIbpru9u0p8DEVJxxRH4lrLIM2V+szUbjWMiVcVGI7hRtv5KmzobxiSjT9hwb
         i3Yod8FHilYWF5aDtD3t+NE+vD5iYUmcrjK0dXxIaWdj2oTodai4oN6EULKdHDXxgDFN
         7yKOz+o/XvIegCcutOzKdIoZ7IZ7U6SEu+dFWAiBwp1iV4INwqOrmPuVwO5iGFhJcYAK
         DMg0HKxCT06LOdp+4cGESpuj0afMVyuTSMjv23MsL0zhBh2GiTjExEDWN4lsGsaNjdzd
         xJMlU1qOJEYDFYWKxkPTfqA1cRIyGbFU6FEpZ2IY+P/GWd3qqNe8D7bZKOHnVkGmmDl8
         Ee1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=0uq4Wm0hY2ie+LZQFqhH93vcKKXBJYOOF8ccKv7zIq4=;
        b=CVCDk4yzCNT9ZDKBYC9eucNYCKRT/CGlxdv4e9npyHa8AYF+EoayhvMaWKIJizorY9
         z3NX7vf0VocNMC4eiKl4nKjf5AT5xFeJwB3/ebVr/ZapP7uLfFIVeTjgZIAhN/kxhGvt
         YgtSPkz5BDrCA7ORP/whruelx8mFaBEWA8ZYd6LLbVxwbgcSCYQ0trsN13braqRDnBAv
         5aaEtOdUOJVDxNoEZVMqfyVHM5ZyMwAKcRf8UCapaMfrQeMslXBV75VwsY/nRjaWoC7w
         YmVq3oZtg9CZm9XvbWvlTRUzdz0j08ph9YO16SY4rYZE4XekUDqjJLF3ZkNS2kFvwYwa
         Ni6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s16si1255646lfp.6.2021.10.25.07.17.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19PEHIUJ026717
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Oct 2021 16:17:18 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.32.154])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19PEHIq7008291;
	Mon, 25 Oct 2021 16:17:18 +0200
Date: Mon, 25 Oct 2021 16:17:15 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Moustafa Nofal <mustafa13e09940@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse cell linux
Message-ID: <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
In-Reply-To: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Sun, 24 Oct 2021 23:26:06 -0700 (PDT)
schrieb Moustafa Nofal <mustafa13e09940@gmail.com>:

> I was not able to find a documentation about this jailhouse command 
> "Jailhouse cell linux" , what I understand it takes the following
> arguments:
> - linux configuration file .cell
> - kernel image .img 
> - device tree file .dtb

Might well be very little documentation on that. The code would be
under tools/jailhouse-cell-linux which might give a little more insight
on what it does and how.

And "./jailhouse-cell-linux --help" might help.

> -rootfs.cpio, It might be not clear to me, is it necessary to load
> this file, how can it be built?

As seen in --help that is an optional argument. That would be your root
filesystem as cpio archive. But unless you have nfs or assign a mass
storage device you will very likely want that. But rootfs could be
embedded in the kernel as well.

Easiest way to get one for your architecture is to take one generated
by jailhouse-images. (where internally buildroot is used to generate a
minimal demo-rootfs)

> - console , baud rate and IP.

things that would go on the kernel cmdline.

Imagine the tool like a bootloader, it will need kernel, cmdline,
possibly initrd (that cpio) and possible device tree.

> Another question: I used Jailhouse-images and started a 
> linux-non-root-cell, but the UART terminal hangs at this point, is
> there any solution for this. So, I tried to ping/SSH IP from another
> terminal over LAN but it is unreachable. 

Maybe start with the virtual qemu target, in which things should work.
Not sure if that second linux will have its own uart there, but it
should come up and be reachable via network a few secs after start.

regards,
Henning

> Thanks in advance
> Moustafa Noufale
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211025161715.61aa35fe%40md1za8fc.ad001.siemens.net.
