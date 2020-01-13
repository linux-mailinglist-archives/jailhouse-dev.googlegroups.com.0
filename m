Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB64U6DYAKGQEKI3LUUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B052138BB5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 07:13:15 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id m21sf5488638edp.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 22:13:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578895995; cv=pass;
        d=google.com; s=arc-20160816;
        b=mL4+DUQTxPvhkSKkeEDOAQfjZN/8GAo2rS0w0BPQ9ogyL7J6f4a2s5y5+mjHZSYkHB
         GkxlfbY3qhWi3NVLs63D/lWzdFEECwa64QwJCVgYnUbhhsn+qR5S5vDpYqYB+F7jF4fd
         o9gq9TgsQuXkaAS1QRA43Yvz09M8dkTMCwdk3NwoiFOVh5G806ZVGFA+0ZiwE+wSR/Tn
         U5ogf5HwqOV29NhmK/HGvuXKPxyW1YfuZvWVxi+NE6LJcdvheITEdhPa7eWer+GKTwXZ
         CcwtSBtb8bJpQofOCRAUYtc2kXYUemBIwfIVlqFd/dZX6KwKHw2s3u66uYsW6bbQg5gb
         zlZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=xSkIr17JTL6s+Husg1Cj2P9IvZp974zR0XpjSiya8gI=;
        b=bgQpTZ5UPzowPXcghuJeLWc+/DQQVbpaAxqfVICISo+lxKZ0eNICHgylkhT8aykRUh
         Imehy6tQ6LsSL1zV7Oro5Osw2/Wcvjnd/BfYAXQ18cvvqXdR2XNqoA8SDAoYjy067Dfs
         olmzYccXWP1qCD1PeeTJ766hnBRaijiwdkn1lvQ2FQmJy1KETWQLWVyYDqQWye4EUOgo
         595UBtG1r7qKHYvqfD6Ku3VoXH+GJLojyo4N1ES/mJs41E/JmzQFP7LoLzpNfMoZr2+v
         drQJimAaPgkPRS/CEvdrpo3Gy8v1WKxqT2IX4L/mmv9zn7EN8iyHga5aYUXiYEEaV6YQ
         Mgsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZGTVDeC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xSkIr17JTL6s+Husg1Cj2P9IvZp974zR0XpjSiya8gI=;
        b=MPQUsvZGKLvXp3LJjVAQ8wRsSikMqDJBo7viNBOICn31rvN55cbUVFCQBTzXdCfAIl
         RCINwECprE2PydVovUWM/o1luz6uhadJbnnVo2ejlZZX4SpGuMF22J36+SLNdK4V2zkX
         Z8/caxyMewnQcyKuYV0Qx5lK/NW+9UUpORMv2oKFbVDfvR8qpTm8WuU6fwOCYbfdU+FS
         eTP0k+7CXfFLmSWtv/KfDsajFw1jqgay/9CEBn4yBoiPeXAAODcnHvK6biC/y6E9aQut
         ARZtyEqEGc9aXlxynxGnorHUyDSaRjb7g+vEHaCKNHHP8p6yj2fF6SwbLRe38EjrYX16
         2dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xSkIr17JTL6s+Husg1Cj2P9IvZp974zR0XpjSiya8gI=;
        b=diIDqivtVwyh2hqtugLSsNxAIz2WGMg+qVS039L6aG85VHFSjkbbeldz5yW07nmKI5
         R5/Vhd9zqp3RrkXr2af51zRoz0cI0An/Q1EQBXVSMPHF2/16o7/x++FAB/Q3L5SeW11f
         Kf5B5cesfysJ5ZNc3wmf/6POrA8OW91n54VAFPX4Mhcf0J6hfVSSW7j51fFOl5yTFRrY
         McBkDztaV8ThGzzG4yOmg88S+bGPUZdgiaS0zPpVEzmsy6Bhk4IWBAtCUEXiFQWozCU/
         EYhxbHwZsCynxkKrvsdq+Y9+Ais0BQ2Y7lGugPb6C43p+x01cUfFMk+2a/Msx/9GviyX
         cJ/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGZeU1yx+I4jyI6VBauIRA5gUo4QiaQnUVsOMXXrqtDEuw/Kox
	+IQiXWWGCcq/qs9cZjojORo=
X-Google-Smtp-Source: APXvYqzk4zoRtqEhsnjKyTuqJeeApTxbyQRlLSoxkwVTEEzGmskOXRXG/QMCoHJcvj7PAUKtKw4pOw==
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr15441940ejj.6.1578895995291;
        Sun, 12 Jan 2020 22:13:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:64c:: with SMTP id u12ls1703999edx.15.gmail; Sun,
 12 Jan 2020 22:13:14 -0800 (PST)
X-Received: by 2002:a50:fd93:: with SMTP id o19mr15808089edt.28.1578895994008;
        Sun, 12 Jan 2020 22:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578895994; cv=none;
        d=google.com; s=arc-20160816;
        b=zxAecocwYZAwjZvfG7PlJkX05nC1bRdBeBNrX2Fvu6K0ql4RyGjbFGDtICuufdy+/O
         KzUPwbVflMeFIKGcogthsycditgsVYTwkePeFQpxXxO8EpeDkhKPkTNGtnxEZNb9WMlm
         EPiq48bvyeJ7YAA8k/d76PYAdgDPTj++znJfeJ0QgfuvKjquVsp2/6s1rKqjJXxdBMx3
         979jNh3HfFRfs9KHAB4yALnbPQ/gsCfdY4qYfRPoyPf/ITTD533bczMRExkAWnIh4Wgk
         n3Mhydi6JgHJSYTKYlC8+xHBN7Z10BikoGkJzAm+SrnuC+Uxm2crheu1yglqowfemi4Z
         VxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=PURpT+VrlOU/vX+DkFtN2f+WgBcSjg9uYBI7FYURKxU=;
        b=hbgO5Hqk838Ig52jaNvLe3z/DprSxpDm8U9mqSQOL0U31PejCCkIDWKsT3viFRHpHg
         /hsHlkh9GPIdjvu8MrJAV+MbOr6jmnj1HHUrjnqNbqbucfttF4JGXaVQXZKLjUe1DUl4
         FBkfj7avpnXGI9XadEQ0MUXbAcPMihZLaoAtZVAdfTpMv8PRdXe5cHGLiTGtIv1J9AzQ
         tBCmMaa4ljgiHp892kOXgIqF5yV9Qi72g+s8FIhLvQbocSsFzmd7he+tMy5YlFSy7gav
         SzvYzIdSKlNAQ3scCKVDtrI3Sn3H3vuCfbIzSihD3O9U+EMKwNakYf4OYoB8QaLbzI5x
         Bbow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZGTVDeC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id z20si450780ejx.1.2020.01.12.22.13.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jan 2020 22:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MTxxp-1jHf9U1v29-00QmsU; Mon, 13
 Jan 2020 07:13:13 +0100
Subject: Re: [PATCH v2 2/5] configs: Introduce tipvu IOMMU specific fields in
 platform_data
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
References: <20200108111825.14280-1-nikhil.nd@ti.com>
 <20200108111825.14280-3-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <85a704de-6d0b-eb11-0deb-1450e5d0df86@web.de>
Date: Mon, 13 Jan 2020 07:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108111825.14280-3-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:R7fbAJAMD+zo+tEyRyEnoUZTrEPr97VDYFwm/xBnQdAOtZvp4bN
 f4l5keFhDQV/0w53M8UvlHObiJALqXS9E3+F+W7C6j34mGp07+ltyS0DD3HDhfhNq1s+xSs
 d/Wev2sL7slp5JbN1u+MBvkXSX5nJa9kt9gQRH2px5CMUWtxZIo280M93iqaCCnaz83dRna
 5b/6607pmrjFMdEBy/8Xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qjcTGFCmwss=:aGDbkbvvThtHEXsPrROv7D
 mQMPaC/+1Mi35q2lZm1gi0HOm3/lLQ96Q5qdDTD7cDKj8ssmhZDhnv++4U8LGjCFTN7oFHJe7
 YNGq5tTND562M9epltnOFAlYmzWbzs8vP6qA4dobk5KIHvOiUts53ZsOke2wTB3KneeBKGsAy
 kryrdNmwHKb8iZC7Wah315GlDfMT5+P719zTAp8R/vNTANNe7q2SUZYwUBdRD5hnBZPn3YPRQ
 p08sXfq3LkdKwi03Mjc7PccZkxKjBupRnnIi0SLZUgqoaRs4kAjo/TwEopoEWIpGk5CKgStYx
 9RToh6X/4GPOkLqvrOKPyjbvA4JSE57vzvVJGzjB8sJoPThxjyiR6KUf43vCkDntepWay4XSs
 pFlE1seM5/USiG1RU1nA10dogasMdWv5ee/+PngftJVsOEdI6fV0aeOQkP35F5waSb8s8gEOd
 LxXCmQfuxV6fRYwo9UVQiA2GRU1pEiNTWKv6QxyFnNos8UsRoEoQ/4iN0uRp/mGScKR7bPug+
 tAzfMktHxVhWy4yk1T0+WYbUmrq+Qg76B3lbn6eJL2yGA/QBVt60ZozW0cIzIC0MuN7aTxRUz
 bBmDJkeMHAJc4H6CQQ1oImXONG/KmTB7TBzMz8lwTTnWfJRwqBsuCahzS34cVN5Gg3LbBDHXU
 gAHrMPXmIB4E8vQ8oid5N+ovT7cKNc2WVDQyVuG4ZfX+lmCbXuYHipg0OuaOAa3qO+NyTymC9
 c3fyCkBD+n191d+wtt67b/hwiJEJQIBRXaj2vzMxih+T30oBT8eOrF0FKUvDb1/IAAKyFrzUJ
 MZ/vMRMLvJHgHx0lrheYRjstByt/RwbbMcOoZLy+u8Oievn2mSydQMosjNNg1tGrqwQt/LzK3
 DUD1vzZKo8ie/4KwPTrSuLL8cB8YtIw8yS+/YJI793vbb4s7ufPDve2cYuua54YKKrqFgBBKj
 I4LjcVLRblwQRkBS1fBeVEXJhrFZ/VzD7OuVEI9LPc2oZlxlvWc3phbwZqDRhoc/63lYSsn8z
 2E9U2jlM+RbHiTHt7EXaTy7SXM70wU6aNhwh7/TziLsCADTdS6xdM0UJgQSKZ3d+FibYgsH2s
 LTFWEhQhyL8RZgWz3QqmGob3l5GKZp0jAYz9gkwo8OVKh9C+ZHPP139ut1+qH/xlYWdVvDX5n
 D6+9JJIFbMSFq/4o9aP37pGbswRv4aS4dE6zwLDLfKmDD33u/0vZra6Y0Sbd6acvfIwuhz5Zg
 KH416dHvEkKADFKDCcH6lEPUeFGTNQMZoUgWmln4MiueXY0Nz9sSPzxoKGCw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=BZGTVDeC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 08.01.20 12:18, nikhil.nd via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Move the amd specific fields in separate structures.
> Add new tipvu fields for TLB base address and size.
> Wrap all the vendor specific IOMMU structs in single union.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   include/jailhouse/cell-config.h | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 5b983b38..b22275eb 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -251,10 +251,18 @@ struct jailhouse_iommu {
>   	__u64 base;
>   	__u32 size;
>
> -	__u16 amd_bdf;
> -	__u8 amd_base_cap;
> -	__u8 amd_msi_cap;
> -	__u32 amd_features;
> +	union {
> +		struct {
> +			__u16 amd_bdf;
> +			__u8 amd_base_cap;
> +			__u8 amd_msi_cap;
> +			__u32 amd_features;
> +		};
> +		struct {
> +			__u64 tipvu_tlb_base;
> +			__u32 tipvu_tlb_size;
> +		};
> +	};
>   } __attribute__((packed));
>
>   struct jailhouse_pio {
>

Let's give the struct names, amd and tipvu. Then you can remove the
prefixes from the fields.

And better add __attribute__((packed)) to the substructures as well. I'm
not sure of the packed from the superstruct makes it there.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85a704de-6d0b-eb11-0deb-1450e5d0df86%40web.de.
