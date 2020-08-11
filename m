Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCU5ZH4QKGQELOSANMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724A24179C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:53:47 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id w1sf5286674wro.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:53:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597132427; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZzsY4VrVBbXjhwqIoxz8xnWp8MTcRbEYHCfBtIcmFBUXfkYJEGC/sKn2eCKddsW2Db
         OOB62gHx7eBvMJRuDqSBbtTYM3dNZUceVGk2QWftQ2dAbz/hTtAOPzuxtoccQoRIP6LR
         ghZjrsfZX/tu/fYpo1F6vih4BhW8wyisEnkdi9xY5KLiRnjZtfMYcA4XN5oYbzccHhx5
         JdaKWXq2jgExJZ4vH8akd8FWhGZsd6MRlogMni3o8PJ0jrAIcdl8F9MYu6PSCB49vM6U
         kTAjbsh8qTrN54Fc/WBndkliXkg+zDA05Nb93X13yIcDkiZoDNtV+tH+lLPHOhbtD1hA
         oqPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=XwaTscIlo1qsRKGS1S/FnbWIpvbcN4hdxVYRW2y92io=;
        b=wVQkhOxbfP0x92MOq1xLJiSONdnWdEPETdyytAOo7YZTUsUWBouZkx5+bS/KCWcYdB
         33jrvCDYd+xCSp2fIFM8/iS2IhpoDQdGVYKpoEzTl+m6QVbzQpv6emgnH8CoeEbc6wNK
         vK5UteIjqlKPOO0gp3Dsn+tI4Wodr2XbinMNG8QSfmb/Z3+b9KxkT/UjsU5Zm86N/ffn
         Jq2YqRTBI+rqzJDal8P4Pz3Yg1Fbg9nPBUKLjPpE7JA2Ouob9oK9NuqtqwN1Jb0oB6XI
         ljzcijq4B8l8p/RM56sTJ+OHcJ8kqr7d/5JLLKW5gFuQYx2wF1uSxOmy63/CNlk5qMM5
         O9ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XwaTscIlo1qsRKGS1S/FnbWIpvbcN4hdxVYRW2y92io=;
        b=g7/E8SLyjuC4tuZ9kh5wXCdyTY/W5gCkCBOAAmYIPSVZjpZmDGoJh+nyR6oVk2Wm4D
         hQc3QTlKHFZRc06/6rO6mUZHpogXe6TKIIe1IslIcbNAAgFfmOUgt/chhRRKmllRD9tj
         5+8QsEdm2KvwGt9mcAPZqhU3ZzfEA1c50H6T4r/QX5BBf24NOouZTzFV3up3N1umMvkI
         zCIh4RoqwSyijdiUuZTBbcPRPLd6S86k44nxX8FekhWEoxcqLaELZDPALWUWUsWrZnJH
         nrZXvuAvwulOqgT81O56DQvgasJ4GciR9Q20Pd6N4Iw8xDREUTVwPc+A5JYzbpRg6keC
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XwaTscIlo1qsRKGS1S/FnbWIpvbcN4hdxVYRW2y92io=;
        b=p5XF/GtX6E/jPLK4WCyT8uRfdTTmq+I57xi1kWrF+nuz7h3u9Nviau0dJ1UfwMC0Fx
         XID9op7VMHgUqw4zMCi+Is+IWIexnzEt1UfkmGQwvz++TwGR3xRAS9BHeafkfK6YL5l3
         dJsC7HGE47jKijaUir9vayC3P3tUkEVj4YZgtc4KigdXWyy0BBhQ81BwUv9XiOr+1qzZ
         gz/vZzOopZIaeMd+HY4U1MYNgxyFW625KfhY1dbMY6khh9CA7c/KGyjXjgm6106tnCtE
         f9HTjnNFxz6fMY1SuG8fTWAb/b6bx3lhhW9ApRGglWw6rGVf6ighzqYgluEY4jBIVVEw
         1Vhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532un6TOjTdc9Y7GClvLWTC0Lk5mBru7bCXQpxQLJ9y8QNTWRHo0
	IspjRG405gkUZ2oXhhbUdag=
X-Google-Smtp-Source: ABdhPJyXA26kF2raSBhZRlnEf1B+pI+GUocHurUGTRhVxGh1Dvh8x6+Q8WM6GRVVIsnFz/6giRM7Ow==
X-Received: by 2002:a1c:bc0b:: with SMTP id m11mr3025522wmf.83.1597132427059;
        Tue, 11 Aug 2020 00:53:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls1262585wra.3.gmail; Tue, 11 Aug
 2020 00:53:46 -0700 (PDT)
X-Received: by 2002:adf:df08:: with SMTP id y8mr30005707wrl.152.1597132426353;
        Tue, 11 Aug 2020 00:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597132426; cv=none;
        d=google.com; s=arc-20160816;
        b=iS+Rz2KCd8zo7LTp9iSKZnph+LBxT04PCk8Tv//bYy1D2KdNelrFXdeMHMDLqoJFnk
         iqDFJh0S7Tp33Z8yXQJYHj19JMmWJItbZch+CRzVGatUgCXsKXTvcEj18FZwPUghSWtq
         8DhjzziT8YUNyh5hRhgZa1GmJ+fN6Zuyc5kxTbyQW5KZEMWW8lZtOFcTWiR9N19jFJXf
         QBI9Rzah5kln+baPp+6MnwifrbDH4h6/1dwQA2diToLnnWf9RGrvHaVR/keSYNCudkXZ
         QZ4wN45ZGueuIxhfQ/t+Ubi6lMJCzTCZ3kIGAW99Xt9v5HYHVCB2KCXGIDwa/f7L+qXa
         V4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=63AdHfSspetikUgXgdz9zipN6EY4y6GtQNNTyheWdLg=;
        b=K8DY+pQTNyn++HrAi8F6//1YkKQym6FyFLhlfcEDhnCdr2Vv7ckaX/6UzAyi5A8knm
         pe8g489aXXBPIb2mpJ6QOgqjURNnbw4fvQcvNmohtZ2V8O2Eur5DR1P5xEcJfslBnUHA
         OB3WwPaLkgHJs64wSTSn9Pe7gtlff/jNRHJ+DpbmEUYtgBp8CJY3j3xrM8SSybIOlkN1
         GJy0vWM3zHSgijuZn8Q/5cip4gkbNAAHNMZzl0v83xYS6FHLfsN15BUjarq4FTvwLtjh
         PQjiu2mOHJgKZgyNhHyMdIa0N6pN+5AWlaA5GIO91t3/OgBeCrQyNydP233SAIuhu4jz
         aouA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w6si136948wmk.2.2020.08.11.00.53.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07B7rjcq030541
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:53:45 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7rjEd023775;
	Tue, 11 Aug 2020 09:53:45 +0200
Subject: Re: [PATCH 07/10] cell-config: reserve an entry to align
 jailhouse_system
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-8-peng.fan@nxp.com>
 <6bc31f67-33dc-9ef0-73d2-68f7f52267db@siemens.com>
 <AM5PR0402MB275689516FF334722382D71D88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7d53371d-87fa-38dd-1fa2-2f85328abe7d@siemens.com>
Date: Tue, 11 Aug 2020 09:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB275689516FF334722382D71D88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
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

On 11.08.20 09:46, Peng Fan wrote:
>> Subject: Re: [PATCH 07/10] cell-config: reserve an entry to align
>> jailhouse_system
>>
>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>
>> Reason is missing.
> 
> Oops! The bootloader for jailhouse not have cache/mmu enabled,
> so to ARM64, it is to align hypervisor_memory to 8 bytes aligned.
> Otherwise there will be abort when access the u64 address in
> hypervisor_memory.
> 

OK. I'm surprised that this is the only fix needed.

We call those fields "padding[size]", see other cases. Also note that
you will have to bump the config revision when changing the layout.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7d53371d-87fa-38dd-1fa2-2f85328abe7d%40siemens.com.
