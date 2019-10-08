Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7PG6LWAKGQEIHP2ORQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9FCFE7C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 18:04:14 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id i18sf4407617ljg.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 09:04:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550653; cv=pass;
        d=google.com; s=arc-20160816;
        b=mRHgXT+yNpxdMey8iCqb9ZU9bHiYsYKzjAhRY+PFpyki2IJtvL8DIf2e7QmMqzAptU
         lki0uQeKeypgNnMtwpG9NaKI8RN5g/d4V3e5KNna8SAXPo1aG3M07xdK8RWh9ttzPlpp
         3Q7PHrmG+W42oDgD/Rqfx5hoXpdj0a6iEuiFqtHAzxP2repPdxqtB3x37unJe1Io9IA/
         cccSppgRFPvhTx0r7dldviWNTgviO34TG3DfeMq3+GOdHcoqRqGrL+TpFrHqlcLF4N/z
         9wFrJHZraCd94/EdQ+ieloAKtUki9EFkWBoYNeAx+qYa+sjXYLaxqjbQa7DJtTzBMSvM
         mc3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=jSOolMnRfl+skiLbrbinw0ggj9xOwgpjKzk2Q0JUyTA=;
        b=TQTumIe+W4Io1kesINUUUR994NCl0mRAH+6QFvAQDvsZ43smBCxY9gVGBpFVe44hiQ
         bU4ojBqDWD0TyBOnsCVUxpSmFREICisqWb+USPY1pm8FroWJKeBAaDoBv2NikNDGUoDx
         3XNP+j0Fxu6PRzjG+C9SOT09cFuUyrk6BtzRr5CFRj7bq7WA1vJlb17A1AfqNqylut4K
         TxtsVTv82BDv/aMX+IRsQjbulBDLyFNpKHZRPak7JLCI1F9AJJKiPoG3Nn8mYr4Pqpu+
         GalV6n/4w09cPUbG2nIOgvRK9ssCS+OLO42WVYkrboTgq3JSAtZFJmMbESJ8Zy1ND7EU
         A0xg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dU00YtK1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jSOolMnRfl+skiLbrbinw0ggj9xOwgpjKzk2Q0JUyTA=;
        b=Riv9GD9iRi9LOqv+mfLf9V+xrCHXJ5K4iAXUwlr8qioWSZHRo5jbjkqztGCzXiaB7U
         WKIu0Z/wigLM9u50pA5CHqnmPZOJwsECsK4NcxQOaP8PpXCO09EwCBD2Gcu7Cbul0EZe
         zmQhvqW449qfEmxxJ/a/Zo5ZNeogGY/lJwlyLRYB6PZGvMgurhb8XL5EwLTvoL4sluTu
         2v/bmE4kbn4AexCkb8tR+0vei0/bErrSohmm9gt+9XiJIQ885dPDxz9alYUXBKxpcZJ5
         P4trQzBKQ73eV3GjGQLPfPhsUb9g/SUJC4pHnBTLjoKJhgzp0q7XSFSonRSAkbuUONg4
         Fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jSOolMnRfl+skiLbrbinw0ggj9xOwgpjKzk2Q0JUyTA=;
        b=hDHHfJevkPmaLkF5nwlTuPq0vW7SN6Co4J7FS8xBPfxQYRQiL+v3LE1jxR3z2YzQ7I
         JBxvx0n6fmio/yimUmQkyfsnUMPVcRT7zO/7+z32XlZIBU8vX5UF+GcJI9tlNL4P8pLL
         yd4HkAhZSvbYpWqMhkhr0JYZpil+7DkvlJ7CyNyAT/TwOVhfKSjd9/1SsWU/EQOzgzas
         +n31qgyCZfCLvnLDe09avTDXkwzUCuv9ZnhpNkRhmBI4ar6tuyadepW9prKP7WkO16VY
         jHZFMWBqzJWa5RO1ukEjJYIV0Nb/pfn08c5Jb8E1Ef1FVhlWdwl/JABfA7mYPMzNW8NA
         5Pgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXT8PjRexaV9OGjfyZv+lvzmH0eQZMfuVxoLs7tzE4+cZvVK2RX
	2449i5VLbdddL9Y3s44Gv/I=
X-Google-Smtp-Source: APXvYqz2wIYxSLF/sEHlh6nyEZ0mdv+93eyibVX7uibZSZ3EOAHAF283AW3WP5u9pTw7P8kGOGuc+Q==
X-Received: by 2002:ac2:484a:: with SMTP id 10mr20911490lfy.135.1570550653839;
        Tue, 08 Oct 2019 09:04:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3101:: with SMTP id x1ls547531ljx.1.gmail; Tue, 08 Oct
 2019 09:04:13 -0700 (PDT)
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr22851393ljn.104.1570550653154;
        Tue, 08 Oct 2019 09:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550653; cv=none;
        d=google.com; s=arc-20160816;
        b=HZvgQEFTE1Au+qjVkEgcbfDShnv0EaJIcba5xAB1oa3iqoIobTcLUsEkAezFFwz1Ac
         Pnh7983Y3GHvGVMYlEo6aRfv+2Bck3eSjKpwfGH3MAmznpH24vzPq31R94gW67luSu50
         ASa5V/mmX0C73gLQV/jMFs5P8605Ou+kWxDnkUuwk46fInGADGaHFVfu2Qz8IaUnBxZA
         izFFMLTQsS7UOGF1KvPxHVwvUpbyl0MqsN/gGh7hL8FMUvTSXYH9s5KQNKxToRvZ0ysL
         0BWH8V6dFw4OK8q1pxBxCikfuhR97tqnuQjNpUN328W4Pb4l5gACCpB+ByohZ+TO2hiq
         cK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=MaCEmIUTfUEgAhsFu6Ow71tCUtCcw5nGR1cUNyw+yec=;
        b=sgz8xrk9l05NAKhP11ERDK/IKEwJGlpS2kibrOh3dY03hEpBbDmstyLeg49iDcp/ri
         +a2oRkE1OpySIO9HryceF4aNUIBxAvl2f06PFs4e8OVbd2cNQ4W84A0wylXJxrWwP9X7
         jbp6WQznG8bcsmG2PtpWYQKnmmEh7+glM+4ucCIF7TpHnPNi8bq8MKdtXuriZesOgGMZ
         nA8xFeTNWbUeu6Rh2tGXhjNpsOXqj1uJPU/MlI6z8c8yk02uHq/ZSWhnU6TiYSGXeML/
         X3CpvEGUypU3QkriOuiZLLvcV45IRAx84eHLvaK9qmmUqokx2C+l+m4twZ3WDTRqS4Ll
         vGYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dU00YtK1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id u24si821494lfg.2.2019.10.08.09.04.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46nhx82TWTzyBC;
	Tue,  8 Oct 2019 18:04:12 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 18:04:12 +0200
Subject: Re: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic
 fixups
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
 <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
 <0c40baa8-30bf-d60f-d8f2-860db42ff7c2@oth-regensburg.de>
 <e2342a7e-29c0-0e2f-ecf2-b82a7d1cd1c8@siemens.com>
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
Message-ID: <144f50bb-ccfa-403a-333c-da36fe55effb@oth-regensburg.de>
Date: Tue, 8 Oct 2019 18:04:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e2342a7e-29c0-0e2f-ecf2-b82a7d1cd1c8@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dU00YtK1;
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



On 10/8/19 6:01 PM, Jan Kiszka wrote:
> On 08.10.19 17:56, Ralf Ramsauer wrote:
>>>> @@ -950,8 +947,8 @@ class IOMemRegionTree:
>>>>                  continue
>>>>  
>>>>              # if the tree continues recurse further down ...
>>>> -            if (len(tree.children) > 0):
>>>> -                (temp_regions, temp_dmar_regions) = \
>>>> +            if len(tree.children) > 0:
>>>> +                temp_regions, temp_dmar_regions = \
>>
>> Will re-add brackets here, and in all other patches.
>>
> 
> Why that?

Erm, because you commented "Style" for those cases in all other patches?
I'm referring to the second line of the hunk, not the 'if'-line.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/144f50bb-ccfa-403a-333c-da36fe55effb%40oth-regensburg.de.
