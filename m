Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRNCT2CQMGQEB7NJOBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E438C54A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:53:58 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id f13-20020a2eb5ad0000b02900f990d6bf16sf4122902ljn.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:53:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621594437; cv=pass;
        d=google.com; s=arc-20160816;
        b=pBJEuCasJynCzzAbBQBqfxL89bcqLOgy7cgwATqVPrXCkPk20QHl8kaZfe8QheE3d4
         1hOeHgM/zD4CEG8BvayWwwgm/YLTQNmzFscAf0LFqLSr+mgmzTv00rZpWFiTUXSXcGSF
         gq48/Bm3XrtraCzjtUusyZHIk2qI0e2Hi8bo5ODjyMrgKO+74KkZ8gTNnY1MdN/FobO6
         gSrPyBL3X17plTHzhuwoGDiQVcvIX/X+JmCfPusvMOzv0t+P0mAiOeMUuolCN79Iant7
         Gx0tCFFfgYCLCscpVl58O9xLm/BpSx0ieT+mwSHvaTuQjxmUaW9Db+Ll9PJsDtLJsZIV
         /Pew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=3R64dvW/vmqTApqTyYqdkzN6xPe6WB+4bFUTXg2YY8s=;
        b=Bfpv5QiPPaqyq59zZpve9ml+MMYAI8k5A/QSf8av92H2Q2TDLd5X88vqv6JNDCaiKY
         wT3vFVJxIVXHW/adnLNRsYXyPr3bVSN2hstROtYPD8C56KhUffG+CWQXvdshFdF36g4x
         T/1CY+qfT511Tl3ZhMxEBeIP9EjUw7HLZTc07jLDswqAPpJ6KoSPND3Sjs69h8Eudb3x
         SYkHUt3xEt0WyHrtmTvmb8n/cEQ6izpMAhsC114jzuLi2lKWKmGVc7izs4p7BWhr5Vd4
         HpxW/irwsV0lXFskxRtr1o29KGDX49zGuKXxyAFDEZfLw8r9Sd2ppAYSXQAUh4fPhBQb
         BeBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3R64dvW/vmqTApqTyYqdkzN6xPe6WB+4bFUTXg2YY8s=;
        b=kk3upxg97CudGE9bIcKWMa4twzIkIK0VeYD/J8zC6756l0iQU5FowOeX93owy9uc6Q
         jlWuCKnexo+9nOpoWMk0bXxoAeZVgnhYUQVSYA0eUvsK7krePK8FmKRZlthUZVcsVcvG
         iH+Zezgk9gd9VpNJOqF3MtrO4/iouJ6vnRKDRhiZh9bHCN6/yw0DUKw7yc4qqQV75yCJ
         zDxUc5NMT6a3WX6At1xQdlX8lgq/yYYK9Li7Izj4ZlbRcnz9uFQhHMtVW2qV6wJzS2+I
         nPcmIBbqbq7pRGWWtkfyNSTaBE5d8lTArVqM/doxHn0M0SFohEItI0KbcKu6q1gNvRrT
         ArUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3R64dvW/vmqTApqTyYqdkzN6xPe6WB+4bFUTXg2YY8s=;
        b=fun8LYIzUPrgezq/Iv2dt9bCWMBo3rVn3AL7jNcdPXCp+XuOyyJguxs/rHob1Icgo4
         0GXH8K/zpGaHsBaFEU49tc4ui1cxfY3opqE3PjDk+w5qX90P8TfFVwmagS8JyqEYPw9J
         LW0/uE0lOgs3EKkhLckjIUL5HgTLymHRCgsqgoWGTJwbXGaGDkTUvZFM8Q+XxrZv6rX2
         5Ed+GFwavafgSqEZOx1RbBa7fGgWlPl1y0fq54Wpg4GTNUtTsrSKgynUi+GOLv4nHkIy
         VauwKUCMhjiHnHAL5uaKqMxNzi6ammhJ7eHtt3bQtQYe2vV1GcwmTvPT7sQmBPWPDqQD
         Iefg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532DMXbxMAusAJNx9BaFBZ/dPIU7J/+s4C2mf4WkvRWv5M1Ym+8m
	FRv1iqozKP2udr1goYyg3kM=
X-Google-Smtp-Source: ABdhPJxZ0dY7tZ886SQ/MTUIbe7m+jHi2nJmKBrSTSsMpcsaD29R8FRjebEMQp6R2mGsSSV9n4mJvA==
X-Received: by 2002:a2e:504f:: with SMTP id v15mr6777124ljd.18.1621594437539;
        Fri, 21 May 2021 03:53:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls349355lfa.0.gmail; Fri, 21
 May 2021 03:53:56 -0700 (PDT)
X-Received: by 2002:ac2:5e33:: with SMTP id o19mr1804893lfg.11.1621594436477;
        Fri, 21 May 2021 03:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621594436; cv=none;
        d=google.com; s=arc-20160816;
        b=WMnb64dQhAIJx7lanTPjgDFodvfnbODm3QAHw1TbkLesyHVmakgL9HOwVL9DGq2+Qt
         /GyBgHQAOE/yV8YaybAJ+atGbovFhErkHF5s2PBOwjZUgNS+Fk0UU6MUC5N6AUkkqYl0
         aW9+6ptM3I9PQED5VU29ac7aLfzriW7qdmmju2BkATP7T261SotmgDSGNLvGTNtxNJy+
         M9K2+lrG7IA15jv4xWhEjPc6mXjtOdCZ6UMVz/tDHhU6HTJACjuEIomF51idzmUfz6yV
         +XiDCKBN53lo5/bZpKlgoZh/OV51MXreZ4EPQ4g35VtioMnJcAErkk+cQIeSzd7/B1zs
         u7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=ZFZc+KrVrYGaRmq8Eu39jjHy8P0DkGJ/Q33efrTu9Oo=;
        b=Vcmw/LDseHoelxnoObiEOvU2qFdM8WVd0SdSYEVB/9bk9NzPULByMybVo7WX1oz7Y8
         AIf2F9b6YyYMGI9vhI2hoz4qgeYPtG9FAPrOwEUgYS46826c3GsGMw7K56CHd1+2m82e
         0nfoF1ANOtLM+qDq6BxB6Kv2YsV9doqhyr+Qnv8O6eNAd1LpgjZidJe7Q5Twk5Y8hhtU
         Z6Ku8H6u99hMUkITgsmgdcSVrYmHwuFNhQ3NY2yr0Jkdw0MPfsUdTbkHYzV4q0RjBCj5
         n7SHp9WcSdy9BJjhLb7IyJWb+nCsVsabr0Tog5tLPJEmzNtddllflPKm5C4QBY1/Slvg
         FIFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j2si279155lfe.8.2021.05.21.03.53.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LArtEg017730
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:53:55 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAoHdW009691;
	Fri, 21 May 2021 12:50:17 +0200
Subject: Re: [PATCH 0/4] Support building and running on Debian 11
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
 <530859be-1601-18a5-ce17-08e2bee97684@siemens.com>
Message-ID: <7888da56-68bd-0e15-5173-3016e4654a1e@siemens.com>
Date: Fri, 21 May 2021 12:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <530859be-1601-18a5-ce17-08e2bee97684@siemens.com>
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

On 21.05.21 12:24, Jan Kiszka wrote:
> On 21.05.21 10:02, Florian Bezdeka wrote:
>> Hi!
>>
>> This are the necessary changes for building and running Jailhouse on a
>> Debian 11 system. As Debian 11 will no longer support Python 2, most of
>> the changes are related to the Python2 -> Python3 migration.
>>
> 
> Thanks, valuable step forward.
> 
> Some surther conversion / cleanup points /wrt python2:
> - scripts/arm64-parsedump.py (probably not run in 5 years now...)
> - "from __future__ import print_function"
> - ExtendedEnum (as Ralf already mentioned)
> - CONTRIBUTING.md still mandates python 2

- sysfs_parser, IORegion.start_str

> 
> Jan
> 
>> Testing was done on x86 only so far.
>>
>> Most of the problems where found while trying to update jailhouse-images
>> to Debian 11 as well. jailhouse-images patches will follow soon.
>>
>> Best regards,
>> Florian
>>
>> Florian Bezdeka (4):
>>   Makefile: Update build dependency from python to python3
>>   tools: Update shebang from python to python3
>>   tools: jailhouse-hardware-check: Remove python2 specific dummy
>>   doc: Migrate setup instructions from python2 to pyhton3
>>
>>  Documentation/setup-on-banana-pi-arm-board.md | 2 +-
>>  scripts/include.mk                            | 4 ++--
>>  tools/Makefile                                | 2 +-
>>  tools/jailhouse-cell-linux                    | 2 +-
>>  tools/jailhouse-cell-stats                    | 2 +-
>>  tools/jailhouse-config-check                  | 2 +-
>>  tools/jailhouse-config-create                 | 2 +-
>>  tools/jailhouse-hardware-check                | 6 +-----
>>  8 files changed, 9 insertions(+), 13 deletions(-)
>>
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7888da56-68bd-0e15-5173-3016e4654a1e%40siemens.com.
