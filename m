Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH7P7H4AKGQE3VSHS7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498022E601
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 08:43:44 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id t21sf4068458lff.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jul 2020 23:43:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595832224; cv=pass;
        d=google.com; s=arc-20160816;
        b=FFHoKduvOOZtO0+fPyMP8+C5rNJiwyt26BqDevIdtdu/0l8N+YSadpGwO/6kU+/hUA
         hxEHvgE11u8dETENwEwFevj08R44ZffmBj+rfF12vDoVfjYaCcwHMnp5KUZPi0YIpK28
         guJz8T2sWj2svgThEQTWcUFxOPAMaJ6bYrYQFsnrIcBFgTwBT/sXZIvySi6SHduSgqXx
         dBJ+exH6CH6ofmeYlwmN9oTTGjtMg8SheNVMNmI7ZLiuy0DSrmMP5/eQh6hj1/7WYeSH
         +/4Bm57CYTTBKZKWtCKdNn/g/m5T5hmeiPhU4BfJIWT2yqJTJwewBWoi065aCq18Omh6
         N2EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=T+ZS8y50jQeQQ/+IJkSEGgE1AsPK1paWGrbgbCMJS7o=;
        b=Xm4uR+Fm8WVt26p6X6dqVL587gdJpVJ2Deuvo8EO6hbpWqlEDk6FrPCKXxf5Gzp2wW
         lhgkg4XXn9vk5lQ7p/Cv71WK6YVOid0Yd1bewjhEausIbwp4E3n3mXP+m8nWCGho7JLT
         o0P+EyhHDjbLwvD4L3B1+c+bxOEHuWOPm/faN5xObEU4acGv749ZvKSxJkeg8wFtMSQl
         VsPqKU+/ZzOsgeCm+YYWi0Ks+Znx8S2g3gGDSlyGWMmZy0HeU5xZLk9OlIqOUslK8pDq
         h1ZklV3oCvpQIsfseBWYs3GaJkdgGjzG6r6OQQcBkUWkI+2s+e7xEi4VWNEe6wJHvfp/
         TNrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T+ZS8y50jQeQQ/+IJkSEGgE1AsPK1paWGrbgbCMJS7o=;
        b=Onkogj3RDaH+uYI3R551sTU6u04yGF5/6o2mK0z6awSNuxTgHQak6kvidX5Iu8B9aq
         KH6nbuAA39qHGgNp1Mk0/V5oEfTyU8dP2GJr7j7f0qCYrUpCYkRZkkFHd3VQWtAsjFgg
         2tD4Hwxs1GbqNRr1ZdVnQKeZlT5+biukevs5FFunxoLI1zXP9xwRwKGVwyQ3Tt4YFyJf
         bCXnvoQ+N4vwAc5ofdUGPmnt5qSy2ksTgZt80qiLl2tYRfnd+Qd0EvvGwPwLd58ER8zg
         PtEMHmYmXNUFcFLE7LbDa1g/b6IRF5kbmiFQTYV4tL8XVnEp5dnmaQ9nsPl9i4+2NWwf
         AiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=T+ZS8y50jQeQQ/+IJkSEGgE1AsPK1paWGrbgbCMJS7o=;
        b=T9jw3zQ2IQzjelqw1sVXCrwSMlidmiA/p+J9aQ8/OHrewlZ9K01p51rNG+oZLPgnH+
         wVXplYNYwqGMNE1DYw2A0iS27IMaer3KuKLWtqSThM9paO24Mf69euR9oe24myVr0EcR
         qnSL4OsudjSgfRqPaq/RQmyJpVqMmP/OKk7pElnkbl3DriqgfFpkiEfWbIoOQfLv2WLX
         5+v98jr65PqGl+rdsu6X9Zde6lVsy4Jt9X8iuHcQMb0Ou7PNYKD0XIjv69r6KHwlyH6Y
         ue76Kc2iEUaehh0NIDCm593T2O0hZQWIJ++d3Iz1gNr/WJtIjzjZs4zNifAhfaMGM9jI
         biDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p6gwW9eS8rJN4BlKNy99A3l0Rh9go+87srMmsNoH3RYTeLpA5
	HhAq/RM1hCFHT7goC/NhJ2s=
X-Google-Smtp-Source: ABdhPJxseCFhyu+UmEPoIvb62+5wkMPY1wxT2Tdr3g4TPVXraOqHX7dSbRDCIHK29sx2dLSoowdhag==
X-Received: by 2002:a2e:874f:: with SMTP id q15mr9872095ljj.16.1595832224119;
        Sun, 26 Jul 2020 23:43:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls1834178lfk.3.gmail; Sun, 26 Jul
 2020 23:43:43 -0700 (PDT)
X-Received: by 2002:a19:4809:: with SMTP id v9mr11054384lfa.201.1595832223389;
        Sun, 26 Jul 2020 23:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595832223; cv=none;
        d=google.com; s=arc-20160816;
        b=Jfw79vtrAzaZwX7WyPyjOPTWsw8a71nbuxrNf1nu/rsOLElm1LsCdZHWgx8wlb/SB+
         c/RY/KCYtoR6Kz16tdaS/7PCfDOrtWDaLTJRhXvJXWufQtLsaDIvU2SPQNHytvRZvvPd
         JONa+4QkEo4P6gOWLpgvS7gTkn6Jzl+LWFAzAr1Y4aP16T1sw6CNZjerdT+CENA+ISXI
         YRlzuPKNXhPG+yHs7MqQRGc7rU7TwnX9VGv7A/xsQ2NCAwdnqJu7k94/2gYAp2E1+vhN
         Q5O0TjBbp2cEzUSAnuti2zUGiAjfmFvBRKOuzhPAgGDujKeLZa3UwmcnBwGuntz+rqv6
         0DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BozNLYQwM0NYir4S6teTBymAGTC6EyT1rF2ZeBiVCUE=;
        b=LYxrqvEizpaofaPkZyH0GwBdSeb8oWuSl1J6VFC3gPpHDqpm2ZZXwXwjTDhDjP1Xh4
         +sjWQlI6z8zE9FkFRXIAyJFR/B44PSdKIQjTEl/1bn2BKb8I82kKnhJVuWfhcxumIUOF
         4XRz1dEIkkkWF/ATO4EFbjBHMU/yffz4ZG70/gtQFdm0E3Jej93Ja3NmlcVNZ40hgtLS
         IERS2pnz6+Yh1FZ+bvVzmKatUQJxj7PBH0i5dkzoBgTKPXBsA9r4HYX7PE8B1/rm48e2
         vutYj6xnjsIsO/SkT8qfs2IPkRhRFlBWGcmtWZ5FOum/j/rtAYLHyQseRO7pHtovi5iH
         6nbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l22si179933lje.6.2020.07.26.23.43.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 23:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06R6hViV005489
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jul 2020 08:43:31 +0200
Received: from [167.87.246.21] ([167.87.246.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06R6hTj6001385;
	Mon, 27 Jul 2020 08:43:30 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jose Martins <jose.martins@bao-project.org>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
Date: Mon, 27 Jul 2020 08:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 27.07.20 08:25, Peng Fan wrote:
> Hi Jan

...

> 
> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
> 
> Without SDEI, the gic-demo jitter is 999ns+
> With SDEI, the gic-demo jitter is 124ns~246ns.
> 
> Indeed no more vmexits.
> 
> But the max jitter, some times SDEI bigger only when program start up, mostly because of CACHE WARM UP I think.

That is one source. If you add a warm-up period, they can be mitigated, 
though.

The other source might be last-level cache sharing. If there are 
cache-miss counters, maybe you can check if those increase along the peaks.

> 
> Will you move SDEI support to jailhouse mainline?

Once the to-dos are addressed. Any contributions?

BTW, did you have to patch ATF for your experiment? Will you upstream 
that patch?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/640c6eb8-07ca-c354-f888-abee87ff49b6%40siemens.com.
