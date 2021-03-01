Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA6D6SAQMGQEZNWSIXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 039773286AD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Mar 2021 18:16:52 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id h20sf3064351wmq.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Mar 2021 09:16:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614619011; cv=pass;
        d=google.com; s=arc-20160816;
        b=HdTdxfycajiLqQYsYfBjD7X5577X69nCy95B7En0hrr8F4mAUXNtcRyiV04hZnW20N
         UMM5Vs+1CW4uqPkF6JCYg/hCAFmsBcbrQszR8PeSPl6kXX2l/NnfV22bUGPuCSetyD4Z
         hjntjbiZ60ozvGBoieVFXq7/eNiGnfO6HXb0VmcYL3QChdigRsDcgS4eUECayV6sZQGA
         rhIQyY6nGCyInkT9bnK9eSI3Ke17f0V+0k7e4GJze9VisGp7oKduMvr6iAn3WHy8xufQ
         PuEzmvc7MNu6T65c4FKzpkq3fFydm3P1D9r14jfwsvdCY2sNi6HOt9KQnIYOZB8TZLPR
         Hltg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=tvPdrpAkS1tLVBJzj66nL+VMf0yBd/Uv22T0DS/7RKA=;
        b=SSuVEWuv87QENF7JNAZQhCTC2ZQf/QM3nmrA9G5VPRTLrgDOPVEd76JVzEdEA3uUU6
         H+17hZiYy27WkJqCEUjcYOsfsB48cOGlFOMrL1fUjDPg2V5GIbjytDSs7F3bBiGod4fU
         WeC5YfXUtSYFa3nN958sMc/KLTnlSF/fxLp66Dvs7X9MvGdsgTe6uBk87QGtO9GD5BoY
         PvlDzrgFKFpYBS1Awb/JdLEOTJ64Ur5Ard6dMrgRI73qrV7O82qmSGvEsHlGm92GiB3Q
         Zmh42GEqr44/rtUfyL6JtfXwaoLE/3kMJFjt2PYt3FTfOzkQrQTlI4f/yuP5f4s0vrdS
         bYjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tvPdrpAkS1tLVBJzj66nL+VMf0yBd/Uv22T0DS/7RKA=;
        b=q7oyfDAbdiBzZzcSHAIaAVSApTA5oadpCKzvs7QOkMLdve2GGxdNnPsBzHe22xzW/2
         /yMeaBKWDEZExRkVHvVODqKJpvYSwlRxI1Ys7zim3xunh0Jk4atUPFCvuCFpx9zA+FCg
         gFr3sBdLsuOyhvAaeMJjH3LJligLFBA/MTzD/g2LLqkV8QwgaRa6NOgJIIF6nBS20p/Q
         5wYKnyB6SM3Chu74vgjQIBYdnCGYpyEJM3B8RrTTFGHtX2pdC3rQ66Y6cLADhXxCXmSN
         T2ef4IeeeD8tt2xBPpKrO82CicHHq5K3XFsemAsU0KC6YgY29MXgsoDqXLCr68TEQpfu
         MlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tvPdrpAkS1tLVBJzj66nL+VMf0yBd/Uv22T0DS/7RKA=;
        b=WFo0SAkI9V01VOI7Sp+z9VYX3uaNCtKmA255C1L7eLxrsbGPhoS7JzNUgyWNcJTVfF
         GYj8C282g5v18sQrEXNNB8kVEQYujsrxKtmJ4tL+ME0OIILObZyzauRfMt2Xdy2QLjxH
         h4d+kkD2CqynunHwBLfjJSm5EhRleVrwYoPxIV31KH7qUOHdClOpD4TReVg9Lwi3/k4K
         IVpDUYagCqW3gEmeOAl3XXdQEOyPBisEFU/yvV61GQtwJQ7LGJTUaJjNWrU6LG1DlrHf
         x+PI9BwGIqBy3ugIGlahzBqlPgZL1Ulg0zxCnti5A+EqNaTtNwPfyBELeqfgUk/ZNuGI
         +5+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325nx0poVA+Svg9C7kzvW53e1DzU8tsGSchvXz8W5kkUs3c9+Y4
	siEZw2aq+uQoAOqLejUqRxw=
X-Google-Smtp-Source: ABdhPJzpD7nJoIDG2ArtoG9cb6AlmSm6UsrATWgtSc+qsHZlyzxKIBTH7TYulfk7L9+rWCf3VBzegA==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr11316248wrw.268.1614619011688;
        Mon, 01 Mar 2021 09:16:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls12115027wru.2.gmail; Mon, 01 Mar
 2021 09:16:50 -0800 (PST)
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr17457957wrj.185.1614619010745;
        Mon, 01 Mar 2021 09:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614619010; cv=none;
        d=google.com; s=arc-20160816;
        b=sLe/2NLXSSGoBBlpOWAJyqLFHbAyyYe+RJ6V7aIaL14Ap9/B+BDoMnt8ch6FdtckZi
         F/bRkSiGhBjVsErT+YRXzjoRvxNTGveuFeD0FYA+UCNz1HTLaI6W0NjW9gw9gsUVC90p
         T9om9Ie/LD8TuuMF/HG/Ps9JxD/4BKmjXXe5Mx2gFK8TEH8H42BSgfqfo+cjFAtURjV3
         B/uQ7CscQiJQlNhoeBEc96s4nn5fudoU7H7q0BU/y2BCvE2jbAxmP6f3o76qFWSSj6bE
         YdDOOCxJ8tpAQCyweDvC6uAREVg04N508tQreyz20pgnpSt12VjSerR2fPd3bDPHv2LB
         2Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=14LsaC7yWmG7EhbztisPm+PvnzsZVuuoRuU/8dOHFKs=;
        b=EsLMl58Cm2l6gk7XZn8fdjXkBycYj299p2xUWJnXPHUpcVx+pCpXJQMhb0vnBjOujV
         De62ii3vDRVWV3SjhMI7NnyrF9Cnn86pEiBarENULTMj8OU/7LjFIc4ZB1LYyHDTwmEd
         M2oXUYp7/XhkcIOwaJWHYuiJhWZpTbXPZSlfSeOjEmObrcMLNqB+nsrIRWnsNJXZvPw2
         aqN01TUF9hDI9VVIy6H/VEVwt2leHoWyGI7+zByosJ2ZSxm4jKtbzsqyY5AVLzXIJidH
         v2ASPTJs2fa0vHjE9ym4Gs/xUyLzRl4bW788uOD6B9e5XP8uveUIbfCBusf753uUvlUB
         OlvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y18si777637wrp.3.2021.03.01.09.16.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 09:16:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 121HGokZ002965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Mar 2021 18:16:50 +0100
Received: from [167.87.94.143] ([167.87.94.143])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 121H6nij027429;
	Mon, 1 Mar 2021 18:06:49 +0100
Subject: Re: [PATCH v2 0/3] Jailhouse: Add DPAA support for NXP ls1043ardb
 platform
To: hongbo.wang@nxp.com, jailhouse-dev@googlegroups.com, mingkai.hu@nxp.com,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com
References: <20210205085509.21595-1-hongbo.wang@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <48353991-fb1f-4c7e-fe03-705f295da434@siemens.com>
Date: Mon, 1 Mar 2021 18:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210205085509.21595-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 05.02.21 09:55, hongbo.wang@nxp.com wrote:
> From: "hongbo.wang" <hongbo.wang@nxp.com>
> 
>   this patch-set is used for the case that non-root linux cell own
> all DPAA1 ports, root cell don't connect ethernet via DPAA ports.
> 
>   if user want to non-root linux can connect ethernet or cloud
> via DPAA ports, and need high performance, can choose this.
> 
>   inmate-ls1043a-rdb-fman-ucode.dtsi is fman ucode, it will be included
> in inmate-ls1043a-rdb-dpaa.dts. 
> 
> v2:
>   add separate config file and dts for non-root DPAA case
> 
> hongbo.wang (3):
>   configs: ls1043a-rdb: add DPAA support in cell configure file
>   configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
>   configs: ls1043a-rdb: add DPAA fman-ucode dtsi file
> 
>  configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts |  930 +++++++++++++++
>  .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030 +++++++++++++++++
>  configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   |  212 ++++
>  3 files changed, 2172 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
>  create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
>  create mode 100644 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
> 

Forgot to note: All merged new into next.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/48353991-fb1f-4c7e-fe03-705f295da434%40siemens.com.
