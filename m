Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSMYXPYQKGQEVC3EDMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id E262614A32A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 12:40:57 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id t16sf1378735wmt.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 03:40:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580125257; cv=pass;
        d=google.com; s=arc-20160816;
        b=BQF36lqpWHzYDC9F0hQwnhmDURc9Abks3DI9I8xBmMgaDJlkBNLxAvxQ+xylTSVxsv
         NV+pemx/E8FGMDGkbphCbv6xNR+I/6h5dNTG2AAk2QCEPF50Ll4YPYgEX6y3Wh2SPAFF
         /Spe6N/ew7sSVpsic3hB8yrieGdXqx0bYxKFLtVpNVW/hYYL+IV3z9JLd3mM8Gco9J85
         9Ltuhsnlz8/+f7t/kAA/5QpVs6/YKEfR+38hIADsQqFgxEa29w6ikQX9aYgE5tmslKLD
         MinRjFC2RP6jqRJJZ/dTCiIzTpTBX+TtPNQYgYvQykHp5HP+bH9SwBUROYwEVMtBuv/6
         Ov7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=IM+fVJy4KMrven0u4xbFWjc1ZxtB/nCFZwTDOMGj+Us=;
        b=ETYXW3xD0benH2hZBoPv5kqviGFLGXBmksU8d94d8+57iN9+ObuMdwMHstmIqA8u0w
         g972Iflm0H6K/b3Fez8YMihyhDUjf/VMYluoj2vrVtZOsh4D4ly+Tt++kYLtskEsUOO2
         LspT1Ubs6KgS29a103HoTAN8naTprfgNPdZ2w5YXq6XVp3IYjttK+sIbk/AYyM5EQvnN
         5ULwoGzHUCn4CiwtAF7TDIx9LdWsxKsutMotrk0UktjH7D0J9HIihpMmyX61wDvBl+lv
         YoUfopGhL0lk6I5VE5470EFuOSBXUtxGGV73Cdi+Dc4IM8JSTXKAmTYhAgmymL9NSbxt
         3vog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w686wwh5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IM+fVJy4KMrven0u4xbFWjc1ZxtB/nCFZwTDOMGj+Us=;
        b=WTfNKq0h8bWQ36/C8WeoukCRr/B0oKG4jtG/a3wsIGRSrnGzu+PXQLE/SMY8aQBDIQ
         mLwSx5YB/3dchCUR2WG3sP2u8XT/syY/aeVmpQHeZ6Nk5EF2qB60c5d//GBYapaL3NVP
         KGOYa0GNXxJNi5EC0TTYVvO1aIdAMjz7bwDy85WAhfCVcVSxbc9qjKeNygm0Kg0mpSFt
         jDEEvk3+Rpk5SNzEJQUMqEqkcDpYDtYgXZ9Hg4MVg3+FYK5TS4/6xejqs/v35glLuVSD
         s007gb9t+QaNBHL0caTSP3t8iaEZGHHvytvGgIwjP+dvRdiZCETLwxCOsFVwKw8ao9ye
         PqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IM+fVJy4KMrven0u4xbFWjc1ZxtB/nCFZwTDOMGj+Us=;
        b=J44X56WNdkxn1RvC2xJIJ4jxFTqbWzeC4Gly+MecxnlKbHqZjCWc9ln9OyWX/RYiuZ
         +P/iaI3KUUkyDpNroKL15//xqc385jyzSwSuyU0IHf+Oxdo17eB7MG3vUDimtWbs53gb
         DJVMyXr+o6qShZeIfFO59JBux00O/+RkqT5NPifiotk7IJpBAwLBcCPuVrfpmLuc19XJ
         E00WgItwGkitgV0bITpXEi+G7MczQuWcH6YJskj6Ni5Reo75iPDJImxVsfQJKaY31Qii
         F3/mG77OXnCF4gP2A3zJ3HQClITN3UwrD4rbJ2yQ3295gJQ+wqsSh6K+a/4Huu312wmV
         JTKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVs/i3hSE1uWEPRkyxoQYcZzT/AsJPhu6d6+tb/5fqUznyNnicF
	JQEGibwF92/g7hnoExzYaF4=
X-Google-Smtp-Source: APXvYqwYi009SUzqYSV1g7u1kLb4/eT4IwZ/etEEu+hftiZHMUt/OVzAeKcYq/UYVzkOb60z5EV34g==
X-Received: by 2002:adf:e290:: with SMTP id v16mr22086170wri.16.1580125257622;
        Mon, 27 Jan 2020 03:40:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4fc2:: with SMTP id h2ls6514683wrw.2.gmail; Mon, 27 Jan
 2020 03:40:56 -0800 (PST)
X-Received: by 2002:a5d:6305:: with SMTP id i5mr21486183wru.399.1580125256817;
        Mon, 27 Jan 2020 03:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580125256; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcmHDFFhSWqF+N75UkuzxIdXmK1IzCR5en9/48YFjD829qzMisuNenXoB2SH2gr4E2
         CwAtJpj8Y6XOuDh9t3dD6wi0XQtMGWeRS7vGbdWFKQOEcYGqd5oJLg7p+2WEU/cPEim4
         oBwEpBPzPKQYIU1VQVHSAvPJHLIE1BYUkaHDxmJRFj6sPbyKwrSquEa4/iGjmJfrKBiK
         F7SplM4bNomBjekFHKCacJcp33G3Luy7QzzowOYRQ6JwI5LI39KyeonXqk/4kGXaBW5t
         Y0hc2OHod6bnLHJId4nF3PsWvZYJ3WLVbZ8P7LrW4TZnxaTp+IdFNDuFjo6egte8PLVo
         U40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=GHvV1Cm/cEC7aUxBnpiD4K9O0SLwrqIG+ECPNSybSWA=;
        b=nlteMvdkCJ4kyd4b/JN+gkctsJcctuOj8eHjtvR3CYcdHci7kHNL39o9tqjMANjsX1
         mg+jEI4+6VzmofjjR7O4XwYa7yKm2ISTeRm+GBOgF093GesYu98JNMYnns2yCMwOrxYy
         N0FVNDW01o0tI8ld4d2Ok6LqoQ0756gyEvbagPt/Gpbqt5yqGntAyJLCGMk7p4fKc06R
         YRHfkAxa7MQM7Dt5cSHp1RrOXWu4TI5607QoxqSkQy2Qj/1SXpdGkRXnkst6TropYCaW
         pEphr58SUf83Jm3tWwNVG6Z+dLHx2UsZz8IwA2JA7Pns7LongBtVEWfaUL6o6WDn6LJy
         AUmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w686wwh5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p16si562228wre.4.2020.01.27.03.40.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 03:40:56 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 485nr83v8Xzxph;
	Mon, 27 Jan 2020 12:40:56 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 27 Jan
 2020 12:40:56 +0100
Subject: Re: [PATCH 1/3] core: Tune comm region's flags field definition and
 documentation
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <c1d059a56b20261f75a268fe7bbf94f3e796d99c.1580107046.git.jan.kiszka@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <e0409d00-5289-9714-bd6d-4fe5aeb8a9f4@oth-regensburg.de>
Date: Mon, 27 Jan 2020 12:40:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c1d059a56b20261f75a268fe7bbf94f3e796d99c.1580107046.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=w686wwh5;
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



On 27/01/2020 07:37, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This field is static, thus volatile is not appropriate. Rephrase the
> field and flags documentation for a clearer wording.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  include/jailhouse/hypercall.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
> index 20eea801..07574d3d 100644
> --- a/include/jailhouse/hypercall.h
> +++ b/include/jailhouse/hypercall.h
> @@ -92,9 +92,9 @@
>  #define JAILHOUSE_CELL_FAILED			3 /* terminal state */
>  #define JAILHOUSE_CELL_FAILED_COMM_REV		4 /* terminal state */
> 
> -/* indicates if the inmate may use the dbg putc hypercall */
> +/* indicates if inmate may use the Debug Console putc hypercall */
>  #define JAILHOUSE_COMM_FLAG_DBG_PUTC_PERMITTED	0x0001
> -/* indicates if the dbg putc is automatically used as output channel */
> +/* indicates if inmate shall use Debug Console putc as output channel */
>  #define JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE	0x0002
> 
>  #define JAILHOUSE_COMM_HAS_DBG_PUTC_PERMITTED(flags) \
> @@ -116,8 +116,8 @@
>  	volatile __u32 msg_to_cell;					\
>  	/** Reply code sent from cell to hypervisor. */			\
>  	volatile __u32 reply_from_cell;					\

Why do we actually need volatile here? Shouldn't we rather use mmio
accessors?

  Ralf

> -	/** Holds information special flags */				\
> -	volatile __u32 flags;						\
> +	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */		\
> +	__u32 flags;							\
>  	/** Debug console that may be accessed by the inmate. */	\
>  	struct jailhouse_console console;				\
>  	/** Base address of PCI memory mapped config. */		\
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0409d00-5289-9714-bd6d-4fe5aeb8a9f4%40oth-regensburg.de.
