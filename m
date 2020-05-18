Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQURRH3AKGQECNQPXEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F731D730A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 10:35:15 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id z16sf5318144wrq.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 01:35:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589790915; cv=pass;
        d=google.com; s=arc-20160816;
        b=bhPRRDEXhNMWrIgwc2mHEJaHpYTJHYItSt80442mF4+kFF5rTMUJMiwEF1ExSYNAY7
         x9U5dZikZnFxTg2xN7UqY1bKBU8duluqVNYXyEjR9gM0eJQdLLHqE8tLBQsVpZn5iEJ1
         anmH+5tFk4H2fvDOiCxl+1+6kIIMMPxUjf81GVkjEIk+1PwrW2Mn2Xghl4YAmp3QhUIA
         fQGDe3y+yeEqbeDBWccudlDGwocwGBVzvl2oKeGO5swOovLsj3dmQZvBOOZUXNrzlswN
         sAa9l5AHqG6sKnz8nXYSD2q8Fz/x1b/jCRp3xbYbp6b2H70bn2+cK+b8Qm5JNVDieAg3
         4nAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SJzg3e12PiLQAPPjcSE+O40KrLfcaSBlc02EtFmcA/w=;
        b=NKwZmLnEv8DZMOpcvq6ItOTKL5fAbVO1tm26n6uQTNUkr3KS/KTB+r0JXLqXhgc1q8
         2DMTas4JHSgP1yWJIafGxBAoB/O+6Asb31z+3oqCxGYEuAgT66Hs/zh34Vceo2RYyiLP
         BYDgGR1cMfYufP6sAQ7cDewdnubaQFEMx8nfXxGDOtNPfPr7xtTwBzQ+N2LJy73xO2wW
         X7xYaeLS8gNCd5NTVVi5BxIlGDMtR4TJ/8NDhl1S3GpxELAOA+MNlMHj1aBDymwCelBK
         Nvw7tyKMbzjjx9U69xwWeY/d/ZVT5efpPw4c+J/5Y5iLlzhrVTjeDIiilK9feMqSoLB8
         /jLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SJzg3e12PiLQAPPjcSE+O40KrLfcaSBlc02EtFmcA/w=;
        b=OhYiKG9j9bP7X99r4wLym5v4MvGY8yvMw39N8tRvPqRkk25Jaoatb/nJAIzJJXsVAA
         MRbpp4iyNqpb5CDKrOGKE3Y3JPeqm5gWRjUiZi+gtTxKTQvkX+pM/RxKRx8PuFpP/Ayl
         kQwfs1Ij0+3WE3NrPY5mR8aq3l8dhYlWdeBgvAxC7g37SgeRXX75dE8X3k2V7xNiuUaG
         8qRY/emb64Jkidn4+v/pFBRxLxF7CIfHNHCja+ZbH5QdblR0lgYvyN8F0aJlychhTq9U
         w0LqunpGuGzAHgASq09yJdf59pXTIfGbpdi+wQXdiEdZWpE9oQYKz7E/LMVdjLzOeONq
         JDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SJzg3e12PiLQAPPjcSE+O40KrLfcaSBlc02EtFmcA/w=;
        b=i2u+xhR9xa3osUSZooVt11gSzxljHf/mtV98tcORAhUeFqfwwcTKFBrh5XiHFJYfiz
         asR6gAvB2/iLfN5y+ugQDAw+Y2zI1vw4kQ47TIIIUKSHj2GBF3B5nRA/5fctb/5JCo9F
         U4E+KgQdinf5wGgfT28E6mVwKWBNv7osjoTMgRa/43LLz8w/4TEYvxDroiidEQ7estBm
         hXQbAjT8Cg14h8CDy6zmVcIv6yxSXWagT35ttEn1anSc5HnaEN5QOTCMDaS1nE3MDUQw
         XwYH/FCdgivuil5oXZ3bS30WbWwTZgVxRVAyjhB8qqN6HnlwtXlvSWCVOIaLfk7A1wkf
         xFGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533kwiFgLS0hExClJ8wRUWfi9U9/0rbQsImNfD/cmLF77ZuGRfgd
	Wm9vrKtHsHZ3DGlGRAUoRCc=
X-Google-Smtp-Source: ABdhPJzUidchKFYfOQXSh7Oq/wOhmy/hh5BAickMgUI0FCvP/oAu8QTFWF4T/HYXHDTFAcA1pZe2Xw==
X-Received: by 2002:adf:e905:: with SMTP id f5mr18858656wrm.409.1589790915093;
        Mon, 18 May 2020 01:35:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8d:: with SMTP id m13ls3810023wrx.4.gmail; Mon, 18
 May 2020 01:35:14 -0700 (PDT)
X-Received: by 2002:adf:b30f:: with SMTP id j15mr19867509wrd.394.1589790914411;
        Mon, 18 May 2020 01:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589790914; cv=none;
        d=google.com; s=arc-20160816;
        b=WnURthm8JNJNZu11EGdZegcrtDuA+1snqcMleXPrvngsF1IHZ1RAxBS06owB30z9ye
         oMUAbeS3pAPVO/Okt6YZZLusWNoqJon15cGQPRYt8XY1JF1EyNgOEY+L82QXdIGspQBp
         Nz0ALVX4cR/6WIUJsmq+5VK//od0+UboWfCrfOBoCCNq0bAo41g4+GYrFh+R8X/fGYcN
         bLF1eEFBE7WXZMzvxgdHWVoU6azanKWSJlGzyBbnmATkUbEewovfJoNr+ie/RXJz8jd5
         BF+k75cUngIe+Z1c7UAVFsNOdmIlT7h+1wX2RMd5G5iFpQOFIbkI/a3UqMTZ/4Z+/HW8
         SSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Q8x4spcyt4D9vY28k63/5329gVSj+4d1d1whhIKO3+o=;
        b=YSkSq93v3CBVz2odPxRjPWxC+Qpm9czAQtaZCBjNkongY96zOlF6SYP4OGSLe4yn+q
         S5q2W7lPU1F0bExFOGsARsZsLZ6qQh3b9ekgdvOXhkXhayfyQwzV3PgDkp67uzgYBx32
         5Lha2FJ9zAngrbzmk09kRg8nWjPJSVGqCO/Vm7NYdCNECqZAkd5XUW2zjUFCXBuS+kQO
         db6L1YXoTbHTyIhMO5/7OZPqO9vfShLR+lKGZaCNH2WRzguwZdjWgCu2J4161dPOhHLI
         m4E9BTkV8VdBqPauqHp4IWQiXx3ywMhD3i+cD0IG2d4n6RmnANRkpY2KbMjY3Vjs1q8p
         t2uQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u83si629668wmb.2.2020.05.18.01.35.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 01:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 04I8ZDl9032302
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 May 2020 10:35:14 +0200
Received: from [167.87.94.217] ([167.87.94.217])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04I8ZD31014494;
	Mon, 18 May 2020 10:35:13 +0200
Subject: Re: question on inmate linux network
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <DB6PR0402MB27605FE1988C7CF39F94BB7288B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <66dea8b6-853b-c4a8-5e1e-cd9c8842a0be@siemens.com>
Date: Mon, 18 May 2020 10:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27605FE1988C7CF39F94BB7288B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 18.05.20 10:32, Peng Fan wrote:
> Hi Jan
> 
> Do you have any ideas how to let inmate Linux access nfs
> or other network?
> 
> Currently we could let inmate Linux ping root cell Linux
> with ivshmem-net, but I have no idea how to setup
> external network for inmate Linux.

Options:
  - pass a free NIC through to the inmate
  - set up a bridge or ip-forwarding on the host linux between an
    external interface and the ivshmem-net device

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/66dea8b6-853b-c4a8-5e1e-cd9c8842a0be%40siemens.com.
