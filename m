Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIXV3X3AKGQEBDHZD2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B11ECD7D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 12:25:38 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id u11sf702682wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 03:25:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591179938; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z/BtWD6EKSjMxgj+dKiBI7nAIFAURKjwspa776+7nm9miV6s/Puh0rDY5SuxpFdEgk
         ZG4JIhDvJSz6jrQPt+X30sdTc3lZgQQRpGini9dGWOmqGFqO0yhLW590/4wI1xjVMMKI
         qF5DIGZLogKkpcEG9vjKz95OKurJp4dbP3vDzycMpXrOYK3D9mHn4ARWH2/NkTg2ChHd
         6bdPFXkaSG68NZcWwlrwY6n8XZBNWQIFQjnjmF9b2weqTZQO8ayXcAQ32nSKfgc+sMSo
         FbP/5yypdkgMAY5biCk9L2Gee1k82W3YthM1NDptR08UpPYgSTyxI5x4HkrbTiHdivBj
         AhwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=TWV67cpT/lfDe+6AdMs3L8PXtdeSsVqGjzPzHoMfAJA=;
        b=BbUmEm1h/QjtGJRuFu3aTiz1UaQ0XsImO+05f8ni5bG7H4xLe1TDoVu68Fj6vvuLYw
         XKq9V2IMZm6s0mjVLZ3sA6wNVLU4VD5QSghkJ42Bwc939bs6dpY5i3o+pk7SwEV47Nlz
         ZqUwerKNHvHdC/wbMtV2iTyGqXm5/UnYAdP5btiF3zqlB8iLJCxRs0MSTRIdMKgceF8X
         DeKgpAUPo+zNDhJ3pzFApVi8Fu3U3DMm5/iZ8uzr1J0Km5bgUDPCwV/XLqqZcrKrn9cp
         SnAn2NnXeH/sWwxcQiwOWWY8aFZp5DSO4CRZylFLm2E7asdhSiO1kUHx8045RKAT+ruj
         EoTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TWV67cpT/lfDe+6AdMs3L8PXtdeSsVqGjzPzHoMfAJA=;
        b=n2OXn8fwMWsNOg5CNC5BFRNHaYglhEq9glJBf6DUVknbC7kBZ3xccAaw3p6qgtxFC9
         n6FQfAhexpRIdPaUrcokvQNPcZ2440BUl80otdQAImIjSlwz8W0GaSrVkK/WzS6Llx40
         I65Fw02UACQ/xZgdY4smJbvRhbl3kqzDh3punclCkk2VUCffa08gm6ajrNHxEYD1ziqj
         gphfoflJla9/1krCd+NHsASp6PpcMWiFf+mkj+LAdG33W+QI8yvzHVnRvvqbxomifWzz
         KD4syWFa6oRCrKBBoeudx8pShB57eSQlbyc8XGRYJbGI4TFJo4niearVIs060of5iaW6
         O3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TWV67cpT/lfDe+6AdMs3L8PXtdeSsVqGjzPzHoMfAJA=;
        b=roHB+Sj8kUFvwPANjshsxrolyvgx2vAu3VMQBcS6/tWQtG2xSBbsAFu+h+xdkZKyJG
         VZwmr5lJakVS/q97tQlG9mUxQoeUKARkrppESAnNGbbNOv+GLknDjhgV+7AAiXHg0xtN
         n3Nh4RsCrRa2qxEPjeI3AljXSYESLGwcNFsaNIVQJtMX1jIsl2+JNO+tco73XNrk11bn
         G+/7ORuy0QXtJY/BlfDKCAstyBvVYNdzh6eLwtuC4VjqWX1Zb4u665r8iXTVQu+sRO8c
         C5VLWOQ/eue3hkmy/uIXq/Dj5eN6/ceJVJiJtg9/I/m03Mgd4DyxluTz6WJDc7YDeoIY
         kc+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531uaToXNOx1+FEBwrqPiDS7v5BnxJUekqZzLyyAqF38Na/NVx/V
	ddavPqVU/EqtaVOSnihNo04=
X-Google-Smtp-Source: ABdhPJxQe4VOG6ki1rcf6gj6o+yGO5QxGNsAMhf4ibhEXlxiu/uvp+crBP+mnLPvYRX+FEiuFQwy3A==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr30160780wrt.193.1591179938521;
        Wed, 03 Jun 2020 03:25:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:cc0a:: with SMTP id h10ls861604wmb.3.gmail; Wed, 03 Jun
 2020 03:25:37 -0700 (PDT)
X-Received: by 2002:a1c:df04:: with SMTP id w4mr8766117wmg.152.1591179937882;
        Wed, 03 Jun 2020 03:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591179937; cv=none;
        d=google.com; s=arc-20160816;
        b=rSIaWniqmMcj2rPu3m2Kddl/CbTNRGeQeoG5leCTNhLwHlAuK84MiRGpLaWNLIN9uC
         mE7U1uIUXRdW/e6sWXRgUvbuAcLG++Z3w5nzS3S/7BBFnlR4DtTYoaQjYeZKPrlteuiF
         JIYWnhC84nqtfVas/vNJ6CzCHNqGyydUfirIOPvdu8kwYY97EF/Fx5ru9jV8lkSmM8PX
         9MbzDoJg77sPA6cxCYWx4fhKLfw+pV2c5N2W5XbQhHkJdD1Odgg0u7sHSbcaBnxG+JNv
         RUB2sMSYAqZPjUfDyR6j3xp+Y+GSq9HDf29bFiFqIbrI7YWYmSCiV9UDPSPEmBVHJHa7
         LxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=t0jQU+00UeFkAVEmFuO6gfXWuAHA7RmCSldCvXW++Pw=;
        b=Bi+svYyKvh0arR3hAmsctGGLKqLAEDBKYXnw3YreMKgSv5rvrtGnkgrXKLxmZFW8nj
         5oUmqBYpdATTeqH/Jvu7Zext8bh7ErKv5HyP51zbTVguku26rCEGVRfs4U1qYA+CDZ17
         TFyq9NfzYYtKTtx2ojqvcC45r2yJtjeMLeSm/ibvpNDCCD89+D3tBwAOQHdcPj2ODTGK
         cw32Ru5lO43U/8yHbNpkYR8nETc6bXyYe57/OzmwMJubVlpJR67gCHyOuWpF8QI9/Pmd
         7QsTOiTCP3C39N7TUORpEe0+cdLZ66krMsJ7hIP/fsSRJvP3rjF8+MaZILrSIBEo1Tvi
         V2jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id g7si67908wma.1.2020.06.03.03.25.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 03:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 053APbj7019701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 12:25:37 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053APZW0030106;
	Wed, 3 Jun 2020 12:25:36 +0200
Subject: Re: [PATCH] arm: irqchip: fix irq_bitmap setting
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com
References: <20200603091004.28908-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ace884f9-c86c-e4d3-03ca-40c38dd68b8b@siemens.com>
Date: Wed, 3 Jun 2020 12:25:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603091004.28908-1-peng.fan@nxp.com>
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

On 03.06.20 11:10, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is a implication that the pin_base in the cell file
> should be "32 + 128 * i" with "i >= 0". However there is no checking
> for that. Pepole might choose other pin_base, such as 160, 224 and etc.
> 
> Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
> 160. When irqchip_cell_init loop into the 2nd irqchip, it will override
> the settings of the 1st irqchip, because "224 - 160" is less that
> "sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
> the pin_base must be "32 + 128 * i", and make the upper example could
> work is to check whether pin_bitmap has a non-zero value.

Good catch.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/irqchip.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index 847758ae..794b88d9 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -421,8 +421,11 @@ static int irqchip_cell_init(struct cell *cell)
>  		    chip->pin_base + sizeof(chip->pin_bitmap) * 8 >
>  		    sizeof(cell->arch.irq_bitmap) * 8)
>  			return trace_error(-EINVAL);
> -		memcpy(&cell->arch.irq_bitmap[chip->pin_base / 32],
> -		       chip->pin_bitmap, sizeof(chip->pin_bitmap));
> +		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++) {
> +			if (chip->pin_bitmap[pos])

Needless test, though - or'ing 0 is harmless.

> +				cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
> +					chip->pin_bitmap[pos];
> +		}
>  	}
>  	/*
>  	 * Permit direct access to all SGIs and PPIs except for those used by
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ace884f9-c86c-e4d3-03ca-40c38dd68b8b%40siemens.com.
