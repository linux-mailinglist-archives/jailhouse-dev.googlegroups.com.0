Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLPT7GEAMGQEAFAUDVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574A3F1CD7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 17:33:02 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id l12-20020a2ea80c0000b02900f5b2b52da7sf2256913ljq.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 08:33:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629387182; cv=pass;
        d=google.com; s=arc-20160816;
        b=WSAQy0ry2HEtZF6esYyU727fuNbWBlyT2m35sBNTf7AJz8RilAybpoI4/K072FICoq
         VCHJoNiC6a+fg3MAVra5pKVU30rIWe1aMJC9hTgZWKaMu2vh1w0Z18BbaVjr3lOBPB1W
         e/HxktJu4Kr7b2T0KUv5D5DpyFflBrMz94DAKMbYm2sMP/YgjzzJ7pomftd+liPQIRTH
         fzWBjKGcKcTFKMUuosB6dyfcihzBCGV6VICkWzRrVOeeXkEb2swjQXaeCj81aEFUKcLa
         FWfAX49GbPp3YwXLDFS2TfQArAw8WB4LYp0aplHzEfEW/xQIl+a9PND5cpZfdUL4jV/S
         ojHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=1h6/c8MmzjXbx9/pT0VphAND+XFT7+6Ljuv2GAhEqRo=;
        b=w4hI6qQT6EKpI9m+srVySHc342EuvsWQxrS4hL+yjsq+tE/pGcOc/p3R237FYFZtHi
         ARCvSAxKzJKZUR6iEdhAOjB+ksn92JyaGYcDBe1+bgKDMtwFUJVtfzLi4OdhbtOvA52o
         kAEJbbTKLmgc09IMsZtnlbY0zxclYrkzGQFcTIMhHi/NsBu7k6NHYNJhu+NLrS6tt/JN
         MMV0AxoOwBAmOo4/nD/zWGMDKX3bsDKgna0rQ4cLKfg5q7m2vYu4jgZPaWmHmOM09uxs
         LZVeTr1pj/iTWjVqXbxPLMloxh5fgZdYsxqqcjb4vy64FD1o5b+SmnqyDvA0qFX+LRbM
         XSew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1h6/c8MmzjXbx9/pT0VphAND+XFT7+6Ljuv2GAhEqRo=;
        b=He1e2cmM4nU/crPoRb+9gIB1gl6cextDNsAuChjOJLov5+UxkPk1N5yqqB3osjlYIV
         a1HzduTviwf2ubk33JW/0Niqu+Pdax6UfkybLBcaf+pfnoHvcjdL4aYiEbxHusCDEgrN
         O4vtPeeEGhPXk6BWCbP0QbMMlN6X/HfaQvPFTOIP0o6M3CFt67BaHBFPaguQ/L8CyWal
         PYmp8bzOtby4uAlkUGq8l/tpASe25n65zsqjsspL1Uzrm+FWYJZAEarK+4JYV6s9uT0Z
         gCEy+MFcnXkiv9UqcTW1QaXsB0GypHyPUuqaw4j1mmu4j051HaZ6XqgCptoSd412YkQt
         IK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1h6/c8MmzjXbx9/pT0VphAND+XFT7+6Ljuv2GAhEqRo=;
        b=a93wuGuOixuODLS6iBTiS0rmD11uRzuwLOdIeBQaEHPW+AFLYfV7kFzWSo9AJqZarh
         cR91w7qSli/dIfHzV4Y53DC32CT56l9OrVAR8fUw+fEcU44je36W4NxzQwZlni3lOFpd
         +cAIgQteqEaa/U2oaLp1HQIcyxz8UtXWrQ3JOIa36tyT4+44E2QqBJHm9A+ViWgXSt0f
         qzGnA6eJM1xQAPUhsDPRtkwQ+1fvlxsp0GHLrcePJWtD5ReGln55EaaJc6D8C4EaafAS
         uUxVH36AD/nlYKBi38m9QN/KqrGx2qdUeMq9E++k1qTIQJgINMR2qpqEc5mIlBEilP/k
         WLiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531sJki6zZpqmXrtnn9ac/VGwjLFRJ/YM9mEMZK+1OyqSb86d/po
	1VAc9xPrmJgAbta7amTeo+0=
X-Google-Smtp-Source: ABdhPJwT5z65UaUtCujpkXeCok25misGxB7r3fnf9hq4a5fgggTmpT/Is9mHHibJI+6VOAD5Luf7IQ==
X-Received: by 2002:a05:6512:3455:: with SMTP id j21mr6177238lfr.282.1629387182042;
        Thu, 19 Aug 2021 08:33:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c13:: with SMTP id z19ls998428lfu.0.gmail; Thu, 19
 Aug 2021 08:33:00 -0700 (PDT)
X-Received: by 2002:a05:6512:200c:: with SMTP id a12mr7283696lfb.75.1629387180868;
        Thu, 19 Aug 2021 08:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629387180; cv=none;
        d=google.com; s=arc-20160816;
        b=rUSDj5wUS8aOnI5o68MK+KNev0MDA3GpORDZ6O9Y85M9bO0Jh6I0SLsaDAnemzjEy3
         bWUIM+nXqJGHIlWR5CS7/0l6XaqL73Cfl+74tLASjXjLiDh6HNhSW963wKSVCDFFc/Gm
         A5ywPKtjXkYOrLxip3gFwMk0v6vFO8UPFl3b7YGBvGBPMS6N06fu3tAi3i6O/SfsiQo8
         Ttsi7bPDdfRf8QC3lE4H8acpGaysumTg35BC5QK1y0zMWwl2swzgFIGRCL+W2q/KulFu
         kfcWrAd/34/wFYuFJViKuezaa+I3OEDkv4Mt6Ixp/g30zKovwXJM4V752Oxtk6tVuFFs
         RY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=N3bjIWIMCmGEtIIgA3mllr/uZFzTNB4cwtALNqJiY+0=;
        b=nnVziHrI5nxHIe026eD619R4M7g9RbY6QGDvJyhblQhuOtLRi8rQNe/Y5En3gR/2Q8
         ROt9PvTCYacEuHvYfdy0/aagKn4ZUvdRI8OxVokIJpCnq0bwyUSpMRqrbpZjdbIEwMlZ
         huILr08TNp/i8TUkCQcPte1Q2TkJ1UQMfM4shP3FwBA2we+HPD62xxETF4R5fHgYTFra
         8bZMfHCEJmRysYEvlpITaF8IIEazAg5tDVHJS5IBHlWd9q3QDwjrGniMU09xhXYh2WVO
         7dqv0o/S8CKBunm6pETnJN+Iil+23gPtewSz/ssAHcg0jdyN+3yC5RqxRBDO+8BO/hIA
         uMEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id p7si133713ljj.5.2021.08.19.08.33.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Aug 2021 08:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17JFWx21017951
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 19 Aug 2021 17:33:00 +0200
Received: from [167.87.0.29] ([167.87.0.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17JFWxix021762;
	Thu, 19 Aug 2021 17:32:59 +0200
Subject: Re: [jailhouse-images][PATCH 2/4] Update jailhouse-demo distro from
 Debian 10 to 11
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-3-florian.bezdeka@siemens.com>
 <71a16866-90de-4580-5a71-cc6d384e677c@siemens.com>
Message-ID: <0a3ecae9-8b7e-ba86-afb6-97f8a6ba1d49@siemens.com>
Date: Thu, 19 Aug 2021 17:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <71a16866-90de-4580-5a71-cc6d384e677c@siemens.com>
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

On 21.05.21 12:26, Jan Kiszka wrote:
> On 21.05.21 10:06, Florian Bezdeka wrote:
>> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
>> ---
>>  conf/distro/jailhouse-demo.conf | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
>> index 5b0fb54..6f2c021 100644
>> --- a/conf/distro/jailhouse-demo.conf
>> +++ b/conf/distro/jailhouse-demo.conf
>> @@ -9,9 +9,9 @@
>>  # SPDX-License-Identifier: MIT
>>  #
>>  
>> -require conf/distro/debian-buster.conf
>> +require conf/distro/debian-bullseye.conf
>>  
>> -DISTRO_APT_SOURCES = "conf/distro/debian-buster.list"
>> +DISTRO_APT_SOURCES = "conf/distro/debian-bullseye.list"
>>  
>>  KERNEL_NAME ?= "jailhouse"
>>  
>>
> 
> As bullseye is not yet released, how about making this an option for now?
> 
> Jan
> 

Thanks, merged - now that it is release. I've just dropped
DISTRO_APT_SOURCES at this chance completely, our Isar no longer needed
that line.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a3ecae9-8b7e-ba86-afb6-97f8a6ba1d49%40siemens.com.
