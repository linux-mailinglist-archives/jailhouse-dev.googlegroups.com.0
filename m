Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXGFRT3QKGQEOHNJIAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775E1F73F2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:38:20 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id x15sf2149646wru.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:38:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591943900; cv=pass;
        d=google.com; s=arc-20160816;
        b=RvKsgqsgCZMyKD14GeCB2vsrI90KTfAwnYzFWhe6EmAKM0S5SI+EAfyMy0o5rHAiIo
         TTZ1KxARdggJ5OLNxr14JRPL3dg5CBbDnuLa4JAlWI2yIrYpYYvzy0H8rNPduh78pSDc
         n1IgyLh2E5e0+vpSY98dlhoTVKUwVDHz7N0oL8kKx7HVOWfgHhbcQDTMplTELcuQKeJv
         8LzNkNN27uCvouHRG8zcJ9XO92rGcJAvK0aSwdsxrjvkkqpo4YN22PVXCQnFNSzwxtmv
         z/9qx1h9VenHtg3JrOYFT4kMJ8QmpLqJP27lBvSingbPKRMNxJ7fjFBJYCaT2RRqjlU2
         +Mcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Hm/cCrobdjfyTSkbP9YsczQNsB/E5tsO5uVfxjDYZOg=;
        b=sH8emm0fjDiBSIBaE7nOPWloXCjG7Gd9t1CvC1AanX6bFuHvb7oB4fHWKOanxRnbo2
         PtV4gOABvJHU0Qg+LcKrkBxCx0Ue9gRrXTSMg/poCizKqvVsVhjjHsJeSfBJl+PL1pYV
         djasT5w0boaVDOWPwuFrq5ydGcJgWwbutA/4rmB+LHHzzPowvHMWRvLy48o93Aq2AiIC
         wYbe4ys9Hzn1PPRoBw8WB8jmCJbIwCIu76igZeDqFYKzSD9sz3eNTFb/lKQnVJ8pzsZT
         PopJMKdg6giwxjX+3IEpw6KJc8NXH1TGS9gbbXVYbGwSHLmtCx5CVOVKNxp1pmbnqzoW
         ypbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Hm/cCrobdjfyTSkbP9YsczQNsB/E5tsO5uVfxjDYZOg=;
        b=KWH/CBSKNMuaXRV5l5dbEMmaLqbzCQ7HF+Cd3JziqtzMFSsPdl5H+6S2u6qqI6i6YB
         m0SSBSfWdZHcJbuN+G10+YgLGuC+XWQC0uvGEqHiKn/vrWXlbd2K6cls9V4yqA2JPAlv
         XkPj0WRjKUCbapi2wWgsSUkwKDgFomMjHsu4TwiCrtCvKc6EvzZH8L6lfBTU9FpIryBB
         3DqVdF6nVJIzpc06Nre6BXhOjle+/kxNjHV8yjh2LQjv4DMFI0oYDKq6Oox5oweT11SW
         bcnqliq0KTn6M5qiQWy/fnkLR2IYs5o5B3djP22oYBi7YpNgWTSepDQTO78sVmcjvSqs
         kRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Hm/cCrobdjfyTSkbP9YsczQNsB/E5tsO5uVfxjDYZOg=;
        b=hiDomL39wmZ+b6uEBsQEkR2uqTA1rMNcpCYo8UJz/v1JEFJa2A8sVj26kb9GbCqtBh
         DKHWVDPsOiAybw552fVunCiWh2AK6m398HYbf+jGN6ZHv49q255bF/fxePJC4cv58o1C
         w4Bz6oG+HhJnFM3eEDzcbcA6/7ToQBAoAmbEjuuJRdqE1ngDfJ0pZF3HcbGsXYUHMb4P
         O7zmjGDEgD/K1F9sqH+lLss5dvQOeZJ/xpcqA8zP00MH8IfyvAG5VTQzMR8ZVTggvnq3
         gGriy4domkQev6VMM0WtoIVr4EJ4zVFQPJ6t6ruGyJT8xwqsyHE/llJrZT+K0aB9xM7v
         Sfsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Vh112DhprXYWmJ5qxWLsXxsEG+qI24Fte8YThGCk4gEUJmwj2
	9t/Nt4o8S/4y42/QN6SGISU=
X-Google-Smtp-Source: ABdhPJxi0no0ctp6qH6rqYiwb54DEC1tzhCyIQeZI2mrVsSgmBtfvxAyoJuyTj2Exw6bd/Pm4mpXew==
X-Received: by 2002:a1c:6155:: with SMTP id v82mr11914944wmb.25.1591943900264;
        Thu, 11 Jun 2020 23:38:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aace:: with SMTP id i14ls2888453wrc.3.gmail; Thu, 11 Jun
 2020 23:38:19 -0700 (PDT)
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr12793004wru.194.1591943899600;
        Thu, 11 Jun 2020 23:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591943899; cv=none;
        d=google.com; s=arc-20160816;
        b=M0ton+6162/TpwbBeNg3wqYIWcdVATJjpDi7Bo+zXjUbpFxL5Ll0j8yKJsgsdQdolm
         wmUyE+YA+fXd8vtBQVesg2VS3jsDVpujquo8oiQwn/sXlNfSbeyvnsa131o7kxn84p7x
         2nWGEZut2nlncCZ+bSGTznQd/dOK9eeUmSCQd7r4GpzjqQpyf/bx6ErqrKPshOA8+DJs
         igUeDDOVHLylltI95ytVs+eoAdqARpmH5LimT9kdB6oNz/LDUtGncGvnpUNAIoAZ3H32
         B0ikLKwEXibDY62j06+BzkF4LEW0DcOcagPDpuvqzh4k928q3+XEvGOvrnHzas1XWIXh
         rjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=i/T9G6vGK7NevRGL+gN2GAWFPGLEfOHQS2bYT2999Mo=;
        b=s7GIM8e2NEzKu2YN5bdHv3NC1LbT9uR4Xc6IIdCHfOhwNCdiA2FzYMhlW/U891+tjw
         EhyBbBriVjjlaTyjddD0iKvzksJC+1zX+/hmL4ClFf+btPsGP1mBakP/vwSPGmWJQanR
         DHQaDsuwsA9ev9GMixrejEWWipXyH3J0DL5pVvsSFv8KEbZUj2Cq6vINfqnc5453vK8t
         Tq+wB/+Ybo905Em40Q9S18qgNUKNJvSefQ8U5Ww1GOrZjlsk7ZwsO5gVbAL1Oyxbz/6d
         dIqarGGsJOEy6dVZgk/TxKwthPoJtQZ0qhQXPUycMMl+nOAGGTxXvlzQISm5hUIO4vwR
         TA2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w126si693951wma.4.2020.06.11.23.38.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05C6cIZ5022050
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 08:38:18 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05C6cHcN017888;
	Fri, 12 Jun 2020 08:38:17 +0200
Subject: Re: Reboot root cell
To: Pratik Patil <prtptl.smilingcorpse@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
Date: Fri, 12 Jun 2020 08:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com>
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

On 12.06.20 02:57, Pratik Patil wrote:
> Hello everyone,
> Can anyone help me with this problem: 
> Is it possible to reboot root cell without stopping operation in non-root cell? 
> 

This is not supported because Jailhouse freezes all resources that the
root cell initialized during its boot, and rebooting the cell would be
in conflict with that, specifically if those are shared resources,
affecting also the non-root cells.

But you can reload and, thus, restart non-root cells.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4a04bc1-1254-5d12-05b7-cbd717815078%40siemens.com.
