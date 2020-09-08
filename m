Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDF33X5AKGQEYD6FYCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 53089260FE2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 12:31:41 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id l22sf5022587lji.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 03:31:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599561100; cv=pass;
        d=google.com; s=arc-20160816;
        b=Iz1r2vVNc98PYzty77UxmvRQ1OodgsKNlnfOujUSrOsRctl2PQucPgv4edVnTMwKTX
         OE38sy3kZv99APeU2fnYmlld0f9cqzSPXzyq2ES9MdTrwF+rQvJq2YAqOA9vYI4Er9gT
         LyyUsMbTjAZuoc25gJvFlVWgUrkCLkc3eE4iJCZHSkSOLz2xO3vG+5jwFwjToDsYGy+U
         Bec+elmQJsxzx4mhP7zvaH328gVMHVmp9r1ikzZbB+zsnOMqiqLIC5JaVD2cZyRcF6U/
         NgFxKFGWXsIiS5yDZTpno2f0k+BCXTRYseyJXXZyvpnQPU1F5FlCQhCEbVm5QV4ljO3u
         67rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=lJoDlKKhAlfqur91GWOU3eYhofEYPB4xscjK/pWxXVg=;
        b=ICfRg0uMX0mb0AVrsm1Q4HhYmr9jkAKBp6mGSIcFdpe7xAKAhrbVenuzYrVNN5x9Lr
         4OgnKtVQ+LC0X/2b9t2VRQFJe3PJYaMpBViQNq5aODIjdctUXBR16xI2Yhc3nXtRW9rj
         p2gsSircXK5G0R96KQvsnHRe8oyziStxU28kRtAvelNMQOEMLwxRMMutY+lfFv84JhpT
         7R2l//Jidpz46jFRDZRNmAUNa15ya7hxoTfOnBKgOyWdQtv2M2fx1XwSDgVvwtYYkmWC
         0IKq7OgaZHWMErG+ZotXOfWON9nNTNbRLAM2jlKMeWogYd72c565qeSxFDb4B7RR/IFD
         5kwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lJoDlKKhAlfqur91GWOU3eYhofEYPB4xscjK/pWxXVg=;
        b=OgJnv6eMiup4osjoKid1xntcXEVKOLmOWaMxG0mLaWVd8iL8tqqHExqqsNe2Kk+MUv
         /MhstktwUITZ91MxnQxzta/9smM1ulZ8PjnNw/kUJ5W9OZakJWaG7ikEZWD2Z0KEcnvl
         3graNbgPiBMrETM0IcHmL8BUUpAt/Y/vWb8o9XuvugXHzyRqWqmALSmyoVlZajnEjinV
         dTbBSYxTVWTZqCq+gtYbRW2oRi1IhgXpHNN7NOWP3wddYU6OwVQtu0HhQYttC/c2vYBy
         v2Xse1/KuMTbPsuLk8FWaQM4T3omhc07vf4AxMr8gMp8FPQL2yp0Ya+5q+matoLxHpyJ
         DcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lJoDlKKhAlfqur91GWOU3eYhofEYPB4xscjK/pWxXVg=;
        b=leF3J4sRD04cgGrlPZeT/pduUrBWHWLKqmNpj0g+8dxgP7NTNwprKslXYcpbrAdj7E
         jh7Xy/L45wvdk1GwZa4UDSCy8mSYhgqYwN0KQrcB6dOryn2sfBO1jKP2ysAMGnTALsFN
         4XO6HQvV+A4dm52t19gAgV8mzk1CxyYoRKsvqESnC8cWCdroeK9hpTENkhHYaZyC9Iko
         1QKU5KETAwMprCD3dYnuNFtRGHkDmsNL35rNbTWbCxW1HSDCjJX/NNmW3sEyVveonnwI
         OSo75C+mX5I/wX19//iNuQ3eNQSlEK9gleBL8jV3b1Ed2TLur7Alm0BMG2iUEY+NcyWy
         Bxfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330w2QAQcAkVBMvkoiPwFiL8g3Hq5cAnExi90j9uvi5Ymq9Owx0
	bWNXx8YPcYeS1La9lr9d2eM=
X-Google-Smtp-Source: ABdhPJz3Tu/rgie1F/aYO59Q61wPik6b6a7ek6ILph+6iQ4pRpf+FjJhfbZXlBdHi99MmFXaFyA9ow==
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr13451085ljm.364.1599561100836;
        Tue, 08 Sep 2020 03:31:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c8:: with SMTP id n8ls3745822ljj.1.gmail; Tue, 08 Sep
 2020 03:31:39 -0700 (PDT)
X-Received: by 2002:a2e:814c:: with SMTP id t12mr13207213ljg.362.1599561099648;
        Tue, 08 Sep 2020 03:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599561099; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgKPDJquUdimDsd2V4k5FinMS5TDaE4+uzPMM6q1UY6jduiz9XBNd4ths8o5R8soKz
         Hw7Bol0YcmtkPpuGZZzszK0EBfy0ALqQfgjIV8FkPRWSQVAj/PjJCjer7M1Y3q68v4W2
         Id3J0WYP5K03JXw8jvxkHj/akheLjp88ROxveY2lreXiOBadVI+XDTuESowR3ZeaeqZx
         GvoIgwEgcDWsWdOoSo+xx0x4wmHTF0KoX2yY4/mQjb4FjhzlNq5NU5Y5SrUzMQ04KRM0
         bQWUqg4BBrnCWAfUIZnOmcBogwnKkYt73MahowmXKKosenMBonLuvLnzOh/M5c+qrwli
         Dbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=nGlnnk01J+Lrz9gRib/kILfmyD3NLoISb4giUCNPf/E=;
        b=jJJcBHzYBXsOfnAijHxZl+7b6ABTpS02aYLmq72dB9hkWbwLrqV+mgDBqboXbAHWsO
         gQ4p9UW+RaykEm0vKMnBVfyYWq2TLMMSvTCpqjV5JslROs8kMFwc2dV5lSKElTtH7Bdl
         S+lv8Qdc2Jlhd6xDystIad0KsUyqGulHe8+yCIIxHqjhnRqpHWBZfZ4erzYmfsOvSFVU
         uBseZdM80apMch5dxc/h9Kn4dZfcDsB8aYcvrZnfLVPmLhMER3cntUWVVch9H7zGGvkn
         zJTw80gQjvZ+c7t+HFyVqslm3TmknYPJ6On4gY0/xXv2YELZzbhXzAJG9pKbJfm+5fJD
         AXLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h22si135065ljh.7.2020.09.08.03.31.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 03:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 088AVcRJ022045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 12:31:38 +0200
Received: from [167.87.35.249] ([167.87.35.249])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 088AVbpc022279;
	Tue, 8 Sep 2020 12:31:38 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
Date: Tue, 8 Sep 2020 12:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
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

On 08.09.20 12:16, Jan-Marc Stranz wrote:
> Thank you for the explanations!
> 
> For the IOMMU support I have to activate some options in the kernel
> configuration:
> CONFIG_IOMMU_SUPPORT=y
> CONFIG_INTEL_IOMMU=y
> 
> However, there are numerous other options:
> CONFIG_IOMMU_IOVA
> CONFIG_IOMMU_API
> CONFIG_IOMMU_DEBUGFS
> CONFIG_IOMMU_DEFAULT_PASSTHROUGH
> CONFIG_INTEL_IOMMU_DEFAULT_ON
> CONFIG_DMAR_TABLE
> 
> If I activate all of these options, the Linux kernel won't start!

That would possibly be an upstream issue because Jailhouse is not in the
game at that stage (assuming you are talking about the root kernel boot).

> Which options should be activated and which options shouldn't be activated?

Possibly CONFIG_IOMMU_DEFAULT_PASSTHROUGH: "If unsure, say N here."

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c31c0a2f-17a4-d970-5f5a-7d26a148a740%40siemens.com.
