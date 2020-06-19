Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2F7WL3QKGQEOQQHS6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCD2007B2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 13:22:16 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id u3sf1273080ljo.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 04:22:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592565736; cv=pass;
        d=google.com; s=arc-20160816;
        b=GoEwsSAGmoOslm+YqZQueJTyUz9qiPYXuOEYHDzuyoTCSvZXmgwlTv13r56sOnY6nb
         KKL5MRNrYQhEDBbv711ejy2kXWEdv8pjxSueUx36q+YQlEJOMgKMERDXzw3+I1FmdXvM
         HsAY0mUgCyaH56H49c7hNeS2ro+m7xrq6dC7Sjq1dq0Cdeb2c/S2zz6j+mbmco+FHaQF
         AbANhqH/q01YdKj6jpvLib5+8J49qAvZT1yxyZdR/e6IgDNJjIqJUO4cqWrkJFh5xuov
         nfQ38AbL0H/zdBvvssMLdGBcwqY2E3natQaixvzrthQLWV+XsnwfhE2AS0tW9HzE6Y54
         TU2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ZBkGdyyiBBhfCmX8WxDLGPQTR7pjbJLgd+aRIsTchzw=;
        b=fp6AzE2XD64eVv5zeimqKjXOWHGvMlYtyLZoCby2vJNJSQ3oM7jTH7rMNMEPbLPPWR
         tJ3Iaw9m8hCilBtBI3WbkRRGnB9zrOpkD0f1WvhjEB/tvvkkPz2qRbpRU7P+5jTEJEP0
         ISKuzrtEt9rHzO4nZbudj34IoEI5HfJAnIOS0dZSp/quHbFaKsZkP81XDItZeGHGVMKW
         Uwd4HiZJ+w0AMydRm761vWBX+I+e+ADDx9PsJfr7gJuyKMKnpC32bTpfknQ2HxOxPIQ5
         muT6xLYnHqUmjiKun9Yr1jji1rlsa9yN23b+ahFpFkjks65qqPfoYhlSyvarVJiYvIJp
         iD1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZBkGdyyiBBhfCmX8WxDLGPQTR7pjbJLgd+aRIsTchzw=;
        b=Agx055OiclHWen28diQyLZ9aXS6qmzODMH38naadlv6s5F9EoWvCnE+RFnR8+LfHnU
         ipJETqAUieTNz9WfpjSqRx5yYYVb8Hhia0l/sfwhchK3Cy+pOjmMNxfjNbaG6aAA9/JS
         c7R01SJfFhHGkYeKVU4fiuPMtcMa5ZOatZo9+WAGZtK8N5bgn/N2cqv6P7w6TDcgD8Bh
         Tou17Tg3HZp6kaDKdM7zA6XEVE/IHKK1JJe+jQBU83PkAAD9SMd9lDh0Fm+K+1fsbIsb
         bEnBaZwcH1PPjcGNhElt6kLpqchJTL7nKT4+JhM652Bok1X33tAvInkiyIzFcbgR61ze
         geDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZBkGdyyiBBhfCmX8WxDLGPQTR7pjbJLgd+aRIsTchzw=;
        b=Ym9LPw1n/hpdK2AhZF3ktOgkWu4i/eNhfIeDAp0wOvchsH2KPJt6kYEfKHvzgaD+2s
         fQrmtVYD5fAlIBkglsGOcW24LAVrAM+gx/I6X+WKIvXhvnEcZbRuisVmILGb35sCgiVR
         gUcK8hkovsgSfTlf/NJIxvQxFBwcfhgkxpFZNWBrn33oLoHL82vftqUqTM2/3KAF8x0A
         y31l2P0OuGIUV3dLt0xEJHadOW7jst0MNd/+QgWmiukM5qpoC4ZvXE6i5avQZGdcmJo8
         i9UKmszFEEwnDsUEsHBbCwIb0lqbzG+ctiukOIxWzqn5v21bny5SPAqx1VLFsQ+W0zi0
         Mp3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533o3bICw1VGkItFwmW/nH8DMFqZ7SmGTvutz0AlCrjayZ6g1FIm
	GDb5Z6BY678I4T7oVPy7nsI=
X-Google-Smtp-Source: ABdhPJy8yrmbsTphAtZfFB8+wKdPbiTxNAY7uNtf4+QWWc0bmnyf8U5tb5YQX7ezWiw6whqxlSSbYw==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr1671015lfm.175.1592565736266;
        Fri, 19 Jun 2020 04:22:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:89d8:: with SMTP id c24ls1904299ljk.2.gmail; Fri, 19 Jun
 2020 04:22:15 -0700 (PDT)
X-Received: by 2002:a2e:9b04:: with SMTP id u4mr1726274lji.364.1592565735454;
        Fri, 19 Jun 2020 04:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592565735; cv=none;
        d=google.com; s=arc-20160816;
        b=edbNTojNlXbcx6RgnrZVlPjrofFfA5rVMq1DB94OUl1Vk0rJEZXPH/AuVxdFo8ehZI
         s5h8gd4P6ZMr+TEfHfSQL/4/DtqPu/E6FWjBcJNGF3W7uoB0uTpizOISM2YFY52HFH5u
         Yl8ETn8DSVahst8r4AB+ZK8kFHxNWRrX4jsaMuN3EvJKFg5FuWjfPYlJbPC37K/wZSjH
         GK/p3KCsm9qJSQrP12VNCNuJVUBVHqdlnLxLykdCqOvGdGaWv2ryWus96Zxe3xtWpC1S
         j7kAqTOeGT6PSy1d4J6fkEIdgZERxsEYeFjtcL7K6JSqvxz5O743gJnAQYm7NU+UlojT
         cDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=etY4hTv6sUqYHinOuRE6/2g67ZoOpEfouNci/u4njqU=;
        b=A6CvhqgqKfDMLBv+BnWlbAI0+LKYXnKYbHa1JmiYPTVCkEVqNNBzyLW0TvJ7dsAUFK
         1bw1hodr9ImPjy/113G1N2+BGihbxNHsgbk7aE3RhgJm95TXhK9w06+5ZkvHyxvTeLXY
         nimrQs0jJvTVwU7jzMNxa7mlbZE+NmT/tyhmI0he0jvtOegTElfS60ZoMTSzKUKIor7T
         rtyKrXvCzg7z+/4/gX4QLnc2IWXezsOXwQAAaY45eV5Cp6LI1wfWic647Sy3/goIDRlz
         hFYIYag+Ch0MZLtmFoCgGrLAnQmhF6x6Y9pXqGMAGXdhLyeRFc2nig+TinAgYHxChkGQ
         QFrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x20si407402ljh.1.2020.06.19.04.22.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 04:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05JBME1S020689
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jun 2020 13:22:14 +0200
Received: from [167.87.31.88] ([167.87.31.88])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05JBMCeB021358;
	Fri, 19 Jun 2020 13:22:13 +0200
Subject: Re: jailhouse-config-create: creates many overlapping memory regions
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <785d19a7-5a7c-4157-9e45-f4ead7c37a08n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e01e34d6-3be0-57f6-fd07-ad540aa5c4e0@siemens.com>
Date: Fri, 19 Jun 2020 13:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <785d19a7-5a7c-4157-9e45-f4ead7c37a08n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 19.06.20 13:08, contact....@gmail.com wrote:
> This issue may be in the works / known -- just to add another example.
> 
> On the this x86 box (Edge Up-Squared, similar device class like the
> existing nuc6cay), jailhouse-config-create finds ~100 memory regions, of
> which many overlap and most probably are irrelevant to actual use.
> jailhouse-config-check coughs them up again.

Yes, the sysconfig parser has a problem with sub-page memory regions.
Unfortunately, this usually requires manual cleanup (generally a
consolidation of most sub-page resources).	

> 
> Apart from this uncomfort, just for understanding:
> 
> What happens to resources *not* mentioned in the system-config? Do they
> stay with the root-cell or become completely unavailable?

The latter. Jailhouse denies access to everything not explicitly permitted.

> 
> In theory, how would I make a resource inaccessible to the root-cell
> (but available to non-root)?

By listing it in the non-root cell. If it was listed in root as well,
cell creation will take it away from there. If it wasn't listed, the
root cell will not have access at all (as long as Jailhouse is up).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e01e34d6-3be0-57f6-fd07-ad540aa5c4e0%40siemens.com.
