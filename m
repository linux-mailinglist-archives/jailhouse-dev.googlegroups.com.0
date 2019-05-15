Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBB6G57TAKGQEYGKGIQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1431EB8E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 11:59:35 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id 20sf608200wma.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 02:59:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914375; cv=pass;
        d=google.com; s=arc-20160816;
        b=qWtBe6vbSuX77ckV1etXy6F2HLPuaFzvGRjAZVT9hBfCmvciSUkeUA/b7nusGz5s1a
         MgtTxk/+hcQKvzjOMR2MCyzy4YbwiKLNoYo8pKE9ZOjAH3PlRHwABnnTuPrvvrslQb9N
         R947kh4OL7332Apu/Rm9rKL7ybYF9Dbhm6et62crKygxW23D+pxL325TteaUJlLKhX2D
         r5YDD+o9eEDw7y6GZlTdatbqQ9x0dnSs6jswbogdEN4amt2gKuqCiChQ2aXM4r+0I9V7
         VMWNFyI4yMi5bbMba548Y4Crq1ngGfLx5fTDr9lveQNIf9VIPJT2OHOHoPGTJOOe4Wy9
         F9BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=kaeKKw/9QCLewXmlWwmffl790kEuDm/rBM1FFmDnflg=;
        b=RWLP7h/YytX/s+mzLjHdkawGHep2c0Ma2vpMSXob9uDJdxS6GpmfbZjutxGoIoK+JL
         f4pRYBHND/TFvaihBPOni6fxfEjnEY0XEooYd0StskbutTx7sIcaCQ7mFMAuvlA7HcF8
         0zUf2TDGKGeDbc7n2m72HUYOexKkwu2dmIK8h0+msW+1cfFPj0rMQ+a/WFWQ0WU1xwU9
         AiGuLLZ9uSPMOITb/qnZHmeR0wQdfwMABL49qm+PbFmoflal9PCWS+FhJpF5aPbv5k3c
         kA97UxMad5WUHNaHohz95genc6+WQgpHN/XzGUJsOYW2EA4OPgDMihqBH+in7J3CObON
         7nlA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="nCPlle5/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kaeKKw/9QCLewXmlWwmffl790kEuDm/rBM1FFmDnflg=;
        b=taqp2eDYbLpEmJm0awPnbHcQSrCk5D55aJ02pmZvC4ImBe6xlEP3b4t4O7puE2snEa
         23br98IgRadDprDAYq/WZA12+TpJtFFdoZ4v23Eb7L5VHR10YZcpctqhLBpycENct4yu
         s+R436zuaZWY7EgJqj1CELJs0bM95u8XRsQEabbSO8X6dDzYbrPn4AEyBXAdWf4hquy5
         RVFtSPZQs1uMBzCKxbKAfcShpe2E1H12cMd+F8zdn0wyjlDQhoxDKprmvE8z6C4z4mNy
         UaMQVvzD1uh7w3uZjJznW+yRmhgksZDn6F1I1eA7lJcQur86FK87JHN3v/6+jV/7uBma
         tLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kaeKKw/9QCLewXmlWwmffl790kEuDm/rBM1FFmDnflg=;
        b=cMFYaf3Fj2u+5U5Em2UxTmLhz564XFIKQOAAQba3gAY/sPQ97jTROgb0rB/tJlkICQ
         kF5YXaIziNArDLKW1emh03ELoJILs59NN0F/fahXwwRLeS0SWA6xp5B9HF/+XaYl129t
         X3PZXkjSZONh0zbPxfRiY6wkWk59EjiJpscpeQU6o3xTDrog0SRXWrszU8vEECicYEtd
         vXXKia7H3MXRhV3D+T284AM6ArqhjbEcUNlqI4/naCKucd1mi2nprwuXgtztsa1cjqIS
         EN3Sp3S48a1uiAHMi6BEc6GlIGWv6wlhar1X2uIm9XcCwIKr0bqhRLbLvEnGDWHpqS3F
         mr6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNnSg9FEKAq/n9XHVfB+gvZm94y25dwUtcTkP1THi6fp3hZanz
	VNuIwI96ZidvAqivrbNBadA=
X-Google-Smtp-Source: APXvYqy4bgQUGhGrZxO4+T7wAu0wKF8ZMjGTYFxuzKSb38xuEaCcJhlq0RRG5ogSReatJ+9bNvDIgw==
X-Received: by 2002:a1c:1f47:: with SMTP id f68mr12722879wmf.57.1557914375198;
        Wed, 15 May 2019 02:59:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:66ce:: with SMTP id k14ls472529wrw.4.gmail; Wed, 15 May
 2019 02:59:34 -0700 (PDT)
X-Received: by 2002:a5d:54d2:: with SMTP id x18mr25976605wrv.186.1557914374761;
        Wed, 15 May 2019 02:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914374; cv=none;
        d=google.com; s=arc-20160816;
        b=Aus3vf3oTevnCkTY2nuXZF/RNL9BSNhU1OWckx9oseXmDMXnFknipezAq1Xt5JabKL
         vdkLVPPEUiLi2eeeAbU4tWYAKm/GEvrxAPp3tS2WEhCy2W0XGqaFIG1UIgJJ+ftaHR1J
         rNMGxGXxgB/zT0xsR00XMpDpueU8NQPQzllMzhoW5wQehiHnLGnZi4O+aWmPJAaWMStb
         W2MJhwYGnrFy/T5861XGnfrcGTs5BN4Ojs6s70K+RYTAkKhuasNheqt4z0+DLcZk+7P7
         FW7qbLT5y5NxUAUpsyqaoNSMFsIpsaB70rDFDvpk3t+d0zhPneZulKEnD3VFJpE7BLJY
         Hv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=9CG8XivFc8HHWUJbbbpFYjg1IBCSVYUli2had0P/HYo=;
        b=m1he+oFLveS2rWRUy7S/SeI6VBh1fAdqFslszyNuDf8lpDcKRZnqUFKap0+XbJHcbt
         NZrIi5sutQWkaChJrVdQD1f/xUCShANeK+A/U1nvJpx8Yb1zVBcg/uVol7a03G6LJfrV
         VPZ//YHEMpsjGJLxRH93w0zFnlGU1hH5t8pBaoO2qE0foj8V+7Tq44Xp7DHnO/psu/q+
         YTLCq0I9hL4SLFqsYHZvbiP2+1pJ/n1JGVn+6uH6dA/G5V6Nmtv902a7eSgm7AhKIoxP
         Pp0T4bwVC5d/+oCSClTtSNgaPA3oyYNDBfhThI5+hF3P1A+M159cGavMKhTGZkioCdW1
         Nihg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="nCPlle5/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id g204si1473414wmf.1.2019.05.15.02.59.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 02:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LhvyA-1gvLRU1HEI-00n5LT; Wed, 15
 May 2019 11:59:34 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ab15444f-4a35-712f-3979-8b04a395ee1e@web.de>
Date: Wed, 15 May 2019 11:59:33 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JrgTI+OFJbr2eHu1WnowqGBNdZDgJ3P6gS8SwqeOGlUT4Kh+/F0
 8UlGs4FupWZt3GZftmUy05w66c4nbFtH1EnLOyOWLTmVUv9c09Si/x+uZ1xM68vGl2sum/+
 a/WZCxaGeNITSxh0BxTxJhnCFrSYTSOvJ5ghM6hQEyFQpYOQYAum/woRKWVF2nA83eL0iOu
 9zqu8m4QrXdpTBA/OfWvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pkcR9qtIp20=:wm1EOMy1sM+5iwkbKZFP8c
 5TzU0i+dLyTqO3q8l2rHmFs0dvzxykvumGXB9iLRJlggmA4NoT0BrE+4hg/EvBVfKv8mlyijO
 Gd7zaLUBILM2RK1yxOV/NRrxbFTsc+7KW8u8M0lii4zShoR/MrukALbdXT6IBPCEQMSNoS1b6
 kSCjRi++DQtrfFUmw7xKXag4JQqdio7XC1YFTXbnr38JcStwzHaVpUlXLBjqEsBMxzQN9CV8q
 +euf7d2W2ugtH3+qDqnTIdIdczB2Y6bgk8TWqxBpOkkqGMDEUItXDL5syDHFrn2fUtiT2jp/Z
 sCBPEBO+JlAf7y6iFgiFImf1fAd55tYTTqcqj/b9UFe/3V/mnIXko7uj8WLO1gNNdnfgYlz8Y
 9XfsHS1C8AH5VFbE6GOG4p5QKknbJXvvsAdoa0uvZEAW2gpwCf5m3cxQYj8W1iP2G+n85lbUc
 yrFYgsCVT9gG2cY3euQKu1sV/IxQ0MzcBOwbc7wRkiWS0bFBnbRXB/sxRjdWJy31T4kJbjyw6
 9OLALGzKY2J/ERoCNmrpTDpH0nDsPVZ4B6gdv7V6Tj4MDvAqsa5TgWnXA0PB3lrYI20T0Wg+f
 sQRpC9bOQXESps9K9f7giP7dEer84Iq0AhmHifYwcLzP0jENX6kCYsfx1+WZ3vg7QjmT79fkw
 phbKOYMVPOeXkLCHrUu/Lfhfh/O5EprG7vdqcn8aWa6nMT0yA8Pd6MhaxVYmEvyIC3yt0IWLT
 gfuhguvX9V7EcQkqEnVdUerNZK8N8mO+Viov/2rbbYHW5BQ1wW2s4aSru3vuWcjiRbSPcJ5Gs
 6GgzTUG6jle2Tz/1XMdybCnOVGtbsO1KEw5ZG/V9v7wyBWZiOyG1fGTzUpQSAzMGBLmH7cbt4
 gLpJzZpU49zGFvKGR9VTWdlKgcXnJdLJjwoOD4OZUGsvqo5VzzQkDtfHdbeyTY8WYR5o9GayA
 LXyOFtuWbIw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="nCPlle5/";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 07.05.19 23:14, Hakk=C4=B1 Kurumahmut wrote:
> @Jan
>
> I have a question about the patch. assign_iommu_info and append_comment_i=
nfo methods is running for PCI-PCI bridge primary and secondary bus,dev,fn.
>
> I'm not sure it should work for the primary bus,dev,fn.
>
> Example Device Scope:
>
> 01 0A 00 00 00 00 1C 07 00 00
> 01 0A 00 00 00 00 1C 07 00 02
> 01 0A 00 00 00 00 1C 07 00 04
>
> It is running order
>
> 1.) 00:1C.07
> 2.) sec-bus:00.00
> 3.) 00:1C.07
> 4.) sec-bus:00.02
> 5.) 00:1C.07
> 6.) sec-bus:00.04
>
> May be it is run for only secondary buses.
>
> 1.) sec-bus:00.00
> 2.) sec-bus:00.02
> 3.) sec-bus:00.04
>
>

I'm not yet sure I get the idea of your patch. Unfortunately, it mixes a
refactoring with the enhancement of device scope parser. Why?

I would have added this feature by simply enhancing parse_dmar_devscope. Th=
at
function is just missing the hierarchy walk when a more complex scope is
provided, basically what is described in the spec, section 8.3.1, in pseudo=
code.
Then parse_dmar_devscope would continue to provide us (bus, dev, fn) as out=
put,
and no further changes to the rest would be needed.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ab15444f-4a35-712f-3979-8b04a395ee1e%40web.de.
For more options, visit https://groups.google.com/d/optout.
