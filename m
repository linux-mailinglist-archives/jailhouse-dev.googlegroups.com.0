Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVXY3TAKGQEK5FXZHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC491660C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 16:52:15 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id c8sf584936wrb.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 07:52:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557240734; cv=pass;
        d=google.com; s=arc-20160816;
        b=LyxGyWtQBUzxfJKCP7Id9EnzFSvzC5LtvIgiKrYzQOxM55/dgVpvbt+tAf9Gd3d2QR
         fKK8JlByXcpsBBg96pltyOlIiUl2lcSsPD590RXLZ1FHaRx/y0Gbg6aBsIzfBcJT16FU
         NwZo4kcjq5xhxa6rAq93pJzFL1i49HvSgtwbwvf87PMVkYR88qwO9MAT27qm61441im3
         k3/CVYsqJQO+BABE6Dog1v+NIs4iCrjnh1qztZmfaKKa0sP2Ctb9oByzJyg6OonC5Zsl
         yvz5q/Bry73lqfYYn6DCjVJZSAjk0xdeX7k9lmvkcjB/rilpLoq8q68q89YS5+izyQVL
         pNlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=xqc95ly7hqW6a5V6hJKqDZIlxqEBi5LSU+RzJr75HO4=;
        b=c5Up9Zi9D3u7iA9+/k0bPlVmm01jCPMJIeN8d30998p3OtatrU1lQmMa2wRFTYF5C4
         gFluO4WGi1unfG9gkQI8wJHtpFAQzEfOuIalBxKUZja074ootonztyWfWR58JPQLUgro
         b2kX7o1PDa52cCINx1qeqE8rGuoTrmxEAdu5HUnC0F+Unh7/gTao0hEqNIAo6Yfy5iB2
         4UNIvJb46wcoitZtZMmdA7pgcnw48dd70IRl9fDYWuIcbWOVn5cFYuQMTfK3wLFL2YT7
         hjtVcgh9ErXRoQhvGRgUx0glIuCc9PIof5FGhEhNkbtcxv5/PKa7fjoa1eIh3X/gcMVQ
         3VeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xqc95ly7hqW6a5V6hJKqDZIlxqEBi5LSU+RzJr75HO4=;
        b=GHFEcBP8QkO2IskhShb1E3ezK9pDAw2jumKIizNHuwffPpQ5aNPGBUv7919wIvpxjm
         PgMELrhcJm3wUTBxF1YPRzMxUC93nKTQZXHuHpNfY9RBWYvwdOj8CeeUz1n2X2nPbLKS
         xWy3J1/jK/UBi6yDyWfIrxitPM349O9OBKoEkwGL+WLo6hw8a/Qw4kfLrPtDrk1UD4nj
         xW5Fn9IfWaxe9vchshVYK2wIt6phAFxl4925BlrnJhR5LAKePJjKLQGEc5xM9BAkZutS
         7VC1z31cHqu3gnAxicxQH5BbzyfWCzuIrkEV/egQrfjQekR9HSMBOctfWCehVy3FIE91
         lgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xqc95ly7hqW6a5V6hJKqDZIlxqEBi5LSU+RzJr75HO4=;
        b=WK570x6a5kItPwnowG05/Md2KKL8YM2Rx1Ngw+lXs6sMmI4kzMfpG0IfyQhHdXRKSs
         VD5NgMs6mLtcGv73M4HCgVsFgdmWNLm8CZvLTHvHPqaecC2jt8OGzByqnneKai/I0Cxg
         j1XZNGGqRLlALgk7/LBgONlST16p8cZ+TijOdSSZaEuZJtwVq1CsZzfDIWZ+n3MWbwRa
         F2NrQMp4eKBsiknjUk3MdIDvOpQPFjg/ID075vaWAOq5OLtafBc9SREg+bOqEkmVDxLc
         9f5l3hQQRZTRXQ5xpY4H9BIPewy22KxvNI76sqEa62iyCKaVOTd20BZ6pEh9dVM3ohlz
         VwPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUNfq6GKq3v/G6hX1fjushR0hLNgFnO9PfkyJDbfEaUvkJU3LyP
	OCA2frr93ZeqmEVB+Gc2VZQ=
X-Google-Smtp-Source: APXvYqwEIWO0EkDolgOHe7h1Oc2LAgoEIOVT21eJRKqxem6zmwXoAeIivmBLG1eTYQyX+i6LRbDllA==
X-Received: by 2002:a7b:ce03:: with SMTP id m3mr19860470wmc.99.1557240734784;
        Tue, 07 May 2019 07:52:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b642:: with SMTP id i2ls4048696wre.13.gmail; Tue, 07 May
 2019 07:52:14 -0700 (PDT)
X-Received: by 2002:adf:e390:: with SMTP id e16mr520746wrm.321.1557240734089;
        Tue, 07 May 2019 07:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557240734; cv=none;
        d=google.com; s=arc-20160816;
        b=cSteLlBYKfg8GEXgyWJq7JsC7/lvpPa1dnkd5bbDCj5BDSwrusYbrRnJlfDY17zWsn
         rwVuVe1tSJfdsHCvxOk0wJEMi7zXyCYkEVPySC1cNM6HzGZwEiywPU2aeHk7/IhYgqLx
         Q34xgJi4cc/kx22sMKwBXkOhIzR70NfsiiFEvHpTeEJSJMBZeDOrmUM6U0yVIsf+KL+c
         YmPnGOjUMlGBHGuMmYKfG8gMDYyUNZBl9QjZnY3ROfe11WsrOU59WQ5SNM97luK8yejh
         WKF4aYlQubu6dAS07j4Gq++JIwOAchctuBhcXTnQO42wTdv1YvxjTOHpeY3lw+scniVV
         eRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=yaffuFFEbBq59gCuxT+hRXJQhR7ouMQxg3KPEP5yE+A=;
        b=lw1k2XNycXCTDnAE70y/tgmSt8JNw8K6K7JrjQbWzNK6h1nuDj9wWbmApESyOd4G7R
         9h2EvHlPAd8LuZyd+rLHg/CbHsZ3+ItSEHMJOVw+qGTgv7th8sr0YSkRlL5+V79GIUYd
         3rAsORmxbiMt5ZbDXh4uUsACXoHShi3SXFLIxJLTEIuq7cNcEZ3gAQNxE7VkloMWarjg
         Vl/WRJR/TI31gM+eO6kkRCREyQjhV080MxsWMKkwuqPWUf6gTkXmhEre0jj8F9xBIurw
         W2VdGV0sWOWKSYD3GmS2wCcdWYCzQi3gQ4cKNpawZxpn0O6NdqyNA5TntnVj5j1IFb7H
         F2zQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h5si375394wrc.1.2019.05.07.07.52.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 07:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x47EqDvU010233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 16:52:13 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x47EqD61004486;
	Tue, 7 May 2019 16:52:13 +0200
Subject: Re: [PATCH] Documentation: x86: test-device: document the test-device
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190507122331.19252-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dcb733af-be4a-123e-6c57-f9f2b3439a12@siemens.com>
Date: Tue, 7 May 2019 16:52:10 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190507122331.19252-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 07.05.19 14:23, Ralf Ramsauer wrote:
> There was no documentation so far. Let's at least mention it in
> hypervisor-configuration.md.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   Documentation/hypervisor-configuration.md | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/hypervisor-configuration.md b/Documentation/hypervisor-configuration.md
> index 3e975a00..93fc30a4 100644
> --- a/Documentation/hypervisor-configuration.md
> +++ b/Documentation/hypervisor-configuration.md
> @@ -41,3 +41,15 @@ General configuration parameters
>        * configurations.
>        */
>       #define CONFIG_BARE_METAL 1
> +
> +    /*
> +     * Map a second page right behind the comm_region. Access to 0xff8-0xfff
> +     * within that page will be intercepted by the hypervisor. The hypervisor
> +     * will redirect the access to the comm_region.
> +     *
> +     * This is a useful debugging option for testing the instruction parser of
> +     * the hypervisor. See inmates/tests/x86/mmio-test.c.

I would leave the documentation here at a higher level and move the detailed 
description of what the device does in its code, e.g.

> +     *
> +     * Only available on x86.
> +     */
> +    #define CONFIG_TEST_DEVICE 1
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dcb733af-be4a-123e-6c57-f9f2b3439a12%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
