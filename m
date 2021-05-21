Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM63TWCQMGQEFOFFXHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40138C1A5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:22:11 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id k124-20020a1ca1820000b0290175dd5429afsf3530788wme.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:22:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621585331; cv=pass;
        d=google.com; s=arc-20160816;
        b=F4Wy8DePCtZC8lyuswSotGKJU4qlncaxxTHKQmVqFYaHPYjh8GfikSHY5Efayf76wR
         92R6+rRIZyt1hXam0beXiRA23wM7WpLsJTS6FFKGaEWaXPZipcKhmgnhiXof/y6Ll9MJ
         g/H5lHidLbkmex99JMAJ4rnqNYOzg/qiU35hIGMGoJfXJLRC81qGQ5tftwBaswGY4gra
         otWCyijh8cM4TpcbarDskWRVtYm20BfQljtegTt2IXtbZCktdac7a9P5O85PaZXuEWn3
         sgehLeUc1m2rNid+KY4ubxqG8bzoeec5HD8CjifvGuPgv4LxADaR/c/IlFirzGhGaLNR
         kG3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=3oUU+V4SdvpHV15oh3peTl6k1NZip/CzsMUtrqnB338=;
        b=d0fvf5Dr9aDiyX/eINZLLYWeYAT/nNVLeg7tZNok1Zvq/6YfDc8jTPw4jZDgEA4L0q
         Eqr6xeEbCvLg3T8Zwuq9HbtIN+x0LH6qmOayIbGayJIBSW/m41NMatsjdLw30umMNMuL
         r5szB0iyZR+1P2B9hTR60E6gagdEw/wQdXjgPycALCHnhsw1V7t1F2PqzSDnv2azAiXN
         w8skw2+k0DZiqNBtD+CwlEvRcUYDeJWat4wTogU4urXwWAmQRXXL6S8xBUJxFe/PCsN6
         z3fE6bTfAAvbB12jGpM85PhOELWMeDfwQjxcNDMfuSn97WWA9q0qtJHIFdZr6Uym3tBe
         duYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=f2zvwQa2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3oUU+V4SdvpHV15oh3peTl6k1NZip/CzsMUtrqnB338=;
        b=oz5M+wwPGZHZOH0B0df2nU/tNwx0gk0KZsASVs0GuC4xMroAfPoTW8gquYKbd9/sq0
         31VwaO7gZM0QsU7PqdejofloWW9YL8KpGrgT56a1SkRzr7V1b4dkIHM/uj6tJoendyoV
         ONIaWAkyJMTLUPcEBc6jKC7EtCzrzny4CnSHGyzEOAQsjvYHCwl1zP3Lf9QKPAl1rbmV
         P6klucrUW/Z3syU9+0uYaJjrJvIMhErvTFD1ZTd/ffzeF9Wq+b1liqga+OdVAniVs4Mb
         yHAI6kBgclF6tUMsG5gJYDECpegn7fNDbycByXJtvtq6A7akEjoAG/TwxowLr2m77bOL
         GQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3oUU+V4SdvpHV15oh3peTl6k1NZip/CzsMUtrqnB338=;
        b=QPIaljJJFOIFkd9pggysCROH1G9mNcpuNHuAYvQ/zreofxaNjg9fAGmDB6qgmRNXlr
         R5Sih+PcXtQsafpeFB9Urzk0KfcKs9N8gWBtKqHfW8oCOLEES0+WRtcmipFQCx7R+udG
         OwcwrJfBa6+ICsS86b2KyY79H+TJQ88tt93Hb9nEOcuT9Z6p/RknV/z6cZds7bT2KbKN
         jnFjfoL6fGz03K8sx6uCi4Kk6HlJjEQW9uXIgiPwBkVHE6L5qQKrcIV8rvobRbprzY0G
         q0SL9zirCA2UIaaLDCGm7BECIctDPKTPU/h/jhdn5Ym2YSmXAGDFCnYiMvqNygL5ie7E
         tRKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Cj47s9qX4a6EUhU2qlQqOkPSkJCXEU7SHGYebBUPIBV8yepj4
	lxWRaLrkAYqrR+KVeFhFh4w=
X-Google-Smtp-Source: ABdhPJxXHyiKmVSgrEh8pG/mlTTYtQGGoFbf2LxC5TISCfYdLTCXo2/S3Zym3WPgpFGsSsc4p8lT5g==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr8300468wrn.368.1621585331612;
        Fri, 21 May 2021 01:22:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db50:: with SMTP id f16ls3405131wrj.2.gmail; Fri, 21 May
 2021 01:22:10 -0700 (PDT)
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr8164295wrx.67.1621585330713;
        Fri, 21 May 2021 01:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621585330; cv=none;
        d=google.com; s=arc-20160816;
        b=pt6M7TaN6Wr5ZPqGuGCr+zVVSg2LaqsWaIALdmEHbgDe6TreXp5hjAa9RHg2taSzXR
         G7r0zXObY2SVTdCY+U7qo7Pe3qWvB+7tvWKeDvXgj3iBBKmTGeguPUaxgadibK6Bg0mI
         I3q6KQGQrYxDe9T1X4pG68ha+A8h1KYPaT8eKyeLI7SKuD9jibWMxR+k9c4BdivUZPDs
         i0kkvlkdMopaS4JJf4voV/5ohyY8oaRIKY91HJwWI+UWZDHeTDflmd2pBbIB2fpf4cwu
         575AFCszP+tgixDLPqS8UiTR4s+TdJ8fPzvaoMzuUHKE72MKSb57Rqf2JN20xUEG5RrH
         vxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ZCcOMDjTJnDLgrma0MSeixQthjB6DxzveYSj8LeuoEs=;
        b=KuksE7kjnCnAiHu76aVAwEYiGCyROb4Ea7ojTIVfiXo3b75yQHWElxu068GagBkdm+
         B6jxXhLaLc2ssg9QGkqU0ZK4SGAUAc2g++l+7IlAJoda63bn4XfGZNpuTnmOVd66OAaN
         uygVi/tSDczOXOFujr1vgz2rnjSwlgPgn89Dz8KT4fnNrmCSvKnYAJQQpO4LSkb6CbwH
         GkaLKNcjOSX5EyzAYxl+c+y5jdxWVxFn2Hsa+gYkQGR8HDYUHS9hLel/TK5MsamMvfwC
         sMt7pf4KXE2mZmWorI/LXtAqooMQTwATlaJKuIDn8LQzOreEmoRrJ7Rf11CMFEZRVEsC
         Q7vQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=f2zvwQa2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id j13si65962wro.5.2021.05.21.01.22.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4FmfjG2X1kzxvt;
	Fri, 21 May 2021 10:22:10 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::762d] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 21 May 2021 10:22:09 +0200
Subject: Re: [PATCH 0/4] Support building and running on Debian 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
	<jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, <henning.schild@siemens.com>
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <3c6eb143-ff47-361b-41c3-17a71ada39ec@oth-regensburg.de>
Date: Fri, 21 May 2021 10:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=f2zvwQa2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Florian,

On 21/05/2021 10:02, Florian Bezdeka wrote:
> Hi!
> 
> This are the necessary changes for building and running Jailhouse on a
> Debian 11 system. As Debian 11 will no longer support Python 2, most of
> the changes are related to the Python2 -> Python3 migration.

If we should really think of abandoning Python 2 support (which I vote
for), then please have a look at pyjailhouse/extendedenum.py. There are
some compat wrappers that can be removed.

  Ralf

> 
> Testing was done on x86 only so far.
> 
> Most of the problems where found while trying to update jailhouse-images
> to Debian 11 as well. jailhouse-images patches will follow soon.
> 
> Best regards,
> Florian
> 
> Florian Bezdeka (4):
>   Makefile: Update build dependency from python to python3
>   tools: Update shebang from python to python3
>   tools: jailhouse-hardware-check: Remove python2 specific dummy
>   doc: Migrate setup instructions from python2 to pyhton3
> 
>  Documentation/setup-on-banana-pi-arm-board.md | 2 +-
>  scripts/include.mk                            | 4 ++--
>  tools/Makefile                                | 2 +-
>  tools/jailhouse-cell-linux                    | 2 +-
>  tools/jailhouse-cell-stats                    | 2 +-
>  tools/jailhouse-config-check                  | 2 +-
>  tools/jailhouse-config-create                 | 2 +-
>  tools/jailhouse-hardware-check                | 6 +-----
>  8 files changed, 9 insertions(+), 13 deletions(-)
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3c6eb143-ff47-361b-41c3-17a71ada39ec%40oth-regensburg.de.
