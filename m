Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQ6SSPWAKGQEE4MYJPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39AB9395
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 16:59:16 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 205sf1669523ljf.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 07:59:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568991556; cv=pass;
        d=google.com; s=arc-20160816;
        b=jYiH5nSIUTl7WcRgyM0iX6oOWXchMxIG6bwCgKL9mEteIDqKgLh/uPLHD9PfFYQM2J
         CJld9GzEAQt5E+wgEsGuioE0F8r+FfK8TTtJWzke8sYzxufTg+VC95u88q01OQbpGx40
         /b6X66WKRSiwJWjOuawZT24rh6f4j2y8WXh0xBTbF2kUPdyJ73uGvSB+OCLGrCkXHDcu
         74iPW2b/2BHS5yqwMr1eyGRUny8TqWS5IuxTD1ym7tbFpVvYeoQsmjEu54eECcoKFXcm
         7vSoWx4B2mYIM3hZ64PyHa486e10sIGu3e7lZ9OSKPxXr1Bvc5P7ypbDWBvdbzTsjA7p
         cpUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=h7LLydx6keZXwG43o9PLI5PhKQRxPb6Gn1y8zfD43jo=;
        b=o3bAdwYORNdx9/i5crldOfADOla/1Xfb4yRwu0/wu1i/5CE5bKFwDssFlRUOBGhqKF
         16ZzILvOa74Uu47HIiSae8dYHiGe6lUUhwP+gaW6KGreM9bR+UGWANWSdSd2o3iVDXoT
         8J0QeA5eckc7s89+eiIFqd4h8qJc9zqaZrht8LTMYK08RFUT/cpbWZtKcuyJM++geL0t
         0HwL7hTh9sYmU7QmCkmRgRZ9rrjw+AplR6RqaxYdk0Twi0V4HakWQKWBynMjgdzbYMAN
         L2VUz4MiZxEJJ647xc+dvj4B54L//LE+zofrT39L1aiAspvSpNUvZd7RnDS+MIOghsgG
         7KdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q++3x6iP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h7LLydx6keZXwG43o9PLI5PhKQRxPb6Gn1y8zfD43jo=;
        b=P6ZY2/EWGEQwqdVqnqRCxXKwcIZVAH+zU+yEEWKPR2qFM7TijQN2hxfFXsZ670nkiv
         lS7j24MVLcMM7zgcdST1wP3Q07HSHH4rkmcvXJY0UhSC1PY27mYYxiKpnENBLF8n8/Dl
         werm2FdH2kc8hTiyIkZ5HvpPjAkzuQvTEHzqkvPeAcfnxCuDY2WIE0HhRSr0waXGPE6p
         Ey4KNjV1OEQSjHFvnYYb2NAViqIi0GxNa4JQVyd3TUWbszzJWoIrc/lqf9xZn7bOY3g5
         Nn5fBWQmoktSNgb08uBeplWRw5x7LpO9cKI4fFtdaNNKVbtjkjQnuDbGQSeM5h5/z/MG
         iIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h7LLydx6keZXwG43o9PLI5PhKQRxPb6Gn1y8zfD43jo=;
        b=ZOKOUWjdTT042Zb0Wv+DI6+FNuaJiMtNjwZ+us0ycrfzfzIv34ptCjwTBIzoIq6TJc
         ZYxBnK5T4hBlC6+a1UrI3qSgGcs+l6gshfw834wsQd517I7N3qWqBWTqfw4N8UEzDjGk
         d4ljZ7rwT7lPUT6H//VDuiXedrVmvMstBn7mfnM1yHJp2o/bBNScZW1ah8nGlhsm6eQr
         ox8JbZdE5tZuvtBIh0hPEu0rzPEaSf1AUeGrgPGXYiMYrjFHBv///1LHSnEt/oEp8z5Y
         uOblqGbuasfB8VWcguFKuaj4E4myzJqhW/RUcMSc7925ClLtZF7DMez1LvmjnLuoutK6
         D5Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWXmWDvdhvBG+w50mIWyZ98hO/vfgHgKU9RUJ2m7Dt5AZQJZQ6J
	eWyAOfsUgNrMDU9gniteuC0=
X-Google-Smtp-Source: APXvYqw+X7eibMDWxheVqel0JUy1iLucWyMyrgjMoA5ZJtstA2+iEhFMXGTifiouzi7a2O/sMrENRA==
X-Received: by 2002:ac2:5983:: with SMTP id w3mr8840193lfn.121.1568991556015;
        Fri, 20 Sep 2019 07:59:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:51de:: with SMTP id u30ls751575lfm.14.gmail; Fri, 20 Sep
 2019 07:59:15 -0700 (PDT)
X-Received: by 2002:a19:4b4a:: with SMTP id y71mr8871178lfa.118.1568991555499;
        Fri, 20 Sep 2019 07:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568991555; cv=none;
        d=google.com; s=arc-20160816;
        b=GTWedvz4Rh+feaKw0eVLHvdSPWRgo+ZgxnlHFb5w4XiYvG4ytgbSW85B5aHSlqBDcM
         khR3C5s/RbxftvBxJfxmepxQXf2dOvTLl7TrHEj2J3S8vFZbmXrf9OdoZ8fg/WlA/XmD
         M4iQPIyAyNh5nF/kQXPk2IDCkQWAw2szs6AxQphCU0/VT6nEuQKBs6r52eriiJnda5LM
         eI/8ON9PDsjH3Lk2dFgpU90G44yhqQvUtTuQcRSeksmUlKMSFXJN17ANJjHJNk2CPIYl
         0oVbrVTGP/flKm+OUkNrxO50bxl4qHsypvSCv+rcb03o3lyw9SOs98r3W3smhEmhi29m
         WCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=qv/0KDIDyp3A2pfN242NzeMSVFpLllGwalrUGs7RuEc=;
        b=Fm6sCEmZpSnZNXP2r9qSv/0RHpePq5THr8Tfqd3t5DTFxM10nvFYatug0q/j54wFFz
         qZzIh1PZAwV2UhC8OeMvjj2d4bDcVgjcq1rHYYPdCONVLsNKK/Qj2lrChFxnLrLfALq6
         jnOjjnQq7629kQJkekj98zIzGAMxj61L942kS4g5hPZf37RQjBkx3Edi7PH395cCR+Hd
         KXkeAQmBLp17TzLcyA1e5lMT+q2LnvgmEBh93Z6FAPsM1sTIocsc8kJ6AOyB/nDYYj7Q
         y1sCXLQDPcWUU9rn4Za99SC5wig0plBfH7sounjGpD08Z+/LWU+MNO9gl2jxlkdi6YBG
         2WTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q++3x6iP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id e8si138354ljo.4.2019.09.20.07.59.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 07:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46ZcLV3cFkzyHp;
	Fri, 20 Sep 2019 16:59:14 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 20 Sep
 2019 16:59:14 +0200
Subject: Re: [PATCH] driver: sysfs: fix parameter usage
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
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
Message-ID: <3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
Date: Fri, 20 Sep 2019 16:59:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=q++3x6iP;
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


On 9/20/19 4:56 PM, Ralf Ramsauer wrote:
> find_cell_cpu gets a cell as parameter, but ignores it. It only uses
> root_cell.
> 
> This bug never had any consequences, as this routine is only one single
> caller, and always gets root_cell as parameter. Nevertheless, fix this
> by using the correct parameter.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  driver/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/driver/sysfs.c b/driver/sysfs.c
> index a272ef4c..a15a2787 100644
> --- a/driver/sysfs.c
> +++ b/driver/sysfs.c
> @@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)
>  {
>  	struct cell_cpu *cell_cpu;
>  
> -	list_for_each_entry(cell_cpu, &root_cell->cell_cpus, entry)
> +	list_for_each_entry(cell_cpu, &cell->cell_cpus, entry)

Found this by accident.

Now the question is, should we fix it in this way, or should we entirely
remove the cell parameter, as this routine gets always called with
root_cell.

I'm wondering why the compiler never complained about the unused variable.

  Ralf

>  		if (cell_cpu->cpu == cpu)
>  			return cell_cpu;
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3814a06c-155f-a3f0-9c54-bb2246e19e80%40oth-regensburg.de.
