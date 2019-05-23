Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4GETTTQKGQEQRXCV6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8828D61
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 00:45:05 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id w3sf3526803wrr.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 15:45:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558651504; cv=pass;
        d=google.com; s=arc-20160816;
        b=wYpQ2/pxKw+XcnboXpZTs3orNjPPNMbtlo20KJGjJ7xU2RhXM8QLiE8C04aaiygSiA
         w/YAugum6hGEhG3BsOOQJ7BVLJtAOwuA1AdkxXwVmzo8SA6ETwaVC9591k0JTJYJbaEQ
         8r/W/AinOClM5TliV0qx1GGmaCfCdsHuAXvrICz0KoMwSb6QF+jVZY/3ip2Yq+lzds9Q
         wn1hetZKkyXdj1iBeXG293oxt/g/vB8obkUegiuDiQfgI0T6x1xXSeefqNU6C5/dNmpI
         NGo5Hb0Ne+gy85L7Wl8/ymQIGduGzbqWwxax4LtC0Xfv34TOvd0c0bLLpdYtfsxRT7XA
         d7ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=OaQ53z3t017tY6X8/AK3Vf6W+IATLTQZl4PA5Bjw+4c=;
        b=rOIrTGNlLQ22GTZOYwiPHfkg+DLH6ClPB5wxrD81ogT5QVykmoIMSHmmJ3pVyGwhoz
         4vEDPu6A9o8Cw8bPAARXs+nUesdk0J/SmXCdDqlf3tlRTFPpnjbewZEgil2wAZA4k4os
         1LF3W02tFg9i6xD84gG/U9r2t5bSUpU8tBtTJjm8xWJ7YtmNa2qRfh2ryT6S3hdNo3gJ
         HSiaJERTR4WLZHqyBjAWa6npNyvoGEEwFlt0Dy50RKTpSNmJ5HoUt/Jn1NzlXuUaCR5s
         6umwoJWZhDUcZ5Lwpa/057xczZSwB0Lal2UX6wW/C47r/tc+txw9zJZ0pPfrU/GXhtiZ
         1nOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=njziO9C0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OaQ53z3t017tY6X8/AK3Vf6W+IATLTQZl4PA5Bjw+4c=;
        b=sgxgyKuhOzHhbNz4PFsQNjmgbDWUWx1VTfmgqSlAgnUtvMoaShmoOOlXy/75S7dwvQ
         YJqEOIubOhizrKcv5ZegEeQPG6pMCK29Lr6gHrKFZA/8dSvVtUg2VxNYY7THZWB5kCXZ
         n607rLPrN+Tq+dIuXqmvrxX8rdVQHP6tXg1D40rmrW2HN416+sUpPdcHP9z3335nJXKh
         bItOipdLO0oZXCLtxTgMWBefQrZa8SMPC7gmWfWzQTczk5eVACOVdLLlBEgHI5nR4Cdz
         k1qhsWCP3Sv65VMEjtpfz6n3bAq+mpMKDwRi4fa1ysUu4ezWMMUHGYEqLam3VHZWMwJR
         TQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OaQ53z3t017tY6X8/AK3Vf6W+IATLTQZl4PA5Bjw+4c=;
        b=iXpLjHh2ZqmCjbwzTrlLMeK68DtoxQbxIACM6vgO3TSL7dXu0H53RyId5zfNX33joh
         ohTAK1G9hvMY1JiZ1VZ1sDCbH5KHyvtkxTQY4nfIiAQV0dqqVDaP7qdbXTh1r6Wbs3uq
         o5YdNfvzq33IPgGSCEyXqtpj5i6Nv0LVBimCbc5H+OUEd+cd2cNpaJHZdYviJykFetqC
         n1NKu+WxHUX54IIkuJM6Mz1geqL3+Mv1g6MwsaspNDFS5LIUkOp1/8MgIfJZVEmnWsFR
         D7rZ+ufa/qqAfgUkrggXWSbXr0x4EL6oD90+3sbv40yFmAqMzz6jPVgFu+Z6xUpG56Re
         fRdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUtwdMbQAWAcNly0dj52zi7O8HbzcWkoYnHYnoyA0hQquG0AZB4
	m50hp18Gr5dGRTbvx+2Y9qI=
X-Google-Smtp-Source: APXvYqwtSMPvlZN0jX3FQGTvnxk8hhC7wL/AJ+A8d4d54GmoXgiPW3ApFoQbU4YSRRoInvaH/zgKSQ==
X-Received: by 2002:a1c:9d4f:: with SMTP id g76mr13226048wme.97.1558651504714;
        Thu, 23 May 2019 15:45:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e44:: with SMTP id z65ls2184347wmc.2.canary-gmail; Thu,
 23 May 2019 15:45:04 -0700 (PDT)
X-Received: by 2002:a1c:7a0d:: with SMTP id v13mr14679906wmc.44.1558651504131;
        Thu, 23 May 2019 15:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558651504; cv=none;
        d=google.com; s=arc-20160816;
        b=FDuVXoYzO5mAv3507ZvUi59wpMKq2bp6UsHbnOYOxCTsyZFQPfG09ylZsr8FYvG38F
         TaNbUlIscHdgGK7cnSpdkXusCVbT+sbwoLEfuKOR1EsbI6L3nSeedosCmfxpmVTDVGjE
         a13wdcXXbJfPy4UhSh+hjtobF3i/4rkgw1ZsNflW1r9a5dTCcjUXJuUYVXqTNJLV+Fp0
         24h9XhgSs4rjlnQQwatlVuxSYhFF1VVACHsBwmJR3SwUsrYkL02HFgxjkB1ymqCeN6Bu
         oyq+UMfNq+AL6o3hXyi+UJk/2DWBZF6fh1w/xx5Rl2y5uEK2ilm/YpxMbjIInVr4895l
         Sfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=r7DEd/RoflUrNVxZrE97uto9CcIEdJQsiFhEGDGqUpU=;
        b=gwJ8qXX5wRAedixTv7uIDNn060V+0SVa8bCXemLQDM9V/9nM72jzsoliUJMU35Akct
         bAQ8ZUYvht5QjGaS5SjolfV7+nQFTahl1gQtU6Uf48lDMA53qrLhu1NFPmOQ+/Jsvdjz
         8maS9qUKQSE3s/XUxnNNFzYFVmZp6llJ4Rj/8DPCtJ9hBkBoGMXbBYv2yARcDC+IxdfW
         fXT2F2FqGD0UhSZuHJtcjSk9RSgi7shSTyMacpiEeWGpRoS4zLO/ARjGuGeOJ64EEG9z
         n0dy/29hPNSvE+gZmaIVY0V6b/qll3moHrQO3bhFbQXyYAcHxJmIexh1rT+FHByunySi
         aCUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=njziO9C0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id y70si566340wmd.0.2019.05.23.15.45.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 15:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4594MM4JLszxvK;
	Fri, 24 May 2019 00:45:03 +0200 (CEST)
Received: from [10.10.10.166] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 24 May
 2019 00:45:02 +0200
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>,
	<jan.kiszka@siemens.com>, <lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-5-nikhil.nd@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for enabling UART
Message-ID: <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
Date: Thu, 23 May 2019 18:45:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190523211623.9718-5-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=njziO9C0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Lokesh,

On 5/23/19 11:16 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
> UART is disabled by default on TI platforms and must be enabled
> on some platforms via the MDR register.
> Do this as part of uart_init for 8250 driver
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  inmates/lib/uart-8250.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
> index fb7940d2..42b0979c 100644
> --- a/inmates/lib/uart-8250.c
> +++ b/inmates/lib/uart-8250.c
> @@ -49,6 +49,7 @@
>  #define  UART_LCR_DLAB		0x80
>  #define UART_LSR		0x5
>  #define  UART_LSR_THRE		0x20
> +#define  UART_MDR1		0x8
>  
>  static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
>  {
> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>  		chip->reg_out(chip, UART_DLL, chip->divider);
>  		chip->reg_out(chip, UART_DLM, 0);
>  		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
> +#ifdef CONFIG_TI_16550_MDR_QUIRK
> +		chip->reg_out(chip, UART_MDR1, 0);
> +#endif

I think it's better to encode this in struct uart's flags. We still have
some bits free there.

It's better to not reintroduce compile time switches, it took a while to
get rid of (most of) them.

  Ralf

>  	}
>  }
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ec13c47e-9ff0-8fe2-f895-27213a5b7b6a%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
