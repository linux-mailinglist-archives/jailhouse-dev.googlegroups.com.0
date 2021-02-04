Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMFU52AAMGQE65RZV2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC130ECB7
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Feb 2021 07:54:41 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id x7sf2056765wrp.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Feb 2021 22:54:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612421680; cv=pass;
        d=google.com; s=arc-20160816;
        b=qw4a3Inf+751A+MCzZqf7xCLDouZnIZ+aEBFjapLjCb/IFmrqG3FPi5tuVV7WHiz0r
         G+PFpF1gofLs7YA0tAIVtb55lyG1j1BTfVcx5VY+Z51PMkQNUgSCh72woJI/itdinEj2
         Gs7Wb9r1oVBZ0QIt3UQuEyP6x2BnhAcMmjbHK39sUdBlOGO3Nt8HBk/9slZmxJHV0Sdx
         0VVUnjxFGY4tANTE5Q1ipjGxS/b97JO+LaKG5IsVZNeBM3XDIJ+IbXgGBKp8vrF0K1Sg
         7twOkA4smx/gLrVh6pLNik+v7RzFzZmBwFaGdQ0H7utI+G20cGVtREOJEs1ktUj5ookw
         MW3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=il22mkMFM/ThzYE0JG5L/tXY7a7JH5fHtCYALB+MW6c=;
        b=GJROtMFCInuoRZ5Xs/k5fLQwiB3Q0Ht3dKBy1CAmdqcEr9jP19dyh5T8Z42wbiCZxc
         +FXWHD7ZnFPMH9fHwEiv/nFY5WHniJGd354aonvf0A/C9X3RQw0Lj67J6D7lPiD25ni0
         HaMYpCPmbKXkPywKgqGlWAOW3b7rfx5YolkzH03G94PQV0WenpwKmAjVPikgPdOJ/ISh
         tdvFNOulZLFablfawB2h+F962ah4hkretD42OEhC2PFXLDKRsB7+mqabZ0O13MhSV0BL
         momFEGahVMwMY9HBQeqmkP0jk248XjjuU5H6k+ZyjkTxBjA2gdyoKScxrudpmsbD2Eu5
         9QiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=il22mkMFM/ThzYE0JG5L/tXY7a7JH5fHtCYALB+MW6c=;
        b=ik3swcjBJHlMa6owCrPDtJDjk1KAvURchmz5tHy8VQ3A8DsEyr6pj3DudHMhkxC5a9
         QRy7uHwg21NQ6fzRCD9c/UHkzWYxPlG1o7r/FxeLiMHl0+HbJAJogKztqnJwfO7YFNfx
         +pLD3boF9G/Uesa/qKQ2N2O+LiC6ROBN//w5H7RsK327dYbl2Iyg55eKYrJEHa1eCyCG
         wjDZ+vA0qkgnWt9/MCXlRVPjD2K3AUoNzZVa0QufFS6v8csFTSgpATKcXiSab6OyWPIE
         gM6lzjF7zBm16rF/fwCK0i15BrE0YqoSScoBS1rgZDnYjaTJdSUL+mer4RlFTXx44uud
         g5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=il22mkMFM/ThzYE0JG5L/tXY7a7JH5fHtCYALB+MW6c=;
        b=pVq+gwGNvKU8sEmyj3k1wJ2NXbXKgYhYzWj682jsi1ka2U0aMuIKD4nbz4uXFb7+34
         opfgJ7L4ApdJHW6NvtBcpazWuZXwwovEow5gl9sNWr7MBPx7D87KiNnPKO6vEw4cdXzc
         fmOOl5XpuZ+Nc4ramBqKseQ56R4Vaxu0ySE4Dx0FYyHxZ9ulW6pENbWQ6UlxbuEMI83j
         Kpxan71006orJ6NER2nvl7Ayh99qwF+T0dMbJpjh7myp4Bal5TKCYZmDASetzbynwJVs
         Jryy1BmE9rv/+FsoHGf4ADGEobMMUX/R7K2WmTkArZ9DPFO3rb/x1K9SuBArUtR9UdvM
         gzQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Ggy97psk+VFbVkxU/Ma/UhJnqMzzbMmexqrcfH1p77V+fKggM
	1RNHnqGMFmw1EYVLWUpiyis=
X-Google-Smtp-Source: ABdhPJxFJCB+5/bFFX05cEO7BxbBa86UhtkCNVWuiWZQPCSo1AX2pTmvl0ANENOOus8B38s57f1eWw==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr7401820wrq.49.1612421680770;
        Wed, 03 Feb 2021 22:54:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls5471941wrr.0.gmail; Wed, 03 Feb
 2021 22:54:39 -0800 (PST)
X-Received: by 2002:a5d:4206:: with SMTP id n6mr7427639wrq.213.1612421679880;
        Wed, 03 Feb 2021 22:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612421679; cv=none;
        d=google.com; s=arc-20160816;
        b=jIkeec4vcXwYzwaVPb4+JW77eeGCMY75BEcz8x/l4t/GJz4kds2KmSA9vz3f2RPuJ1
         UpconTLx4JejLB90WBLy19WQISauFTlJ3pSSmYzXJXoV2pJbWTisVYYLNARKsua5iKCk
         AQU54At0Bd49ZGN50FCmti+aKfKyohf5EAi3rMG+zNQYemPqGOtN134w4vanfkahxX5E
         /O4qoTlIvxAxweBogapK1JS/XHhLvpvUDOi/8esqlZw3FyKuTzIRr8/ppzuSBKmeSaRq
         bGc/2VIFkEXKvMiFxOiW9qQ5wqkMUEPPTBIue7M/6eLQ9STSV6jaiD7gJJT7t7OEnMVU
         APWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=bofxttduUJFEIhevjTfqkm405fLq23KDgc5jTuW5whs=;
        b=Lv84hQnlq/Bo5yAdynBLC6n40hJWkJxvVogWUE2P2GOyxvZkzFakMd6I4GQkAPvc03
         oO7hHnwNeLifvOfaYpCW+JuVQKNEko+DPvXd1xXjFIN91kZa1dfDTKrJY/LgWphjMdrq
         gn+GozryqBlhuzVPUsbc/6x24qwNVf5TjlhI3l7BNSLxF/2lDbDyOATjaR4vZILURsue
         UDwJplZrzZ1ZtWXeycInkEc7rdM3WzHiqSTo/t371iN9SbnHy4lPfPqnPEbMhAX5DZ8Z
         TkgqXF2Eql4FJFRCwzqFavQQX64slNsGKNS1aakE7aeA3T8OeKBPr9LpMguNAC4OtgfO
         q2sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q138si181303wme.1.2021.02.03.22.54.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 22:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1146sdZJ017710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Feb 2021 07:54:39 +0100
Received: from [139.22.124.75] ([139.22.124.75])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1146sci8010911;
	Thu, 4 Feb 2021 07:54:38 +0100
Subject: Re: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
To: Hongbo Wang <hongbo.wang@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Henning Schild <henning.schild@siemens.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
 <c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
 <VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eeaa285e-c9ff-c007-51bb-fa3d8194aa36@siemens.com>
Date: Thu, 4 Feb 2021 07:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
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

On 04.02.21 03:33, Hongbo Wang wrote:
>>>  .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030
>> +++++++++++++++++
>>>  configs/arm64/dts/inmate-ls1043a-rdb.dts      |  767 +++++++++++-
>>>  configs/arm64/ls1043a-rdb-linux-demo.c        |   57 +-
>>>  3 files changed, 1843 insertions(+), 11 deletions(-)  create mode
>>> 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
>>>
>>
>> What exactly will that allow the non-root cell to do? Own the DPAA
>> completely (taking it from the root cell)? Or does this enable sharing (and then
>> only in a cooperative way, due to architectural limitations of the DPAAv1)?
>>
> 
> there are some case that user want to non-root cell can connect ethernet and cloud via DPAA1 port,
> and test their performance, so we plan to add DPAAv1 support in jailhouse.
> 
> in this patch set, all DPAA ports are owned by non-root cell, root cell don't connect ethernet directly via DPAA.
> 

But then we need better documentation and possibly a separate linux-demo
config for this rather unusual setup.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eeaa285e-c9ff-c007-51bb-fa3d8194aa36%40siemens.com.
