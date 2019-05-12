Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2F337TAKGQE4WXREWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D40AD1AB4C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 10:48:40 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 205sf1302171ljj.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 01:48:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557650920; cv=pass;
        d=google.com; s=arc-20160816;
        b=hX3GMybubamBIo19h8QIUy2Ro7P27cRoa1C1U+ZPlB4mGs6zckRyoLqT1VjesdWECS
         Vgl0o2/072/cc/+Qb2LbDmk+0c9d9FdC29FcifJwJJieIRS/JOhtxgYsLJMKyR7Ddipq
         1RPH1HmQjbnNQwL1a5Lymv4LJ0Ji6fg7IGXQ0JiJHnP8ZTJGnngATTNpJZHgrVM+G8dP
         9eVGWey6yyPqFtqXYJaTx387Ie3b52rfNWbHPK2cP4hkhm7TgGkYixE4etQu57uDOD68
         bnTmxkpIBRqMROBaPm1e4rVch4tUNYU/jjEdtrFzeU92+1VsCJrV9GwfYIdKPuyAp0YW
         ZsDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=MG66TwR1HkxqXzYp6+FjKo7l945/dI3iJEhefvz0Txo=;
        b=RQ7yX2AtqyRoG6jlulOzd6jO7eSvythQvJmHtDCIuEEMjsRjNTZRMb3aZeiuSo9OI9
         XBGZnk895za6WUNuuMUaVIegpj4w3O9eB1VDfmeFMDbVyJBuZeW5I0z5UUxbVV92cXcw
         CAw9yEFvGaiPo/mRRccvPtz7ORaQ/WoiYNUUiRVBTSBT51XEepFtAa0GRGT+xKyMnoDP
         5eTgOBXfwIFAsraeF2l+iydW7nk3dI2hCB9qHUhnmAJWiH/JTmsska7ITU23YXI34eWf
         ztJ3l39HAYYiwVd3R1BJFyKSgyLvafkbqL8oDnB2eXgOtwgx3AjRJOOGiGhkunlSewVY
         UV2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=P8YKwESt;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MG66TwR1HkxqXzYp6+FjKo7l945/dI3iJEhefvz0Txo=;
        b=rZZN96Et7l1QVy+mDD9T741HTgzIi/gNn9bIg32lE0+3uojDgY91YGXxFMCUP4ebi1
         imFvnJZe0d3ksXd61FRig+SADktu0DQShCAcAlZEf+zcIn3XZqPEJwz13SQ4COi9HBPY
         zLwvMld9+rjaNAuVq9faS7JcjgIRy4ynjr95/lxhynCCyKLr0P00rUkcaplHBM3EE5bA
         bn75Y6c9xOOXjohhSg1mseDNGwZHdPvx1CmOiKmqg4xLZwQ1ODZQ33mbAceKgmpkRA/b
         O7fNl7isVAMQnbHDHx87z10O7/SCZwp5aO80uyu4xCr1ojuqj9l6A1pbadD79B2iv3fW
         anGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MG66TwR1HkxqXzYp6+FjKo7l945/dI3iJEhefvz0Txo=;
        b=X6lnlj8KXb+3pg3QwP7l0Rp18taLPilIQByYlWQ9RpU7dIpslH+0pbL9Uq998L/aZ6
         GZQF7yJB8Uog4/ahoIZKwMumu4k0F0EwUXSLDWhJbfjnh6oXxCFzb8jEJi7PcUzPmm4a
         /UZK9rssoGoj53EJvYiVNLI5LA/Mf3JRJB0xA5bnK26AreUzCcL4heiIq8YDKKoue1PV
         2Lu3o7KJR9WlYT+JNeEkBG1rYaz1kO0ZB75v096nfXsov46+v2KAKvyCoWzCavqlfr5x
         /P1MSRikJElN0rMyQ4nBFKySjXlHfotJWZ3K8OGtcMjRciqRgKUhDhvvBqKX/pMQF0Gs
         lEtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6shk72pp9CnnSU59LUkcdKutWoN4Tpv0VNxJdwFOfCelozYnt
	/Yl1GV6vG57jtHy5+MMIlLI=
X-Google-Smtp-Source: APXvYqweMGhYIfHeQOYocdiPVD3Eu2xCrQhajTJ7Mq6TjgO61xA9U3zUQIoG2ddHMWHqMossLK1CfQ==
X-Received: by 2002:a2e:9f44:: with SMTP id v4mr10435842ljk.72.1557650920448;
        Sun, 12 May 2019 01:48:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:558b:: with SMTP id v11ls876371lfg.10.gmail; Sun, 12 May
 2019 01:48:39 -0700 (PDT)
X-Received: by 2002:a19:3f4f:: with SMTP id m76mr10429022lfa.17.1557650919922;
        Sun, 12 May 2019 01:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650919; cv=none;
        d=google.com; s=arc-20160816;
        b=o7ShmyzPfCH/HDeYzMX2kXt20CcRcK+3KtxJFrbXwtsZZDRNootU2KBodk53C1H1FS
         CZ6XLBHVSNXTD3XcEhQk0T7sRRDpS3lo54l0gOfFBcY1pOdT2EBJftmhNUuqKG9mqL+T
         D3vwgz5ajNFrj+qzoJRAvTH1r3oyPsFjS3uV8tjVbo6oSVU6cI2oYuDg/OX6bXMCLl8V
         62rgcd8nIdO03vl9377EJS/mWowEjmKlo3CR4b+a11b3MvJpNVqFV6GzkkeyiyTx+XK4
         DM+24Gp6sBSgqAsmySOKaCD5nhFqqyHPpjmSEXpu5/O+vi4mDg40JEbL17K5LVMTDy5Q
         iyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=+UxKdGAYXZU5+xV0rOjKJVyDQHwcFKNasd3OiEFmvkg=;
        b=LOwkU8yQqOf/2kUReJmisoeT3N/TOur6NiJZtI/NOHLHEMpKND8adUbZLTouE5SKNG
         R1PTn3U0GP8LvCsCK+UJpOC8SiujG/GM06kMXGG+RPkSzoDpwi7AHXXQfEE8bOMnN0n2
         fzwYbXRO09Rc7STl4jkRd1bRnU6v5ZwCDly2iWbrp9i671fX1SJYnacsteXWywdv6xI+
         Pt5j13JLW7Y7Ifyx5tTDcSpGwsQ6zHp4zlbSzFBqp9kycxwyKZcBCmNmX3/TKs5NIi74
         W00SeJgp6QjlImjuovIm/Z/SgHJrN88ZHxxnQEpVTMr76+B9LKjSU9PYBGzadsvFDXC3
         86BA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=P8YKwESt;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l9si1920316lfh.0.2019.05.12.01.48.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LlayN-1goTnV432V-00bH5z; Sun, 12
 May 2019 10:48:39 +0200
Subject: Re: [PATCH v3 0/6] Improve pci caps config structure
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <14fc075a-d249-5397-c4ff-e28ad9465b9c@web.de>
Date: Sun, 12 May 2019 10:48:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:f46Ou2LzbnFDxiKXpIZCHNGqHTYUG23G8txXvj0E41ye79H87g7
 rJCoOwLiSEZzZhylENF3EaB9Xsy/zg7uTmjei7YakdZXvxHiTEHPJsy2t+Lb+qu2HrfOr6T
 wwU5yuUF7VpvQKlr1J8P+T29ZLzVXZZkzhh3RsmYs0D7/6gty5X8ZuHmWcJ5oOM6exAR+s1
 twA87sSnYkPOGp2WVtJzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ciTgXT1Jvas=:Q5Cv+ViHY/tdRPEpft4aNw
 I9VxnVQCqtW+l8rG7YcuJ5TtdJbqwURK0ohX9Ho1Gr74jXD7x5NHLeeEnAk433leQb/0MFb30
 EEDqsSyJWPM9qiNCw8hWf/ib22n32Q+7zkespTceS/1CMgRxkr4bHLVYRetdhGePEOgBsBWuR
 GS51QqIue0UVJ1nsEAPMmtshD44rVgGR+cmn4ZRWBIARYmZlJLYuLrv3TA19ocmlpuOeEm8eY
 MA6gz82OFItvzRr3CuxFVViaRXGsfJHY//ChhgoPDHnqtls1BJ4eOgu6IH/knOxGUUdydInnL
 4T1zp1nE6Aw2cSrLQvWS/aRreLO/0SOfgQ8RL24Iyf7Tnm4wu1zqxxImwB3zHLlymzbEkTPMi
 1qKjRpVNg75KhaWL/4FzzCS199DLWl/XgUV13kSk79L7rDdET2M7cGQ52HjR2hfOSUkGznxjo
 8ny+8WcwL4EebP4Q/64NI+SKCCgMcQ3iOtXZr8mterr2TVIV5oGf+95Ar9LF5blJDAu1E7zRa
 CtTppF4ew03wVzu0MpHM5R5rGlIbIfHmG2u4DBmNRTd9Ap9f4XweRO45i5QZHMJQI09qh5TlK
 ugL/AiXYC5heGVuAWMX2vEX1QoE5GqLCaFn6+W0AcXI2+MloUdDiIMUtTEvRooFlC8JJALDjB
 vQkceaPghU9xG1podDkM/QBrnz4hktLVd3clqdTAIe7TnEx/dtNiteJhn9pZ4ENyl//FA9Qm2
 KzCm6tfTfm8khpc3C1AwVWafkHMudWzR8Sqn6hlGO8xvqvk9/U59NxcCv1NdXI2NaK3NhO9mG
 LGd/gbXCDLd8IR3cXYZXleFu5qaA9cljFpIe1Bsmth4ZAlqHo67zBQtQ4HWpty3TJXk4YKWhS
 /F+O7nIxxqTb3PL8576ylZISi7qQ6NzwTfVFLp4NAVUjAdiWy8goOd7+vbp7YoC0uUQ9VoJQj
 L3ndHhEwMug==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=P8YKwESt;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.19 18:52, Ralf Ramsauer wrote:
> Let's use speaking names instead of hard-coded constants. This series
> first adds definitions on C-side and later improves the config
> generator.
>
> The series can be found here:
>    https://github.com/lfd/jailhouse/tree/pci-capsV3
>
> since v2:
>    - create new own header for pci: pci_defs.h
>    - directly use the generator instead of the back and forth
>    - rename __str__ to gen_cfg()
>    - Shrink copyright header of autogenerated files
>
> since v1:
>    - remove the ARRAY_SIZE patch, not related to this series
>    - Add a ExtendedEnum helper class that allows type-safe use and
>      generation of C-like enums with syntactic sugar
>    - Let make create pci_cap_id.py
>        This is done in Patch 6/7. If unwanted, this patch can also be
>        skipped without any breakages
>    - Align some hypervisor snippets, where we used alternative
>      definitions of PCI cap IDs.
>
> Ralf Ramsauer (6):
>    pci, configs: unmystify magic constants
>    pci, config: add more magic extended caps constants
>    pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
>    pyjailhouse: implement a helper class ExtendedEnum
>    pyjailhouse: let the generator produce speaking names for PCI caps
>    pci: use new PCI_CAP_ID_ definitions from pci_defs.h
>
>   .gitignore                         |  1 +
>   configs/x86/e1000-demo.c           |  2 +-
>   configs/x86/f2a88xm-hd3.c          | 54 ++++++++++----------
>   configs/x86/imb-a180.c             | 52 +++++++++----------
>   configs/x86/linux-x86-demo.c       | 12 ++---
>   configs/x86/pci-demo.c             |  2 +-
>   configs/x86/qemu-x86.c             | 20 ++++----
>   hypervisor/include/jailhouse/pci.h |  3 --
>   hypervisor/ivshmem.c               |  2 +-
>   hypervisor/pci.c                   | 26 +++++-----
>   include/jailhouse/cell-config.h    |  1 +
>   include/jailhouse/pci_defs.h       | 81 ++++++++++++++++++++++++++++++
>   pyjailhouse/extendedenum.py        | 46 +++++++++++++++++
>   pyjailhouse/sysfs_parser.py        | 32 ++++++------
>   tools/Makefile                     | 14 +++++-
>   tools/gen_pci_defs.sh              | 50 ++++++++++++++++++
>   tools/root-cell-config.c.tmpl      |  6 +--
>   17 files changed, 295 insertions(+), 109 deletions(-)
>   create mode 100644 include/jailhouse/pci_defs.h
>   create mode 100644 pyjailhouse/extendedenum.py
>   create mode 100755 tools/gen_pci_defs.sh
>

Applied all to next, with v4 of patch 5.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/14fc075a-d249-5397-c4ff-e28ad9465b9c%40web.de.
For more options, visit https://groups.google.com/d/optout.
