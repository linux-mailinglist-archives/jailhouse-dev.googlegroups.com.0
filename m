Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB24UT2CQMGQEKB5KC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BAB38C48E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:24:44 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id w8-20020a05651c1028b02900f6e4f47184sf4916218ljm.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:24:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621592684; cv=pass;
        d=google.com; s=arc-20160816;
        b=XnCaexrY8uDzJQvTJl4NSi7L/ibptWXCKk1zlz40vtVpDQXB9Z1TXKhwjLunP4C5di
         A6+JObtpa37oRmYnxXsqLTwZHpm9d4+MiQ8krr78iEI9ffH0Pf6G238c4AYfFMlxsEOr
         2zKlsbP5yXuyQkOJYJX43aXo0byszyJr+n07mxsi88wJySvaC4KqWy9TrDCVAwvTc/Ol
         ZMa4a4VYwpQq/F+ZmQqlveL8/Lz0Sh6RMrmZMH54JMkJ2grETAGu6dzx3PwPp/no1V9O
         ntDnv3Z6+uSoMX1ke6OAfBlEb6ATsCIN2mKkzWA7PKTAldqdJ9p/K2JoC37KWTFLAVHU
         q/aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Df5qlqv+/YLrPaFWz9bZIQoBuHHiojxAQXq6EXTM7LQ=;
        b=o3KAbMevmiLI3DQALQ9oNUJe2ueNCwakfDSu17iJl589mQW0RLrwM3ECwUEaWaQVGk
         w6LHHr9M3UcHdkSEd/hQhV0TSRVO9TZmHQjxaDVNOvtsLEpx28O+RR6T0oCrgxFgysAS
         T0DJFWD8p2d4a7KQFQrxjh47fE35UoMa7tV/h/jBuu9shEPeQ16fuin39YvBl/14HEwo
         7mb+rvdMvOnLmj8FYuRd1EFIfvT/0vDhPS3ckbfr3IsM4gccU1wQkX7pPqGVulylKW9X
         dt4nhiqTdJqsYeLLjaciCkI8PCUkym8M0CA5b63L43jDluNrY+BzI388A3cRfpHoY8oS
         krYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Df5qlqv+/YLrPaFWz9bZIQoBuHHiojxAQXq6EXTM7LQ=;
        b=SxdkC4Rbtp+skeIkNr++tE3QepzcbiMFgg3Njms3J5xuzRiizioHR5FsG7+2TD3HpR
         m7nX9QOPsU4TSN9mbGpOpoyj5yFmZP/UMpfzFraGEHElwSjrbw7nW1WWBHfVXw/kYbbq
         T6b1eoPyOkSAo6eYtmxyW4TJ+5bLEveJb27xJMnducQBin9Imhd1vqjQ02FfC3tlTCPZ
         IuqC7ztj6qsGhVSs3H+WjWe0aAlnjAElI/+s526vg3o3sFdl1cuytoYwP5lFGv0R7/Ye
         G1Sh0haa8rzdRxjc0VXvtFb5ieKAu7RXDYyfZR+q8M35v2NQZihCLGwtwqzv6HZadPGN
         m3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Df5qlqv+/YLrPaFWz9bZIQoBuHHiojxAQXq6EXTM7LQ=;
        b=tC4cY7KgG7H23fG8wT7Tm3EfThFwts20SmGMY0pnIkXDU6wVfAmNcmgnrsF1C7OYmk
         IA3yf+Ul2mChLmDOTexctR26mBgZYyVJTi5ol0Q2hA5qmCwgfI6JDyhfUKsaFuyhEV+F
         2sJEKH6tmV9Q2gq7ER+AHXfaIhLQPEX+QI07R0rFHSvur7/UTand+L5AzM52GHRn42G0
         PkCDJ1ylgDOmiDwdpK+1Ff7L1EY4PDVeyvS0QYsBegyRzIfMDrp3tmLVi0Siv7GuVZb6
         Q/0uoPIdb7tjgUU37rYSHoaMsLY4xoGBhl54rgylli8qDiQXDKzcVyokYGWv4/pfsDc8
         ct3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533demMXi0xr4OxE2c4Mecc8Po8ZGLI2EyLoqyyCa81arY+ETnNK
	RgBFYBbaHWgcLU+8ole8eMM=
X-Google-Smtp-Source: ABdhPJxlBGqjXpRG+mJquvkJ2ErmfVaiGoEAnEpmqu9hh4/A5wKd7vp7FCG3/mSUTvjRTeHz0t0Z6g==
X-Received: by 2002:a05:6512:20d9:: with SMTP id u25mr1673948lfr.452.1621592684045;
        Fri, 21 May 2021 03:24:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a371:: with SMTP id i17ls1126816ljn.11.gmail; Fri, 21
 May 2021 03:24:42 -0700 (PDT)
X-Received: by 2002:a2e:8417:: with SMTP id z23mr6558710ljg.487.1621592682803;
        Fri, 21 May 2021 03:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621592682; cv=none;
        d=google.com; s=arc-20160816;
        b=z+w++32B1K7nUf1blHGYMKy5Zlt1JCJvzly7UeV8fKk7GN6UHZmlZs82i85dl9Hb6e
         LaG+j7APvvo98E8N4Zkrb7MTdYl20QWouf7JFizgcy0O61TmwMXmnVtzth4ol96UfNiB
         kAx7YkKKI1cbC5OJqHVe5VVdGXjHI/Vci6L8w7a4mQ94oI87IYEQysCcbS2OQMDKxCn1
         0AOy4iyn1OJuOrkQa7Tv5GWGIbTY3+ylKvqc/+b99LnYJjDzpgZO8btWQ4cFG8L3QdSb
         8lHFNqST3PejSap3QG25HS0hOE+PQD45RTnyV422Ry1drGmsxgNzN0uMYxwmmub7hose
         JlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k0VOPPIUYv6lD03U5/Lw+/Igli223dQ6yWwEEnr1VEk=;
        b=SqSWLa8HLkZmbtW8whSN1j3TdThVD2s1O+DX/GUY081wnf7M58GKofLsfgh5meH3jC
         2uqppLCQY5vRLcSJLAre81+x3qYsRtnFcUr2M174BDRgYFbRMKjMcS12NA/DtRMIFY1+
         WIfMXbnA8D2w3JlFvhTlotSVlrxEiy+PJaJsbcqs6eHQYvRA8NV2ewhO2rto37K6xnJ8
         v0NSEJ+BQvLU7IS90fTx6uErPbJIDBhGAIeowqQv9W21UgSSntZm7LXIHs5B9+7CpGCZ
         qjWidGOrZXBwnAE4h/GdZWNhvyf0TcliLE505HX2iCSAqtJBzWRpO0a5vXS4STmYH7US
         ks+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o13si283654ljp.0.2021.05.21.03.24.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAOgxh006055
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:24:42 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAOf2E021691;
	Fri, 21 May 2021 12:24:41 +0200
Subject: Re: [PATCH 0/4] Support building and running on Debian 11
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <530859be-1601-18a5-ce17-08e2bee97684@siemens.com>
Date: Fri, 21 May 2021 12:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 21.05.21 10:02, Florian Bezdeka wrote:
> Hi!
> 
> This are the necessary changes for building and running Jailhouse on a
> Debian 11 system. As Debian 11 will no longer support Python 2, most of
> the changes are related to the Python2 -> Python3 migration.
> 

Thanks, valuable step forward.

Some surther conversion / cleanup points /wrt python2:
- scripts/arm64-parsedump.py (probably not run in 5 years now...)
- "from __future__ import print_function"
- ExtendedEnum (as Ralf already mentioned)
- CONTRIBUTING.md still mandates python 2

Jan

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
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/530859be-1601-18a5-ce17-08e2bee97684%40siemens.com.
