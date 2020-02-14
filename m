Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBFU7TTZAKGQE7AIBOUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA115F8AB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 22:22:30 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id l4sf8481947edn.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 13:22:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581715350; cv=pass;
        d=google.com; s=arc-20160816;
        b=NxE64lEJsMQRGyKZ34fFz1NSDRV9lJyrT5sPCmR7c8F5uaLUPRf+JUSsBez48wtpg4
         np0JzusMoh8f9UQ4p5Z1f0fe1BlgD1l3RsAY8WzTblX5sqEeZXbIiDd1kI/8wVbteMKM
         mDCEO6xhA4ft04tEpcW4s3wEbbeXga884/rL7eR6iU4fq4xbVnIE1HHQZdzgW03F+Ydv
         ZG9ndl7hr+XmMu2hLrSlYZlcxHaW065sN90qVW8N0M/6HIiVVpTl/MjUJHMP0r3TaU/H
         9uYsuazdqzdxq9DuCdBNg2L7fuUXHbhSSbcUBnpISGGWMPW0BwhGbflp053nChXHyBWs
         tYQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=Uskd4cZLLTe4wPqiF7Z8/Pmk8BYrAdVIiqL+4nrpNd0=;
        b=KqHLPhE2lXi3dEGCEx7VL0wIF7mfVbFm2PYFMVZ2MIT6Df7EcnY5ySIdbQyYRfVqRW
         UU+6bA6WNfSeSkQleMghBAv9pwPgx+Es93RdL9TFFWBPSkgZkszDkVNNQPpVOE26KrzQ
         YuDfakD6qmv5UN+E3M0qRMnuDbsfTeTYZC1skRJwedDj0oqSA/Mg1eJzUZEoWzDkf57x
         4V7hnYrKsFenB8vwjoKnvJY7Ijg23mrNfjpHBMroYvmqB7/jvo7WWZqmxcK2ky3O2SMB
         Z4IgZtCtoidK/Fde3KzSyeLr0s2Rn+OpydgUNIacm7S/GwndfaMvIsMqGEplQXowA+dg
         pc1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uskd4cZLLTe4wPqiF7Z8/Pmk8BYrAdVIiqL+4nrpNd0=;
        b=TlShrsTCprR5o+/VzKlmEZ62IUdSVOpraO5R2aS8SD+JiVyNtM64CzBNrwZPB4nK+R
         aUGR+BurxYF79bkiAsbhnipS2XgVSGHnc1okU3w6JPMW7JeDb1ZXRsRc970el0GkhMRD
         vwO96EAnZN7BFEUSj/iqJrSnadHnHP5eEr+CneNFEwnxudVUzB48e+3Fu9sfZVr2lSaq
         JZGqx0hlTi659ki0d6NUp8/VfviJhxuLGaYGPogk6q7M6qHFF264oqWcjhzn3jUP1Biz
         5XZwFL66wmpaDPBW5tqoou0NK7v9Rr436sAiYCrObN6r9pIewg5FogTazRYH4mqOU5vh
         WOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uskd4cZLLTe4wPqiF7Z8/Pmk8BYrAdVIiqL+4nrpNd0=;
        b=VHbl6O8Y9iyRNajfCNcCyMM2THGCbDnVnBYqALPigBrH4sWFjpMvesyQp2RmlT+G/+
         jP1dUCZaNy/mBi2My1j2AkIlgCEa51oCzn/S1pyD9vQX/kvP7ZRUxf6SLCARsDF0elM6
         WoFzXKQb9UPft+7v+VTNThVi9iKf7ju4QCgP7R0EQCQt4HlnDf/aSwoF3WXGmEfz9TKB
         5kL1WKesZjAes3dmi1k4PXmbEU4Nwcc1ZUtreVKNlPYgGFFCmrGmOYmC4i+iYTEMQUvv
         zjrqEBTxLnOfunIAFVNTzBQ1W4RNtkS33IbiTST5Wl2sFIka71MKIz0y7S5hveOWPNaN
         +mhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJnQjmyjT5I6NX///CML9JScwetgrZX1LnHU2NsEQgtSdVxbDb
	1Swc8dBU3ZzdRDr39e3ACak=
X-Google-Smtp-Source: APXvYqwTpIKybTksNTHeThjlo56l4Fc1Dql5XMEK+O7Bxfj35YRsqQK7NV5IdaaczuOtprNNrBOuBA==
X-Received: by 2002:a17:906:ce3c:: with SMTP id sd28mr4889149ejb.251.1581715350659;
        Fri, 14 Feb 2020 13:22:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1f97:: with SMTP id t23ls626148ejr.11.gmail; Fri, 14
 Feb 2020 13:22:30 -0800 (PST)
X-Received: by 2002:a17:906:cd14:: with SMTP id oz20mr5032019ejb.64.1581715349968;
        Fri, 14 Feb 2020 13:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581715349; cv=none;
        d=google.com; s=arc-20160816;
        b=Xf4l+/KXjGEDbM7c79RmCayVzRPYbKqtj6kn2hXWgK7XuPB+R++XXPRQw+oQqjGIYo
         8keg2kM5RGlsdr5MxTx8jvPrIv/Wwr57frvSQ+/a4gXYrZpMzzGpQDe2gmoCzn6PmbSS
         NLhgFvVW/+t2TDEXCwHehqkZykWWnaUnqAJyFVodUcPp1QYTCEEKvYLuNHPTPOKWA1tz
         A9trr9A8YTHwNH2kHCxoA4a9ICLQqX0t52mHFDK+KnlAvAtUxtrSK6Q8ThJvHw6A2k99
         WkCGUUZDxFis7ubrc3c65nGylNTd7xrWcSLTorXdU79lXQb6f5gWNyKh/JDWOygDZojq
         wh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Ghal97xRBdh8xlpJzuCeaa4tEiYZrN5y6UGOGoWGGCg=;
        b=lk6I/nJN02yjmKJpWVobrQ2gjbSczTXTDD4keFSTkwtT/YKstbJ7Q5t28On+LRkT06
         fPEpA6u+SLW6V95gnYR5yN5MCVtXaaY0y+fSLLbAX+C1jnKaQLEL5zzdCbgRPUXGzl+8
         QM1a4iCxbs8tl54+IcglQ6Hi50GC8y4YFUGuN7ABjQpbyJQk+oYEZVc6fWKIRyxAM7Nt
         QvhJ1+geGfBXXyfU6JloEBmUvw6eE2pWxghcPt7avQO0e5abr6qlB0dD0dKi2OgdsRYX
         atD37NggER4HJFXfy7YYoFLrXhqyHaMLKJOk9En1zduyRFxZ+pPU/UM0kEhJOwaguxs7
         lwRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n21si296572eja.0.2020.02.14.13.22.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2020 13:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01ELMTfb010928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2020 22:22:29 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.2.69])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01ELMSHY007635;
	Fri, 14 Feb 2020 22:22:28 +0100
Date: Fri, 14 Feb 2020 22:22:24 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200214222224.7b141d64@md1za8fc.ad001.siemens.net>
In-Reply-To: <ffb915a7-7216-49c5-a7ec-722d33ee2d05@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
	<20200120144629.201f3081@md1za8fc.ad001.siemens.net>
	<b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
	<20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
	<5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
	<20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
	<96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
	<20200207110143.3f84a121@md1za8fc.ad001.siemens.net>
	<ffb915a7-7216-49c5-a7ec-722d33ee2d05@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Hi Michael,

thanks for sharing that with us. Maybe the whole story points to a gap
in the docs? In that case please let us know how to improve them,
otherwise happy hacking!

Henning

On Fri, 14 Feb 2020 13:12:51 -0800
Michael Hinton <michael.g.hinton@gmail.com> wrote:

> Thanks for all the help. I just want to give an update and mention
> that I also changed the (old) IVSHMEM code to do MAP_CACHED. It's now
> just as fast as my other MAP_CACHED memory region and is working
> great! -Michael 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200214222224.7b141d64%40md1za8fc.ad001.siemens.net.
