Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBSUT37TAKGQE34HL7HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA801AAFC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:22:50 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e14sf6852893wrx.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:22:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557645770; cv=pass;
        d=google.com; s=arc-20160816;
        b=rrl905LC/XG2d5VWZNwsAUVmaW2aVE+V0Gl7w37TdwEIqFfoZTvrVcO0EdIIUgsjZB
         lwoiJTB80RA78nh7NaBwEt6g11+jU98XN31fzm52Y9uidwRh39w8CyLizZ67aVcZXZwB
         84f0sLBfGT0WlBHJg5RvROHztEzzOSgSc7kl+HdO+KmIJGHdS1LUVaTgqZ/TYGX5iXD/
         6B0XH8K23G+455Esw5JljVtf+TK39x0pJ8OsLOH6FR9tKM6cyETv30zVS9sDKFo2lssf
         zlJRafYG7QTF49qSAKx21OtBh6vW68y5kfmPWWz3G9fm2t8HU2ZUV+3a6i8gPOwnL2sN
         CzzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=e88ZPlRGUaKBDOdVZUvaajvSYBGlwWB/QT3hApTkFvM=;
        b=JTR00mPqCsuWMIXWJQgNNQCIVCmNMEU/nAezXDIGuVRCblKh3IkfNbcWfOEHwuxVgg
         9CW2oLJxAJNyGJVBY6I9PQILkUzT7qHDPUFdllruQbu+gvM0juzAy9mwpcDHRCIS1yDr
         Zakh61R/g8f5eC3tqrYm4CEakSG6ep9Rs/dsFBT6SU3X8HzhjjFuPgbaimSJyEphJRhj
         mvWbomYjm16TR8S6VJgaB0XOtataAtmvgZHTaL6E+btATOy1kowI2PDXxTYk9Mun8CpE
         yeyxdjAqWd64DBVvoYk3+Bubdq0dDOL80g18mXsmo6yX4fvUm3vl7vjgncfv5+80OlLr
         NsSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PTsYVn11;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e88ZPlRGUaKBDOdVZUvaajvSYBGlwWB/QT3hApTkFvM=;
        b=Ep9iV3h+hafW3xgIMSkVTLWzKBaY24s40NkXmW9lFwktkqOn1C4B6VH1fjx1D/sYzs
         3ayzxGPzTF1VfHsHAFYesAqKI7ZMc1Z8voyCqhZa/jvxeBpIipdHFqBbZ7nm0qM9TqtT
         G/Pv00PCr+XmU6ZLaJvMkbXjsflX8WK/HDXx0kkBkpyFgVA4CZ4gXaJ6Ujyf8g3H2aeT
         jbgXubRCX/UOH0JjldapAcGkzX8XwbIybJuJwmFNV0jH8YBIQ/xjxmnUVR1hryQ7DFrY
         24wNEg52zatXYQD/g/drJ/L7n23IcdEdUZSVl/H7HsUJKBUukRf2UYnkp5jf4nXH0BfV
         s4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=e88ZPlRGUaKBDOdVZUvaajvSYBGlwWB/QT3hApTkFvM=;
        b=R+LX5mPvI7jv9xxN0oJiLjjeEYy5qZ2d5Ed8U533ll8yY6cq7u1/2L6eLoD802FgG2
         GMnp7shFqC+MohYpU6JUv3w0XDGpWfZE8Wh1Q4ZggLZIgtocn4NZ9t45Y4ooJQ7lnj0H
         4zeNegG/R6JSJ2bLMRyGfMiY5AEndqQBX+wVWPiXbtul0FTQ90AFIHEicIiXAUHZG37Q
         2aWEgf8pKGykPLinEdEplUSNjcTxNz1I2jxDG4rBroGYhF22f9ocqept0TMmL5mGxpkr
         BP8O2WSx4ip2mAYdM7yf0+9kUf1g5vk0AtQtS8bSjf+0ZddKx7vJd8v2QhbcQNoManTZ
         T6cQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX3aagrKTlaaBSl2cK0ZFAj+fH10UHXDebcauGvXXRGPYRrYFiV
	YiH4U5qMbiqE1bO/TSwiA8Y=
X-Google-Smtp-Source: APXvYqyWZ+2+8kDwlkGzo1Bmsgq85PUq2UwKsGViQ8TQ0I86zPhcBkBJUWq39EHRsNtTEoPJY0EROA==
X-Received: by 2002:a5d:618b:: with SMTP id j11mr13626239wru.36.1557645770289;
        Sun, 12 May 2019 00:22:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8b:: with SMTP id m11ls2354957wrx.4.gmail; Sun, 12
 May 2019 00:22:49 -0700 (PDT)
X-Received: by 2002:a5d:400b:: with SMTP id n11mr11768202wrp.123.1557645769827;
        Sun, 12 May 2019 00:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557645769; cv=none;
        d=google.com; s=arc-20160816;
        b=PUFGpSbWnApPTja2C0apYLgTTGgE+KwmE522cEtsbP9dgPhC+oKP8VnWSX3pz19Qo8
         QxQpXsG+JLchXYhnjyLx7jo4LPJCUe7G7mMRzY2ZgkReRHSGd5Q3nt3eaEgHhg5Qyfxq
         6y8dVucf988TgIMBwuKyhQ2Ce1PyzO1/lgsJgj8tCrPCMLP2bKYh0Xqc38Kv8qZOfVzf
         eFZt7AftxTaJ/GGAqXEIn/UZeysvsafhab8Pi/2neOMQuCU9FlNoOaF7liBnIWi1vsGj
         b3cnT8uXCDnCOzDAek4IT3STBxfGENs0X5t4e68+dP3dxVuAELCqo7tkBSCNsWHVH4lW
         olPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8Gpm7/o1/dsHO8jlUzgC/GeSN/HSjII1ktQRlcBx+qA=;
        b=0hCDnUFaF5/ipz1iG0BUUTapulstpYvBybFtTKitSl1pFTjMP932bi2OhmLzMo8e98
         jhaiCqMpSYrQcx7Q557USBN0e0sDnVUJCfKxF/7hz5mUXjsu3iGRDAWqwl8peXtiPFTK
         g2zrqoEFd0L5I0ASLDbft7XGK7BbIWWamFrt8FjKlZxyUVHI3FMQ8fk3iBSRgwkX0Tpm
         Hic1InEnpTO5emHT1C5+kVqhMs94wiuLV2iPxZOPF3iN1y2iC3h+oGtXtq1Cn9zotFPu
         7xruKkLOQzBRrgclZHXjqYXEj8LxrvbTmT7Z+fjWn067bi/CuwE+v1gWju6FyfkN3UVW
         VOOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PTsYVn11;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id r10si1389754wml.3.2019.05.12.00.22.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Md4le-1h7VRj1YJe-00IDkH; Sun, 12
 May 2019 09:22:49 +0200
Subject: Re: [PATCH v2] Documentation: x86: test-device: document the
 test-device
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190507191957.6738-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <a8975472-2145-0183-0bf1-7d4a8a5fd6ad@web.de>
Date: Sun, 12 May 2019 09:22:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190507191957.6738-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:QMvzQHjHgqkwMnkuR5Wlf3CX3Ycm4n0g/7+4/iZfNefA2o98PHn
 +ze6STzKv25pTugFcrRoxHRfsCakifpTe8hbnNMVZ04qyZ00Cz7OxmVRvNQVmyM7C19uirM
 tyJolDMgWTwsrMsYiauPmDqvf1qyg6P8RtV3Px7kc02LJXC4mRJQJ+Jt/LyPVBYs3V42PYT
 +6qVLj6+jCF3exvrGOlTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NA6ro+CiGkk=:eOZbL5inot00N5Gebkuh6H
 j5FAnKqWAiACG/RsqkUJARlYaA+xgCKI42/HS/46ofJUmpcA5l2isYemj4K4ThueVriv4SZ6n
 kAViN0q9G9CnHJ9cn1Nqp2Z1d1mnC0WB/lIZ6k8yFjvSGbINRXbes7DqWoi1+LVfahtJjKBpo
 brOjmcRqm/YGhOC1q+xpq/VwwH3YmqzjOkCzLMtGwyaLmpZomT+SaD3pDdNYyQH58Kk/CTusN
 QlI0ehLRR99YJ+4zNWvfW070FRII5KXM2ve49mPvpgc/uEHGCk5Nv+vtsFdDvYrib5pYxBnvl
 G95P3z9W0V5SiosvJYFXZNSviUkrVZ+KNICo5dmi0woTs2zAtkuEX3RGl6Y6svrADw7cmMtjK
 eQyY/3z+q7P3qiIauZjHQox2IUT7v+aCyTO9VjEU9pI9WNDUuDhrm8eYB/cBxqDvZB0juIlEw
 RCO+i/bmJvvQI6xdFg8diuSDJfATyZIz9BU/HKeNp2mwxhzXOUFmhH+4wOlny9Sx+oBLDREBU
 76e9jtbwjyulKG6hYc5TnwDg/fzmWBvVVruXIy9GHTtjSZ1Cst6tigV7VyZFpZoEL1b7QAyl3
 PwnKgfI2fIfIke3nf8hVGh0usCoPSja3BDHhnhBs/xcIlHw0FSdea+IGK68JDqDiSbTDQXttp
 R6yYRZN2so3u0DmsMlZF92m+mTBliSoLl12/bpY7f6snoCvHYIANDWRvszhr325aRSstE2rUz
 Fja7yyi6zCRnz04A5OzD4vCDjlzdC5CmT5NArqdT7uEJOyaG1QqAbH6vE3q5rcniiFYF5fNH2
 EquJp49GFygd1Wzab47lcTiSn6xM6EdnksWW+eAgMu3xdLX+q1YVAQsveheJ4TyW0b8nHTfDW
 pXjSe92CKSzER5e7FkRssRbYeDJKms1N7fAyeIwwHfBiKgV+W26i7sIIUzuxs2NczHIhj5GRc
 D/qJtmkAiXQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PTsYVn11;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 07.05.19 21:19, Ralf Ramsauer wrote:
> There was no documentation so far. Let's mention it in
> hypervisor-configuration.md, and add some comments to the code.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   Documentation/hypervisor-configuration.md | 6 ++++++
>   hypervisor/arch/x86/test-device.c         | 1 +
>   inmates/tests/x86/mmio-access.c           | 8 ++++++++
>   3 files changed, 15 insertions(+)
>
> diff --git a/Documentation/hypervisor-configuration.md b/Documentation/hypervisor-configuration.md
> index 3e975a00..a526d0c4 100644
> --- a/Documentation/hypervisor-configuration.md
> +++ b/Documentation/hypervisor-configuration.md
> @@ -41,3 +41,9 @@ General configuration parameters
>        * configurations.
>        */
>       #define CONFIG_BARE_METAL 1
> +
> +    /*
> +     * Only available on x86. This debugging option that needs to be activated
> +     * when running mmio-access tests.
> +     */
> +    #define CONFIG_TEST_DEVICE 1
> diff --git a/hypervisor/arch/x86/test-device.c b/hypervisor/arch/x86/test-device.c
> index cf81e92c..d9cee834 100644
> --- a/hypervisor/arch/x86/test-device.c
> +++ b/hypervisor/arch/x86/test-device.c
> @@ -67,6 +67,7 @@ static unsigned long testdev_get_mmio_base(struct cell *cell)
>   	const struct jailhouse_memory *mem;
>   	unsigned int n;
>
> +	/* The mmio test page is one page after the COMM_REGION */
>   	for_each_mem_region(mem, cell->config, n)
>   		if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
>   			return mem->virt_start + PAGE_SIZE;
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index 1c6a35b3..0e6a56b1 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -29,6 +29,14 @@ static void evaluate(u64 a, u64 b, int line)
>   	}
>   }
>
> +/*
> + * mmio-access tests different memory access strategies that are intercepted by
> + * the hypervisor. Therefore, it maps a second page right behind the
> + * comm_region. Access to 0xff8-0xfff within that page will be intercepted by
> + * the hypervisor. The hypervisor will redirect the access to the comm_region.
> + * By reading back those values from the comm_region, we can verify that the
> + * access was successful.
> + */
>   void inmate_main(void)
>   {
>   	volatile u64 *comm_page_reg = (void *)(COMM_REGION_BASE + 0xff8);
>

Thanks, applied

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a8975472-2145-0183-0bf1-7d4a8a5fd6ad%40web.de.
For more options, visit https://groups.google.com/d/optout.
