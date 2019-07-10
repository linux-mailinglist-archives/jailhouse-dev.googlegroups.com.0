Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMVETDUQKGQEEMQECFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 875A864ABC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 18:28:34 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id r21sf1837812edc.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 09:28:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562776114; cv=pass;
        d=google.com; s=arc-20160816;
        b=r3uf67dV1bGNccPEhkW/p2bmZ5XBal/I9tqmAhIXxLPrPt5bhMLyVfDYlaDqzuLAmy
         YUdpOj8gaMEvgaFMdT78iFiNeGmZUHJnlI29P8cVD76W7cVsiZ/GytGWOVdjOJnfBmEt
         Uess/RMYphD+7oevwODVFY1b7PB41ZJtn3mMpawFyBOxgLqY7RnDYEsfeBn9UxAXcfjK
         +RIIow5SXDTAvoHpaGkUvUAu+VE0LsYA4PCkh5H5z8PYX8n4VkWjRGbBpJbczQ2nwI5f
         gh7/4puKrhmSHM9uJ5tQmLpNQxRQkyzoILPuabN3yPJ85fb/h/zlFt2f1EbJb0xE527D
         d5fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=DCqp9Q/e4olmWmWJmZyrkYT5EwQQXn2h4h3teHUvjUU=;
        b=Q0bHNSIshMjpJwm7Nrnb/R0+ndiInjnn+eIj6bgwsxmRQgbaX1e+oArQiRzDB+d3ay
         OK1AD1tBeTZIcXQPq3MU62xoC8aAN/IM6gICwxzVxEVTNEx2mggPqSDa4c8CGA4jIk7o
         lL34QBRzZvHmsuOYG9sqVd9qyczsB9q9FfLnOSJ3m87OY7vQ/LvxqgLjT6vlFNW6SpIL
         U/LX5uj09kmEGUfkiKng0QPU0/eJuqgWcEV68t5XjeNs6YLp7O1yS/KrSSToPKEg/Skm
         vjH57UHXVFwWbnP7nINw2Psh5rJDQKcookBo6Cpvf/a9Wsf5y5IoAy3Nt2NC9kvKU7uy
         zG2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gVYpAhuq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DCqp9Q/e4olmWmWJmZyrkYT5EwQQXn2h4h3teHUvjUU=;
        b=md8uHHNbVEY3ba45kynP/c6kTwywfBAuAMUU1w+cxf3GbrdVPulGHE6K54EclSYKRS
         DepQ+tlnO1fQgGVb0PaKG00vlwjwVbeb3+hYUyT/3zYwE7WGKqgY5q90352Fawn6VsZ2
         ARaJqaak2VIzr4YhbUmYD2/OyYQ++7jVuODQqVXNFrUT0eDrgEfqaFET/JfobJLYG1/A
         pAOpGAjhHSnyAnhWQR0K3GRIQ5kbrN/wvcYFnbiFWHQAeBaGkvUXJeYkNfWkITJZLZQs
         Vcu+0ZofeikbnMKVP+s3LbxCcdX5u96VoVMuIHXrD+gXQFxVrx9CerbthDPbCr5OBQN2
         nw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DCqp9Q/e4olmWmWJmZyrkYT5EwQQXn2h4h3teHUvjUU=;
        b=nK0S8txUGoIdj15TaM3/ICroZv8PyOk+0a9UMKbNqLGTarAM9xvO80adBmmdusfvKE
         Md1FA0n/i7SRZoHdVi+ET5uYXBYvT6Opiqdzqto5pEkLtzbqFdZDkVFbAgdNZl82KmAx
         otMkSt0zY/bBudXjj4hahIg6pOsSC9J3d2o4cFAR/vNwfsrJVf/Ey46F41vGO/zMgC34
         1kRJW0tt8JLIdiNZYG6e8rXgNZf53GD88APqTeeIG+3B/BoK3+SgUiaUwFblG77Afl64
         EHqEt0AlGA4QptPoyoHolxxTv6xTK/JiMdP75mssmHS90F83853fwxkLVhAHidXYPyX8
         opuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtJSviBLZBCymDog8OGBxwOA59Kfuza8hxqW26qJOgVvSJZcOL
	1oyHBpG2/LO0UqAsCvmIsY4=
X-Google-Smtp-Source: APXvYqxbfqY+gcgZq/9siSPCg9Bq7Q2UrjEoj/K5zvqYo6t6CRMfCMdksSb+Z3dEU9Xzxavyh7VkBQ==
X-Received: by 2002:a50:ba78:: with SMTP id 53mr30262314eds.6.1562776114324;
        Wed, 10 Jul 2019 09:28:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7345:: with SMTP id h5ls696901ejl.16.gmail; Wed, 10
 Jul 2019 09:28:33 -0700 (PDT)
X-Received: by 2002:a17:906:e2c2:: with SMTP id gr2mr27526643ejb.284.1562776113738;
        Wed, 10 Jul 2019 09:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562776113; cv=none;
        d=google.com; s=arc-20160816;
        b=nwlLhX7N/UySfNjgaSXyloAL5yFmWLUjPO9iL6Qzfe6GIZyd0271uF1WU2NN7I812v
         DHE4M4xgl7D8o9G0+pirH/+Jgl5iKLLOmPYQNCQouXRUxOyjaPFIqAqctb2ebA5jVl8A
         TwOoo1q/3TZ14mtQQf8yjHhzeFfpTqLu9TbWohU/d2C0Cgr589oDdmOO0dc/bTUbtct0
         r3aNypkIDmbJjpe0iElifCqpa9dlkdlLcjcOm740mhCtr90FqyNN6QHM6695naFc7GSa
         hVUmQtL1fClXSiWUtzoaR9gl0BizZGvSnX2PETJRSE6MuUXW4BrlsRygBIIqZ7BGQspi
         9exA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=31jMLWVo7I0+recM5PEYDpOJmeQlEDYQskB31tkgH78=;
        b=LesB2fAqCywePMVtOVyU9IPWW+wljfQHvQxdzu1ThtW+gGwsCiymEkbYSyjMECMeKT
         /9thhQDTBZWKZ1lm7KiRbOneGww0ANQ5c//2pfrruZWMpPB5SFcIf6MQxWZLN3cScthc
         uoTIxDYspiJEqJ4SqEbHSZRMi2yFiPP3QbrQxwTVgw35Nm374ZdkDYkFWjWwW375rR4Q
         V1a+OS7h82F5hlrX6BI7xSabLgT2zf4scCHj6nkYZqUHbkWhyZI45pXPIJgHo3oZo+ht
         D301YCjRuyKvtp3VYFuExcS5JoLqIWaDJoJhsNyvGFyJWo5WQdxRi7ZTyTsShIxQTNNu
         xkHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gVYpAhuq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k51si190588edd.0.2019.07.10.09.28.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 09:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45kPkn1fkVzyCR;
	Wed, 10 Jul 2019 18:28:33 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 10 Jul
 2019 18:28:33 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
 <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
Date: Wed, 10 Jul 2019 18:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gVYpAhuq;
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


On 7/10/19 6:13 PM, Jan Kiszka wrote:
>> Ok, there's one chance left: According to lspci, the device actually
>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>> convince Linux to switch to MSI.
> Latest kernel already?
> 

I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
upstream? Anyway, it's worth a try, let me test upstream...

At least for 4.19, it looks like I'm not able to easily switch to MSI.
At the moment, I don't even understand why the kernel actually uses
legacy interrupts, while MSI cap is present. Something is odd there, I'd
expect that MSI is, if available, the perefered method. But even the
root-cell after boot won't enable MSI. Still investigating...

I hope that I can switch to MSI with maybe a dirty hack, but I need more
time to dig through the kernel's PCI stack (PCI starts bugging me). You
can find things there you never wanted to know! :-)

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
