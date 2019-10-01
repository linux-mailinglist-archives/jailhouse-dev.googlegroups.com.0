Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJOYZXWAKGQEXJP74YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF9C3896
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 17:09:26 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id z20sf4242057ljz.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 08:09:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569942565; cv=pass;
        d=google.com; s=arc-20160816;
        b=sFuRbn3x9kY41jueWZj4kp+l5ScrTjvdp0PchKj2lkcs/ElukbAuGQxcEtvT4VqpeM
         OzaIStZcGYrJ7fFPRWHpnqTEHuIbLAbQD+Mq4cDAuDOVAU+7xAA+71SMC7ZplUt9woqw
         nYgdmEP85NglftYRR769J+OxCLYkDCjMsMautTHEjdrhMgl8rzXbd1P5LUg/nv6OFIgA
         oE10x6l+mAMHqkbH0nZStAu0nG9iKeYQMKU8czTfdqCkIkESniJDrPbrENnSH6plf7is
         BxN1Nl7jswrCN74856xkmruoguUtIc7WEX7eLRgiwIdqtxdpxWCoLJpopYYX6JmLuzDd
         XF2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=/juwyAq+tlWQG7Jn8mcV2/oxXNkBGeDZFDd0xCkIA/w=;
        b=mYWlIkxFhCT+3HNGYu2OZtrSGLa98e1aOlvhvDffwBDp7nQDtzZja1B4SACdcTWUj6
         AdfbroICFwm3Uqi6Z/EzNOJpa87pnUjTBC3GmQwjLIzqL8gnY8XtSVtKGaozY9bby8d9
         fWfPtFr3eGS5wh7nfM5N8VemWFVevrgQhU0zzW1kNsg0cbW4bCRjeCQGbvFluZLP/ksn
         C2hMKQ/PP+Jpkuq0vkpU39hSfqq/NXCspnxWHKTp/kagqJ5huVZMEqGHXCY/G5FjpLBY
         bCNHN/0qV4f5SNdOk0DLSP94lqpg6036PqvRsnM+jNHr5Rv8/8nd16wL8IrvgJDfGCNn
         eLfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LwQEPzfc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/juwyAq+tlWQG7Jn8mcV2/oxXNkBGeDZFDd0xCkIA/w=;
        b=cNpO/t7VjzxHUoOOQ7D7ONtWF22f7m0PvjSCFWlbKv6bxp5gkADrFCcbZMd3uNJYKV
         QGAXnE1WHCdCrFT9eb2Ivw9Ykiww3Z4/gIUeejFxsvM1GoAdPY/kYagH63E1yxUri+E2
         GJj1UGHVCCw08I3JlGY+ff9mO49C2nxmJfb86uX84oJ+mCzbVOHxDnSC79v76EjkHHOb
         EZmUcZxKqQ0qNwnGdGhuJgLnirsxD1qOYv9TZJyZzDHgSgrKI8s5omutiKSKKjNMS6o3
         VCaLf4rRWZFVxrPBgInfCygmsiMSLO/cawUqOhQuZSGewZTpIemvnN+Xuh0hInZ98PPk
         Qy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/juwyAq+tlWQG7Jn8mcV2/oxXNkBGeDZFDd0xCkIA/w=;
        b=tLDGUrSMVKR6e6PukBfzy9L+vHNkbqHeflzcMGun1t3V9GAr75u9D3xJQoJt1gPkbR
         bDWjz/kL2oiyF+gCMv6KO5JGQj4bZGbDDomKHIYvChRwSqAkCbeuejnwQtWJhVXUZAzC
         YpP5yEyw5PcQOJ/5gLgOSy4+ekdDHcgSe3yl4os+738L+2BZg5ejFH/kwFGrH+Bgl1bk
         FTf+aTgOZTYwKyd4RDOEsM4PJVngL3KXdEC0WdLJd95u4QkC9EpyFr3pbAJqjn7AOIhw
         F+6Zz+zZ7yeeMSFP1UuPqoHQK5l1Mztgf9E1kIaonDAOtmK2vn2L9oJtV5ptq6Km9zLf
         k5Kg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXwea3384jG4QSqSTnkhvuZz1kjoK+3UlZUNx6no5d2Gh9nAWlJ
	WGegSgEie1IPq5OiGTYu/KY=
X-Google-Smtp-Source: APXvYqwXWXXL5AiyS6cBukdBMCbdzjpbM9k5AwruLqFOFeAieFvS9kICbQEsFunxc69fZSJICIFSYw==
X-Received: by 2002:a2e:9b5a:: with SMTP id o26mr16297942ljj.158.1569942565683;
        Tue, 01 Oct 2019 08:09:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c17:: with SMTP id j23ls2072141lja.12.gmail; Tue, 01
 Oct 2019 08:09:24 -0700 (PDT)
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr16603505ljj.53.1569942564767;
        Tue, 01 Oct 2019 08:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569942564; cv=none;
        d=google.com; s=arc-20160816;
        b=q2OmfXjuAlOoAhq4YDonnfGwUXXGRajxkQ8MgBejYTrzJra15AhYTLwHO7gt/RZczj
         MrOZHQl/PyMS3jf54IGWDkE11Xmy3EwI7v/fFKDCHYU/wuk+Xs1kojl5Dihn+TA34Nju
         qTSA5HUAn8CN/+Zc09qUMNcNlo/r2FCsCf0Te4oOCbTlPKuMpo/ZMOkxLO66k3HvJIKi
         TVJ1+MXhC+/EfZ+KDiUBowMQV9nbKASHUQ3Qgcy5BFSfDTndoeb0GPBeGLj0bwXLTf5O
         Mzpd+HDnpzu0gurUQcpq0pEgVhz5+F4UInN+tSvY2K+EUkw3vWoy0pQBrsQqEY1xm2PO
         5WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=NSFvMO0o+6EyiIP9ZvG+JyIDcmHDEKScpxdO8kpt1Tc=;
        b=lXXW/1FotuIdC+wbYwvj6dVv/+gei/9Zf+6n0NnLRPb9jXPJ3DhlK/LcevIcJibizt
         ehiy4Ig8ewDXwpaJfYyug/AC5dpNW99X/+p2hBlwDS5bsXDoh5VS7eLquveEiKv0l1Ba
         wJHiI7AMCyV9h890g1uW5/fhL1yFTWjdZeFD4dqy8tpIVeEzcfy5ta8igjPbKdPnxjb8
         JZOTf/U7M8siTQaU2l5VPeRwBTwNdIba6eIRgzhDPhV643Db3WqrnqQB2zs2FGh/yHby
         HPX2kA76y49MXvBQZqd6Adx1vzg86q6gS9Iv+9DZK//iqLCevioQdpC3N3Jz7XGa2yC3
         RwtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LwQEPzfc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c8si1141948lfm.4.2019.10.01.08.09.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46jN373px5zy02;
	Tue,  1 Oct 2019 17:09:23 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 1 Oct 2019
 17:09:23 +0200
Subject: Re: [PATCH] configs: Fix qemu-x86 /wrt VGA access window
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
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
Message-ID: <9b69ab87-55e4-99ef-7138-6e0d2a2d35f0@oth-regensburg.de>
Date: Tue, 1 Oct 2019 17:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LwQEPzfc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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


On 9/19/19 4:11 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Copy&paste mistake, other target were correctly set to a size of 0x30.
> 
> Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a permission bitmap")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  configs/x86/qemu-x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index f9877a21..03768f12 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -205,7 +205,7 @@ struct {
>  		PIO_RANGE(0x70, 0x2), /* rtc */
>  		PIO_RANGE(0x1ce, 0x3), /* vbe */
>  		PIO_RANGE(0x2f8, 0x8), /* serial2 */
> -		PIO_RANGE(0x3b0, 0x8), /* VGA */
> +		PIO_RANGE(0x3b0, 0x30), /* VGA */

/proc/ioports of Qemu 4.1.0 reports that vga is from 0x3c0-0x3df. Is
that correct or do we really need 3b0-3df?

  Ralf

>  		PIO_RANGE(0x3f0, 0x8), /* floppy */
>  		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
>  		PIO_RANGE(0x5658, 0x4), /* vmport */
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9b69ab87-55e4-99ef-7138-6e0d2a2d35f0%40oth-regensburg.de.
