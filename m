Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCVGQ6DAMGQEV22WUPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00C3A2777
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 10:53:30 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x9-20020adfffc90000b02901178add5f60sf575597wrs.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 01:53:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623315210; cv=pass;
        d=google.com; s=arc-20160816;
        b=l8QzZgiHBgoPexiFUb5dx9JOOa4jhl1rFaX5iE35GBoowcGRYwJpCw1vKD/yfQlSZk
         NDHNjYYd8cRqV0g3gZ5Qi/3DzfRbdxyxuuDrCxOYrJxLH1LBL0L1zBD7wwNEyBEA9sIt
         42nEI5BFyyslQIBVtTekAubKkk+MfUjEOZ0tHNRk4kyM7wLLjGv60q/w1NYd1l1DH9lI
         mrgfZly/ROwGv9BDWufKdJ4UC/g7hbqffhTE9MSW+3DsaPJ/f3tnyRumJ2kIZLG5jmXJ
         w4PmrH6DTK7MiWlphrar6h4xUlfWL5ATDbTRQOuL0x0yWPW41yYu+1B4x8eF5vE0dTKV
         MqXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=59extwKwRZTkHzmShU+fLW6ocg6FEKCFODWLqFjDCPc=;
        b=ApFK0MxHhAj1rZaMIl0qB4rk3t3U1+Xx7nxNmzPvUAIwxAn77JSD2tNGB9kYhjjX7l
         AwMmfw079VOV8sv7OT/hYmccdPAU63m0iqXRhmiEqQQpACsBdrqRpiE8BYdjmCdUIGWA
         eJy3C8V3bCTG0fSmikPjyq4UtetcO+kVYRe0ByMjdOzJi2ZLtGor+KfFjeTRzJ9QXi2Z
         Sce3DH+Y3a4kfBdkVtqJlF/bfb31zT+MUmj+gzikuC1DlPiv1+7QwPSRvWDbLhxYyAFV
         hI+D+ufpJHY5Z8CmiDPN3IkUPNMVblmoY+yEnYsHvlm4+gMTYZDTV8/tIoHWI+qjo4WC
         CPPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=59extwKwRZTkHzmShU+fLW6ocg6FEKCFODWLqFjDCPc=;
        b=mEErnJ6iMCtbkgCE8gAciMwyhh0FbkORUc9c29M407uxmCgaSPxh8Ta3MjVZ9SDW1b
         tC+aXhH0b2dgVkYEHQr4u3IOD/3j0BXB6AM3zLiR8wfJcge70N9qRNmawL9uWBwQJ7ac
         J1U674K+R0SS7pVzQaFfUCrCfsLBm1Ya3qXO7Zll5CQMnzaY0DgkoljT9JddEd3ipqAK
         2gCw05TKCSTCp9LFHtahHSnaWc3lPXsIcQe5eoeX1lqNthz6cFDMucloviZIwco82Vd0
         I/RgRf433kUIu+1q+v5kMw8A+BhwIiB/blhM7APAWzmwnCjgQdLlPDx3gRhoGhcF2d8y
         9LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=59extwKwRZTkHzmShU+fLW6ocg6FEKCFODWLqFjDCPc=;
        b=G9fG+sj35W7+fIUbLwLsoCLIbQjARzT/8K2VXjB9xmaYxcf6Kj4zmD1kCEcWrs+7Li
         eda3o622aEeVoqhivtP0Qgmab2bIIY4ED8WosJcFyd6pxLEekf8HHhbFE2v34f8CFA4G
         rZ9vTYObi8a8FeQAxS/HHp7MWShHKCugtbkAkpq6khrkTHYqiWRILCQuz3xepQIsjzgP
         Yzd1gXH5BKMYLij7YblHHWC1mhYFERzk3CSLuJG1+zkYtp85j0eIniMUPhlzN/NJtxkG
         6og476UhkuSs7zatEl5zXkUg9LK3GapgiW02PnHfyDjQU2Xus7cgg/Fb6mwCxhqS/iYL
         hULg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53370sLBhZX2/YHybjCdrX4qmWvZJng9hc+NVXMBjyYM8BoZhxUS
	lXFj8pkTQN4pjxaualGsdgg=
X-Google-Smtp-Source: ABdhPJwYfKCSESPNWnRwPPkUhRDW24bMcv/U7xC2rBwaEl2ocxsklIOPCH3yvatRk/oAwjlLMRCAkQ==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr4012610wrn.217.1623315210727;
        Thu, 10 Jun 2021 01:53:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:358e:: with SMTP id p14ls854884wmq.0.canary-gmail;
 Thu, 10 Jun 2021 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3790:: with SMTP id o16mr13936984wmr.41.1623315209763;
        Thu, 10 Jun 2021 01:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623315209; cv=none;
        d=google.com; s=arc-20160816;
        b=BrX9orLQnKP8bH05Uh3/suhmBTAO4CX3NS7dQ60aK8v/K36JeWXeKfx1ThLE0G0U+4
         ET5oC9n9YYfphtMjdMEM8H9amKWUEwTURG3xTEHOeNx3OU6/O/7Z4WKvR3nfXD2Misjp
         lvWuID0f4Gscby/puSc0Ql8JJM7cHh4xptMJLCKA/e9q8T2ZSANocjV3d0SWczWUheTh
         syxbz38mhBiUpUVchKGhn7Pgx8Rx6beNseZj/gwOZhjzqVG3dOzmkIzn/clU5KBTZUZL
         G5c25C+/9RL0WVCcvj/YtY7Kn+CNeQTUbLHEYl4RvMRZA2HclI4zm3/6uCMsCq+M/46k
         wDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=bQ+0KxUhGsLMbONT6tgKvJJpnmj0+UKgz32E8ajq7dg=;
        b=CfTWtX/0k5EDwD33iVZ4rlukKmDj/UJHapKerIpB2oFYyK3svrtPKvuwO03EhliQG/
         bQ0G+umZWo/aG+l5MwokBufoaE1k7c1NgbzOtacUBD1nhfGHemesD6xNYeKeXg/LtJtM
         AyHhdDJrFZQo75VyYgyW1rprM2VbDRutgkb0BMZ+7n3J4qz0zxHmVBrauoKRE0LV15De
         xN2F3Xw3Vqmr1xSt4vOhjNi7JCI70nuG0tl2Hvm/GUB/j3XFF27JK7rZNBvgPkdZ73l4
         uPXJwFzwM3SVpah576RKP4fBMstViUMEnEXiARelkK0OR1jdggyPmLLjqSbkziTu1g4s
         ZDCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f143si199780wmf.1.2021.06.10.01.53.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 01:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15A8rSgS009390
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jun 2021 10:53:29 +0200
Received: from [167.87.77.77] ([167.87.77.77])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15A8rSl8003833;
	Thu, 10 Jun 2021 10:53:28 +0200
Subject: Re: Understanding Jailhouse partitionning on persistent memory
To: laurent gauty <lgauty@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <d56ce2d8-9299-47e2-80b6-eea428b62f70n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0d8757b9-c2f7-266f-8ded-709c632f955d@siemens.com>
Date: Thu, 10 Jun 2021 10:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d56ce2d8-9299-47e2-80b6-eea428b62f70n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 10.06.21 09:47, laurent gauty wrote:
> Hi,
> 
> I'm currently playing with a NXP dev board based on iMX8Mplus. I'm very
> interested by the approach you have developed in the jailhouse project
> in order to segregate different cells running different systems.
> But as i tried to install jailhouse and played with cells, i reached a
> point where i don't understand how jailhouse in intend to behave on
> persistent memory (i.e. eMMC / SD).
> 
> The current configuration is to have several cells using the same SD
> card / eMMC, but relying on different partitions. And i think that most
> of the projects in embedded world will have to deal with only one memory
> device (SD, eMMC) for cost and space reasons.
> 
> So here is my question:
> is there a way in jailhouse to isolate the persistent memory (for
> example partition) of each cells from each others ?
> If not existing today, do you plan for this kind of features in the future ?
> 

The general issue with partitioning of storage is the partitioning of
the device access methods to it. With something like AHCI, NVMe or MMC,
you have to go through a central point, the controller, in order to talk
to different partitions of the same medium. In that case, you need one
cell taking ownership of the controller, serving other cells as proxy.
That would be the Jailhouse model of it: no device driver in the
hypervisor, rather using a cell as driver. To provide virtual access on
the physical storage, something like virtio-over-shmem + virtio-block
could be a pattern (though not yet production-grade). Or storage over
(virtual) network.

An alternative to the proxy cell could be if you have a directly
memory-mappable storage that does not require coordinated access on a
central controller. Or if you had something like SR-IOV capable storage
controllers that could present themselves as multiple, thus
hardware-partitionable, devices to the host. None of both we've seen or
tried so far.

HTH,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com.
