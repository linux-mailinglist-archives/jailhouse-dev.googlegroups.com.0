Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNH64TUQKGQE4EGII2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D574505
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 07:33:40 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id m25sf4888235lfh.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 22:33:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564032820; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xk5sujlFAMzA0XBOGhB2GQtcSsvgbLBUYNFkcjcvv53YtSQVZDsQagZx1ko4F+b5Ke
         lFO9UnULVHDKPfdkNDgw2V3mGP3r1m7/mYKMGT1br2YNfAg9l9hii1PwX9jQY5JVBFqj
         Ba78iaFbtqSqbYXjagEMxoICC/cdHHdUxZdm9SaN8+TiZ00yQxJEP3KTFAKh6GNU1eU9
         hfW0Fa17j/cO57DbchvyKS8YRCEUbTVBv6MD9XVE8rAj7Pfu/tquwc2DXgyDEvt+QtM+
         nkgzpiCzrOh29rddPxwzCtVJSdw0/w51w9Qo7RaY3/n0r67NOEcbInRkrA7WipCCSXNx
         57Yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=aZXBBDXwfpaL+2cY1r/03AeQaVZZC/rVYw4ZtgMSUc8=;
        b=jT2z3lb5kHNRS42/BkrbQtvzlpxHlYxOr7eTkl0s/++nd8uufsQsChlK1hM/6winwP
         NlortpehR8DsbAiOegvdjYuYC8maEYDQvKNu1sMk+8KiTjtn+HVDgMMi7KC6dsRVzmjW
         aKD3bcM+wWemmMQlmHcwSzio7qGTftoZj3/DvUQNO0B7CykU+TTXMMaz4Jk0XGYOq7xP
         if2HeKuV6DubnTYmAuswD9Zo/RDpABP0T3aHoPAp1VMImUwb+prhnUZALLEEb/LpROMv
         HQWIzdHfk9Goe2H1D/9LnAl8aFxjcv4xrh38pTNiEztZQB9wlvUS6ZgZl08IUQISuBOP
         kV+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aZXBBDXwfpaL+2cY1r/03AeQaVZZC/rVYw4ZtgMSUc8=;
        b=KP6VA0m8MLwZeBzB44ylpZkxp7jFsSwpdQzS/DzebKEF7w4oPmabZ7lVO/oDZTjxN/
         REXEwowOgYuqP3wUFYFc+9+EMGDlkqqA+/KkTXCqHydebHmTaWPTAYG45MeVlRIUSvQX
         k886T4eM0LmIRuWm+paVRk732wiGU4AMJ4ypJYI/jbhjpgFBW4MATljR31pnInPEytUd
         Bm9jJj7J1DL4wxcvB8BRJ7o6En6fW5jXvpXdsXn7Bj7KZl5/1uXw8sbuzE6UjOVPIgPs
         V1aMHbqB4BqZe7LLNJp4A8E5deme7hlf+dSaKvgsZINYoi32+HydKcLjj9xtveZ9WNA/
         4fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aZXBBDXwfpaL+2cY1r/03AeQaVZZC/rVYw4ZtgMSUc8=;
        b=cNCzdTjZGx1TZe/isoC991zk6l5pM9reBEhfu+3jbaA6dlAyRg29wkbCjLtqNvt3oe
         j0bxd5iR7t17OEmEPiAs4n190iquxCwZxRJHQtwdTany/A2p8R7yE9R56xEdCxwlykgZ
         0YIJJTuAQp0xIx6TBxdLnCd6Nm7HY6xGhoJbOk8p9jn7PJ2QCXthMjisojQxFDoqGrS2
         8jJcHujw4m3K3BYNW4jC03Em7g7d4F5ypN0jkhaHEzY1KZJvaj+OAs0UO2dOD2Dc7MHC
         U46ADqPV5vD0U6gHZHdqxBGut4gNzT7F49XP0QrIBrNGxoSnzKjelRuXxxobzu0Tjeg5
         nUMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVmsNRtyT4r96iWEHEKTtMTC8ZTiVt6xby3Jutk+9hxu96IAWCV
	kjP/WnJh/hceiJ9Rd7qRV94=
X-Google-Smtp-Source: APXvYqwYi3duvWFAtszRKlkeq1XHRXQBS2a6XoOnYrfPKafGOdmfZWWy6r1PsuoOZ196uwwlqN9/5w==
X-Received: by 2002:ac2:5231:: with SMTP id i17mr40442283lfl.39.1564032820524;
        Wed, 24 Jul 2019 22:33:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:640f:: with SMTP id y15ls3986151lfb.14.gmail; Wed, 24
 Jul 2019 22:33:39 -0700 (PDT)
X-Received: by 2002:a19:6557:: with SMTP id c23mr26375571lfj.12.1564032819797;
        Wed, 24 Jul 2019 22:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564032819; cv=none;
        d=google.com; s=arc-20160816;
        b=0rqbCHRtw40YWqFLtJFehDrohBg1OpTd9u8HmjV/KLrY0lu0vM1gQ1Ptf2fyHMzNrz
         BDY4VftGD7m0wgvAcM19r/4zajCtygrLqDc0ju9zcv1WGJuCzTGwJSpoVLayfsj5z6DD
         OFLh70MJ+9bC6rHWxa+0qFy1Dy8v/g1h9IK06WLuH5Q05DJv+tP+IiouuMUpJrkf8wAn
         P0eUh10XGghX7vqhWVYAAtH1eFon0/pw0HvskAJ2L8AyQ/+uJxCsLB9Oq4i3MW35+vEh
         mH0WqJxFdWF92ng7fwwGev63Rb59rEYhxOO5RRnEDL9IKDTLAW1QrT3czl6m7DU5oA4D
         zPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JL/tXTWX7BkJIneRcA25B/kfrOb9JyNMJYDeDhV9BYo=;
        b=lmcJ2iP5z1p8BE7L+j9ohi0B7OOSu95ffA8uVW3vkwyYa+HFAWyjcu4sWqVSzCjquS
         hnCqW33CVd6frVDAFFMQob1n7Jq7TeXLJMPDaWHnrbAlROEeDLD8SdYuLBijvFUIroiE
         gNfpbO4Ixff6xa7Jo5DEmBL5daiQODQM7U0EiS7uq/dd7CZcxpkx2PuBBeuWMfwnJdUT
         pmka78Q5mETq5VUOwkKkRX7w+Mjb5sYxPCTyn2MDhUiEXxNrdzPnvsHt21ChheU6JQYw
         rCwGtVtVaAJb8xFdPLEHKjrbmuKJVM/LLc1KQuGt6a67is7H36GZaCrLSR96norzOscx
         UmOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s14si2752379ljg.4.2019.07.24.22.33.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 22:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6P5XcJx001449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 07:33:39 +0200
Received: from [167.87.33.114] ([167.87.33.114])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P5Xckl005558;
	Thu, 25 Jul 2019 07:33:38 +0200
Subject: Re: [PATCH 09/11] cell-config: introduce pio_whitelist structure and
 helpers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
 <20190713181037.4358-10-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8f93bac2-f44a-ae41-55f3-8d0b96bb3248@siemens.com>
Date: Thu, 25 Jul 2019 07:33:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190713181037.4358-10-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 13.07.19 20:10, Ralf Ramsauer wrote:
> Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps to
> fill lists in config files.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  include/jailhouse/cell-config.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 76c9e56f..a57fb9ef 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -206,6 +206,17 @@ struct jailhouse_iommu {
>  	__u32 amd_features;
>  } __attribute__((packed));
>  
> +struct jailhouse_pio_whitelist {

I think this would be more consistent in naming if we call it jailhouse_pio
(analogously to jailhouse_memory).

> +	__u16 base;
> +	__u16 length;
> +} __attribute__((packed));
> +
> +#define PIO_RANGE(__base, __length)	\
> +	{				\
> +		.base = __base,		\
> +		.length = __length,	\
> +	}
> +
>  #define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
>  
>  /*
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f93bac2-f44a-ae41-55f3-8d0b96bb3248%40siemens.com.
