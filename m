Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN7W5XUAKGQEKOV3KZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E3D5D323
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 17:41:44 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id v4sf3591920ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 08:41:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562082104; cv=pass;
        d=google.com; s=arc-20160816;
        b=U/Wz5A+GVH0OYCRThjqQwxnnjikVeZTXqLxeIzYMkri9I9DgiayWenMP5Yk6el/kvV
         io/bHnIns29khzBf6FlERgyF5wK/OeWoUnIUupAmmBmbLbZJqbvHQmuveLZfO9UT4df6
         QDjDj+ikRtYSHkklwZlPYuAGJXFZgT0OoQmt8272pw1/ZQ8HwpPbtadfD5bWhEHPBwkN
         fO3b2khMSsIbU8atFSftorP9nAupr0VALw9QN21hZV94rLMYY4kbRxbTXRvEPiHnsF0z
         +toNbpY/GGF14z1nmmV6PCb+mv6EGbCkYTFS6apjl7jL4EteRfYzC4rpSOR96gxFCRBX
         NvdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=zfL6LZo23iiCpYMvNrPXBRBFEWyw5WwpJBxnfDE++vA=;
        b=KkA1Ss7f6HoYcybi5enPZaJ2qGGOSSh0RNgFoc3AQ5ssEbIqgaRdTCTnu/l109Kb8C
         KUpzgn42yJrSHDSav632r/YDV/b48/yQyI2EDDhVdRwJcVMfYBo8ErmZMiqskXULcC9Y
         y6hmEp8nu5EYx6AiNRCGztsTn8Q+E5GxsAoyy+cT7kNeqKPfgIAXkWCpMgzFgLqIMgsQ
         onkWPTcQ1aSfmFvg0xTRsgIFUnj/F09P0I1PEdonoHEm0zd/pDO/kt8alxT1UieVJDXS
         +VX20qEgCsD3S+ONf8w/nraoO8teKc81/wSCRGP/x5ZIx4YClGJ/InLaF1awF4mmphD3
         GPHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zfL6LZo23iiCpYMvNrPXBRBFEWyw5WwpJBxnfDE++vA=;
        b=UCJS9qi78tBw0KViuXLYKxidTUM5ta50+C0OX8XWEeSlqMTuC3f2+Qz+4UM+4fHY/Q
         yBxtttTUrzdEIctZ0CwHrxcHg53DkM0OE//7RL5xGeFZjkR9EoZ1o4f/h7meTxd9eiCI
         /gC9R12eJ6EqAeiIoWn+vC5cx2Kx3wf7Z+wQ3wvYpXBrzeFH/c6kQ9MaQV6MsttUp6qn
         1iq29EYuMBKTpHdZGt72ZGo6MByj1KNfU6CKPo4o8Bh6nDnF1IxMzsORuoRpCSVMf8Ih
         nYthwmJlzRG8Ip+UMzBDp7VAEiXsdT9F4pKBZKOYArKi1QM5U2AB0r7BTQSbPQhCSPqI
         xPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zfL6LZo23iiCpYMvNrPXBRBFEWyw5WwpJBxnfDE++vA=;
        b=bHPVCCOBOtGwLhQL7bEKvQhyZ37kUAlFKwR3F8/C257jiSHWN2POako/5dEz78XX4e
         wNm+66LGei4ybb1voW7FIFtDQYlhqA/pE9TmZ4uFlI9cI8IfUBkPbye3W7sX1Yz1NqBS
         ndO+IEOgaG9n0DNq6ufbepo5sn+1HfagWd2h8bDXmgl8hcQmbH1pLif72Ozmj9LTAASR
         Y+c63zKjhgsq683peSHG/UxDNc0wd1EP0OzN5hlVEukhT/0MBQpG4nImfBC4fRDBgR9P
         SSPMEucpUEcV+VcFRVH7oRo+Ja4/6O3mfTwSfXrUXiWH8Q0rmZPrAHTqNQ/77YlUwmpN
         KrPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWjH0WCZkRmdUBqB63ZrYHQF86iXYbNGwuc8IRMCxIsyCgOuChF
	1wqNt3oZ+EX6FQ/zuD4D7iI=
X-Google-Smtp-Source: APXvYqyxvQlgP2q9n0EV/AEouvogC1Pa6ql0it+sosGVlSJRGdnvff8X3DBjFekxyR9t9WBYzuoT3w==
X-Received: by 2002:a2e:8793:: with SMTP id n19mr17863048lji.174.1562082103870;
        Tue, 02 Jul 2019 08:41:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c213:: with SMTP id l19ls989359lfc.1.gmail; Tue, 02 Jul
 2019 08:41:43 -0700 (PDT)
X-Received: by 2002:ac2:59c6:: with SMTP id x6mr15542550lfn.169.1562082103376;
        Tue, 02 Jul 2019 08:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562082103; cv=none;
        d=google.com; s=arc-20160816;
        b=eVnWeO/lV4OpXGzsYQVd+TobXUSP6LrVzUruREl6z7v8I39iZ7s8TdNPGlwAgkKgfy
         J6e4U4EJBxLlO/6iW/wBTgyZ3CN23TibkTmW3jTDSji8eC4+cLA8FVn/80hZSRqZdVs7
         ssRB0PORHvhnG/A/7g2egY4zljN2MbqRqnbdQzXBWsZeO2vRvtCgZGWff44PZCrw2+g3
         ihaDGUfFVb5SRbsiW8zQsOe1F3I4Lo4u5n2vm34YxL/wveSP/TIN2i6pCKy+/yvVwFKA
         oLEV24VSA65WpOovEq4jfkDhogaNs+5UwZjMUyvpA067afNuPvz/9nLYeFKd2jCnhsDs
         PQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=S5Duv+W+1cwlOLDQF8O1doyr3vt/amjC0fHsvbmsnHk=;
        b=ZthfFtXrlg2RuoBV2YACMpt24AKbHs6xram+peVrE79nWmAJXGiIIIYlu9nad47TDu
         61QGEGOJc8uH47R11poTT2i4vkA1PNGIqS5VjzWErr8xP9J3yGK6YPM3xqHTXXXK14sD
         SBq8SIlT3SYTPe0F6m3WyZPnNCiTpUHmwMiyPQeNyDSvfeOn5tUh+KurLTfwksduIQEr
         OF+tOIijrlgyET3tPENq+oqYwhbxDAHoFpVbeVf7XoKsH7Ahf/t+vFAbpOYyjsesYCLc
         u8Cs4q+bhzCQdjgFLbGZzBZePN2dSRzD/U9uBAmjI1fQ/uHAMyY6ZK7prWThzhzXMLcw
         u9Og==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v29si857644lfq.2.2019.07.02.08.41.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 08:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x62FfgOk004620
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 17:41:42 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62Ffgtn006229;
	Tue, 2 Jul 2019 17:41:42 +0200
Subject: Re: [PATCH 3/6] core: Add stream id list in the cell config
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-4-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <33ad2ca9-c618-1443-9fb4-ab5af325ee25@siemens.com>
Date: Tue, 2 Jul 2019 17:41:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190702143607.16525-4-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 02.07.19 16:36, Pratyush Yadav wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> When IOMMU drivers are supported, it will setup the IO address
> translation tables unique for each DMA context in the system.

To make it clearer: When ARM IOMMUs are supported...

> 
> A typical DMA context is identified by an integer called stream id.
> To setup the correct IOMMU mapping, hypervisor should know
> list of all the streamIDs that should be setup in the IOMMU.
> 
> Add an array of stream IDs in the cell config, bump up the config revision.
> Change the python struct unpacking logic in the tools to reflect
> revised config structure.
> 
> [p-yadav1@ti.com: Add size define for stream_ids]
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> ---
>   include/jailhouse/cell-config.h | 6 +++++-
>   tools/jailhouse-cell-linux      | 4 ++--
>   tools/jailhouse-hardware-check  | 2 +-
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 198fef5c..caf2fba8 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -50,7 +50,7 @@
>    * Incremented on any layout or semantic change of system or cell config.
>    * Also update HEADER_REVISION in tools.
>    */
> -#define JAILHOUSE_CONFIG_REVISION	10
> +#define JAILHOUSE_CONFIG_REVISION	11
>   
>   #define JAILHOUSE_CELL_NAME_MAXLEN	31
>   
> @@ -74,6 +74,9 @@
>   
>   #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
>   
> +#define JAILHOUSE_MAX_STREAMIDS				32

At the risk of having asked this already in the RFC:

Is 32 really enough in the foreseeable future? Or should we rather have some 
resizable array, analogously to memory regions or PCI devices? That would also 
allow to set it to 0 on non-SMMU platforms.

> +#define JAILHOUSE_INVALID_STREAMID			(~0)
> +
>   /**
>    * The jailhouse cell configuration.
>    *
> @@ -95,6 +98,7 @@ struct jailhouse_cell_desc {
>   	__u32 pio_bitmap_size;
>   	__u32 num_pci_devices;
>   	__u32 num_pci_caps;
> +	__u32 stream_ids[JAILHOUSE_MAX_STREAMIDS];
>   
>   	__u32 vpci_irq_base;
>   
> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
> index 49babd92..4b6f504b 100755
> --- a/tools/jailhouse-cell-linux
> +++ b/tools/jailhouse-cell-linux
> @@ -564,8 +564,8 @@ class Irqchip:
>   
>   
>   class Config:
> -    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
> -    _HEADER_REVISION = 10
> +    _HEADER_FORMAT = '6sH32s4xIIIIIIII128xIQ8x32x'
> +    _HEADER_REVISION = 11
>   
>       def __init__(self, config_file):
>           self.data = config_file.read()
> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
> index b86756ac..afd1139b 100755
> --- a/tools/jailhouse-hardware-check
> +++ b/tools/jailhouse-hardware-check
> @@ -136,7 +136,7 @@ class Sysconfig:
>       X86_MAX_IOMMU_UNITS = 8
>       X86_IOMMU_SIZE = 20
>   
> -    HEADER_REVISION = 10
> +    HEADER_REVISION = 11
>       HEADER_FORMAT = '6sH'
>   
>       def __init__(self, path):
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/33ad2ca9-c618-1443-9fb4-ab5af325ee25%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
