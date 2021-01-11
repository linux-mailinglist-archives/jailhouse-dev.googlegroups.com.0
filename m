Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPU6D7QKGQETCWSNTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF532F11B2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 12:44:41 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id e12sf7734659wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 03:44:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610365481; cv=pass;
        d=google.com; s=arc-20160816;
        b=P7Od38Naja3EvWxsyg4k+2ohu5WxofqMDyJTbG+Jerdch+UdntpxheIf4WEuCMJlzm
         d7Zxk6ghwvNMAT76Sg0p0wOVW1re+Iz8AE3yOkeS8sg+u2om6D4tGnHp3wcGnE5E/V7Q
         JTYauA3cgGmzTcEgxqAZujlA1Tt2Z18zct7AyOw4rRsNm1isXXs8Fue7NzQisT9fmveM
         nSbb8jgTgtH1/sDI6tjm7/l11LNE7yqK2OS7VLEPinpDL6Lho0UvNehdm38/1r3blxdV
         K7m2JVD9Zj9ejFfn5wnOT6CxqiBjCS4Y6ueWTlO9NYYFwn3/UP2NriJsFirVEAeHg9Hc
         ibuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=NODkKsRv9aQaoUSEywvOWwxiJWYDXLl1dBizVRVxaK8=;
        b=ETh86j/ZNNvanzXlcuCUy+xwMENhHNP68jjS6hQf3XX38Ee3rHIf5+LCk0/DWyC+4e
         ccUfef09JLSupnHf1cTaVa4Upl876knsGcjZ8t7lQsgXf0fsNYDTKtPY41llWGo/WUU0
         xuYCfrEDlZ0IIuE8S+ypLlSdnlUvagnZ8BYOfiNR3vO0Ur+ZpwZvnLIkQ35Kz93+a0AY
         /wPFXrea///UIFwuVba7UgBRA97qzgKAnTKH4qDzZeq2QnIcwstWSZ3f2OXxafXGWNcS
         hEr51N8bqZHWhzYZTheS66Git9fTBMI3Axg7L5xw08g7LMq/gzDs1AxSivN2T68lkLBX
         iPbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NODkKsRv9aQaoUSEywvOWwxiJWYDXLl1dBizVRVxaK8=;
        b=JOtsMU2FR72d5cbDopwGBF/EYHNz6b/sBseQuNVltW3xFvQcYFaIIpL+7lONwDnd3g
         +NpXoJRHVOvIY82uRu9jdLscTFRyFUixv7oPolxz6ewEejZFH48oup3gGypb5n3HZSXO
         HTOki3UN7IB45SubSCplIJyDUCydlgyaPlSBS1YB181dNOo1T7SjKxWzZPYpiRTevCbI
         n8kK3355nkihNNb/+U2vaZMeTKQP8uKWEMmwBxd7QL57YDeEpBRDFiO8JTqTRm3Jl35G
         sTJ9nOgcJc3l670TdR0z6bDJHYepX3PedSYdOEe3BXQkZttxG3WAf3dRl0xa3tD4B0x5
         ORyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NODkKsRv9aQaoUSEywvOWwxiJWYDXLl1dBizVRVxaK8=;
        b=oxqnxhT+bmDu0Tvqa5EdHBpF2zugugCY72vNb2ttK9KBm5tDAtwfo0lqUkBeYQyppe
         GnN6gk/DOaPGiVG+hUpEiMRhE79Du6TVU67g6uJ/jKm/GT8/LFvZyLWPI14jtRaHqS6u
         Q5aCawq6hj2LAhtMK3eb39SGHU7F/lie/fldp2etHKutJGOyReZNRwndvQ13CBryRkOc
         jqabnnVs9dDbxeYyUnTslSG07YfrpJmvtXEHcO2WV2U56BBVJqPmAfyd9eUFpWtKuvAM
         2i32tBJItqKrm+XUUrv+riAoepW2RFDzBZ5TcN3lDznxd2w4DdoHLy8p8fjzuUDzIK+G
         pK/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533m1opEimpB4Z3lVvLB5KWA1yE3aLzMw/0lkIgx5P6ojNYjHHke
	0wn9Dpb9Z7/bdzdTiK2PK4k=
X-Google-Smtp-Source: ABdhPJwBsEtL9qui+LYmnI8dgrL0RZ0LWjfSiC2P2EC/7QkhM2qt9ikdNYxe6RrD284BgSYmkhxthQ==
X-Received: by 2002:adf:e990:: with SMTP id h16mr16349625wrm.307.1610365481684;
        Mon, 11 Jan 2021 03:44:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls2456776wru.1.gmail; Mon, 11 Jan
 2021 03:44:40 -0800 (PST)
X-Received: by 2002:a5d:67c1:: with SMTP id n1mr15815379wrw.205.1610365480830;
        Mon, 11 Jan 2021 03:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610365480; cv=none;
        d=google.com; s=arc-20160816;
        b=qhJZb0stDYeo/Pvuvxfq/C2l4N4nlauQVrAUu9B/2G7B7pAiYMHL4iThT4g+HMxSW9
         SfLyGploMuqZbDJ2BWXE39elIVtl32jD3of+ivPa/2hvKU8lYRepeoOmIYr9mLmK7xn4
         E1kqp66DlQBxoBd0tRmfzya/tNC2ZSF8VhJsdn/W5e5sVYvE2cFNBTSOdqlCFynR04xR
         iRK84Xu5dg9yFt3UDnBGv3d26mXa4Eu4/csopyvhdLwfM0vO799rdczDDPd+9iNLmRgr
         hBGWAwV6MH32w0MJfDmzu1ARxsE91b9ngwsDza1jkTnKl9ocerrkqWfeSZqWKRo4rGnD
         GgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=8uuAk5V1LY5clrTTX83bSMoQlZ4XzKZ/iDgHD/T/Nuc=;
        b=gMbQfHwlpTUgpeC8ra+TnqIm5GZiKnKjLSic8pLVRQrKo/S35xb300qOKjPA5fqBYn
         r9164uNmMlwE5P6AbcKc+m39eqMM7PZLHxbzZSmGbeJsH2AG0T9Nk31mLk/qBcOAX/vH
         vIFZanWY4P7TqkLu5VrRbPgAWpPwlxgzTBI5v8nohZyGwZpB8KWZE8bbehqHfeo/Hcc2
         2P6Wrd+U0V4uhq8zA+tIlJZ8uAhAlsFH1sv9hSBIj9Os4BPDLDWx5HNyWxUZmPI/Tp8H
         jp9ZQIHYbjxMc4KwojKvbW7MkMixKoBrBfpEhOLVuogUub4XmCa+f2fn0c3ZkMD0LDsQ
         w6fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 7si714023wrp.3.2021.01.11.03.44.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 10BBiQGI027438
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jan 2021 12:44:37 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10BBiLPJ010512;
	Mon, 11 Jan 2021 12:44:22 +0100
Subject: Re: [PATCH 02/14] hypervisor, driver, archs: add basic empty
 infrastructure for coloring
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <20201123204613.252563-3-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8eb7c1ca-ae63-3c38-baeb-ea121dc12251@siemens.com>
Date: Mon, 11 Jan 2021 12:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201123204613.252563-3-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 23.11.20 21:46, Andrea Bastoni wrote:
> Add generic architecture API layer needed to implement coloring:
> 
> arch_color_map_memory_region()   // cell_create
> arch_color_unmap_memory_region() // cell_destroy
> arch_color_remap_to_root()       // cell_load
> arch_color_unmap_from_root()     // cell_start
> 
> Currently only arm64 will implement the API. arm32 could be also a
> possible target for coloring. x86 already features CAT support.
> 
> ARM architectures also implement:
> 
> arm_color_dcache_flush_memory_region()  // range flushing
> arm_color_init()                        // hook for the initialization of coloring
> 
> The architecture operations implement functionalities that consider the
> color assigned to a memory region when performing the VA <-> PA
> translation.
> 
> This patch uses a reserved memory region as mapping-scratchpad to
> perform coloring during the load operations. The mapping is removed
> during the start operation. A later patch makes the start of the memory
> region configurable.
> 
> Refer to the Documentation/cache-coloring.md for an introduction of the
> coloring isolation software techniques.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  driver/cell.c                                 | 10 +++-
>  .../arch/arm-common/include/asm/dcaches.h     |  8 +++
>  hypervisor/arch/arm-common/mmu_cell.c         | 52 ++++++++++------
>  hypervisor/arch/arm/include/asm/coloring.h    | 59 +++++++++++++++++++
>  hypervisor/arch/arm64/include/asm/coloring.h  | 59 +++++++++++++++++++
>  hypervisor/arch/arm64/setup.c                 |  3 +
>  hypervisor/arch/x86/include/asm/coloring.h    | 45 ++++++++++++++
>  hypervisor/control.c                          | 56 ++++++++++++------
>  hypervisor/include/jailhouse/control.h        |  7 +++
>  include/jailhouse/cell-config.h               |  6 ++
>  10 files changed, 267 insertions(+), 38 deletions(-)
>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
> 

...

> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 472cb4bb..e62e692b 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -115,6 +115,7 @@ struct jailhouse_cell_desc {
>  #define JAILHOUSE_MEM_LOADABLE		0x0040
>  #define JAILHOUSE_MEM_ROOTSHARED	0x0080
>  #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
> +#define JAILHOUSE_MEM_COLORED		0x0200
>  #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
>  #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
>  #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
> @@ -127,8 +128,13 @@ struct jailhouse_memory {
>  	__u64 virt_start;
>  	__u64 size;
>  	__u64 flags;
> +	/* only meaningful with JAILHOUSE_MEM_COLORED */
> +	size_t colors;

Wrong type. Needs to be one that specifies the width in bits.

This needs to be bitmask, one bit per possibly color, right? Do we need
64, or even 128? Or would 32 suffice in practice? In the latter case, we
could consider shrinking flags to 32 bits.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8eb7c1ca-ae63-3c38-baeb-ea121dc12251%40siemens.com.
