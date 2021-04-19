Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIMQ62BQMGQETOXNMEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE53644D8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 15:39:46 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id l18-20020a0560000232b02901026f4b8548sf9097061wrz.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 06:39:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618839586; cv=pass;
        d=google.com; s=arc-20160816;
        b=zcVRYYL/9R1ZWSdSe2pmPhFvNmMLVQl/wy5zzk7vBfzxnx3rYIIcGuog3R8y85Q+t4
         643ielQbVGYBeSa7IIeyvzO++GG7GfZjaATY33cqSY8rk52QW8xhiiGNmzWNLBDmYKsG
         V0HzoRwdVhbSSsR4agPTuHS1rIUay6kWGrk446RHndv6bO5xNVxrBldjP1PyAO7T32Xo
         faqK6yhyqoz27bSnuLP1CtoGMQTr25PcNSjymrisaZB5w7XpHsP9QlnkEVCr53tyYEmJ
         dx2bsjMxtFSz/5t+WySIrU2/TVp2JIIZ1sptpo1WaBBTfaPJNo7yirC8yDfZ6L4qJawO
         qPNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=VSNLCA/D9HU/Z9ymUbE4lP8mZlZwG/bdibuGVFfRvv8=;
        b=LWjjBZYl5FG6+qpURRM49Q0l3FToWb7VrLKNaeGDnApQ0Qo8bCfzD8ppMT7+sk6Fv3
         DsQKC4dvMParTg2G+kKsXOifBzlb+tnwmrYiZeKjDVBvTaWksnV8zJI4/LvQtSLUh9VL
         Ikellu7IyFNsWbYqrN+ibMBFJ6h3rghiNniD90O2PqrfQs6mlmGGyikr8gsBh/9MkH3L
         kfTc6zwX5SaFvIGLpv0kyENUIoRn1YOXPTYGfsGnxacDGxeg1gniT79cobwV4wXSLY/3
         DDl8I3OF/ouS4SqfrQYFgfVciPJOpk2S2rMTcI27vEFEjOOdTcTf4mGt7kNbpxiK3L7r
         82EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VSNLCA/D9HU/Z9ymUbE4lP8mZlZwG/bdibuGVFfRvv8=;
        b=g7MyVHO0VNfJZUqHtFLqhsyf1pWiNjXTNMZqRwh1VGHzYaobmrQpF+DxeZSFylN1b+
         FAxjFgZLSrle2UU4F1onvfy/lZ2DfpIzozzy++ueb9pPelV3sA9AUw28mce7cNDXlVG9
         fKMSkPMiZ+mYtJVBATmHR39DsmLL8XDtj2Co29pR9Guc22r40P4Xd9uvBvEVe9Xw/f3T
         +3V3x9ydzoQ6L2TJ7XVhxIDCcV7sx2b5/ZAxo2IXP5z8VFGpPpIOfgdrzpYUbRePNveA
         +m7AQBJHxU7YNsx3SU36ZUZrRPrlw0DKXcY1Dux1xBlTa4lJB5FOT24721RkkePO9PvF
         ngxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VSNLCA/D9HU/Z9ymUbE4lP8mZlZwG/bdibuGVFfRvv8=;
        b=nRu/z6qdBGZ/PrQqgFPX8XPMEnl5ncx1Y9BklszGop16XBhBr6z5TCiisg5sD+hTmy
         JeBmLQ5UkKYQzWNPoy13JOdIwduKIgKraercvveF8y5degOLGh46Rsoqxk55iXp3s64J
         0eaEnd+Y2RapZKT90l13VyJhH+5PcCNEcQ9BNMHD3seY59KWqfborNfAuZn9ngHy+Qnd
         Aps5Ld28yrk7V/FMs4zShgIXQ/Bhr0luu5jruuHplDq3ViCZQUOSyRfPfnf6SnmvCxii
         1WEat/PWDMfDND3BNyQWRDBytP+FMSyAJEDHst/ntFPAqqChotXW074fuHmAxr7B7ghu
         uhNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531b/vWBSQVXzx9fhE0nIVUbiY7v15qAzCR5hMd3nI1Xjr2WuqTf
	Sf3gTm8iUI2OfKe5xtos8gg=
X-Google-Smtp-Source: ABdhPJxdgW0DeSYyk71ReSWQqjqPfFNQTA8O27U94lNmJgG2lj8jcFshENRBmRyeJpRAClut8KJOPA==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr21932246wmj.184.1618839586020;
        Mon, 19 Apr 2021 06:39:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c1c3:: with SMTP id a3ls7949208wmj.0.gmail; Mon, 19 Apr
 2021 06:39:44 -0700 (PDT)
X-Received: by 2002:a1c:f614:: with SMTP id w20mr21465056wmc.70.1618839584921;
        Mon, 19 Apr 2021 06:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618839584; cv=none;
        d=google.com; s=arc-20160816;
        b=qkj2jY17BGGLVJUNrIx0t8OKAmdAZtkuXnhMiYTrabNiBVEhWdjIx73vq96mmY4n99
         73muvKWMNUZOdPiIjH1VIox7ClKjv3YXovcY4wI4qxgmYTlGCD6hBe54ONjNkU1rXC0i
         tewnKmNgXY+gQChBuJdsJV+lx1zo9BI+aNgLIM3NyVt28YctjbrY2Y78ScG5TLoP3FGU
         04nBKf0auO4enX4c+2mPcLLJzgzq4JES1+RziP+qDNx8hn495FWNU19Om3hUnXgM4Fyl
         lMO2IE4fzqsE2BZ9coo9qE7WKSxEj+UMr3w9L66bmMFd93598lqqLMnl7Sk9RS8Ku6lW
         4tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=dSTcvMKF9Gf6jSQ4Vu1YPCE9jE+DRVAAbTk82ubsvq8=;
        b=J7Bi4rQqtZe7JhDmT4PijPXFCDlqGwGIqfR/pBDCaMsn+nRbRw1rusup8b+HALAM2r
         ENjfZ0sjB6WhhNylhVqltgbcKJaPudDGOzVISacYBEjt0VzR50PU4hkRny6VbIKiTFxI
         4xzvq3zvELEX9HAu6EwVwvnpzOx7dqp1/7PWM18O/BIF9yFL+ib02ipRzaXTieZUoYst
         GUvw6anC/ntkQBS/OQfx04XLbZ8FP3JGg5DHnJ1/68NVloU6wu5tHt3pGYKW1XGMflRe
         61rEyvb4hhyN4TsEvxI5RD+7ox/TBJgdq6KsYSJUBfVMBXVZPT4wdmgkpVLX+qEswRt9
         /0YQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k6si1111207wrm.2.2021.04.19.06.39.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 06:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JDdixn019128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Apr 2021 15:39:44 +0200
Received: from [167.87.42.108] ([167.87.42.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JDWO44028424;
	Mon, 19 Apr 2021 15:32:24 +0200
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9234b1f8-0275-b438-a1f9-9c274dd74c04@siemens.com>
Date: Mon, 19 Apr 2021 15:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 19.04.21 15:28, Peng Fan wrote:
>> Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
> 
> Not sure whether you are aware.
> FYI: SDEI not work with OP-TEE for now.
> 

Thanks for the info. None of the targets I played with - so far - had
OP-TEE included. AT-F bug or a conceptual conflict?

Jan

> Regards,
> Peng.
> 
>>
>> Hi Jan, all,
>>
>> I have seen that arm-zero-exits has been merged into next.
>>
>> My understanding is that right now the only officially supported boards,
>> meaning supporting both jailhouse and SDEI, are NXP's ones, with only a
>> experimental patch for the xilinx zynqmp firmware to enable SDEI.
>>
>> Regarding that patch, I have looked at it, tested it and added the missing
>> non-secure-boundary check.
>>
>> Are you thinking of submitting it upstream? If so, how do you want to
>> proceed?
>>
>> Angelo
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://groups
>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-03GyURVJ2De-Fe5r
>> eAcvveWQq7JxAUTh2kES2DSbwcWA%2540mail.gmail.com&amp;data=04%7
>> C01%7Cpeng.fan%40nxp.com%7Ceaba478b1d3941914a6508d8ede4db50%7
>> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63752091447529456
>> 7%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
>> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6zMBNnEHb%2B
>> %2FL3FRMLvw%2BlO4KnOr9ryagUIj0soQB38c%3D&amp;reserved=0.

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9234b1f8-0275-b438-a1f9-9c274dd74c04%40siemens.com.
