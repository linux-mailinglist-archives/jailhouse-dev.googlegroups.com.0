Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMYST6QKGQEGJFG6OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACC2A91A1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Nov 2020 09:41:13 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id e11sf205797wrw.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Nov 2020 00:41:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604652073; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZtgXsC0/gzdS/mNnQYeIyPzkqDKzr2tuqDUBpmzXB1WImt2FGc5xVdMz3Bq59DSymr
         YamnwF7hoXs1L5ip458UohGT2YRV4Cq3HD/Q4jm7jWNrYNSh0s8qNHWyydIUi7agou3E
         ato6FBBOWkSRj/U+wTB8bglwGzJAEz85oOgBHQRi667Ghz90lKdqAEBjt3D1FSwsypFz
         WobPQpoikV4CMAJesRWWMfKTu3uJzuE/9op47bDTXFzGPwr5mDp9CKM3K89njQrKRUwJ
         5sC0DFiaXmRsPLQGEo9r2X2/K/bJySXBsFT/lILETV4p2+RtKS5+cWrXEGSd7/AVuPeQ
         TYOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pS72nqNaxzUK784pJe0tzsagVD4/xIhIv+jIgqRxUq4=;
        b=plMO79G5JqoNQLqoz5kChEDXmDmH+Ty64V2uNQuFL7g/ma/gLuy8HI9gcep2DIMTRu
         iCDxLMXZWdHZRquBndOYElSCmkxf1LvqYtiH2gd5sFjjR8NL8WWxwslU2rTf9+RkiwLs
         on3wmpbK10ZRasYE+YBt2a9uK7XNqEAuPkRkfrZ/43MtYK0FCphzUwSE7RyMbwkoPNRD
         H0xwJDkpZzaUUyhdssbNPJbf/m8SS3AOlxwaozgvkYjbTiPirxDjpXTCfC7Jhs87uWr8
         GLhWTHjWWnUL3NiLS1yZecU1MtXbm79D0prmNdGzN2XLASPaGT1NmevVvt8B7cmWw/nA
         X2Og==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pS72nqNaxzUK784pJe0tzsagVD4/xIhIv+jIgqRxUq4=;
        b=Uur5hGZeeI2eOha4FVloPTONDzHva4ej+uNwhSKgv5BKqG1By2NlybYXPMaLHfKsH4
         8kk+ChEotFjbAv+cOrgie/ArcnAesDfwmHeN0fOJNlm0QJnMH9nSHXVBHE0QyKGE4viv
         AaJ0LT41ZqOeHqmS31NdjGYAOEUvg3c4PwHHXXb9D+JJ2WHVYn5fztnk0qh5c5myQnm7
         J68ZUEeQ3hSU0f7ootfm1IolGMxbwC393X7CYDxLP5ha5HONEDLlHhTZda1HcEU67B/m
         SgTq2iuwUQwFyxAL2oFKH5aejaPj5pSL2Genpojo8u0pH1zqnakWLAePspNzN6BNqiV9
         2J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pS72nqNaxzUK784pJe0tzsagVD4/xIhIv+jIgqRxUq4=;
        b=p7ThmPTXlEqH/NqaUoloFmvafiPHy2u+EbSHaknZizalSDSO5Ru3WmE/yrRXdBPzyf
         TfO3uYl86pO4ngfz8HMV7DgR/euIG3D3fwlye2WeJuphQYOKOJlvemeedh6jXqmadZf2
         w7gOqkHspQRf39yPLCxwR63y2uC0xc0jKocTDTGrB0W65GgxXP8CWye591glXEI+FjXf
         +bAQA+kxZF71rE9oZpjnQOjPxzHcp8InipQV/8mKRSq6W6LEY0qp2NMexJ+7rbDLhJZ+
         Jrh/lWiIQ1JNd9MBeAuip0rj9QmHaizTfkSqe+FIg5VgWHb1fAWg/jfCgqsSU325enQ4
         G8vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Z0YtnYQN8vZIFKe6G61k+VgtF9QKujO8CpXN4qjKVRTt3iPr1
	juphyeCpPxyt0NJLn9bLI90=
X-Google-Smtp-Source: ABdhPJz2c/HeZF/KqHvZbAujfUCY4lw1YIx2EEMUIgI+GpB0QTGRvTik4PXze5CHbz/o1LkUImammg==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr1289907wmh.54.1604652073717;
        Fri, 06 Nov 2020 00:41:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2348:: with SMTP id j69ls272034wmj.0.gmail; Fri, 06 Nov
 2020 00:41:12 -0800 (PST)
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr1175507wmj.128.1604652072553;
        Fri, 06 Nov 2020 00:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604652072; cv=none;
        d=google.com; s=arc-20160816;
        b=WxmNH3rWHyHI9LSOpfRoB+lWH9rjTCyfexF7gd3CQsFLvPJIln/97Y0Bix2ZiNYhXN
         2QJJYxeMU9sojNHexxtzcwBA9p4TSWMoJa6KZ7u2DcZbGgcPNj7RokzXlTEYKwzGf7x8
         LxSsP1hs9nBXIqc6BGbeZ1fCHSEdJSgqt7GVWf0XnYLndLSljpbzBOOWGRNSuVAfh2uv
         7xcNF+dWJUtlaiLAQMVz76EIuuL24uhLmQAyewLtwzkH66ASJIwIIgHJy6OJVFK4oK0J
         O/UxjotjNmhB9tHsmERFDlbyrgcgutzItpy1hDVgL1oBSWJvlvWDiNYVbnCEB2bHa/Pz
         +nzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=CQWFWcjcH0By7qurjdr/ISQL8UW0BsK6ZX62MscC3NY=;
        b=HUdCP8sr+7dANjzEyVJ4r7UMBVEOxTUd/Ema7JzfHEcrT8anCFFCeVxZcNjR29U1Ae
         iMoYUdQjFHVdPB1CRfnFq48VXUcyIgd8mNapUVRWiEeARJ7/VvwV9ZmZUE/hUnGltJ5k
         ffW6FiEXUIWbpnKkEWnhYj7Twrk9kDA8Q8AjhemycWx5R5Y4CKr13iGMIet9ufc6Mybc
         yoizM78SCnW8lYP7GjYaYQa1769clDg1Z+3WMk8aieV2hAOGgNTQgUht1+Z8bAYWE+i+
         ED0kMACHrPVLo32fOS5dyc9npdP5YQQ6dA5BiyGgbqzXEAu3dSR/jHwygna2Es3L4ZeO
         oy3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o4si17063wrx.4.2020.11.06.00.41.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A68fCbW004926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Nov 2020 09:41:12 +0100
Received: from [167.87.41.231] ([167.87.41.231])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A68fB1P016243;
	Fri, 6 Nov 2020 09:41:11 +0100
Subject: Re: [PATCH v3] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Sekhar Nori <nsekhar@ti.com>
References: <20201030122712.4199-1-nikhil.nd@ti.com>
 <20201106082508.mqlqohcvw77wysnq@NiksLab>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f702ebf0-991a-c793-1a3a-dc1f03e2bc9d@siemens.com>
Date: Fri, 6 Nov 2020 09:41:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106082508.mqlqohcvw77wysnq@NiksLab>
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

On 06.11.20 09:25, Nikhil Devshatwar wrote:
> On 17:57-20201030, 'Nikhil Devshatwar' via Jailhouse wrote:
>> Current PVU iommu implementation ignores possible failures in the
>> config_commit part. This would allow inconsistent configuration
>> to run and may introduce unknown bugs.
>>
>> Solve this by making sure that the pvu_iommu_config_commit never
>> fails. Catch the errors early in the mapping phase. Use
>> "free_tlb_count" to track available no of TLBs for chaining.
>> This can be used to check if any mapping causes it to potentially
>> use more no of TLBs than that are free. This will ensure that
>> the allocationg for chaining will not fail.
>>
>> Change the return type to void for few functions. Add comments to
>> explain behavior in case of failure. Remove un necessary checks
>> that would never trigger.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> ping on this
> 

Sorry, long backlog. I'll try to work through the Jailhouse patch 
backlog soon, latest on Monday.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f702ebf0-991a-c793-1a3a-dc1f03e2bc9d%40siemens.com.
