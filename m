Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBAEZZKFQMGQED5YHPVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F07437539
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 12:03:45 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id p10-20020a056512234a00b003fe188e9960sf1493332lfu.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 03:03:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634897025; cv=pass;
        d=google.com; s=arc-20160816;
        b=y4MSKH1JgbpvPHe4HkHA+T07Kk3E4XhO0J4tp+jMsFkcVdjNxXga4VRaTrS9v6XXge
         eXZvVUIW3/Dhtyd0C/oRplmWzaEb7YHAMh3Lm6kTcPfFo7Bek8MDIiJfrQZ82jxJhleS
         nFulpxywoKkpkTGTaO0W0Hjis7APp56Zs7TE6KDne2WrvhZ7mj1g+dVxECD+EUd5xK4h
         c3f3Sjckoj4WPTVnWdrhbl0fKpxT2XpTM36SoxC07jc8DX2L2go9PLAxR1r3E4FROw2p
         hifOxrVUu5rGn0fxtvFdXbxMMgLcEFK88gJbKscNKed2Sr1d1LLEJ7XC19f8mhS3o6r7
         S6xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=DamQb0VQzfNGz8TK/KClJ9CuYqvHI/t35jNmsy1Pd18=;
        b=wDcs8kANyFzKxmBkLO+kCuJUsRYeGlJmShxO1L14YlO6LZeHNMbDvWG0ovD2+q/9ER
         ncRONw3m5P9EWCSlXsmOtXnLKorIIKTWGNCLuhGwiCiymMQFKakIKRVfuJOsd2Uo/UTc
         y3O/hPxRMrJONzNP1Vwix5520eoDXTLPgj/DtQxsf3fbjrNeDCq8mANUjBYUHWtraQ4g
         93twW9skpZBlxKFDWrYH8W/WZqoI8JRU4OcouPi17v/z0KcJjwEs9AYYagESVRzozM4M
         +Vx6RLT/xoHQGC1uyYOJg7tFYTB0fnw2cXeZZ7OwJOweFKp7Q8QILxaRX1P4VYrjfVlD
         Z3oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DamQb0VQzfNGz8TK/KClJ9CuYqvHI/t35jNmsy1Pd18=;
        b=d69cFxb687l24O90mzAFO2QoYHmfE2rNLPKsFyT9SbW+0o85UeXF607N87aYUkD3kj
         s/n+XSsfiShtw8ik4e3IsnaxWX34CxxXqqNA002xN+FRVe7/ohTny25ixTYD2EYrhS8I
         pZRaMdCU6ZF93tSavQnz8QWmy1xuluDq2lsKZWfqHpGyZJQK4hhxaV5uxfCxI8aX5mYZ
         MmvUSV3IPZQP9FF9E4fYBNWMd4RJ2V3sKOn/h44+HQytzkXKlJzl8iOxuaH3rJgXL1OX
         N2drZKVcuhx75ZiMMZF/3J+2mxljGPlfa7y7NOk0Gmx7XCzpRVIhaoURXKRxr2+EbU53
         7WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DamQb0VQzfNGz8TK/KClJ9CuYqvHI/t35jNmsy1Pd18=;
        b=KhtdfHCQ/F6s/u31ipaQ1J+P67TLVK1+WzmKKo+N5p7IRfJCuEX61mNgRGlf+uaeDY
         W8bZtQIpOAXO8pBOmXEIYsiq/CS211xbfv/xVW/gWJNVCHP4ADf5Tiv+yWV59CiWlhdd
         HxlEljsunrEwg0t1v+eskZ6HScEwN8y9WeyRQIr7zIr4QB4qSPUUvHOlcRvdP5wB17HZ
         dBO9DPsqV1vfrM7mBEfTIp7TTLWvlk+3n/djTNwe22QbrM1WrD+q7x6JOhIRL0DTNPBo
         ULGWrRS7YwbVKcND1fP0CoGTpCfimJUTTNoiTsMrO3NkDCLsIJnGqjPpfqksA3owRre9
         o4Aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532otIr5/I+vUkTqLA7kTUasgk7KRofFiKwxehcTlvl+9zcj5MgU
	Wry0WuHeUyvpjuzCAyxOpho=
X-Google-Smtp-Source: ABdhPJyHDGdVryHlappSecHY6XtiG9LsKeFOF6b+h8rMrNVwODgnUXsYAOTsby7IJQSZjzGxLBbrig==
X-Received: by 2002:ac2:5edb:: with SMTP id d27mr10438468lfq.615.1634897024947;
        Fri, 22 Oct 2021 03:03:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b44:: with SMTP id o4ls1639331ljj.9.gmail; Fri, 22 Oct
 2021 03:03:43 -0700 (PDT)
X-Received: by 2002:a2e:4b0a:: with SMTP id y10mr12285424lja.334.1634897023843;
        Fri, 22 Oct 2021 03:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634897023; cv=none;
        d=google.com; s=arc-20160816;
        b=YVW++DvCiILoU04m1AUG2i0NNnJQELqGVC1hSlh5mKf5nGIjPdp0vgYDVUqnQbeTyB
         60l/7YFt9WesfxXbeUVwJLOdMEAbNBXKdOpyorUqGdGMMF3dDCD8ZTabCl2GcKrNY8S6
         2H46DYAWjk196nNHeXujxJ7/NLoB6uYRKowTflLZk9DBr9bHk/TKjajvPF8mqhxnWm46
         /+Tlrks/b7tQDGmY4VsOd9N689Bx1AuQj9urk/ZhfBzOefJOwB855mWeC4Gxamfg7Vbh
         Tq3miiHAZRmVcPfVZwIJGxcOtzhJGzbrDTiZKSu8yySMHBSNh7yCjd8J+Bbqfr8X6/D9
         PYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=myJnaygsCsH1vjAnVnbU0hV+X/LsKfOrzvzDeRiIM5w=;
        b=VqKajqwgXZTKJPDjI+D8LR6RVtQsPCJti1gu+ErvVjMJ86oYQh4lg65K9OSpb0fKeY
         adMWhK4KONzNpP4lvFeb5pE9GKFA2vs1KuYFt6oCSNHULU9ifIifuCtRLMExQheNgMPB
         UrUX/3bhIFIj2runD2cC70oSBVHkHCP/Yu/mBWHKk/Lv6CaB98P7ViUzBHPph1tUryQA
         bMb1AkMl32K55du/N8eJV5D6KQ07GQjcNiiVq3Ar9Sh6BmzW+V1QFXvaDQexRPFgnFGW
         kfB6DkpamP7bpVNQ87E2KxaHBoae8UxGC0ixK18OEydi4guDCVq37KsKASwyIteBmraP
         6cvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e11si230277lji.5.2021.10.22.03.03.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Oct 2021 03:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19MA3gK8018960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Oct 2021 12:03:42 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.35.209])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19MA3gDT015272;
	Fri, 22 Oct 2021 12:03:42 +0200
Date: Fri, 22 Oct 2021 12:03:41 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Andrea Marchetta <marchetta.andrea@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Building Jailhouse on STM32MP157A
Message-ID: <20211022120341.5b77c9db@md1za8fc.ad001.siemens.net>
In-Reply-To: <c8079f2e-4e88-42fa-8fd5-e852a6f98a10n@googlegroups.com>
References: <c8079f2e-4e88-42fa-8fd5-e852a6f98a10n@googlegroups.com>
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

Am Fri, 22 Oct 2021 02:45:44 -0700 (PDT)
schrieb Andrea Marchetta <marchetta.andrea@gmail.com>:

> Hi, i'm currently trying to use jailhouse on my stm32mp157a-dk1 kit
> for a research project. My main concerns are the followings:
> - first off, i've found the device tree for my board, but i'm
> struggling to convert it to a suitable jailhouse config file. My
> device tree is enormous, and thus i don't know which peripherals are
> mandatory and which one could be skipped altogether

Writing that initial config is cumbersome, unfortunately. You can check
out existing examples and see how their device trees have been
translated. It is an iterative process where you need to solve several
issues until you have something working. Later could be hardening to
remove bits that the root cell maybe should not be allowed to do
anymore, once running under jailhouse.
But the hypervisor will tell you about problems with reporting access
violations, so the process could be called "guided".

Maybe your research can be done on a board that is already supported.

> - secondly, i'm not sure the linux distro i'll be using, which is the 
> openstlinux one, can work seamlessly with jailhouse
> has anybody tried something similar? As far as i know Emtrion used
> some STM chips with their boards jailhouse-compatible, but the
> address mapping is completely different 

Jailhouse consists of a bunch of tools and a driver, plus the need to
apply a bunch of kernel patches - or use the jailhouse kernel tree if
your board is supported by mainline. That should not pose a problem for
any distro.

But again ... taking a problematic distro on a problematic board is not
research, it is "BSP doing". For your research just take another board
and i.e. jailhouse-images which will give you debian as distro.
Or if your sponsor insists, you have to do the "BSP doing", which is
not too bad but will cost.

regards,
Henning


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211022120341.5b77c9db%40md1za8fc.ad001.siemens.net.
