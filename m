Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBUG63TQKGQE3G6CEGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D703AC30
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 00:07:03 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id q2sf3635445wrr.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 15:07:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560118023; cv=pass;
        d=google.com; s=arc-20160816;
        b=ayaPr3YMhltnK4oehFaNBevBJ0px/swT/YTckxLS+UYOwR+VoDmh8DPaDng82CQThM
         OpMLTo+NrkGjjpPzJ1SbVl2u3TmRR8wh8UmZiZegSpR3UDcxPsBAS0tKDzAWqv40Sr9v
         jStxFlddnt5exYSpW5M3P+bAgMG+cpLJvFLUfpJgjF03fdbef0CkMGkDAE+KQlbk2bVx
         7OLvcx9wEflYn5uPVtPmlkxsqyW5crTciuDkfQ4t+7nZDtnjeNb6bNBVVip7UBMGzZw0
         2QEtnKRn6oHFDQsowUU27dVoYiMGiz1FQWT4z4JCUXYSCbO+jQBPiBJOrjMsJy5FC2Sy
         ynHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=S8FOnYf9hEWOWXG5KTrUuvfhJ8JfQl9r1RfqxS+EkQ4=;
        b=ZBMiaEXb888DwjmKHFrmiacRg3A92Ue9Wa+mZJ3xPe5lL7PEZRUG1uvGllS6454mT3
         WvQS3+WJfw9zpmSzm7KXAs/PXBm/w+G/P9sShn/1xlWbAwhNRcsEGmFmbD6XBezQ+Mhy
         96eW4sviaobAKbaOHp4Yoe4QyiOMo83lgQM1xqrw9qYBuy+RgnQFDuwQ2IbTveMYsLLM
         v+rb2IqibE9Ss7Ghi50u/XesS2KHAIgf5SD0F0jFq+Do16DmJfZE5t3kyY97bTWt50LN
         S+gpcxY7VK4lSGS+FVDZjpnmNYT+gc/NKOhQ6bCuzL9h6YYIEVdfmXJn+7nnHNmee3oN
         WO1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OAutPW5s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S8FOnYf9hEWOWXG5KTrUuvfhJ8JfQl9r1RfqxS+EkQ4=;
        b=FwOyc/1iJl6+dxCUZqPg/bYRXuz8fMGXn0So0Z7F9qVQOWJ9IPPLNTG/Pys7oWs/dz
         BOqJN2azbpyG4hu6sAnmvhKCjejRELzN/aqmY6x18544WeNcvLApxx7ZzVKmT+VmWeSh
         jED1D24L6LEPjy32yVLjHbEMSPGAHmWGq7EiUCHY2xQM38om1TEcSiaqLs/x3l7kIF/X
         YQgWNxPUcw9tVr9GFn9yB9KuCViG1qBJZUVQVpAQGjge+fv/fvj87OLUX0APdYPBXalp
         zWYnKjkwNfdaa9lzInvEBQQB9eBk5awEfmSsIhNe9m0yL90YK6jkuLdQPQOuB4/N9wnY
         uDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S8FOnYf9hEWOWXG5KTrUuvfhJ8JfQl9r1RfqxS+EkQ4=;
        b=gc6K2hDXeUyOtwTFTLqD6v+XruEBN8O6ZOVL8lTLEM7gcgJsmTLdbxEqsBgsObr4IU
         WgaJjGZdq626Oq1KON/EGgrV25luVOgKuOUHgo6o5ImGE9IGFzwsSUzJPE0R8q+kXpgb
         5RUr2jiFVbWhS+fuQL7vAcqmVv2GF3jfSFO7AO1nJYOeXOGjKQCixBPyGoJt/9G+gzNE
         SR+SoMc+hFQzQdkMKcOScAoafz7wOvtApvTIJbv7Lw902XBSImmYcxhZ8I+f69Md9vFR
         OJwrQVKvaCdmMlWFeI7ZoTZ25EeUk93LlHy4l/O6VAfSo8L4OFM3w8fk1WkAMtWyE4vA
         G5lg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXjRyv+mBYCHwXfwp23efKBM90aPbcEZ5jpUEGo4tDTJwL3vFZg
	T5ZwX34lcqzL67kKeEfhPNc=
X-Google-Smtp-Source: APXvYqy3gMiWvRY/VcgCyWh1nEJvn5NJBUhiimgO5iuSDZTR0chqT0n5e+CHHfIAr7SCCe4GmHbFuQ==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr10647008wmi.73.1560118023122;
        Sun, 09 Jun 2019 15:07:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:99d5:: with SMTP id b204ls4183467wme.5.gmail; Sun, 09
 Jun 2019 15:07:02 -0700 (PDT)
X-Received: by 2002:a1c:4054:: with SMTP id n81mr11371600wma.78.1560118022602;
        Sun, 09 Jun 2019 15:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560118022; cv=none;
        d=google.com; s=arc-20160816;
        b=L86CqzJI1bBbwj4yttUxSAQP0rkOQRH3GNXRNtmIPqm8tDeAkzDxFhSH97VuHPVVJv
         /fXwsHWsMPpxI8yPR/BEjyo3oEVhyDLFinyIc2srgkzXektv/4v8CgXb5OHz1amO3mRN
         M89PFB77jPId0MmPFRnRCAL0hhHg7AjhAHSkmvtF894N6X0C6ni4OqB70cpBY/tyquv5
         NYIEBwDLWAJ58MRPUeOqagnLrZ1p1YxQbQKhb+Sff791mj5WLpcISzJ7uGsKWigfOnQz
         o6KvS2W+OZUY2zZADSyANg0pBepRK7BZevhdvPZ3683ZdLG0CYujUi5A0enKFkB59RsR
         E+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=0SmDYipcxCEsiqaJnT/rp+tD0bzmPiclVFp1nd762gM=;
        b=zi/oD0c9mbrPcksE4A5ucPJevw3nFjZtABJux4Zy5dluF7w3bTDeztPUOuWAQO5RQR
         9X966Lhx0Yasf5hlBR3La8gPQqUms8kV+McPKKcW2I9OjDvJvBU9HeqXuQFsU84b/fTu
         BQaIqx3Z4+AxjFfGDj0w6qns5Ma1U2DzP9TTJcfPTap0EHr0qTNaa8h9DvDB+5LvLKhq
         Eqfu8xbMhfgehJpKUtPm+lT3NfUb0yXn7kxIJnWqxtQE0yP469yI8E5tGUCUn2z5QuQn
         50mastxby+Ox/MHgZuSPYIprBvfYRK3O7YmPhDckxVrqWc+BGqwkWj15k5wgEdSF86Mk
         25+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OAutPW5s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id x3si592732wmh.4.2019.06.09.15.07.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 15:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45MVjd6ZNlzyF3;
	Mon, 10 Jun 2019 00:07:01 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 10 Jun
 2019 00:07:01 +0200
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH] arm: Account for non-compliant PSCI_VERSION return codes
Message-ID: <4a7ef1a0-b21c-b224-7768-2b0929349bec@oth-regensburg.de>
Date: Mon, 10 Jun 2019 00:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OAutPW5s;
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



On 6/9/19 8:58 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2.
> Filter out all negative return codes.

Oh. We should fix this as bootloaders are out there that do not stick to
the specification. Nevertheless, should this be reported to u-boot?

I remember that I definitely tested the series on a TK1, nothing
exploded there back then. So at least the TK1 seems to behave differently.

Anyway, tested this on a TX1 w/ and w/o firmware mitigations, as well as
on a TK1. All configurations seem to work fine.

> 
> Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Ralf

> ---
>  hypervisor/arch/arm-common/smccc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
> index 5affa965..7734b999 100644
> --- a/hypervisor/arch/arm-common/smccc.c
> +++ b/hypervisor/arch/arm-common/smccc.c
> @@ -23,8 +23,9 @@ void smccc_discover(void)
> 
>  	ret = smc(PSCI_0_2_FN_VERSION);
> 
> -	/* We need >=PSCIv1.0 for SMCCC */
> -	if (PSCI_VERSION_MAJOR(ret) < 1)
> +	/* We need >=PSCIv1.0 for SMCCC. Against the spec, U-Boot may also
> +	 * return a negative error code. */
> +	if (ret < 0 || PSCI_VERSION_MAJOR(ret) < 1)
>  		return;
> 
>  	/* Check if PSCI supports SMCCC version call */
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4a7ef1a0-b21c-b224-7768-2b0929349bec%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
