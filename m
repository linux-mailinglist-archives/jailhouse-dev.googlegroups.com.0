Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5PS575QKGQE7AHWVFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 89661284524
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:58:29 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id ga21sf5374540ejb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:58:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601960309; cv=pass;
        d=google.com; s=arc-20160816;
        b=ir3x5B9KmoBQJeypkInM1Z4x6x//YDlTDpFWcF7G4fJVvlp35ihqkbW04Mm45GzbQE
         ZBkrxdrX+nobkcsprmMhY1jyPZE9w9ek9d/axiBYt1wTdzQlB/VJekXM3KyusZFO5G5x
         lYmWUZSWlHhg+Zp2vr3feTLBQddMPcEIkkL+FXegN9seEyrFntDqpJ5s3I+dN0xU+DBw
         6CdtWi6dSd8CHEBGCCQOHItPzhsKJ/atK7Q3FDbo6T0X8uz4i/c9jBtfOcjYrJzheZYg
         tD5jADQDwv+FoqX/K2ntC9HhLHg3TRMAn4YBOeJL8JMU6lnYcCxdiCsa9PHVM0HONnjs
         23CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=o8GFxU/KfJABnOVsn2EMKrrqbOSoLiSQcwMOpxuMwAI=;
        b=oZDODCRgxqLvbLHBS1RuL1xTOySe9GDpqnIj4cso1Ya/6vbqz1boioXHi0kGjE1AFF
         QYWEivCkYOivKW0FdZ2aLXxWdl7d/8CJYbHugo8Qyl4X7Dv/v+bGi1JV2ifOpyFkX0xb
         pkWoxamWZx41hLbf6mO+YZOKaJKPGMw6xnEMiSq9H6h4ssshz7wiLN/dp4nl1P5QPyXA
         oPxdpxnXTZO8JLN68QoOFj/lWi5moVk5VFYltKd8M/2drBfp9XlrfimnfyTVrDktj+Sq
         zqEiwhjUI/vKQjuK9bNNVC1woe6ZxWhdNgUh2aOHOMmewAHpOmxYVdFZAfpnTixCUKTa
         mTWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o8GFxU/KfJABnOVsn2EMKrrqbOSoLiSQcwMOpxuMwAI=;
        b=LZMa7qIsTeHpZ74AfMf5E7EGHQdzzM40Py2IcA/cVeRDHQmwIU0Nnaah+i645azg4M
         YtakaORkXCjzNrB+YPIk5fZED7b0+fhQ7sNrQ+r72DqblZaOwEOoF9tNluFoZJ383Id/
         UoKG7buYqlcEtFbDbh2Dn1EnM6ObHbJ7JYrENoJFEoqAn72SqElVEgNSJ1XJQML3K3RO
         I//Pgj2+EcXc1GZcaoDm830vWi+ajrbJeE8c7Yzw2ciB6ZpCfqtFLx4BU06hdgafLjY0
         DTDO1r6QGP+vfQfpvtJsEYvZvtdyxEVdgnPexGelU2SeCnUv7VzZ4g6yIn/2u1ZV7U/c
         Ba8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o8GFxU/KfJABnOVsn2EMKrrqbOSoLiSQcwMOpxuMwAI=;
        b=ZfUmiJ5thGPPiS1CVHLG71Pl/oAoOj+qZwxstL3iQ0/tciTmz6lv+GTxv4n3Fq1Bns
         fVevlFUCjwMkqQZpyknx+Id449o2D/xIGrhK/JbadafN4Pzcj9S6DQfJQ3GREWLMRvYv
         BV0Ij5iOd6k3AdOl/CZWsLxk3EYux6bSSl5/6hfzcZufI9hJBg6lHapUNibORAmE+2yi
         Lr5NBlt2JPq73xG00God35qPOIa26k1jbgewRst4Y2Rw8atnr8bc3jWGlnVYc9IN3+bl
         vdRnbJKndNLMtQ1bJNVtzDXWPFzhs0NvOGzucH1DMmgtXvzyw6kb/+lmaOqG74ZJEABD
         9ubw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531A0cClx4kgTlLRP53tuGOrBuE1/DtZSCEimXNWeK1g9PVGbUwM
	pmn1HtOtuKDDQGN3mHe2+AU=
X-Google-Smtp-Source: ABdhPJzNq63JPr+/mfAMUXJrIXPzLLLmmo+MKCg9IBcrjPwQDmDxnDc7wyq5i5efzwW8mLgWhhiaMg==
X-Received: by 2002:a05:6402:1847:: with SMTP id v7mr3452780edy.307.1601960309323;
        Mon, 05 Oct 2020 21:58:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0c8:: with SMTP id bq8ls5378804ejb.3.gmail; Mon, 05
 Oct 2020 21:58:28 -0700 (PDT)
X-Received: by 2002:a17:906:b216:: with SMTP id p22mr3326552ejz.228.1601960308277;
        Mon, 05 Oct 2020 21:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601960308; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlHBF7gDHAoBnbOPxzWYzXXjfYp+zlVyysBFbcwOaQDMziqwzLMGvATC4PTzVGiF4C
         knMOc0dTcWgRjmsGNUZ+Knd3US+on89IDaA6SHyR5kM0J4WV64LBsxxFuPGi3lKxmUMN
         8kaXQWldEZY6zmGU3+PQP40u46Vw1ptQ7BgNHkk49R99bUqIKgssnC99q69TpcQ43aB6
         2Q+Rk2pQwrP2FY3ROU864f6assd1wu9LrpB2wTbQGF+bV7d5JOdPB4i0Zd26J7T3y5FJ
         iMic615DA27QqeBbaU6m07aNfgvBJIUkXhmPr5V/2i8PX0eAeAScyM70sTk1qOLcm8ik
         XmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=ncTgYROr11KDUkoCJQs+cJD+RqTVLCW8bpltfzsDL7I=;
        b=Bu7LOdOLgTHPSHGzr4s9b/xZh5nmJpXDLXGq0Dh3zZoVf6gHEgx+uB2xRWlUtiDBfJ
         5OBSJ4b70ii0EmBOvaTN845z81ViP95IFwGIbWFgX7aeJd2JibGI62TVcEChdMApE8u9
         LAkQYdTPsnrkRd+O1xxB7DVRQFVdnTqdU/0wuCb8oBPFlot377n0HywSJGgqXY+teLVB
         0f/WZUPavZYdmjEIf0REMEZju2onATPlrwmJVGMiTn0kSCqDmCHM6+CoEqyGGfVhMnIg
         ReDg+PEOQtS0DBgihNJPpr+cAfE8erpHpGPv9KQQoB+oU/NMtzcOyj7alOygUwwctSqq
         yEcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a16si78208ejk.1.2020.10.05.21.58.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964wRWZ010238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2020 06:58:27 +0200
Received: from [167.87.160.159] ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964wO39004136;
	Tue, 6 Oct 2020 06:58:25 +0200
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Chase Conklin <Chase.Conklin@arm.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Peng Fan <peng.fan@nxp.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
 <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
 <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
 <a4e8e137-e632-c312-3252-261a03cfc46a@siemens.com>
Message-ID: <de3b9649-6e4f-cac7-2216-8c88572b0a16@siemens.com>
Date: Tue, 6 Oct 2020 06:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a4e8e137-e632-c312-3252-261a03cfc46a@siemens.com>
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

On 06.10.20 06:50, Jan Kiszka wrote:
> On 05.10.20 15:25, Jan Kiszka wrote:
>> On 05.10.20 15:13, Chase Conklin wrote:
>>> On 04.10.20 2:00, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Array lookup is simpler, given this input-output mapping. Cover the
>>>> 52-bit case as well at this chance. This also obsoletes a couple of
>>>> PARANGE constants.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
>>>> hypervisor/arch/arm64/paging.c             | 19 +++----------------
>>>> 2 files changed, 3 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
>>>> index 67664efa..932dbb50 100644
>>>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>>>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>>>> @@ -101,11 +101,6 @@
>>>> #define SL0_L02
>>>> #define SL0_L11
>>>> #define SL0_L20
>>>> -#define PARANGE_32B0x0
>>>> -#define PARANGE_36B0x1
>>>> -#define PARANGE_40B0x2
>>>> -#define PARANGE_42B0x3
>>>> -#define PARANGE_44B0x4
>>>> #define PARANGE_48B0x5
>>>> #define TCR_RGN_NON_CACHEABLE0x0
>>>> #define TCR_RGN_WB_WA0x1
>>>> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
>>>> index db8314a6..cccce410 100644
>>>> --- a/hypervisor/arch/arm64/paging.c
>>>> +++ b/hypervisor/arch/arm64/paging.c
>>>> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>>>>   */
>>>> unsigned int get_cpu_parange(void)
>>>> {
>>>> +static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48, 52 };
>>>
>>> Hi Jan,
>>>
>>> I think it's safest and easiest to treat the 52-bit case as if it were
>>> 48-bit.
>>>
>>> The 52-bit case is a bit trickier than the others in that it requires a
>>> 64KB translation granule. With a 4KB translation granule, the maximum
>>> number of PA bits is 48; programming for 52-bit is treated as if it were
>>> 48-bit, so having this indicate that output addresses are 52-bit is a
>>> bit misleading.
>>>
>>> The real problem is that we set T0SZ such that the input address size is
>>> the same as the output address size. When not using a 64KB translation
>>> granule, programming a 52-bit input address size will result in
>>> translation faults.
>>
>> Ah, good to know. Will fix this. Also requires to cap
>> cpu_parange_encoded accordingly.
>>
> 
> Fixed up in next. Not resending yet as the series is large, waiting for
> further feedback first.
> 

Hmm, I just realized that we are hard-coding PARANGE_48B for the initial
page table in entry.S. Is this safe even if the supported range is smaller?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/de3b9649-6e4f-cac7-2216-8c88572b0a16%40siemens.com.
