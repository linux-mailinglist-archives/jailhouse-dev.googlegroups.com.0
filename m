Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBE53T6AKGQEBUKER5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C21342994AE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 18:59:33 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id t3sf3100758lfk.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 10:59:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603735173; cv=pass;
        d=google.com; s=arc-20160816;
        b=SWDSGE+mLXD3K5k0sJBHOIhLCuvuspNdgcwEhxG16cU1EFL9x6Qe5/3hUwore8HsFe
         8lXYKacqSEW2gLjvoABzP40a5Kt7v3J1QrFLh+tIDDIxl3Qxq+38zfPZSHjRv7N1Srmw
         1UK5kkG89akhszwCDeeHdbvqGyG85BHHwD+MXG15+uyyRLyThlZwQJ4cXAMwdTtjFg5j
         t3pVxqBicEN307aKK/KYBb34BWMJ46j9aCg8TS44v0Y2INncLyteUXI3cHoLCr1XtY9x
         1U6UYMmH1sJ4Bk7fMmRKFDlHmcG8D22i0oW9A0jFPRimAYqAMOMxfnrp8noC+P7CvxMQ
         Cszg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=GcedRbc7Hi/iYysuZCo+gnbqQeA4uExfN6X/FpeBRtM=;
        b=hb9zqUOMioZue9cfz4S/+hLyRslluhFNYYYh6DqJ4VU5l4aFPeYu4INVfD+22/6su9
         MDl23ovpR45p4a/TB7Y3BKV52filF3M9yD7oH4DbZ5MoljTmzlThBpwnupsd24mTBLuo
         I2OrjJ7KUMGFNHLiygSSEEypx9YebruSud1KCI9NAAVVElwtSSXAKtAWKhCkq+RmF2Fk
         J/FYlY9widbOGEnkeNDVUl5jqoqj51PqfEzH6G3oLYvXK3yufWfadsydhwXojgKFE7Nj
         2xAFIJ5cERu9Wf4UecQF76lGOxAObLWFIdxDtOh5wznjJsi2TpCDrW4bcG6w+CAPs+ta
         iJBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GcedRbc7Hi/iYysuZCo+gnbqQeA4uExfN6X/FpeBRtM=;
        b=ehAr6duk96iTr0cKDNDytaSgRECCvmOJG7PaEoarlsDNuX757TeGdDJEVVa98kRdAD
         UDpRFxbQ3R/e8qhRcZXFeNrUzZtoG+KvmfDV/0Hk94/wYa+iedGFaL8tjuMN4ILCYsI4
         t/v52S60sYjTAJuHMDpglK6Y8dk6lUcJwV9OeMVgFcLBfXWzyNYsMb4Y+r5yvwkG82L/
         KM3OoBWY3MHiOPvhl3Fy/GiiMRRoxmSEWrZKu6HBFEGm7QQuUfAsjsihx3zeudZ0kJJZ
         qrCyO16TAGx+ySFPiAgbZcB3o6fpFVkWhFJPEp4IILdj5nNGfkI9IgOYK9FZUcb8MnFo
         cN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GcedRbc7Hi/iYysuZCo+gnbqQeA4uExfN6X/FpeBRtM=;
        b=Pr6bPwx5yO5slSN/0YZd0xriKc6m8JQ6s6DRLIX7rboP7x9Ii5IzUldfGWcSi4iIZB
         jQ1ZVPZnWRRXeltXNm8cEl54wB6oLcx4KKUPu/2HQnmRblEb2af1viiXaf2nuARzjpYt
         KmrDCZ83/CuKWmWWoAFFPy3JUQLKeHctaNen4EcVjXPAZwEPjxvFUPX6+M/R82527+rB
         c2fXxCicdgJHC3DarS9Hfw04Uvhz2yxaV0jxp6I5ZYbFWIRevj9uV0zYcOHSK3ojoWB+
         Ngzqw44M9OiWE/GL6p4OvRSBj4SBnTkM0A0v8/4cgxIE6fFTAjoPJcJ8Mjh4otMda71F
         iS3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WidSJvopD0bTuwQ/itO+vJcX3OB4y1X7H39wZiHRhwxElYFZA
	jTsAf6p+prDNRz8RqBe40B8=
X-Google-Smtp-Source: ABdhPJwAGlA/ZIjuviom6XVo7o18jyNfxVZfGl1wvocCZdmriHdeK9iIM2hGS5TcLcQ3o7D6oImyLQ==
X-Received: by 2002:a05:6512:34cc:: with SMTP id w12mr5308666lfr.326.1603735173274;
        Mon, 26 Oct 2020 10:59:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls1621583lji.10.gmail; Mon, 26
 Oct 2020 10:59:32 -0700 (PDT)
X-Received: by 2002:a2e:7206:: with SMTP id n6mr5908621ljc.279.1603735171960;
        Mon, 26 Oct 2020 10:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603735171; cv=none;
        d=google.com; s=arc-20160816;
        b=hZXYv7uLwKG9oWFeG/wnF2yLAI70Pc3z7T1WfN3GwnVoTU3BfBbLVhVd7Nr8s85TLg
         88ti2Fh6RAwJsEwXGtR5sor54eGm15vL+A3Tu1OU6vLA45O4b6aKiV1ZLeR4IO+zj+5x
         dpFQoQYuW8Oo6E09x0M6u5hZfFFNG2jviDFAgEKslDAjiy+gYSKlb1CGF6vHl9zwdBbe
         MgIRUYk2lYIr62zCnMGeUvGn+GBW4PEQkQz1TvjqB+5AiPM3bC7kM/wCZBAJO0No4IIN
         /NptIHlYe3mL3fAQBNkOLyU1ACBFpc3WoT9IjaMSPGGgEZdao61fbxg32HDzrgDARA2a
         XdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JSukMlq49et/Jt/CDkTBP3qdHdOtwDPUHGKobe2a8BY=;
        b=sNjIQmlBkQXlfR/8TG35A51Gcnh6WYvt9Zbt3uufdRziEEFIQL1jF8OR/3e5qr8QOC
         93hL/TDCsrznZcQ7cIXYwV2Q4i5c9iXAYukigVo9jixyUcyFlq38hPtbdhrAalA20405
         8jGA1v5Juj6S8cL/RDYM9XYrRoz1LP4GB/yUMQ2nTFUjazsTYWHXA4ju7vVxiYsGsX16
         2BeCGmonh9cC7c7toHV+clwWVLFFqTVBZEPbYFe3fyVxSdTQULFUDdUlIDnWSuM9dXB4
         OcLk0Gu2JrjVLLuBPs7a9x8GaxzyhEmEv+VqPHDMdonCKn0ARs6XJzjDPbTqEdIeoq8T
         DMWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b28si75959ljo.8.2020.10.26.10.59.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 10:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09QHxVJM031377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Oct 2020 18:59:31 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09QHxUv0016225;
	Mon, 26 Oct 2020 18:59:30 +0100
Subject: Re: [PATCH 0/3] configs: arm64: Add support for k3-j7200-evm
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20201020074525.7941-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0e94455b-ee96-d076-9ebb-d4c9a6f0a249@siemens.com>
Date: Mon, 26 Oct 2020 18:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201020074525.7941-1-nikhil.nd@ti.com>
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

On 20.10.20 09:45, 'Nikhil Devshatwar' via Jailhouse wrote:
> J7200 is a new SoC from Texas instruments which is targeted for
> automotive networking and Gateway applications.
> 
> k3-j7200-evm is the board with this SoC, which is similar to the
> k3-j721e-evm evaluation board.
> Add support for root cell, baremetal and Linux inmate cell configs
> to support this new platform.
> 
> Nikhil Devshatwar (3):
>   configs: arm64: Add support for k3-j7200-evm board
>   configs: arm64: Add inmate demo config for j7200-evm board
>   configs: arm64: Add Linux demo for k3j7200-evm board
> 
>  configs/arm64/dts/inmate-k3-j7200-evm.dts | 351 +++++++++++++++++++++
>  configs/arm64/k3-j7200-evm-inmate-demo.c  | 128 ++++++++
>  configs/arm64/k3-j7200-evm-linux-demo.c   | 238 ++++++++++++++
>  configs/arm64/k3-j7200-evm.c              | 359 ++++++++++++++++++++++
>  4 files changed, 1076 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-k3-j7200-evm.dts
>  create mode 100644 configs/arm64/k3-j7200-evm-inmate-demo.c
>  create mode 100644 configs/arm64/k3-j7200-evm-linux-demo.c
>  create mode 100644 configs/arm64/k3-j7200-evm.c
> 

Thanks, merged to next.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0e94455b-ee96-d076-9ebb-d4c9a6f0a249%40siemens.com.
