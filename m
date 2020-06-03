Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNEM373AKGQEYF5TCHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C731ED3B7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:48:05 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id x6sf1016831wmj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:48:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199284; cv=pass;
        d=google.com; s=arc-20160816;
        b=uUCxec+ok9In5rYifUjulsZEn7tXfQOJoz/eKqBD5MRWDiOIg8iy/6+jpiAi+5RRJd
         fz6EmFf2C+WPA/dzhmpHiwW8/jpkJ7O6ZsVHizdMgoIfN3axC+bp968NKvMEaVYpI1Bg
         QnG39p+8QHudWR+vmDmfHFlr3uYCZI4yEXh7rUweql1WyYwQ2BH88A0k9JqydBo9dxHL
         iEj9BEfa7W+RoxVXrdsFI4jaCOoRmdQMd7FJIjqIub1cNe6IguUepJ6O/EazzIs5BQfY
         QJor0imqvv/r29PkkDZ4XdoyryIlB/vrJKWQGkQ8wI1bKDGVp5z56VLT3SZFsfLLFS0c
         rzEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=jclFrgs1GCfqAWCsLAyn7WaDuUGRyzynqsneTpk5JXw=;
        b=AdGmUgEkQpDFBJjCWjqnwZbi1TmNzOKgeRQefgG1nsD32VrtN1n0jimPx57MzIHLoe
         7B2zxZ09KaqFF7oipg8xeTPu898wvBxLP+ECn5xpBch5zdw3QcKMR6BLiY3WCOuWyne9
         otfLyvnARTL5KNS43DDDjr4TqmCi2nTzdhHnyStcjnsmjejO5W1S7PPIvbzlzD19oKQB
         4HSRzJBS5A1HETEhOP20Ej7LFNVC43XX+fqR9gQRfJliggGbzHUAWf88OcT15bddnZpy
         1BWn2/bFMr7rWTdVIWg+WGZlXLAaxDLfsv+LN6Lm9WESPVJbCCD+yYHIMk0B3yJOuc0b
         GAHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jclFrgs1GCfqAWCsLAyn7WaDuUGRyzynqsneTpk5JXw=;
        b=ZUxG3PduL1yu0Qy+5vQVfCXQHcYl5lnyKQxCy/UUK9H9VfvkRqJT8qZnZcMXWLUqUE
         nKr31KWwseTMoGbHaLIUFkkDf0Ej6mj2FXjdhuiUN5EXsmW2W1t2tqKK4eMFPnj1ueZS
         cxXpvFhO9SMCc6n2JWK2GE9hFP+NieBcX/8Ybostg6EcYuyjDKEZbCP0dA8Vuall6/HN
         iC5Mvq6AS+boLh1/wvuDihQb4L8UnGW5yZmYbg2c6uzVu6dV34tEoW8AqiEK6OIE0UgD
         IzSq166Nr3eIlttKfy1yh00yzkJqzrOFsM2tJem0f0Au4IECYjSjeR6Mv/oRndP01NN1
         CZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jclFrgs1GCfqAWCsLAyn7WaDuUGRyzynqsneTpk5JXw=;
        b=hNFEL3xSe5v1GK/Ua24ok6x7sSG1GcSh2/Ucnw59jtwh5H1ie5C1qw94tWuUy2/QHC
         23eV2Hse5eAhD7mBZ+srxlBOjQ32KAp6Qh1uv7U2IkLjWaMyiiN+kAs7bXMzHQGh7iae
         BMm5ZS78dDjSEU/QO9T04ut2Alu8x8jz2Cl3t6j1p/qCP9hxSVXnD4qoGk6U2tD2Dcc2
         HG8oZ7XpQ80gfuzjX/aOtpcGMa++MJ1hGMOqDLz/bJ7ryJY09K9s5WpQCiIcxkEzXNqP
         fR7uS1Ch6sVvs9w9ykbK/AQpDyeEOkuRaTs0SVW/T6aTEIIW6/fnjmR5h7DELQ7GHevR
         r0SA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532wDv2D8ymy5xUrbLp53GSqEPTOruov/tRCRpx28sDVMRWy5wlM
	cfS8xndor0A+W2C8VUAT21A=
X-Google-Smtp-Source: ABdhPJwLXKmUrczrHuGcag4rSYJgr4t8jBk4pRdA7aFzISqjth9XeXQK4tdQPzi/u+3UiiyHGm4iWw==
X-Received: by 2002:adf:f512:: with SMTP id q18mr153453wro.38.1591199284674;
        Wed, 03 Jun 2020 08:48:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls3411903wrl.3.gmail; Wed, 03 Jun
 2020 08:48:03 -0700 (PDT)
X-Received: by 2002:adf:fd41:: with SMTP id h1mr115069wrs.374.1591199283889;
        Wed, 03 Jun 2020 08:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199283; cv=none;
        d=google.com; s=arc-20160816;
        b=NjOCsZXVNYHneJjFAr3xPFrq/u6APLl7Rnh6xdNjmWwSYtC1NUaR6MERPV5ijqfOT1
         SEx/gFEiBUV9Ah/RqTfTCo7/zyws+WkXiVVp3uqfP9i3+KZ0E8agIxcjT1r0FkCDKmhD
         XNrw/GIAzshyWO3JyFcrkT42JOEwA+NKsyEd/NtW4yx4xHnLuePGhUcTmT0jCr7KD9wM
         f8BJhAMHmDVjWPpJe17Peqp9h5PhL2Snv3Ks9SrA+VwB0WqwuMbVA+iRtJK0GHk2ak30
         nWgHR6RcBlYc/wm7asS11eCF0JMoetvFxAj3uUcJtp8WXA27YhxSZ7F0bC2Wx5wyroUH
         t/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=fMmrahSQ5jWJiO8jF1GumBSf6d+kRmlMHb5CP/TNESg=;
        b=DHylESUhW+De6C/TR+V8jJYVxw7VUOn/x2Clxk2QyswKEUVKa1zcyAT721L5zo/d9d
         9Nk76rrRu7Bp+XNcr/aXhDgVbWYgbpgM7lG8EvkldVZuRDRUN8xSwI9USd++Nm4bsMWp
         6kGK0gUieqa7ICIcKKvY5GBpHDV/rT4k0QXtALPspw56JaVYw3ZNEECCGOPKnpYYo5g8
         beB2eSp66KYrlGK6I5GZuj/DVZUpM1Q4GloUmW4H8IR6Q628PK12x0KkxoHQlkhGPDQD
         +0hSQIpBcmozy6YxQ6SfRbAF0FoghuyUB3SfgOZHdU0KN7VJ+tNfkoWD7WAG75a4m8zl
         0Rrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s137si117765wme.2.2020.06.03.08.48.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 053Fm3Lm018468
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 17:48:03 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053Fm1vF004167;
	Wed, 3 Jun 2020 17:48:02 +0200
Subject: Re: [PATCH V2] arm: irqchip: fix irq_bitmap setting
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com
References: <20200603135400.2330-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e501ba31-ff5f-4537-ee18-ecf2834448ed@siemens.com>
Date: Wed, 3 Jun 2020 17:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603135400.2330-1-peng.fan@nxp.com>
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

On 03.06.20 15:54, peng.fan@nxp.com wrote:
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
> 
> Reported-by: Alice Guo <alice.guo@nxp.com>
> Tested-by: Alice Guo <alice.guo@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Drop useless checking
> 
>  hypervisor/arch/arm-common/irqchip.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index 847758ae..d1a89359 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -421,8 +421,10 @@ static int irqchip_cell_init(struct cell *cell)
>  		    chip->pin_base + sizeof(chip->pin_bitmap) * 8 >
>  		    sizeof(cell->arch.irq_bitmap) * 8)
>  			return trace_error(-EINVAL);
> -		memcpy(&cell->arch.irq_bitmap[chip->pin_base / 32],
> -		       chip->pin_bitmap, sizeof(chip->pin_bitmap));
> +		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++) {
> +			cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
> +				chip->pin_bitmap[pos];
> +		}
>  	}
>  	/*
>  	 * Permit direct access to all SGIs and PPIs except for those used by
> 

Oops, missed v2, but that is exactly what went in.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e501ba31-ff5f-4537-ee18-ecf2834448ed%40siemens.com.
