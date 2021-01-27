Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5MPY2AAMGQE5QNRCTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0A305FB6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 16:34:17 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id 2sf1440040ljr.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 07:34:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611761656; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ki3Px/Fa/I5v5toXuN/V+gWYYpMfLNoBPPf0ggYYgVgCCGwf0GLqXtB2dc2noSemiW
         aTN3FV3wMgrrmxLtt2errT6k2spGJ5aGYkzElMfMtF7KkRK91/Q5Q+rRmwvd5fltU6EY
         jC6vYVYKExZaddtUeF7qRFXJv5lPRQN1cvI/5v4yMLURC2ZZ5Bk3sTAPtqNrp32+agtg
         g7MAAyJQ42SbvMosUZ9yxxMnJAZ6ke5MVqUDPzXkqDHqJBFQQJY5fFrYlPaxnRnLoRtf
         XPbhX36K+aze0f4ShyGJt9RWNO72e72DecdG/26friGHcthHsaY/htWpwcWt893qyXCf
         qa7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=PNBLxHCi8j9uOUbQnlTAm6AWCiGJtAi5kqco/x7ZHm4=;
        b=z9xrnJ/oTXfU9ozRJyESnWXXCOxScgRKcWIIo9a2cwORI+beh3F6LIzg+ib7+liee7
         5yqiqMRUTDTtSwJAJuqmFBXE1jshJ281Upw83LAj4HxhUu/iogRmi4ep1SN1hivQyklo
         tPBhZcvJh6EmjrZCjjVMt1ebqIh6nrWYnwOn11Kad1eyofhT8jza9uksNyJj5T7L4OgC
         HuZhn8X3o9bZ+RxQ23yMxFXCjXtCOr1jF2+uXOAHMYVTvTOP1tajvlwCcVxklri0Moyc
         1zM+g7xTmejBcEjfOeKVHOQiOKa1fNQzQKJD19M9Scer4rvQLWZZ/f+MiQkwQcJYtRmU
         FYCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PNBLxHCi8j9uOUbQnlTAm6AWCiGJtAi5kqco/x7ZHm4=;
        b=D5JWdG+A3r7aFyousGLjn1EQO8LYa6cA57hgGx0tAhyHLuv1jSvkrRCapHeFgavhom
         q2KfYxxhUnNUK+RPFFuio64jMiXO+3SomxbnUOvvayrCFLvCGfR3W5YJxrqbIWjkhDdQ
         e81uWAEVVF/bYIl5z72YZRn7u6CMD1YLKcTLyfwLDVigWRkDAxClfZPbQ0e1NBx/WQ2H
         DCAl/MfYT9GMJ0IlZ1i39WeBoY0ZgkhRGxHYO0xpWs93HZxMZZ9Cd0gkq2LJtfWqhPl0
         r4iYipxnuait+4VIyia3RfdrLZN8HxI1ZNbluC0iCrHbB+V4+oILCY4iKQ88fmA+Ap5L
         3vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PNBLxHCi8j9uOUbQnlTAm6AWCiGJtAi5kqco/x7ZHm4=;
        b=qam0zIl+mgoxIawx/Tj5EcqagpzBsVRNGnoFkILOLgRzI8LbC4IJg/u6fnlvFI5UWF
         z36jc565L3v+iHYsyIgNPfeuIPaGIf8dqpavFLS3hgE5wpK32aU7WWQonHKJJSjyeEdA
         0/Iaysk5303tF1FSO7+/9Uwi8kesPhYLQgD88QLSYzPsdxQrK/Jjhhzf9WeOlTKn764l
         sKCFNS0XxTJx3uowfY0i1holK5GOTzXv0R4hWwmL0forNURbVXFrBa5STG7LVy2hiUVR
         2RySF0orIZCMuSSE6etgfeBzwipKZ/ndApTeMD3L5lrSIUAo/2QbrPS721fEnPu/ovou
         HFJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533m55H5ZqboDLlBKXIWK08unAMKmtCDa7lEaYZHcZcAixkCOenL
	lOaGYjtmNEtM3UQ2uQp2a9g=
X-Google-Smtp-Source: ABdhPJxjJ1zhowL8dsTQZ8fROSQM6EUSpwLK8waJariN4n18TQiQsQF0/NZrdwdFj+53rYDiO811JA==
X-Received: by 2002:a19:c70c:: with SMTP id x12mr5376329lff.222.1611761653725;
        Wed, 27 Jan 2021 07:34:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1397:: with SMTP id k23ls444703ljb.11.gmail; Wed,
 27 Jan 2021 07:34:12 -0800 (PST)
X-Received: by 2002:a2e:9f4e:: with SMTP id v14mr6018210ljk.497.1611761652507;
        Wed, 27 Jan 2021 07:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611761652; cv=none;
        d=google.com; s=arc-20160816;
        b=E2oUfodFYmPCMh6Boetvix9jJ1i2omVYx/agE/INa4qFpRCq/9tZCvlcQLTdteSVIu
         +ZxCl/Q+5jefwihvC28SPMeFhOX/wOQG7DWqHJ4MPQihhk/npxdP2OcUgh9FltmcbCzj
         6KQVPIGiN97ZMr6iYWsnDGiqmNZHXW+0U1iUENKHtuBupzTMhf38wHQG6Dldklc0tgJX
         MRu/K/u10ps5VRshQO888WB+F/8f2tR8NW00gsQTleichfOFQ7EbOpHocgN22lHZ7Gu7
         ayAzmtszrC9lMfld1AhUc7f8kdZ/F/yLTBdiI0S519Uw8wrjsmStBEyBgYRGjn3oPuOu
         hlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZGr/oKauD6rvFF8pcNUwtUdJqmFy8aWjn+SjYrx3qvE=;
        b=DCAW8ctmMlx2e6caeCqXfv4RW00n6rcc4wQmZDo+V5yHenryUpCoQYsBLuJtw5i3C9
         EWbWqYbHrtXsKgVsdvGx/kZXGoLbEjh+W51+3Z+X/ddv16V3hZPDZmA6OhOKlenPyELl
         8Ljk2SSW36vaNJONyS9JqHgqiPNzzV0C9NocGSiR3uEQfq6yCJd9ZNSTt2UxWV+Ysde3
         MUq/5spwxVL6rTTaOeeVY6cPkX8MDWMBBuHX42MwTCWgB1Di9k9hbCF37xJ6ff6PD9A1
         xiMD87+jCKAoWVmWac7K8LkcugAYzFTs7MMrLvD87TPM2ggxKejlzGDnrfMudwg3bpvD
         C2Mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t21si108285lfe.3.2021.01.27.07.34.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 07:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 10RFYBBf025281
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Jan 2021 16:34:11 +0100
Received: from [167.87.73.55] ([167.87.73.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10RFYAgK025190;
	Wed, 27 Jan 2021 16:34:11 +0100
Subject: Re: ivshmem-net issue
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <919da75f-be40-9b65-b260-2373403275a6@siemens.com>
Date: Wed, 27 Jan 2021 16:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 27.01.21 10:08, Peng Fan wrote:
> Hi Jan,
> 
> When booting inmate Linux, I have ivshmem-net configured. In root cell it shows as eth2.
> 
> I monitor system network, and see eth2 is assigned a random address.
> 
> [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope global eth2
>        valid_lft forever preferred_lft forever
> [ROUTE]local 169.254.232.89 dev eth2 table local proto kernel scope host src 169.254.232.89
> [ROUTE]broadcast 169.254.255.255 dev eth2 table local proto kernel scope link src 169.254.232.89
> [ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src 169.254.232.89
> [ROUTE]broadcast 169.254.0.0 dev eth2 table local proto kernel scope link src 169.254.232.89
> [ROUTE]default dev eth2 scope link
> 
> 
> And also in route table, it added two entries going through eth2, I not understand why
> it will add one entry that default use eth2 with gateway 0.0.0.0
> #route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> default         0.0.0.0         0.0.0.0         U     0      0        0 eth2
> default         _gateway        0.0.0.0         UG    0      0        0 eth1
> 10.193.102.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
> 169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth2
> 
> It added the eth2 route table and will break nfsroot if we using 10.193.108.x for nfsroot server,
> because it will match the 1st entry.
> 
> This is not jailhouse hypervisor issue, I just not sure the eth2 behavior, it is systemd does that
> route change or we need look into ivshmem-net to avoid update route table when creating
> eth2?

I would suspect that this is something specific to your network
management system. Is it systemd-networkd?

In any case, the only things that should be more special about
ivshmem-net is that it comes up with random MAC addresses (which is
unusual but not unique) and that it hotplugs (which is rather common,
thing of USB WIFI sticks).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/919da75f-be40-9b65-b260-2373403275a6%40siemens.com.
