Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7X572AAMGQEXANORPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7431236E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 11:20:47 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id m9sf8354812ljp.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 02:20:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612693247; cv=pass;
        d=google.com; s=arc-20160816;
        b=qkqLUZy1yo8aNgLFZEDGisqjUbmkYR0E9zmyB0tEqXL8syoy60aB8ojm1p2uBBeDTd
         MHqrghTDEMIGdj636aJuk+YPNPjcz8XS73h2bI9XFIEcPJI7PbNeMelwLyIH3hcCLp1o
         vOcxUoA4nozbhgII5e2VGVlR/JTnGqnqmWgCZDUJZptIgagxdNuQ0U/Iqh2POBK0sWpE
         1wrchaWKBJkmiKqUFKj4k0C2ud4tIqEqnkZk1OEHSKgk0Hj54Bagg5HwktSXpMPZaJIw
         YNvUDMX3XEcZ4jFdGZZcrA8mlKpcHYpVIU4+7Y4urzUMmTg5VlLYjz45IbpfH73VZvOn
         DH1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=kbTM0fCq4J/OEUobuGRMVLHwRVKe1MIvfhSnZ/owXUQ=;
        b=NKLsVkdJD1id3g/dJmRleKfPQPJzztF5j5cTHPrhslKI960FoE9TfDbwfzs7Yyvww+
         ENTR7MqrO0K4yQZGAMXNcyfywNXVMVsAWhKj4UH399GQcSX43h/T0ZfQMwywTsjwppdu
         xwiIHWBNYzCXlwTRw9xPzXfbrDlrali7pPKM4aoX19792WxZCqGHPGp8+0fjZA5jsMDP
         BfBK7wWgM4x1TBZ1O6sAJFFY3FvyPcgjYIzF4chL0DRpd5GFl/IckuRvT9KucJe2xiwI
         vc1ehU+hX+jmjU5NinNJy3wYggSYR3sfI7PWrV0OnnKsAz2gDa3KhtPyKSuHR9gY2POe
         AWIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kbTM0fCq4J/OEUobuGRMVLHwRVKe1MIvfhSnZ/owXUQ=;
        b=UBve1pK7je480TnDNFYMrv9tYis5bjY5pBj796XxKfvd/nBOZoYJErCma0rAjBVOXE
         wfJN4EzDTZEcUkjJbIefW1sxoZYsV5SN7T4udyLrkQge1aLbftqo29rqEsIm3pajZuuJ
         6qgXhgQdHE08M0Gu1Nd6KfN8Lf/ifFUldOCBAazY65bYTD4hJXbpIePkEbOtrAQV5Vul
         jZ/8i4uSajVICdnj7v+nc4cqIWZv+CD1FQFmG9oESq9feM0GYOIpy8nDHFDcpvFTJu6D
         exW3Byp8r1lI817TH3qC/VvFUWC6YKrSjGK5hRVi+47hd4PoXhLE1juW3PyVklr+u679
         79/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kbTM0fCq4J/OEUobuGRMVLHwRVKe1MIvfhSnZ/owXUQ=;
        b=ZJRIJcxlDpx7dhBVUs4ob1tRGO2c36tP+S5KdWZ6iT9ywyD3xpeixwqkYyFC/Uh7+A
         Y/T1Bt/2c2W+MBd4UZ5wtq9IsPCoThaPQUQVTtf34pVjMF6ABGUj3S2DEdvRDm4PuN60
         A9jtDMfd8sLGI31v6F474Q3qIcxjim+kwwgF/WtRyHLODPVqtfvpIgPmiMvc8pRXHBo1
         SpJNU6PU2l2wPsYSI92NcdosEmVHyejxT0+NjmVTzdjrBxTCsAimm1/OZvGnBVVptPIM
         Le5SC9y2Ay+suYu1XFRN9wzJRpUOpIVlTfGZczzZoisuwHxiBaEbwWOfxOU2fKZHJr12
         bXWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hsn8/cIVKNhYQgPCYrmiTJVpsCQr/G/7sKZVelPB+gAB3gC4W
	gUPqbOfuQZfYJv5qcHq8++o=
X-Google-Smtp-Source: ABdhPJzuy3twM89pcsT0Ac1jVxmE8aoXzcEW+rszvCtKuxxIsClvFt9R6b6pm1F4eoZrbOMApbOZYQ==
X-Received: by 2002:a05:6512:2159:: with SMTP id s25mr7293668lfr.341.1612693247009;
        Sun, 07 Feb 2021 02:20:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc11:: with SMTP id b17ls2337724ljf.7.gmail; Sun, 07 Feb
 2021 02:20:46 -0800 (PST)
X-Received: by 2002:a2e:9692:: with SMTP id q18mr7719154lji.69.1612693245916;
        Sun, 07 Feb 2021 02:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612693245; cv=none;
        d=google.com; s=arc-20160816;
        b=qUQGTcQ/TIcTLw6180NSPoHn70xyq6Tv7aJxr5as0IqzXVmvV0eVt7w8xSNRJZN6h/
         xH6HoZwlVU5h91xKMA73N8OutJdKVoWf5JHzu4JSm6BbYiXfa+raB9NOqMsDeiaO9fzi
         olRm6a3XowpjfZfGQp7AqlRi7kx9+XIY0Z2LF8bhT6HjEqSNJl7vwhZq+nhMGQ4oEMCG
         yk4mB5CcEpJA5Jqaql81HOpENVx2dp1YM+Fu1jN7DDE5m0SJ1vMjCrFNlch03CZIchvx
         CZz3mpinOC6NSQtuWbZKBbtuoRbN0ErxY9OK8/Aj1uA3FruEDl5eSv9/z42Ai6muL/p+
         fjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=c0fZcgZVftVFTtzXlmbQTaGhzps5JG2+ah3AvFhoM/Q=;
        b=DKqiagxC+RD2mq0vLultsfCkBEG6imglGDvVUHfb5AkQC6lDHk2ekBX3ISuqSSvgtX
         /48sEHodsoQyeqiHx0sDBBAwbptV8z6jvC5W/XQo+yUzxhkaiMd6k+9oQuvnhVTwHcts
         tEHlK0AyVAtU5KuDoJxT5bXOvOEtyFyuO/Qy3tEVScBwwpDPpzjdNDuAIXWmnV9wxQnE
         oykGe/cT6H4oxCsUJ04zowGtlOD5h4/7an6KaoJj79D5DYV3SBZkcwzFl2E8ezihUCY2
         omtA+0ie+XwBXUxIycpjrxmFImZ4Q+E8eVpTq5Z3KAe5oCavAWHSE7I7zkqI+tz+yHCS
         HYcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d25si558308lji.8.2021.02.07.02.20.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 117AKgnt025251
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Feb 2021 11:20:43 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 117AKbrx018012;
	Sun, 7 Feb 2021 11:20:37 +0100
Subject: Re: [PATCH v1 11/23] hypervisor: provide implementation for
 __assert_fail() and group panic-related functions
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-12-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <12d00415-98dc-b7c7-5fa0-745074844505@siemens.com>
Date: Sun, 7 Feb 2021 11:20:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125120044.56794-12-andrea.bastoni@tum.de>
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

On 25.01.21 13:00, Andrea Bastoni wrote:
> Implement all "panic-related" functions in a dedicated file, provide
> __assert_fail() and adapt includes.
> 

To be consistent, panic_printk should be moved as well.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/12d00415-98dc-b7c7-5fa0-745074844505%40siemens.com.
