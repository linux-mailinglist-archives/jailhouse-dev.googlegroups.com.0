Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXGO772AKGQEIRVMLYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id E61541B37AF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Apr 2020 08:42:36 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id f15sf586711wrj.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 23:42:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587537756; cv=pass;
        d=google.com; s=arc-20160816;
        b=l4qYea4ziDOfvEPlYi0/PdVqrqYzIBJIczE5Xx1cCSuQebLTChmLy5m1+1O6L6lgiD
         aPhuhT8C42QIslf/TN4jgu2drLQH9Zg5vL2zkgYSWYfIT/cVZOXe+xu0p16yzUfAGcJv
         +SIKweNeTeCosoVyLn6iQK4Bb+7KuIui+X3oFc00g+M8bpJzhgD78bf+/Y8djvcWAFOj
         qV1rre3Q8f13eTNA4LzXCx6whszE6UB9Tsi6LIqNVbOm2BzYeZN3qtCv0GPSRonLBXJV
         XL7Z4xKKAfEjTxTiCmb3kx9NVHvP7fvYdP8HJWB1WNK9OuwkrIY7C56uuFNgyRNSING1
         xb+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=m0vvZ40PieL6TyTk+F+qpQZI4U0JWJsVtBsqBAL0x6M=;
        b=q3t65UuvGFgwGvdUKy454fEAGV8cSvDMs4LRPMzUekW2rO3plb9pHVDl8oAyM26EmD
         8JJnnOCfQiD1ube2QO+SyoSB/WvVzVApivXB8UlHj3lkSGn17IMAc0FndkdEWcoKETM+
         TvZDVpvzB3JMauLaarr+kCiMV1XiYif45tzxycLGpJQZ7oDVoljEUJvjz4pTVDmv7Y0G
         mPPf0b7hx5vHuNmaAzXPTFaaWakwO6YwE3+uMIDwsbPGtG3tGX9o7Jhk62GuaCUkran7
         V+54S8kgQCF57zpAkB9Tbztil80bwERzbkCMgxVV2Rfv4cP2F5kN2aa/gYbBxPj/EOzX
         go8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m0vvZ40PieL6TyTk+F+qpQZI4U0JWJsVtBsqBAL0x6M=;
        b=RARwzZQ8pcEruVeVwnC86nd9WeNUtaOu4Tmie9R62aoBuPefcyibam2jSWh/I+j+E1
         D5UG/uuCI3UPXeCz6lqnq72MR8qK6mjWgKwbh9J7x4SPiKzjuP3RlF3jwNpe4OBvFYXZ
         qhaFrYqVGwMmEmTNlnWQAFkfbSpAFl6OgzH7Gt+lYZAVVrY98MNMduBEDuKYNUSlhNrK
         Dvsg4SuQ0caqq8BYWN/PGHb8XZn8U0NhGTu430xTC7W6c3P5Dx1ySo4ys63/RBeko0XZ
         UI8Dl8hXETomOGe/H0vpBmyorhWyPOXQI6L5Qrb847vk5Vx+omtNlrsBZqWe46TOgE/e
         Zc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=m0vvZ40PieL6TyTk+F+qpQZI4U0JWJsVtBsqBAL0x6M=;
        b=mk4Rta2q0+Ik7VCP8pIIqbCRaDQggQQGCOL1ne+4JOMWsovZnaCOXeGEeIu+HSPwuC
         kxKanHwmnDqrTIZgidMREvSArZEXua+UKyK8ZxhfuzPsifCsintBksSiqEv9VzmMD1nN
         g3C/KaOgJLIHSFJZQK7xITZTfrl5HXP+I32Xf8lH7aZY49QqxD5cM18hwRjedNTMP+ar
         drwPl37vNaHAZmprBAeMDOfSc6Baf3KCdrONsZmU9rosZGkR16jzC2u8WQ2VFCL9UTav
         uQSOtx9xg7v5el2boXzcEvV5/3pePVHNeumg9WbPDMFoIzr4WuyGgBx0Jjs3kfz0iSYz
         Civg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubQJh+VzKbjU/NW7GQoTvhHosY192w6U684reCxL44vpKocdJGf
	X5SklmYh5S/WUjLw3g6ebFc=
X-Google-Smtp-Source: APiQypJFFqVpKWpIeIOtsg8xB4sEEdNGwG6h6uInlcvVLid6jZIxXga0vgWiiDVxq8ECsvNwdHLwkw==
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr8705475wmj.55.1587537756496;
        Tue, 21 Apr 2020 23:42:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e512:: with SMTP id j18ls877804wrm.9.gmail; Tue, 21 Apr
 2020 23:42:35 -0700 (PDT)
X-Received: by 2002:adf:b6a8:: with SMTP id j40mr29615844wre.255.1587537755799;
        Tue, 21 Apr 2020 23:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587537755; cv=none;
        d=google.com; s=arc-20160816;
        b=1G1Zf/u/NrTn4Fury0Ni0AUwHlI19xpVBYvf7pST68V7AUDaWn8kHmHb/T60wDrYM1
         MiEPY5X4yDkhdL81yOZr+f+uXpJJyp92i/ea9LYHy9FuxBQynS0+pSP3fh7Wow/1obnu
         fT4ILtAxn/5o+aoP49CgGxXqanN+NbDsnT3LR6ykBZex72g4aCXrUHKle3LAD3h2fklK
         sVjXhG5gJ405zQL0fzK9e1YTnGSVNN5RELiObn+VKB8OKkKAs+s4C48NuHF1pcQlOc9A
         NXVPfPNYPy5x/WFqTgR+DOAjXjsow8cPjUGROYmbCDtpkxlZDe0IanqfVE9yUCLna07d
         WZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=A2Zwyx2tFtNPLPJGwikCjvgLqX7jw8hXNPzSDAwZQqs=;
        b=scdg+avuWHtYUjxTGZPbMZmplzf1LWk1nP0drzQazSaM6a1zcyeqoE3GNGEFPym4eU
         PXDEm+kOyEZPujcHGyF8BDdTVo6Vf/XodEA3bV03Co0VyJlhD+XWVG1GhbCIYqJdFum7
         6j2Y2FbCsrszwoe0wUCJxtoy2MIwvRMzvwYT00bB8soAkH5DhIBc9hY6fVIXBmmw82e2
         EikztRMEoGvPA2igfDw/nvZCMtk6bXJAL3P65eq2MO7uU8AgJzlBaoRIldSp3rTbGETP
         ABkepEu/4czeLP1GInrOrAHhLmFIX3MyZ+RthK/AHo/tZR5c7xUekgx9fRel4IVSx53j
         p4tg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u15si292158wru.2.2020.04.21.23.42.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 23:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 03M6gYDc006218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Apr 2020 08:42:34 +0200
Received: from [167.87.33.221] ([167.87.33.221])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 03M6gWmM031896;
	Wed, 22 Apr 2020 08:42:32 +0200
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: marko.bertogna@unimore.it, tomasz.kloda@unimore.it, giulioc@xilinx.com,
        claudio@evidence.eu.com, fabio.federici@utrc.utc.com
References: <20190327121849.1882-1-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
Date: Wed, 22 Apr 2020 08:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20190327121849.1882-1-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 27.03.19 13:18, Marco Solieri wrote:
> Predictability of memory access latency is severely menaced by the multi-core
> architectures where the last level of cache (LLC) is shared, jeopardizing
> applicability of many Arm platform in real-time critical and mixed-criticality
> scenarios. Support for cache coloring is introduced, a transparent software
> technique allowing partitioning the LLC to avoid mutual interference between
> inmates.
> 
> By creating a cache stress environment with a memcpy bare-metal application or
> with the Linux "stress" tool, it is easy to measure performance degradations
> caused by inter-cell interference, e.g. running the LMBench micro-benchmarks, or
> just with the GIC demo within a L1 Instruction stress scenario. Once coloring is
> enabled, instead, predictable performances are restored. Reports of extensive
> benchmarks and evaluations on real application are referred in the
> documentation.
> 
> We thanks Tomasz Kloda and Marko Bertogna for the prototype logic and Renato
> Mancuso for suggesting low-level design improvements. The EU Horizon 2020 IA
> project HERCULES (grant no. 688860) supported the initial implementation and
> evaluation on NVIDIA Tegra X1 and X2; Xilinx Inc. supported the implementation
> and evaluation on ZCU102; UTRC supported the testing on ZCU104.
> 
> A bird-eye view of the implementation and of the commit structure is given.
> Some coloring-logic fundamentals are situated in the 'common' part between the
> driver and the hypervisor [1], but only the latter implements the whole coloring
> support [2]. The hypervisor also exposes a convenient interface to ease the load
> operation by the driver [3], who implements a simplified memory allocation
> support (only colors have to be chosen) [4] and extends the configuration file
> support [5]. Examples root cell and demo configurations are provided for Xilinx
> ZCU102 [6] and NVIDIA TX2 [7]. An extensive documentation details the technique
> and gently explains how to use it [8].
> 
> Luca Miccio (8):
>    Common: introduce cache coloring primitives
>    Hypervisor: implement cache-colored paging for Arm
>    Hypervisor: add hypercall to ease loading of cache-colored images
>    Driver: add support for cache-colored memory configurations
>    Support cache-colored memory configurations when loading Linux inmate
>    Configs: zynqmp-zcu102: add cache-coloring examples
>    Configs: jetson-tx2: add cache-coloring examples
>    Documentation: add description and usage of cache coloring support
> 
>   Documentation/cache-coloring.md              | 330 ++++++++++++
>   configs/arm64/jetson-tx2-col.c               | 529 +++++++++++++++++++
>   configs/arm64/jetson-tx2-demo-col.c          |  76 +++
>   configs/arm64/zynqmp-zcu102-col.c            | 153 ++++++
>   configs/arm64/zynqmp-zcu102-demo-col.c       |  79 +++
>   configs/arm64/zynqmp-zcu102-linux-demo-col.c | 137 +++++
>   driver/Makefile                              |   1 +
>   driver/cell.c                                |  56 +-
>   driver/coloring.c                            | 239 +++++++++
>   driver/coloring.h                            |  52 ++
>   driver/main.c                                |   3 +
>   hypervisor/arch/arm-common/mmu_cell.c        |  27 +-
>   hypervisor/control.c                         |  77 +++
>   hypervisor/include/jailhouse/paging.h        |  11 +
>   hypervisor/paging.c                          | 168 ++++++
>   include/jailhouse/cell-config.h              |   9 +
>   include/jailhouse/coloring.h                 | 151 ++++++
>   include/jailhouse/hypercall.h                |   1 +
>   tools/jailhouse-cell-linux                   |   5 +-
>   19 files changed, 2096 insertions(+), 8 deletions(-)
>   create mode 100644 Documentation/cache-coloring.md
>   create mode 100644 configs/arm64/jetson-tx2-col.c
>   create mode 100644 configs/arm64/jetson-tx2-demo-col.c
>   create mode 100644 configs/arm64/zynqmp-zcu102-col.c
>   create mode 100644 configs/arm64/zynqmp-zcu102-demo-col.c
>   create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
>   create mode 100644 driver/coloring.c
>   create mode 100644 driver/coloring.h
>   create mode 100644 include/jailhouse/coloring.h
> 

Thanks for updating this! I will refresh my caches on the topic and 
provide feedback soon (I already have some questions and remarks but I'd 
like to double-check them).

As you likely read, there are better chances in sight to also address 
the root cell issue by booting Jailhouse from a loader. That would then 
leave us only with the question how to handle the hypervisor itself /wrt 
coloring. Provided that can buy us worthwhile improvements.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7e92c41e-12a5-28fd-b1fc-4949e5ccac20%40siemens.com.
