Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYO25XUAKGQE6REH4AQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87F5D1EF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:42:42 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id c18sf3545023lji.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:42:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078562; cv=pass;
        d=google.com; s=arc-20160816;
        b=WUsa3KitajooTkWWLW9wWrGbTcDVFu2remVgZI52viKK0X5WIo0Qqu0xvxsUfKPObc
         M1wyADYcoPecn7ZG7KNdPjfo2VBUazKhoX5bMQUOw150bvMj6pUS8k3zBVqvpdtQ/A73
         i31AAPVoUZvBBsVqfydufqRdIyPBzLwfgj89wWFt+T7h4iKIXgyb6ZpzLpkxOO+Cb5NO
         Vhg4fyM23CU+tW2eZzeaniOLRfMrMq7FZqsG4nuLVnWvsS/aJyYsZ0qaGFfc4CCnUsg/
         NIsx7N9eQxf1kcuIb6SScm3koI3GvHzx5vubFRsT45ulrovayD12on4QzldrKja+TOBu
         jq3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=YWvZ39fXFEYTbI9hjPvK9N3Lu8HxB8mq0MVYtJ/2RsA=;
        b=dCZs+1Levp8CR+b9enhR9i9a/KeWDur6WzFjRBb7VdUMWdXN06YsZ50YbIGIQ45fvm
         wMwD+d1EDMskUHcE224QkcjbXwNqmSZWBCmliq0u5kBbC5iBQHcQQ0rmxvwGR8ZATwjE
         RhRqFDesBcOZxFMoLZC2ptQEpAzARWQVWHRfUiEPX1J5i0mIz96yK7DXkg5dlcef5j1z
         FsZMmcePzfS/JUWnjabcJMO/LcpNgH0Y5hY5dq4yycm9O6voZMQOLZV/HrbIZEtKgPu0
         NNViTIcjAZAa4pKgwrolzFfEBn/6oE1iW9B/ktto4QXbs1qQ1uZ1TNxiMAYSQ/BbvVv1
         6xqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YWvZ39fXFEYTbI9hjPvK9N3Lu8HxB8mq0MVYtJ/2RsA=;
        b=jgdZiShxyzZS4imC9BAcHOQLLVmToDEhzP/bLLu30P4ehYJjyDrx/8nXnxDAP6CNxv
         zg1wIxWefBGetiIernlaOYnyzWWZ+uWPAEyOs33eEKKPPkNsN7DOlcBTzgBb+jlMu85G
         0MbNiXuMt0Dbq8GRMJeP1t/ovWPDNTIHL8yIrwxqcroHk+vpGthKWX2fRQO766CGktXR
         UWKnpuMNubwkOFOwYE2DI3f4qVCd/0UUca23QWdvydcXEVg/XLu7xWgA2lQkCISc8iPs
         s6nmgezO9V8AVEKsLlvh/b0NQu688A5mUW0k4gAjfGSoWYLSmjGWHzLzSuclNOTgxiGa
         xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YWvZ39fXFEYTbI9hjPvK9N3Lu8HxB8mq0MVYtJ/2RsA=;
        b=KMZRTov2jxwq7iiJ8xL/rzWuoEjqLny1uHf2IfHyySR3W59sIwvR+BY5rJB4yw/RTI
         bVNABMTzI2oM1UY5SRo4w3F55SPIHaBVsI0L3xmM6wqkteTSaqKHWckHQZF3bD2++jBM
         gUZ6d2GZROoFeTzZ5+HmGZ4Nzt/ND1AAxLtSgh5uSds4Y6huXWbskwrwnO+UXwEM7eoH
         TDR8iWfKeUhzlEdeTEGq+2F4FUqQnr8GyNlwHTvIvDFkCv9A/phyh/IPRhaj9biGSeaz
         dXc+Oo+3JfF2Jn49Aa/BHkWAlEcOQ+8sBcd9lFs4PS5KCFV+Yt6IMMjjgV/wS1zmk0vl
         nXfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXzMqVqwPT/Mf9obweYdC4VaHkX0chzXfwQNqCVg4gdwZh0vWWl
	NNojEheB5ScGQAQNj8nQRBs=
X-Google-Smtp-Source: APXvYqz6+7ph+rB9ulOltN2YhjuoPl9DqJvB8aJIFWm1qoGg5Jb8po9ceJY6iUMXvg9gIPy9ifyUpA==
X-Received: by 2002:a19:be03:: with SMTP id o3mr759868lff.88.1562078561934;
        Tue, 02 Jul 2019 07:42:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7b01:: with SMTP id w1ls209816lfc.5.gmail; Tue, 02 Jul
 2019 07:42:41 -0700 (PDT)
X-Received: by 2002:a05:6512:144:: with SMTP id m4mr15768582lfo.114.1562078561105;
        Tue, 02 Jul 2019 07:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078561; cv=none;
        d=google.com; s=arc-20160816;
        b=grsa8R+zJnk0x3r6uQ03FnK/vB7hMo2kWm4WZkfyWL+6CtRol/FIaM1nyoCrm8tn3z
         qgJhloOXarrsM3rFeOwQG5d/Yj9FqX48WiswCJJk1KL13j0jvbr/RzkUpm5ElpFtXtVJ
         j1r/Pkt9IiBmDmr+LE363cPox9i5NmvuWTyLAN6EAU5zih09bvlKs7zaEi0f40T6hi7l
         I+LpbIJx4OIEQSFprnDBWjaT2WGg93QCFdVp6TpPXkaJRs5G19110hvTeAgitbeelHGz
         cG8kNFQBGirmdP4MOmGHQgbQvjpAmuAtVx7mDIayZuSrhDcwKQ6lFjGWnxA3Hvtezl+z
         +Cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nIL7SppqZRsa/ne0TBcF8BeMa1Px6K9dXm8CG8a0dI8=;
        b=LuznoS3Zbi8+QpBxNI++sHF3kd5YFXM7/D/GcfdG+2Ql7qKV9cTIfwWItlxnPPQdY4
         xeR5p5IxbK2hLPa0pGPsd2Az2unFtdYgbaB0FtMuz5AgQIdlRTVyVsDCd4aDxOtIcp+g
         GQv1QFTOKzkiPhGRHWazyvrHbOzWeueRE6f5xtievh2NfQYiLwURy4cRaJ81vRhRfpQP
         9C21uPNvm/xJWXxDvmdlZ/tfUL1mT7dQtRhTG/F9w3Y900J38KLbPyytpooEO9pQf/Ff
         BDE5c4qkP01UvEF2NnCK3q/dDaQWHl00YCWzM/IC3+3I8U3+CH2RuC5nUYWvn2y0m22A
         Gkaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q7si258739lji.5.2019.07.02.07.42.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x62Ege2j003253
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 16:42:40 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62EgeUs027695;
	Tue, 2 Jul 2019 16:42:40 +0200
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
Date: Tue, 2 Jul 2019 16:42:39 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190702143607.16525-7-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 02.07.19 16:36, Pratyush Yadav wrote:
> A System Memory Management Unit(SMMU) performs a task analogous to a
> CPU's MMU, translating addresses for device requests from system I/O
> devices before the requests are passed into the system interconnect.
> 
> Implement a driver for SMMU v3 that maps and unmaps memory for specified
> stream ids.
> 
> An emulated SMMU is presented to inmates by trapping access to the MMIO
> registers to enable stage 1 translations.  Accesses to the SMMU memory
> mapped registers are trapped and then routed to the emulated SMMU. This
> is not emulation in the sense that we fully emulate the device top to
> bottom. The emulation is used to provide an interface to the SMMU that
> the hypervisor can control to make sure the inmates are not doing
> anything they should not. The actual translations are done by hardware.
> 
> Emulation is needed because both stage 1 and stage 2 parameters are
> configured in a single data structure, the stream table entry. For this
> reason, the inmates can't be allowed to directly control the stream
> table entries, and by extension, the stream table.
> 
> The guest cells are assigned stream IDs in their configs and only those
> assigned stream IDs can be used by the cells. There is no checking in
> place to make sure two cells do not use the same stream IDs. This must
> be taken care of when creating the cell configs.
> 
> This driver is implemented based on the following assumptions:
> - Running on a Little endian 64 bit core compatible with ARM v8
>    architecture.
> - SMMU supporting only AARCH64 mode.
> - SMMU AARCH 64 stage 2 translation configurations are compatible with
>    ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.
> 
> Work left to do:
> - Route event notifications to the correct cell and identify which event
>    needs to go to which cell.
> - Add support for IRQ and MSI routing.
> - Add support for PRI queues and ATS.
> - Identify which cell caused a command queue error and notify it.
> - Support sub-streams.
> 
> A lot of the work left is optional features that the SMMU provides like
> substreams, ATS, PRI. There is little reason to add them unless there is
> a use case for them.

One quick question again, I already had it for the RFC round: Would it be tricky 
to split up this patch into single-stage only + 2-stage support? That would 
allow me to asses the additional complexity we import by adding 2-stage support. 
Or is 2-stage support inherently coupled with the SMMU design so that such a 
split-up would neither make sense nor buy us anything?

Background is that the majority of use case I see will not need more than one 
stage. I particular, you have no need for 2-stage support in simple bare-metal 
or RTOS cells, leaving this only potentially relevant for the root cell (or 
secondary Linux cells). If the feature is complex and can be disabled, we could 
skip it, reducing the code size.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/47206b1b-aeec-d71c-6f4c-9b4680282ef7%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
