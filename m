Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2F7YH2QKGQEVOEBB6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE131C4602
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:33:12 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id u11sf450377wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:33:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588617192; cv=pass;
        d=google.com; s=arc-20160816;
        b=roaE4y4LqMe1wMaDzRmeB9oPK9UeJLeEeKvMfrGpTxLgptl+jPbo8BFL92Eaup+Lgc
         YRVgcg8LZPtivFn8u0ICV6hu8J6lANfWP8Q/uUokfD29jZRaMIho0J8fg3BzrlfDVKlo
         p24YSJ1LCAr5axdZWXq+wm8/wYVKAW60nSFpCanQ3RHPJeGJ/VT12gT7IRUumTJrUu2q
         Dnp+eTl6p1Rdmm75DtHy6sax5DWuGgyD7A8YOHt6mHrspLC1a1rHwn2dPj9Kjk6o4w45
         zxNDNZoD7oBwxil6IGlc5oEWCQWd3HXQGdzw8SkWjGpCT3MFV9yvA9u/pkbQ0IHaFVEW
         kEug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=5HFfrXR2sYU1CWTWedC2Qyf12UWMc57TxMqAY1f/zaA=;
        b=MDw6XX8iLviO3p1dRZ7f3jnGXuBdiRLjVGRsls09Znna3cyLY1RuN8RCR4gr14dxGS
         UBW8JeHdRhLzuoaLG14OkNQeQC4mK7gsOmcrZxsRkXb1rUb+ZSKxQrzofyKWSn5qqkEO
         U/F2QtE7YSe5PsJwlWZJ06QJfmhAAMXG0hy1O9r0dE5HXmHPkCGTudAIwjGnM5ZphKFj
         4t3qVDD/NoOWRaqB7aNIdDxIdb8pS2gUe0X+Q3L06f37Tqdvi5iImHbZfW6HiQpWHkJT
         Nh/1c0fWSsg6rJTqKs4RE8zrRRWTc3ABk9Nsp1R3BadlACFw7TrK/YN26BvsXXzF2a4C
         cfmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5HFfrXR2sYU1CWTWedC2Qyf12UWMc57TxMqAY1f/zaA=;
        b=iPvqQmQVMSkBo2iqOtgz4qWW+mulPoiAcuGkyi6ok73NFTNkOaETXadNCea3pcNVkd
         Stz3GYtHz+h6Z18l1G6tveF3bRxFo+/BbVGDwKlKti984XHkJONxkezdmv7oMglsYUTp
         ijTDjjtZn/ODAqJILTYo02VE6zUHqKWOHh3o/MvSw0WDsXlpsRrEKCouSImtIjjDo4Bn
         uk0dsUcofiAf8RpBOs/OfBQT2f0rIy/8An/liNP415pJjK04+EvEbwTG45jxSOtzMmV9
         zQ39BvySN5mn+hVaULX9neF4ABJh3Jo5ViifTwF8ykGDnOY0GRfFIJ5qq89DK68JFDkH
         dBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5HFfrXR2sYU1CWTWedC2Qyf12UWMc57TxMqAY1f/zaA=;
        b=tYvjwzJOEuyYqLEEOOJUiCdFPKj87lgtinqPh/hXUYE2HapevNEs4xV9pWPc1iuAVv
         qyW8OlIP7wH1M6zHDQMPdcD0XhjG5Z18zwPP22Zky9WWYSA9TqDlGhEQ9k1zmR6ZukOk
         dDacWoftLRlQYJ2CZEh1NgEGvuwUCI3FxeJYwupGNBYpDHFf6yiwtO+nWfX6elqj7uFF
         4eyyuNxdu9ZrD8LOl391KuJiScAORHVGJUuvMPY3ECIjPLgJ6+pxPrmweAaN3d83a5hY
         cNakGYIe2le5d9Dk5qEeaMfkxCNhXDpo+A6MIwkdlTSvVBtqTYIH+nyS1VdXEqZL099T
         65Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYmTSgVnQTW7WuQukJVoR39txQOOc48ZFxC8U8o5jGkIH20QkdD
	gbG8vaPmwJPiXSovoBqKliA=
X-Google-Smtp-Source: APiQypI5331hYGx31sc9pKK9Ko3JMvc8kgCtkONvvjrU9007Of4V2YREq4sSgAlG5IgJQ64QHU4RCA==
X-Received: by 2002:a1c:8141:: with SMTP id c62mr15961710wmd.87.1588617192215;
        Mon, 04 May 2020 11:33:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:11d0:: with SMTP id i16ls1222759wrx.10.gmail; Mon,
 04 May 2020 11:33:11 -0700 (PDT)
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr424917wrn.193.1588617191388;
        Mon, 04 May 2020 11:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588617191; cv=none;
        d=google.com; s=arc-20160816;
        b=AwkGF+qdXSlMONIFD+FN3vL8NO0JMNlUQB2CYalyHGEMPEzsutak5bcPqcoR3kzQgW
         KUhABLC2roH6UkLTCSrWUGofb52JBrKcQwNKQgNCdrIe/wztoH7BUHnrx+ikmoYGFOgX
         zuBDfPZ4pUzv4gozLO6KjFsZ4vLnALXU35yOQ6xvZfDslYBilHGYtmdskcglS5B5Mjky
         EhZxawz0y0h0k/4jEg4KmqfnkPkWCn6u1fEJKfHK/Im64A3BQa4f8BY78uV1RuS7gvUf
         zvNBsUbvj168eOwthzfK8bDRtFowo9v+GXYelQEhxt7knoQwXJaKV5ETcs/ecgVCPYg7
         3Mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+r/fntX2jVSVQf5hWrVSjYJRi4HrkyW8KlZzmE+3Ve0=;
        b=0Gq59qYXUs60MM4I42yQz7AU7caLhl8ckXpnHEj8DGnNGfJoiuHM/FcZeeszgQzDoS
         RDwCASCkV0ihrAOprkUQi9czsN8AnpRLvIvlPbA/zaMm4rdVQ4FtWfmP1Vp9WEF1+SF6
         VFRSfNdAcK8YaOSlfMS9lnHTfGtCohZg7WmAtYbA9vHhj0LY0ZH2OR0lFeJWZpcsrHwm
         1p4yeq0ADf9qbNCNa3eRdccNWeYRbKWSvacNvYPyQ44Dp7qpdQWdITJPL7hYbzs7anbG
         b26+KR6DJD1CpDpu7/214PDAixV+9WQc14HTRPOtM6m2fMkW4RTNaI/QgpcdIfoMNNS8
         lGrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q18si322063wrc.3.2020.05.04.11.33.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 044IXALe025769
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:33:10 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IX8Zu017419;
	Mon, 4 May 2020 20:33:09 +0200
Subject: Re: [PATCH v2 3/9] driver: introduce col_load_address for colored
 binaries loading
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
        Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-4-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
Date: Mon, 4 May 2020 20:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-4-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Currently Jailhouse loads inmate's binaries by mapping its memory region
> to the root cell. When coloring is enabled this operation becomes
> not trivial. To avoid logic duplication in the driver module,
> use a special memory space when loading to colored regions. This
> convenient memory space starts from a fixed address defined by
> `col_loads_address` and will be mapped by the hypervisor using the same
> size and coloring configuration as the inmate.
> Since there could be platforms with different memory space layouts, the
> choice of `col_loads_address` has to be done accordingly.
> Allow the user to set this value in the root-cell configuration and set
> the default to 16 GiB. The latter has been empirically choosen as default
> value.

This is better than the hypercall in v1, but I still dislike the 
approach for the complexity growth in the hypervisor.

I see the point that some logic - namely the strip width calculation - 
would have to be duplicated into the Linux driver, but it feels to me 
that this would be a better alternative overall. Did you think through 
or even try such an approach at all?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c0710d88-a53b-c17e-8c1d-6615b9b8bf09%40siemens.com.
