Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGWS5D3AKGQECH34PQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A961EF648
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jun 2020 13:14:35 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id b63sf3733131wme.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jun 2020 04:14:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591355675; cv=pass;
        d=google.com; s=arc-20160816;
        b=CDKhiyAwzEL+T9HK82Ku2C2iE5ExAxdmdtFgYxLESXbGvIITwHSEhMmhkoDt8igZCM
         znFIyEtWvj+bNj+JghuLPEm9q26OgTygRGTYNG15ajOc+gidGQaE/o+sd0hlRQa5VYAg
         w2jPpJf7EEGRWhmwrcb1hWqEkT5SDCeWj7knNqEtv0ESkDpGR9oqDskJhYASFZ5ebkug
         ZKPd1Igz5v9M4ZbWCTzU/8K8qfk/Avr+ifmiDfh1ogPg1dxuJbQxbMdZ5SYn1A0Z8L5/
         dCiEu7DiaqwQSpMRmZxKYH4p35OSowFtD9kOyAR+t50P6cFFvE+nE6s1AuHDyjQLZ/VN
         NzwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ZE6En38c5byHT21Oa0L3kHfJUpWB4ivS/qeoYD9rsOE=;
        b=COyY8+fgcXya7f7XE8L+oJK0k2QzgbKAsXyW+ILsrc3TDraviz3c5QGJIFdBR42o61
         bucfXsLCgFv0ysi2Q5Wm3PSi1OQXYZkf2N2mHBXf+aQy1oZVMS6VQi/vbi8+kxD6KEW2
         5uvBncocbn3iXS+6nHM5AfQxQC+SS9o0IO64vKO9bTBO7SSfbeDDnlkg0VXDC8AoNHNl
         bSYMcByq/rD6eHJLt+QmdKltptrAsnnyjkvulvgxpD0k3jsvsIiDrqLC1jVw/QH7zr48
         FDYCUGym/CZQlAvSuP48Y06la1P3/C1hlWPUtP1oJp47jbBC1QwN4VbsYdgD3DE4BN9z
         dpHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZE6En38c5byHT21Oa0L3kHfJUpWB4ivS/qeoYD9rsOE=;
        b=ob6LnZ4CLUchaG768s2WpPbKqm5qGRxLrWT8p4OVDh00n5I46VSyWWs8i5xuJAOI66
         Ggd1vLMEvJi4qeZT2T4naiCjO+mpDmxZq2nUcYU9Lj5RgLvP0KOcSV3ftJhO2CNGqvXf
         pbYJO6nx18+qByIRRe29mdLJ8vXo9w0ECuFodujmV1z9LL1QBgn+9+i/7LY4fypZlOEM
         awHsCqqPrmAk8LSqo94EzFUHQMXKfcSFwSxcn1+BOZqiHu2oCy6vpLvWhV8vPrpkTFg/
         L2xbuuUeuNa/dp34uz/9L8CqONfrUkCHClvJYILm6GAWnFgWfiLeH7eFtF9aJ/KXR5tv
         TGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZE6En38c5byHT21Oa0L3kHfJUpWB4ivS/qeoYD9rsOE=;
        b=mSiPwyS8vKfcw8eyEQYaRgszpHuvV+umtgI/CM1/l9YaGq4USRzQO2dqA1skky+Vs9
         pgLIPHpt4nRMbBxCC8yaQZfrPDA2nqnentWPv4BmeFqxyIV2BMrX+ywdfhaafgUD2rTc
         iwHr7XoZF3WlD9E5vQDBk3bqvN4KPTGVSRspXx9etcYLTkD7V3yd2EFlZyufkCynmlvK
         2oVD05CZ75rFaO0jfJ8TxmCIl1E03ARbJFp/FCtcx4JMtAjEwFVi7BiapX4bih7mXet/
         lwzeDl+xoMek29i0Mk7DpctPQzjX4BbA0hplZ9p5bo8h6EyUXHcMbkFiFb2V/fKGtg54
         89Uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QQ9DOcrPNf0JrDqmRAIc00RxiOlSlRAwbtmvEY9ShqV6DJ0uR
	vdaDLbbUTZ741KVgQc8KQoY=
X-Google-Smtp-Source: ABdhPJzRu4eIWvf+Sa4nXqbKzurjnqSjf4IjF7rNhBJaRl2Uo4qOCdOVbEUir/ghmkTb6kBvg8ulMA==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr9690166wru.117.1591355674931;
        Fri, 05 Jun 2020 04:14:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ce:: with SMTP id 72ls1225867wrc.1.gmail; Fri, 05 Jun
 2020 04:14:34 -0700 (PDT)
X-Received: by 2002:a5d:500d:: with SMTP id e13mr9780832wrt.150.1591355674240;
        Fri, 05 Jun 2020 04:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591355674; cv=none;
        d=google.com; s=arc-20160816;
        b=JFi0tEQvHQ1THWQdqxuYizPh3sBhaOmQWPW5xXKcCDYMghXz0fHnquILOJlBcnqOI1
         lhzcXoXCXCRbQxxuaLnFynWtvIsU4VCHSoBAhzAW1KA2vQ23/3j3YMvJgi9qJbqhQbje
         xUvGA3b/rBOxz7gpxpA97J9HRw+OEmSdDrzf9c8U/QEtmbX3Xb5Y34ad6ClhaE+i1xZ5
         O8ksvdWcc62XgE6k/6DLa0P5IkYKxtjVmARVxJfU3l8hihvh1GUnfeNcQQApn4ab9fUy
         RZYLutEjhxEnl8XBQ0e8Lc8G2/EO1bm125VDC8jomvmCKRWI3tjeWJJVNR0oZOGZDE4t
         15rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GZZWMh55axOFNi6/VFLDJXDAlMATnqDfffUM0kKo2/g=;
        b=0bOXUFlwZ+0nPBtY0tGK9kTULvn8stk8DWp4AitOOIWakKidOfMEgkUIaaN2CvkCC2
         AquP2IYrZpOPgjQeGxJt7oy7BT5X88OBGbD5iScsSGswKuSEyiP7e3hEvEaAOz1QGHcw
         JoB8Bcnawx6lsz+wMqWNZRhLIQhpjeFTTfJZKN60nJaY/Y7m9aO70Xm8Ab3ibtoyPJwI
         9nyCNnElicU1y1n+bnk+ZzsSm0tlE/r0jnW2N5gZhvE7lLWMz6A6i7e2PRdbDJc6XIYF
         gX62qYIZ4dhFKcjeaSsGugF0E297qMX7Za01NxbFftYNvcnAEGQ3iU/+vk4U/212qyzK
         srOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s137si400309wme.2.2020.06.05.04.14.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2020 04:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 055BEXNC018867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Jun 2020 13:14:33 +0200
Received: from [167.87.6.236] ([167.87.6.236])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 055BEVr7021180;
	Fri, 5 Jun 2020 13:14:32 +0200
Subject: Re: [PATCH v1 0/5] arm64: k3-j721e config fixes
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com>
 <e72392ba-8cb1-1030-8753-ff7b47724f11@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bc02eae3-0cb8-804c-6926-1cc537bae2d8@siemens.com>
Date: Fri, 5 Jun 2020 13:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e72392ba-8cb1-1030-8753-ff7b47724f11@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 05.06.20 12:48, Nikhil Devshatwar wrote:
> 
> 
> On 02/06/20 8:14 pm, Jan Kiszka wrote:
>> On 27.05.20 14:23, nikhil.nd via Jailhouse wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> This series fixes few issues with the jailhouse cell
>>> config files. It adds required memory regions for
>>> fixing crashes due to accessing few devices.
>>>
>>> Also, remove some obsolete device partitioning
>>> which is no longer supported in the 5.4 kernel.
>>> We will add only when the drivers are upstreamed to
>>> mainline kernel.
>>>
>>> Kishon Vijay Abraham I (1):
>>>   configs: arm64: k3-j721e-linux: Add GIC ITS Mem region
>>>
>>> Nikhil Devshatwar (4):
>>>   arm64: dts: k3-j721e-evm: Add pinmux for main_uart1
>>>   configs: arm64: k3-j721e-linux: Add USB mem_regions
>>>   configs: k3-j721e-evm-linux-demo: Remove unsupported device
>>>     partitioning
>>>   configs: arm64: k3-j721e-evm: Fix failure with PCIe
>>>
>>>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
>>>  configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
>>>  configs/arm64/k3-j721e-evm.c              | 32 +++++++--
>>>  3 files changed, 53 insertions(+), 70 deletions(-)
>>>
>> I only had one comment back then on the last patch. But now the new
>> config checker has some findings on the j721e as well. Please have a
>> look and address them for v2 ideally.
>>
> How do I run config checker?
> 

jailhouse config check <sysconfig>.cell <inmateconfig>.cell ...

(or directly tools/jailhouse-config-check ...)

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc02eae3-0cb8-804c-6926-1cc537bae2d8%40siemens.com.
