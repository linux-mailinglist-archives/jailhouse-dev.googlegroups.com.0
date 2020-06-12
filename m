Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7VORT3QKGQESPAOPDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id A35611F739C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 07:49:51 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id i199sf2274599lfi.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 22:49:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591940991; cv=pass;
        d=google.com; s=arc-20160816;
        b=efj73PlUV7JObULf4wqI2vdTKU+U5Xrkp4wtXhNQCyxM/2hOpKy9SYq2TdqGegS5Wm
         UFQ2Sm6E5wJ6mnLzi0W6m13rYUZ7PFZtdz+yPxi61O8y4FTnHqf4Fr/IM6UVmyF9rLwK
         z5MnQY3FlwoKxU+HD19oYWOoyr8uKBPy3UbDDtDHJU+X6sVI200zooFHOHbZXdYABwII
         q25Hd5zUBiORtO+PvWT3Jc4F4omcoWJmxof+su7GSMpvGMqehJDCGHVL7r5o44/vIPxJ
         KfVrzjT6vm6RweQc0652cmOaUKrs8Q5YncqK8g7mqY0H3Gh29ePitlzuRYthwN/b30Ru
         mLDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=LxXJX5GUpClvmsEfADnVOGimWqmi49prI9SrfYoOio8=;
        b=TdUfL4DmuzlIzTaav4AZc8p8pY5mpp53HFaYOdaY6tVgsJtTFlPQ1E4sh2KqYiC1Q8
         3kyFrnhJuGc+FfyyAv2Z5k8dKJeZXG0E4SZRgkYfZgdKAJSvs88mORpdFwZDfddnQjHc
         Wpbun1HL9NWtF0ku+B5H1id67P3hHsfAgXEr+pna3uA26DwDLwZaXquVzKaWXzUJTmNi
         Trk5FrOvFsj6MPBBmu3pwTa5e/sWu2bmpEgMnDXHRUZuLgt0NiERSzjepq2Zps6Ea/JK
         PbsKj8B0rAClKz1RQ2rSq/vslJShNlEOQcp005QPEjj0SlM1gQyEW1N3OLxDEJbqJjs2
         xT4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LxXJX5GUpClvmsEfADnVOGimWqmi49prI9SrfYoOio8=;
        b=GV3E6Fwd7uZWBkw8EairKRcyvtAC/Eq1dXUusgqysj8VMcRVB0AKJvc7FF2K8aA/iL
         uatyyRYnCCv3S2CNGn/iLr87i03BZDmRdW2hm3NDjj8W1gmZC3k95HiEuYtTxmximYHr
         QfvLMByE3x7erXsFch7EKBRrh+7+lRrz/UvxrscewitUTfKZdOb9hQeaugsbECZCutCH
         ynCtnnyE9uFYG56jnVb6e+YuQFPVnxdZsxWtBr4hjA4VODQq5d8xGGUxozqDwhwHf//T
         AIRObccmZJuclLhD//pXox9mLE8NiqXb5OmsoZ8LSwFNxuPnaG+pUEAQ8+z63ViqOZta
         vJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LxXJX5GUpClvmsEfADnVOGimWqmi49prI9SrfYoOio8=;
        b=GHp+O4i2eapbq2KEK9uS95JYRoFr69g7afuDHdJvBavjGO6KgKMrf77TryH16VJ6FX
         coPLemmGRYxt8OCDx/lYwEuRaALAuzTLujLXZfivAi9dbk+8cjPsJxhG53P4cC2eUOU0
         gps+39pikR3Bm9YxvLJHl6GXtATwfylw5IdD3ddoJZQdbHRYKNQ3UlvKIwaJHAmMkqtb
         yV47J9aO729OI+cR2gK11OpDd80Otx0SHrUVr1/N6S8Fkh79tgeSJACot8kxjatn84fc
         7oUmSbnVtHnMTETZuTJaof/eJWW420F4Dv0cUM5yV1VlWQPxtIWR9x0RU+tabtyrVC2R
         KVeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Gqp2RNGh1wR5+GDjdGqqqVP21SBcygnqH/1X0P1xjK2RX9i0y
	rrlNeNNkVgO6B7DKWadXMc0=
X-Google-Smtp-Source: ABdhPJzKAPGemJTacouymjUUW7oyswPRf/AI5ah9anOfoIAbY9HhkZDAZ2nw9/zMWQAKgSMaNKXA/g==
X-Received: by 2002:ac2:5df2:: with SMTP id z18mr5924679lfq.151.1591940991138;
        Thu, 11 Jun 2020 22:49:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a02:: with SMTP id h2ls953064lja.6.gmail; Thu, 11 Jun
 2020 22:49:50 -0700 (PDT)
X-Received: by 2002:a05:651c:93:: with SMTP id 19mr6268296ljq.245.1591940990266;
        Thu, 11 Jun 2020 22:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591940990; cv=none;
        d=google.com; s=arc-20160816;
        b=p1k7oonflPib7NpGQ7769u3z+MyKOZxnxy+IBHwsPuAphMlizcDqn8ID6WnwP8XofQ
         mcHEqgRhT7RJ+XjjlaW3wwNtE2gXA3h4MdceYmSAEha/ksHT561bhLJZIlOPzF3G/ekv
         ppgKHP//PYL4N6TnNHBsSSFSg8pjSj8PwzQH46nvsvVLtGRC4MC3I8WXTgnxT5lNN9gb
         Q+441bzjHy13DR/NoAifLlu6DaipznVOaOmgPPcAv+2KY4qd1RWLwpUpug3Axc+QkHhg
         vkt6J8WH7CHY1dBsDVvMxlQqxpTNfUfetNIO7egg1CqRzsM3DyxjG6dMb72PLWq+mQ3J
         jmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=97MVNgON2yfY6pse5t5MJSZiM1XrH/0Vh05Bm3Rl2b0=;
        b=zgilePp5dgwdK3vqh9a7z5/KXzqV6TDrJdyDWr6kUN972B9knWTRHo42TSogJsGZA8
         ZzZNUvQVl0Amf1lrYpjoB271kdKH+vaijUG6oeWnhm2jb9Rd6nIePk14RS+vaszJ0dcS
         KZGCy1DuGf94L4eVscxLVOHL8BeOEVZLmxJUsYGzrkOrj+Sf2HVNxKqm501PPT6U/ENL
         eZsXSv4/EsVU9kdK+bxBWQeAp/R5UpCFlGOC5yXkhP64BWHHAYYqm2vfs12RvP+fQjpR
         GgtY+lSuhzJDlMPRkFAAcF+MwbaUglbERYgbtNPmWYbx6KxORsloLX59RuCixThA2y2p
         /qjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 130si257606lfi.3.2020.06.11.22.49.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 22:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 05C5nn3A025810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 07:49:49 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05C5nmA1002362;
	Fri, 12 Jun 2020 07:49:48 +0200
Subject: Re: [PATCH v2 0/3] configs: k3-j721e-evm: Fix device partitioning
 issues
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608103548.9040-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <74c56bb4-77f2-c96f-859a-35c7d320f6d3@siemens.com>
Date: Fri, 12 Jun 2020 07:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608103548.9040-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 08.06.20 12:35, nikhil.nd via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> This series fixes few issues with the jailhouse cell
> config files and inmate dts.
> 
> Also, remove some obsolete device partitioning
> which is no longer supported in the 5.4 kernel.
> We will add only when the drivers are upstreamed to
> mainline kernel.
> 
> Nikhil Devshatwar (3):
>   configs: dts: inmate-k3-j721e-evm: Add pinmux for main_uart1
>   configs: k3-j721e-evm-linux-demo: Add USB mem_regions
>   configs: k3-j721e-evm-linux-demo: Remove unsupported device
>     partitioning
> 
>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
>  configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
>  2 files changed, 27 insertions(+), 64 deletions(-)
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/74c56bb4-77f2-c96f-859a-35c7d320f6d3%40siemens.com.
