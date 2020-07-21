Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTXA3P4AKGQEUXDWHOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB0228127
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 15:40:31 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id d17sf10703231ejy.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 06:40:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595338830; cv=pass;
        d=google.com; s=arc-20160816;
        b=vZBtjdSlCpqDAiFTJLjt9k9Xl4pIf5ePNsmsJX/HV9+t1EV5xWAqcoFi7o7pcMjwHu
         kmAGf4fkAFi4HN8cyOGd5mcz2LLYQ1eLVudz6M9TuvXp0kbBMovodt3fcuUg9XD5Bn/b
         ++aBM0B3KK3EFwKqzE08xsEibjKeOwGKzySmlXiGCRux2s0IUzkE2mYS0dPgfT6bZ9U1
         tvW3RSn1htU3Bm2pSbv4pzOxLXBhrf6RA34nllm2JiIFFFbRNkinYqaY6t7XYJ2GM+39
         HfpkHZJKGLl4C5kmabPtRfQG5OzJxMVJ9Se/HFrE3pIBtaz3rzCagIy4hhZxJDlhE+ua
         HHPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Vfq3gJo37b1K1ga1VltwEIHqKAsbABgUyqqqyFtZmXg=;
        b=DSLuf0CAe9qH8S8PHUZiLtXweJ9IRjJXNWorXc8t7C1pPdl8KSVYimSvSD3S/U0hEC
         Xk3u8eSD+SxxBVeuM10BFtfZ98X7xfjxL6BjDzFbK1HzJQv4nvgk4To+EaOcEv2t1gVX
         ANTCG3IYXi30usREe4kPWWIwJKhdxdPGZu60vL+o4SFkmoM+bAjtU1mxMyi69WTnFczt
         EZUrvck8kxSEVypUOCqdD10qN6NvXmtBiCUCjDVa/muLxS/a4CXPbVhUlsF8bqlwIQ79
         ycsntyOWnp99pih7HJibwrXOzSTy9DSfHBlSndJ/MNGsMBgfA8Eav7qm35cpLxFYvY46
         SN4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Vfq3gJo37b1K1ga1VltwEIHqKAsbABgUyqqqyFtZmXg=;
        b=HDxLgJYkWY7aL4RFb/9M6uIIqqYcsPw1ipgw4eMyNF1eau2XRY6PCy0B2OZ2DGBI1i
         5WKErhrI6E84ppJuoeyqgNrPLo324Z4HGnSYUV1x069G+OFQSG++kknc0WcC1U828qph
         BrBnI/Hea5xJneNwfCQt4o0Vjk2Jwr2BuL4qnx+3P7YEazXSCzeqAwKjH3slksnm/ju4
         suJuDKTEueoJTpzG95sw4dY0xVJEqDc5gS64HB/jpPy+OLzdQXJ1xovSjMH4CyS7kVSe
         xqksG+SKGUigaj82yjKfPkh3//3/KlVD6Wf/1r9VTtSBBIeYO4IuoiLhF9PWxYSLwjD9
         birQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Vfq3gJo37b1K1ga1VltwEIHqKAsbABgUyqqqyFtZmXg=;
        b=DXAGBo3MBo3bDXgcPrYauVyoBXdqmbCNz48OZ5PrlaO5DvHNx9vWaA252CnsI7zUKJ
         YpNQB1yts1ULL2FqYTgUPKO3SEb9T57lQ1uHkFKKOvtGo22jeks+vBKCQXkIqxF49dmw
         YFe5cURmCsDoUFIGOAZUyKPGE04lQg0azHmT3pkOFvL042SlcX+rARx0k0vh0jFe0DHU
         DlMyYO3hZB7hRQmTYysxAd+oOWA6kPqT5ue9NU7zvsJFMcOqZXfhSkK7wdQpND0mVe6M
         FOpAzahYyLw6R/qkq6Efi0dj1ST+Rx1/YoWPnsrFjtkyC4dI0z397vM2DXj7SnkkkxFH
         j+rA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RyI9GOuaq+A0o27k8qhPUPLYcQnaNgrh4ypxstStQX8yDtd45
	irohwi9L8swpizHl0xCtWTg=
X-Google-Smtp-Source: ABdhPJxGQkcBv1Gnj7AcOAJKNLY+VfS0JySaWdWkEhiRMt6VCNisKSX/c3L1Y1mvhThGa1esMf4H0Q==
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr24762657eja.510.1595338830721;
        Tue, 21 Jul 2020 06:40:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6a8e:: with SMTP id p14ls9491346ejr.9.gmail; Tue, 21
 Jul 2020 06:40:29 -0700 (PDT)
X-Received: by 2002:a17:906:c459:: with SMTP id ck25mr1126163ejb.177.1595338829885;
        Tue, 21 Jul 2020 06:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595338829; cv=none;
        d=google.com; s=arc-20160816;
        b=dcu94B8e2q3a73SepltlSusJQGiz3Q/bjLf3tGdBNppj30k1iM/wCbh3yly0oErEVS
         tx3QRor7PZylrS2rj+UmKtYQitLQ/LPV9BpA0qynJWz4WvP+lu1Gaq+zysiwssaS2FmU
         8sCV3lJPfoFR27XEXb7TE6tvGILtPAiyV5baLNAD9eSPEmWBzfH/y0kq1KETjcTCH7B7
         udJs9q5GMlQHFvQtesfV5/wCdktEfNn+FrImr37LsIL30t83Cx0b6COZ+KTUt4yMMbDh
         uAfeV85YNWdUsN2OoZCfzD61nhnecwrtPys8HfiktDlU/c2fhT+fJI7ymQUEByBhlQOc
         AV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OhS4Vf/zmiDBW9OhCcEWEZPryL7YM3+jVXZIpmESZ1k=;
        b=AUG/iZhqLA5Gb1usXXndxAOuJca2z5q9L1WTi/H7B5UAmqEnwtnM1meLkIk1nqROxi
         lxjbOsolCMsyOWw7iUjiG0DXkdshd1nJPNO1ULZW6ZjDBZ85wdCaIX7VGGixZkyXDhrD
         v6SQVJ/CTs1zs01nHhFjofTdCa/CEiL2t5Tt2RLGIe8dlDupGmoChvQ3CbSgy/HUL37G
         Zj5VVU0efMJcuD/Vi7eiEKwj8aINp2CUgnLBU/t74pO6eJaQTv6nm+U2eiWsN4txk40o
         Vawe9am4f7PKr8tX/w43g8jTn3lXtpuYXSbNy3jlHNETtZnK+JATi8nFvH2pIOnRXQ+I
         JFJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x14si1200870edq.2.2020.07.21.06.40.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06LDeS5A018983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 15:40:28 +0200
Received: from [167.87.32.116] ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06LDeSKP026166;
	Tue, 21 Jul 2020 15:40:28 +0200
Subject: Re: ivshmem-net no going lower_up in root-cell
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <15788c10-ef19-0fa7-ece9-97c3ed78ce52@siemens.com>
Date: Tue, 21 Jul 2020 15:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 21.07.20 13:30, contact....@gmail.com wrote:
> Hej,
> looking for a hint / tip where I may go wrong.
> 
> Without pouring the whole config here,
> I am on a real box, x86_64 (Intel Apollo Lake), Jailhouse-images is 
> next, building --latest.
> I have a an ivshmem-net defined between the root cell and the first 
> non-root Linux, and another one between the first NR-Linux and a second 
> NR-Linux. The second one between the NR-Ls is working smoothly fine.
> 
> However, I cannot get the first one up. Jailhouse-console-ivshmem says 
> the cells are connected, In Linux the device comes up fine with mem and 
> alike, but the stats stay at zero, no carrier detected. I have checked 
> the configs to my best knowledge, mem-regions + devices look right. Any 
> classic pitfalls? Could this be an IRQ issue / misconfiguration?
> 

Sounds a lot like an IRQ delivery issue. You can check that via 
/proc/interrupts. At the point both peers are up, they should also see 
config IRQs (first vector). If not, check if you have assigned the right 
IOMMU ID to the virtual PCI device in the root cell (use ID 1 if none or 
0 was used so far). See also 
jailhouse-images/recipes-jailhouse/jailhouse/files/nuc6cay.c.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/15788c10-ef19-0fa7-ece9-97c3ed78ce52%40siemens.com.
