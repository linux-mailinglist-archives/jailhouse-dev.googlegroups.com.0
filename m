Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYGBSWEQMGQE7JBZMLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB503F6AE3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 23:13:05 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id w18-20020ac25d520000b02903c5ff81b281sf6547035lfd.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 14:13:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629839585; cv=pass;
        d=google.com; s=arc-20160816;
        b=teHucQCGJkCovQrZPRI+FGhr4DApiW5+4kWt6C8YmYTLrAEKH1qQSB96EzpBNt5oBq
         legj3VJIP9lyjHHMVUreHT/Bdnz8jPqcI4AESd5npzZrSyaBomG8dkL3iv2fgGPdmfT4
         ofodBZrpaFrAqmk9n8Oa0/Mk5Jx5wxiTetFk8yuI83pe9xrjnu5pcqBYmRERrkwQn0mL
         0L8Sqx0HCWeCbH48GaG2eWsQCY9giR03U79pq73xupg4wLczAt4rBEKq8WovWPt5549e
         1QfJjJ5HpJVss0KgNdtyjOhYlWuG/SWubnlzRoOJiw3/ly0oIwozIjcJFMonjNuQO+iR
         vJhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=znHM0Nhuf6uOqZKkOupaeyY5QSKo7Ehrd4Z6yOsfApk=;
        b=PCRpPT3NE+Zh5rSHtPkC3yIi3rM0pk/GVfvBGHrV0BhzYddZps1WGixn3P+0108irl
         e+9kcC2mznusfUiFM9CNfleK02rH7P7xieJvidZPyASWkaF8BdIviU7jpG46AOhcTVXj
         cKbw53k2ObgMk0JVmHh0hI1Ri3rhmHkxr0Dfynvqag1vBZapxaclZrAcs5E9ZoopgK+5
         4cDEZdIl5d5ujMFNB2D51yeOV2IJtXul6ioVkva+P1WXyf7N77FGyqnWm4/HMLGtzq36
         VNVlRjpxn2ukuiVWBIbA6OsmGVI7GjQVcNVHDc5rAZNxKST0pxZ7O1h8Mf8UJFLJSUfp
         A5tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=znHM0Nhuf6uOqZKkOupaeyY5QSKo7Ehrd4Z6yOsfApk=;
        b=hhhgbHoL5waIL17+xw/AhthDSoYcj9loWGsD5z3c48irVk+hnMCxGqhkq3VtFm+ilY
         PwDWisZtQU0GhkWmR7av2nfjD8qgoEgJbdvmWbbLq14qOPmlyAy1WUis1nyr2Wbi8lQg
         U+mNgKRy1dH160itoJGlYT2k8ifCmsOSrMy6WMQYooeNTrt8zhkrT6/nEeEDEb5kmZV8
         XxgGpDMcpVO7aeQF30h5KfsW+9TnAg9pFeNYky1fRvlgYHkS0zYZFRrbKh3NWT9k/gpG
         aZzWfL7p0b5cYeNnxeudfTeIP4REf7Ew807WmfjM869NOIOi9X1VykCVZJsSqRN+TsfS
         jjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=znHM0Nhuf6uOqZKkOupaeyY5QSKo7Ehrd4Z6yOsfApk=;
        b=dBR6OET+xR0evi8rUlo2ehe+tAODhlBzAwUM1rbn1/58uo2rbQnVcDYv26XTWe0NSi
         ipY3Tw/gImq2Q3BR7FLOVxAgyoDz7Xcm7Naw90tqlKBy8AB74qBlBBPi3+qmMCEuq8UV
         J+0/5lc8nD6I+QLc3rOUBwq9haAquUahOF+gVLfLZQGBmK7LjDXz9RdZLwTq2TUipGFs
         o57QoRYhWsOsFBkN5+OshhuaQHA6CIxjzCN5flvVamc1nvjKziRZYtiQxLU6ky4NOAxY
         nYIhT0zT1GHwq4a+DWfclvMpAdqupEQ35sKBJrGKxpB0IhgsiWTDJKvDHM6Fi8ZqKXHR
         jClA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gLHxFFAmEtnzHyRxtpQnQAL3EHu9ZGir7s8XQeYwyAOUTkvQq
	jW1OqIAOPkrYv2cD2tRQmh8=
X-Google-Smtp-Source: ABdhPJzk2tEbgkshK2TVd+eMd0uz2MfrK6usj2pYtHLGuhCG4ozH0YiS4owjKkxWK4xq+jzUuJwTCA==
X-Received: by 2002:a2e:9247:: with SMTP id v7mr34029997ljg.97.1629839585247;
        Tue, 24 Aug 2021 14:13:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:ea5:: with SMTP id bi37ls1336686lfb.3.gmail; Tue,
 24 Aug 2021 14:13:04 -0700 (PDT)
X-Received: by 2002:a05:6512:242:: with SMTP id b2mr25135952lfo.120.1629839584040;
        Tue, 24 Aug 2021 14:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629839584; cv=none;
        d=google.com; s=arc-20160816;
        b=Oeq5nn5ai+jzEd6VA3Xvg3JWfims7BXYNVfv1OYxrQdAkuhcP9VkuS0NO8w7FvtwQk
         sD3yST7ZthMFUmrz0y8XNVUmYe+ODRtMkCZXPHrcANKNj6HFRlkpgBgkCmRj+qusYgnc
         s9PvH+NZTVe2UYBFAGXRWwGz9Gb7aFWm1RiXN73drxoxwNpEusZ/yI2eVrgELqQoYuId
         VuZEjy5DqVFP+33YwYCSs3/t691cdlaIGzGjHqpqPHACjKAKxyJ71z4E2efYz1POkEPk
         w4Nll0IqY4IAIURUGIkqUAAib3IctJLFdQbylBnBRVE+vge6bj2xU1axNhtY9qr3ftVE
         AXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=BKWSlL3LQIlF9sIxYrdnyLpXrvKqQM/l3LDGAo7qt3Y=;
        b=ttV3hi/X0exiDOYZ4IeG8z1sWbRuZvdsgBpX1qSHCsFbrHfwV9uFl+Obd0lTRjhy/s
         PJKZ3+U/HN7ciZsy72B13O7Vn+51wMOFTtXMZqMPOAe6PrwqVGtt30xbhXvItTQwLUDC
         PXyzcpQmpVyPq6WjuKkhR69Wd/QLiIcjPHYR/JjHgovIrRqLD3opqf/akn/t7npbtiyT
         OpzCjYh1XmKCjj9DZThXOOwkrEcC3WdvlYoK+IVvHEmi7z4T2O0pLr6JI/BjuZtpffEJ
         sRiK6dRNUsaxMDjqWmwI0ObW4j0/goUTWKCjYu4ONWKoUDaID452GM0n2iEW/WmzxhCF
         ydng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h13si863716lji.2.2021.08.24.14.13.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 14:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17OLD3oD022960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 23:13:03 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OLD2tP022033;
	Tue, 24 Aug 2021 23:13:02 +0200
Subject: Re: [PATCH 3/6] x86/cat.c: Fix returning bits upon cell exit
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB667022FEAA58A2425E69A019B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4cc2a021-5709-b7e4-4d88-e0a62b0c926b@siemens.com>
Date: Tue, 24 Aug 2021 23:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB667022FEAA58A2425E69A019B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
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

On 02.02.21 17:44, Bram Hooimeijer wrote:
> This commit ensures that creating and destroying a cell returns the
> ROOT_COS CBM to the prior state.
> 
> Previously, the following sequence would change the CBM of the root
> cell for a 10-way (bit) CBM:
> jailhouse enable: creates a root cell with COS0 and CBM 3FF
> jailhouse cell create: creates cell1 with COS1 and CBM 1FF
>   The root CBM is shrinked to 200
> jailhouse cell create: creates cell2 with COS2 and CBM 1F0
>   The root CBM is unmodified.
> jailhouse cell destroy: destroyes cell2 with CBM 1F0.
>   The root CBM is extended to 3F0.
> 
> The last extension is considered undesirable, because the bits freed
> from cell2 are still in use by cell1. Due to this, cell creation and
> destruction are not inverse operations, but instead leave the system in
> a different state.
> 
> This patch checks whether the bits are in use by another cell, and
> whether this cell allows the bits to be ROOTSHARED. If these bits are in
> use, but not shared, they are not returned to the root.
> 
> Additionally, the root_cell bits are removed from the freed_mask to
> prevent merge_freed_mask_to_root() from considering these.
> 

Just like for memory regions or PIO ranges, this case is intentionally
not supported by Jailhouse: You cannot take resources from the root cell
and then share them between non-root cells. You either share them with
the root cell (and then possibly also among non-root cells), or you do
not give the resource to the root cell at all (on enable). Makes
life-cycle management simpler as your patches demonstrates.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4cc2a021-5709-b7e4-4d88-e0a62b0c926b%40siemens.com.
