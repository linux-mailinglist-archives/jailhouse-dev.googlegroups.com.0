Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBT764OCQMGQE52CHI2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id C438539A57C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Jun 2021 18:12:00 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id r15-20020a2eb60f0000b02900eddb317c52sf2603454ljn.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Jun 2021 09:12:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622736720; cv=pass;
        d=google.com; s=arc-20160816;
        b=p9ZgAl+IlW6+sjafsax2sFCoy63IbcW9iaDe0NAoulSrmjTkRQFjTSieJ+e98gJun8
         7iLfBBgUEH81fTCerBXAhXs5/ch6eO2ilGQdbGToenVC/vKYa3srqvtM6AQRDmhsze0j
         lMBdFlPE7FUq6Cmwa6v2vVYaNmfLj19W9DyR0zSaq7Ng0X7mMXdNJxGXbSGX4nI7YhzO
         TydhgBKzhw3kmG2nUXhuyZ21bWNXsAFzKm5Pmp8d6KggUiMTVJQSuQFnL0U5Mboihsko
         YD8tyMUt5mZkNTKMfxKyaqGKaPXIYrAiYoD6AJSKsbClZld6z65UCpF9dnAstsghTTc8
         Wg/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=UupmxlYR988zesyGkX/FDzsRZZcj3nt6fKm+Ktl4T4Q=;
        b=U8AArbljk0vF/8rYeqKOjyiKX8D9dhhdH0+D1vghNev9fzLYOu8U5uGAemS1HsGziO
         4JfVe9q9OGBsMifloG9yZ5mzyhKm4o4gedjAQUtrn+o69c7IIHXn7fN7SEPDH1dpx8oQ
         cfyiQiD8I+PWCHc+FoWeEaxWenupI12LOP3bmi+eB3harvN97GKzb+fkN3nDPUL8TQbH
         mQP+XV3+CkraQaH9DyBLkurGoNJ/dFuDO4alViHxRXCw3WZfiTRCOyVmlzSmmjkrkkKm
         qgTXdWYR2hb+m7FWVajPwnBwbsPK/s08ZIlrwxGeKgeJTLk5vuaphJGH8AZlZWRqZaFr
         W5LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Nu200L9q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UupmxlYR988zesyGkX/FDzsRZZcj3nt6fKm+Ktl4T4Q=;
        b=lxZnhR08V0bSWNjIHDzv5Xn0ziZDesu9lDCUCVCWEBBu7czf5SJoO/6Z/aLUVuw3ZW
         3u8G2IjMMaQ1MYHvlRQZ2yq07gVgalj6tFpEoeg1N1YmwuFQYL2FLY9d5bb7Q3RRy0XH
         q3mBzG4VH9q+ZIes4rsMV5HCGvntNzfXVVEfVdlCoIGvQy+nyjlycvuInn3ERXXir/zA
         PHVn5+G1fh+k1Jj1k6E9M+DkIKHe45iGRyRJuezB7vHnw5YmzRFgMT8i7dLGoxPRzuGu
         H4+WY4auAwOmqe3lTZCTMDeH22Wbhg2IQ/55OSv9ISQSeh+3dmQRJtWOzj+zVRlLsnjW
         GgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UupmxlYR988zesyGkX/FDzsRZZcj3nt6fKm+Ktl4T4Q=;
        b=GFsAI/CKx/OgLMikmrLJzUapa1C24lkpCLCTHWYE9STv7vczXHG7KvP0zc82lYIPlC
         lxuZOPFBoBFiDmQpJLjFYk4n+mW84v3q0oGQSTRNcXNh9o0be+6X3TMZKNqDi2mkl6AD
         cafyfjGEXJhFjXRuAdkoiXWx85vD0MCup2Dnjm7H8MOuIVtMmsmPOHjG78QoS/5I/Jeh
         XdUy+CJehHAW8n2vCpHgeg+R6A2SFRl3e9K+43yz48keppYA6yVgPuDXVNsDMgHg57T2
         OuCuzKUGB7hZ9gmm+1wY9KwiAOy0/aoThkup9Jv9d3UeqHlCyMpCCkSidJT1rtnJIpiZ
         VGvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53044JGm7OQrDSX2Cr+Tok3ZHnDeIMA2zeGkEFuLpS0KSjjDAzNN
	/7In6w/2YXql62ex9pYeVFc=
X-Google-Smtp-Source: ABdhPJz9NFKQdO47AcLYHCxfP07tmFDlA+lh8Pr5U02nrgcFp7f21GdhbYUpjsUsQs2TnfcEI+uNiw==
X-Received: by 2002:a05:6512:234c:: with SMTP id p12mr287226lfu.240.1622736720237;
        Thu, 03 Jun 2021 09:12:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1025:: with SMTP id w5ls947939ljm.0.gmail; Thu, 03
 Jun 2021 09:11:59 -0700 (PDT)
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr123494ljp.252.1622736719205;
        Thu, 03 Jun 2021 09:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622736719; cv=none;
        d=google.com; s=arc-20160816;
        b=PYby1usBrHfkKX8BGdunAosnyrNBJg7so31e801sqF5fYYyQNnm73ZVITFFHmbqcPw
         LGadNWvfSsGGOQOzb7PdOMOAnSShiwFHFamv6KwyUWMHG9G48wmP/wYctAD+Jw9vJTrT
         mhvqmsWTjyibN5lIIqZ64oOpyzEV5A+99ay9kldCVyMy2tfGnKiofrIJ/2YiUoY7Acw+
         jGEu1IG31NghZLhGfFNdvpLWKjWfJfnUaO4SKI2XUgOp+VWUg8yNQpeOJThf6AybGsT5
         GV5Wh5hfvUDgxw4LxxZSfkIVA7TNAEQuRAA62PJ8YqWYpEtk0x28CbmT7GQR9tXVTNda
         kVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=0PQZmMJ2pP+Zgp5xzCQFZc8wo9Vjgv/+b2jevvz2Mx4=;
        b=sUfQ9IW/oVGLmN0ddZ6ORmLoTMSi7USmjqU1O2WEom5PSY/2qOHosMi7iwJ07SJyk4
         n0rqhmrnOvuWmOVXhCTmnmTv927kLx7yyJtIQU/KsHofgKytTunNESHOSeaaD6ckCeS1
         cjDmtFi+ZmZtyeQz4cews00nl3H3NXDGwmlIR3Hjer0/Og0100ZDvhUapUFdp6Xbing8
         6uf8wCMLdZEjQ96OVcRMYhcfTKTspGxFm3j1jRFxH3mVDkEOwvU/R8DGIGeo8ovPEtuG
         91D7JWUpBaPLQEizohK2pOyWBL4UnBb+vgv9eqNnLPfAbUZaKzrYwdEtKe+Z/KDL1nNb
         nvbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Nu200L9q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id q8si192694ljg.4.2021.06.03.09.11.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:11:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.227]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MMVpy-1ljr4V3Mek-008FsX; Thu, 03
 Jun 2021 18:11:57 +0200
Subject: Re: [PATCH] gic-v2: Fix the wrong setting to inject phys irq
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210603152703.21027-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <b6764664-b276-6fd9-0ac3-af94a8f8fff0@web.de>
Date: Thu, 3 Jun 2021 18:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210603152703.21027-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:cQZH+JLjtGuMvGJ4sU3J4WzwsiNMxFc/EW7M8AH6jQVzylmpVXB
 A/5Xo3KOqAf9CGt9DP6DsZxiCfFag3u0uatUZoV2JTo6oNj2xzgA92MezxexCdZVHOtPrmp
 C4s+YvYMOyyHXcjiRvbDxvvXW6xlYjRwaQwjMh95RMuwlF2dJOH2YnOA1hrGYxYJQQh/6fJ
 Sh+jIEYwU7z8LhSZj5eKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8SNxil21bu4=:zU9dSANNI+GnuzWWRnRFxz
 wwNtSx6uPHV5l7kqKDosoPKCcRjgfJWJhaAJ7+lGChc5tLr5osGHfRpFvu12IERebRtB88Iea
 s/RLpU5xpmZUTPpny2d3E4Pgb1Sx3JMGUYIpfiSGCWz0IF0ReHb+FLMx3rKW5oeEfAaBKURmQ
 3bLxeX7xgtJHQkpTp/z8Y9ERsG3SpyHLyY/2ZQyrQiLAJYT9ProPob7uExMS82bE3eWniDm1T
 z5+Ah2saeYhdA7gnwIboukIC3OvuNNgXwGW0X/++JXeN5i8RPyQVcwNnv/T0GX6QlrJ8CAGrW
 VmoZ/qp9myZEGhZQsgMNYzZTVIVIXZHVUM+JB7ewIw1VL8rKPcMfcOxckVhQknJcu2gCWIzCb
 4Jf3ewvn/gJ5p0MTSVkGdK+y3LCEWZ67jTEqOu15aT4oquke4S1ci25rl4Ccke1YkjaLVYvMj
 WC3qlQmRrnUvuCYMVAWLoGqtcVvukOuEPm7ExmoATNwJiU+Q77PQTyfCsl9oSOPTc5CXEUHuR
 pKHnmisjCFZjQpvib3aCd22JcjJpqEMyZYxzbzCwiEXagyuxTcnOyIQfCuHsDgHt903zGA3HR
 RMP1oUttPq4qwIylNquRhjyBkdPSprfzm6WT1Z8RxsQRy1UU2JgZjoQcuzCORj846HvibBh/5
 T+Ef6WvMBV7YYkyHOq8DniFG1ptZBkQymodMshi28+tWu5/Rh3cIdddkNx6Q+zr436U1p7z7r
 CXefMAGHenmJw1STojxGCArS2mxxKmIOQmo0cjgdFxFBGZmzD5hqZjhYj82+OK14KTbHkyVIu
 JDC6XdTD7wpW9/GQJ0svXx3fPWybu6PrpleYzN8CQEkdXIiBJ0uR/WqYCiY2SuKFRFy6Z7K8C
 chW8L9bt71LUuPmXFUB9usgNOiX+D1wXeWwn6jqPMFS66xOiqep+snB3+lkkHgAfeiicFPnAa
 rxxCyxSYTCINHuOJdYYgpN2j1PFTSq+A5iq9j7h+JTpeljMwk9sKC5aVXHUUGUUPo029/8G8B
 Sv8mgdSpmFnfF4OiTGkOsvQMXWuTmI0XE3lBFH3jeUlKc4hLxMP87A71UeKY1NAVfRIcbvUsV
 pyY5P3WeqqHBIkiJ8MPKst7jpubBrD9PBlC
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Nu200L9q;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 03.06.21 17:27, Dongjiu Geng wrote:
> The register offset and bits offset should follow below rules.
> 1. The corresponding GICD_SPENDSGIR register number n, is given by n = x DIV 4
> 2. The offset of the required GICD_SPENDSGIR is (0xF20 + (4*n))
> 3. The SGI Set-pending field offset y, is given by y = x MOD 4
>
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
>  hypervisor/arch/arm-common/gic-v2.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
> index 31371de9..03b91fa1 100644
> --- a/hypervisor/arch/arm-common/gic-v2.c
> +++ b/hypervisor/arch/arm-common/gic-v2.c
> @@ -364,13 +364,20 @@ static int gicv2_get_pending_irq(void)
>
>  static void gicv2_inject_phys_irq(u16 irq_id)
>  {
> -	unsigned int offset = (irq_id / 32) * 4;
> +	unsigned int offset;
>  	unsigned int mask = 1 << (irq_id % 32);
>
>  	if (is_sgi(irq_id)) {
> +		/*
> +		 * The offset of the required GICD_SPENDSGIR is (0xF20 + (4*n)),
> +		 * n is given by irq_id DIV 4, the SGI Set-pending field offset
> +		 * is given by irq_id MOD 4.
> +		 */
> +		offset = (irq_id / 4) * 4 + irq_id % 4;
>  		/* Inject with CPU 0 as source - we don't track the origin. */
>  		mmio_write8(gicd_base + GICD_SPENDSGIR + irq_id, 1);

I cannot follow yet: Neither now nor with your patch applied offset (as
well as mask) is used if we take this branch.

Are you seeing a problem in reality with the current code? Can you
describe how to reproduce that scenario?

Thanks,
Jan

>  	} else {
> +		offset = (irq_id / 32) * 4;
>  		/*
>  		 * Hardware interrupts are physically active until they are
>  		 * processed by the cell. Deactivate them first so that we can
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b6764664-b276-6fd9-0ac3-af94a8f8fff0%40web.de.
