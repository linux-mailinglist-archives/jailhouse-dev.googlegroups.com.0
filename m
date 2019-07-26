Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBK4G5HUQKGQEONVJX2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F5C75BD3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 02:02:51 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id 9sf11085882ljp.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 17:02:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564099371; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZxT5UE5xiV4tWEsLpuc4GcXaY0qTJ8AoTiPmwDhIteBuo0ZCOOiUQh2b9DSccGLe+i
         /PXPPSK+CBMPvGgSowEClRuZtWkVm4/lZIFwRnayGsoSzuWTEuFUs1uYkcEBUTNYVLCl
         30trLPrZchAbH2DPkgENn5579H9SfuS2PSvCs/sgJAt4t0zKIDfcf6fBMyKVQXPC/NDK
         vNb75MY7t+2ThwR+IEEZy0ZpHTJYerGWhPtMh/O8M+lN4hUmB/vEzb2PRVMEYP98l/uf
         HAx7fLTIttdDcYwHGfufhDhj7WIPYisfp0Yo2qLwMHy6nxa2RN07d3qBf6LDfPRcSXoO
         5vFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=NIgA5Y1hBXmm7xaP8WvuHwEdnbDePepcAelIa0YhayU=;
        b=ZfHe5u1pLLHNLlh1CpS4xyUaYOtDNrmYdajq4TrIb75GpDQaOy0tJmURqFmSTVeP6S
         oIObMGGkycR120QzClmnpEhucedCmDMw/dsZhcdgc1yknlPzVFGsi4fqXjmhJeEjZBR3
         O8hEYkPDiU1oY80TvjDtgnzz8wZuvXVK7PhHlGtbm4N/VWKcpN6PBQIN9UrkD7IFil2D
         dXBvcFIyUJxsrFjLrquMHCDyAsFcR2Ro/IC9f39OEGoXcyOF4l8YoeR3pEIZQRwPopki
         TP9H7HTl7uHyCoKInpuIsHYBdHUWBqH6H8kEBC2065bH6VWXe6WR3sxrhX2/iIhQGDQK
         cw/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n0InjuHZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NIgA5Y1hBXmm7xaP8WvuHwEdnbDePepcAelIa0YhayU=;
        b=NHSrm3YMyiMTjyx1OVgd2LiwX/g+GZZOB3XuZ7d4qn5BlSbPW0TATgxAelUC2dy9sv
         FOyVd3eKowIV/ceaiiytVy2t1Q8kWM2ZM6GKcFF2q2TjnJBYQ06fapHy5zK9oMTE/btD
         j6qFHb21u/8qPx/HJ/8pMZTHRardO/NKFt2I+B2HlgGD2L8y2qnDFHPHTbMxFJvwfwqf
         OIE09jwmT7CKIvOZ2xI4ZsTv/9TqkDBJZ4oGWAN+xUPk8X1pPqDvLX7doUAQeL8c/tzL
         kqAhHaSm2XuVkjkbIZhBl8fzgUcdAffIysctRyWvMNmZ9OB3mgqlfVj8QZy/0nu8p7Mx
         Obmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NIgA5Y1hBXmm7xaP8WvuHwEdnbDePepcAelIa0YhayU=;
        b=NG7NfeLcuApnTNf63WK46k0Rt6BVA0dG/5Di3ZPAfjV4LT94krhVidrMpbNtAeGjg0
         xBijCkmdGoplGV++Qjz9edh7NOxJxPQJmqdfei9gShqYaF/Mg1tmPgy+dfN4f8NjiZw7
         NnUE7p0Usevx2f0zCe+KbxfiQsyx3izQwJy3elAueuJkedbeiXH1x3XDqiZVEUpxu03x
         DHRYF/TAYGiIT1jakY8pZXdaXrRsQhhXKLii0OXGg7k9GFQcjU1FNXJ17ginvQ7gQarF
         Tt0hVpxfHbtk+IKUxSxRX9lGNRLbpf4kcF1OFCRFxsr1G4qC5hYmY5Q4gZ4GJZstKkvy
         +EQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrXyFS9jJ/9Nb0Be48rDV+M1LpdOpdJYZGAkugzDao3N/4+1i9
	vP7fV8cS3PV2PNFnpBw+d7w=
X-Google-Smtp-Source: APXvYqyKozR+o2jnVFF6nKG/9te+GOu46CUiQmz0LAnCJ2h/QyZJe/NLmDvKFAxPqv0KSAyhgDc1wA==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr26524341lfo.148.1564099371235;
        Thu, 25 Jul 2019 17:02:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9714:: with SMTP id r20ls5904998lji.6.gmail; Thu, 25 Jul
 2019 17:02:50 -0700 (PDT)
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr46034250ljn.204.1564099370698;
        Thu, 25 Jul 2019 17:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564099370; cv=none;
        d=google.com; s=arc-20160816;
        b=xBvFzubmKaAJtGfkLbJCG3bVEbZ0vgfxU2URIhpXAaqKR77iW5P4a+ZZEuGMKXwoKV
         QjIo20xIgL6u8gkQskz08dcaE+OO8mOoXGqUJzk8QnmZJEwMQyDg1HDL6fjsJT2eObDH
         X45+9BBDA10mF3DekLuk5IBPZelNK+FZPtMQHBJs+NpynUjZkcE9JnFFDtv2fWNcyWx7
         eX8/7M4MhkCs2WvMb1vlBPenTYN6Qu8h0p/pw4UGAHLfd3yIja3/4SJF1L+57TEuLHsB
         ww5OnEJlmtuGGohQJ2L3WhEmU9ToJTvkk0kej2afh7ZTa5agagw/qg2W/45WApNxK20i
         BhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=zz2iGSfteJAShfbH3J+//cNsk9ne0WGfyp0RmnfO0Eg=;
        b=nkksnqbG9HnaVDolAXSsQSi5suBPDZPm5U45QLp9BOr1KNVA5J87gaJZozXMCfORYH
         L4pKg/R1HXHwdOY7eRbNcgQmDDKTRVQUJIbOmo8qVXROmCtypyVzlFCdDPwAE2Xkf7A2
         Baokmg/eABLuitIzkEHs9o3A4K75tI8PfLTJdiRbIQHIhh/sG6Tf2ZRkcBCSkVys5NYd
         2LnYk809YvxWrArJCYehwIbXFiAFaBl3DyApKdWvIMow/t+o8HFg+O5MgAGXiwfqXRKH
         4fgS9BODSEq8RyRPbGgczdLn1Llxh2r2jrjtB4i2oKmqsTvb0UjH7A7s9zrOedY2922V
         qGbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n0InjuHZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q7si2935079lji.5.2019.07.25.17.02.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 17:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45vq6140JYz102D;
	Fri, 26 Jul 2019 02:02:49 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jul
 2019 02:02:49 +0200
Subject: Re: [PATCH v2 4/4] tools: update config generator
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
 <20190725171123.9266-5-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <18abfa57-1e5e-45be-fa3a-850713d2ff1d@oth-regensburg.de>
Date: Fri, 26 Jul 2019 02:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725171123.9266-5-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=n0InjuHZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 7/25/19 7:11 PM, Ralf Ramsauer wrote:
> Obvious what happens here: Align the root cell template.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  tools/jailhouse-cell-linux    |  2 +-
>  tools/root-cell-config.c.tmpl | 22 +++++++++-------------
>  2 files changed, 10 insertions(+), 14 deletions(-)

I forgot one thing in the config generator:
  s/pio_bitmap_size/num_pio_regions/

But it doesn't break anything, as this variable is not used.

And another finding:
$ git grep pio_bitmap_size
configs/arm64/amd-seattle-gic-demo.c:           .pio_bitmap_size = 0,
configs/arm64/amd-seattle-uart-demo.c:          .pio_bitmap_size = 0,
[...]

Those are futile in two regards: ARM64 doesn't have x86 I/O ports, and
they're set to zero anyway. I'll write a patch for that.

  Ralf

[snip]

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18abfa57-1e5e-45be-fa3a-850713d2ff1d%40oth-regensburg.de.
