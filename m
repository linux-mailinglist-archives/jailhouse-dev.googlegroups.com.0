Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBHWU3KWAMGQED6QSAJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C482420B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jan 2024 13:52:48 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2ccae3410d3sf5546481fa.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jan 2024 04:52:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704372768; cv=pass;
        d=google.com; s=arc-20160816;
        b=H1x1mfHPSzr1DdNfFuU+WqcqL3NbmN/t390ZYjgPxZ+VljpDMlx6ZA01cNyOzEkLbl
         lfSExIXyFR02miwoHX+Wmo9inI798wXjhy5yA+uHkJQICVFbEhBxIafSMd+IRNWvI4Li
         bT7Qedy75RUsz+HjSY1TdkFTdTnsO7sXZWqw8U5bEkwxXEKWkpiXYFANq0CcK20jd+4t
         v5yFqN4CWNOF4he1xsBpIidNP3JANpLF3O/wr1W252NKbMuOO8a2EFD2RzKrUbSkqOy0
         37WWiwU+Pq1b4GflJqRH+zoZ+M063PnYPRnBf/5jbfjLrsgaQ1oit7OwdbinCDvxHANY
         O3kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=XOA5XTslAgfoqItHaAbdePUi3wlStQEYTD/lP0WGINA=;
        fh=4Ira9jTz9eNTAGyAJKrSblku9+hl1uNslVperE/h7mM=;
        b=zGT3ohLdwlv6AFmwle7oqEFWCEDK630Y3AP6FoYuuZYlimHoH2LiuXRV71FIw5kPTj
         tXgsjl1/HfVCQHvPwzhDzQHCkKbIhCUp70nVHHUMm3geMMrnYXBFebTv3dYvQ2zTYM+G
         6nmXW/kkFFYoyEkuz+kix8crq5qCZZ4pLsVdsO8E/JHe2SDGGNamRw937xuWBk4ORRff
         XK5YT9Z6qd5o1i/OHoJ1r+U14xB6Yxaf2lCYgjgo8h8c+UHTg9qMY31iauy6wi4Cz1NX
         gQKJAFU5caxdioAuXqM4jNxyNnJC8Hf0ajLt3KKz9qkjzpowtKYEi8dT8df15ykbK4DZ
         MVMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=GSibKKp6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704372768; x=1704977568; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XOA5XTslAgfoqItHaAbdePUi3wlStQEYTD/lP0WGINA=;
        b=io0ZA7orvd3keVM3KYe8ZeBA+jWT5AuDn6hrS7ODaOyWZCZWfVhsbhw9EVcIfPaaaQ
         /S8hN4/dYmbLbxgya70si6rqGiOhLs8HwzY8c5Z2SuW2MOSdRfZA4WgWC1qystdhX+Uu
         dQxSJOvnihyWEci83t52Ovd8tFQ/fYvsyJC1APdms261DU1gdKdUTjGLxZejmbb+FgQ8
         vVD15A+nhZ/rT0LCCt1TcmVH7UHlVExcAVx9tbjRBbzcieOH4ezAuZpRR7poajPAKLxe
         P2FuJu/pmRI0iDLhSS9RpQ9WX3IVfSyeaYs6KjdvVF8r/lHI2IGaxncrqb99yZlnHWVn
         oLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704372768; x=1704977568;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOA5XTslAgfoqItHaAbdePUi3wlStQEYTD/lP0WGINA=;
        b=jQWobh+Xf3VDHFEYFbHuE1WKvyYW7fd/TKjPy2gKGBUgjnVF7xXqQbzOBcdV7x96xj
         VPT9LpkPN2puLaU6LMXeJLSf1FPKWWqg++4s7JVLrfZeNrcMT3tpFSyy6Vza5v0Gzgq1
         iBnhBakn1vcLXqg4VQv1K4aHK0QJNm3/YP0Nbp9t8ZaqRReCOMZxhyvwdjCal6kPCIdQ
         RjVbtzFwx3mQMSRyegvJAhHbP5+b6XsYZD4U40kh3AVAyiElpyiGdQnMkBxA4kX4/sOg
         4p11EMkL9ApYxl2g+xZtLtrDOaDKzQJEoGeDP7D2D7jN0o7M7WvCJzuPtNNtOhXfjDMz
         n1rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yx2NkZt7StBlTSvgI/eKw0V+RsPjVju5xzXGQyTJEDJfpGPuP6+
	9CxMqwRaEAXjq+7OzWS2yXQ=
X-Google-Smtp-Source: AGHT+IHZfTk31iGTAxZ23yJFH8rRzRTf2GzP+FglJe9rhG4zuV3Z/HeELCGz2vo+u0HVifskITAG2Q==
X-Received: by 2002:a05:6512:3e11:b0:50e:7a09:8a6f with SMTP id i17-20020a0565123e1100b0050e7a098a6fmr203350lfv.139.1704372767365;
        Thu, 04 Jan 2024 04:52:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4018:b0:50e:7663:9a90 with SMTP id
 br24-20020a056512401800b0050e76639a90ls66267lfb.2.-pod-prod-02-eu; Thu, 04
 Jan 2024 04:52:45 -0800 (PST)
X-Received: by 2002:a05:6512:3188:b0:50e:8762:3c0 with SMTP id i8-20020a056512318800b0050e876203c0mr277871lfe.48.1704372764723;
        Thu, 04 Jan 2024 04:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704372764; cv=none;
        d=google.com; s=arc-20160816;
        b=xPf2HaRm7M6iTYfBf00nOzXmw+N/taXmfrVJtmWA4NvvQHioXdKEcPZnv7T7hWnb0j
         jyddtk3XiyQV8FJBZUDgl8C6GEwRf6H8NbKv8Vemd0kPX9K/6w+5oMG93/THcKlYzo7H
         TcFBKSHMGbc4xt7KgW8hlyCJBWMaRcZHmyyn4UguFWbaZjwpQELz66zKo3GjMHmSZdis
         lX0cZXWyK/S0Bi2ZT4DYLV+JzOPiyAzR1f0n7COTv7EqVoA4aM9PJtvH+mrzrS+qClPp
         w2kCmY9L3uxBS65ufCTReqNOdaSR1TrWIcGkQXolpfPNWwuGZTKTKB7oZvVYCGKuiY4y
         WeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+XL2PEgSGRgzQjrEcU4IFSeimYDeXDJf0AIoBm34Kkg=;
        fh=4Ira9jTz9eNTAGyAJKrSblku9+hl1uNslVperE/h7mM=;
        b=t+3PGSjwAFCHE5kYGIF7HugKFI9Zh6GS6+tY2LSsKcfq//Kodl6Eknc5UajcNAzE9M
         2WpSHj5cLSpWi7OSgjLKH5IHcDFRhYtHB5uKKXJW+KFdBr+P0mtqkAuoRkTo97D7J6Y8
         DXMS+okq4kitmV0Iw+tYweuASMxhJ9pj+5GfdzZKvHN80pMHf/WmgUfpXUkKll5MA+sK
         aTbxQVbRebhix8gjiSnFGX3JstEmaX+KPTTFGUzxA9eHasG5ujACbKk9PMc/8KxGPh61
         5dmsjnDeJfeLwR7ZHK6BjuEjtaEcBd1u/lZLHhhyEO6rPhL0+EeqjzzusLmCgs+gFxFp
         bx5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=GSibKKp6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id m6-20020a056512114600b0050e69030a77si772905lfg.6.2024.01.04.04.52.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 319502A0236;
	Thu,  4 Jan 2024 13:52:43 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4T5RMG6bMXzxpl;
	Thu,  4 Jan 2024 13:52:42 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jan
 2024 13:52:42 +0100
Message-ID: <dc35efeb-302f-48d8-bad7-daa678a4ae75@oth-regensburg.de>
Date: Thu, 4 Jan 2024 13:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fail to create sample cell on Intel N6005
Content-Language: en-US
To: Benoit <b69644445@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <e06c1b28-3007-421a-960b-a298cfaba7ebn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <e06c1b28-3007-421a-960b-a298cfaba7ebn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=GSibKKp6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Benoit,

On 02/01/2024 17:03, Benoit wrote:
> Hello,
> I have an Odroid H3+ (Intel N6005 - 4 cores) with 8GB RAM.
> I successfully recompiled the kernel (5.10) with jailhouse support and=20
> installed jailhouse
>=20
> Loading the kernel module works fine but the following steps make my=20
> system unstable and I am unable to create a sample cell (I tried=20
> tiny-demo and acpi-demo)
>=20
>  From what I got:
> * I have the memory reserved upon kernel startup according to settings=20
> generated by jailhouse config create.
> * enabling jailhouse works "pretty" reliably.

Please be more precise: what means pretty reliable?

> * starting a non root cell cause kernel crashes : a core is not=20
> responding. (as reported by dmesg)

Please attach the corresponding log.

> Afterwards, my system ends up hanging.

Sounds like a crash.

>=20
> I didn't touch anything else and I don't have (yet)=C2=A0 access to the=
=20
> serial console (going to look for a 3.3V Serial to USB adapter).

This will very likely be required now. You could also try the 'jailhouse=20
console', but it probably won't be very helpful if we have a crash.

Thanks
   Ralf

>=20
> Did I miss something ?
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/e06c1b28-3007-421a-960b-a=
298cfaba7ebn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/e06c1b28-3007-421a-960b-a298cfaba7ebn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dc35efeb-302f-48d8-bad7-daa678a4ae75%40oth-regensburg.de.
