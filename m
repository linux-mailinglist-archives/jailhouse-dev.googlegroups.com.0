Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3NH2SCQMGQEHYTEWOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E73965EA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 18:50:55 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id jx8-20020a17090b46c8b02901640d55b228sf182035pjb.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 09:50:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622479854; cv=pass;
        d=google.com; s=arc-20160816;
        b=OeMLr2i7X4DUi8k2jhAUQDfQV9gH1blQuf4f5xBPHidxX9+liF8brC1og5+OIdcMhd
         wOa4mU6NTLZ005w7tQZe7ZqXXygfJBEPXfHwBtbebs75gWlqgbgL8boZz7JZKb+HjuHH
         0B0ScEFSg3VPAizoCeS5UE+03NPUITQmwkW0DrloOP2cOjMyi3GPWTkpjrJic8bFt1GF
         WbKG33DLJfzZENQQEV4njwZIoDX1D78P2vdlwhTbPg3nSBWT04s9CP3wN/R9G78CSgvt
         H7IHjsdIqQS8/aNVzQmZDFC/D70o3U8QZtD457aaLIXqV9lQL/VKFaRISTEfIaTwRh2x
         2RdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=wJf8B7dKh6XgKVVKk3OeiK1FU6qggFnvwpe3MlT4nXU=;
        b=zkHnP1J0LWTpnoyDyOq4ucJfXFc57rUsC0Cqi4m9XKrjsJZ6poIMrM9UGtdqWNtR/x
         jOo7TekcChKBpZ33AUihi/PT8V+vMoCGf0oCAIAddPELOkJFv6ATripw+HiVwcUCmSjF
         UwWE6230znf/iBUaE/j+Po7XiP5O0QGXNl7FFWNmU+QGoxOMbsIdDslJef/SnUvYcHZQ
         ivuNURUflp++CEes7fF3O6LwUbZw8I6pUt2aZ0NWaJZ/pqo/syUyD9xe3RHEKA0mOm7K
         LWnIGbiRXkhTOjplMkOAi1ssjRy7L5s3cAFf5ABLJc5mkLY87RQGnaiKrqvixbUWBWZW
         Fp/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wJf8B7dKh6XgKVVKk3OeiK1FU6qggFnvwpe3MlT4nXU=;
        b=FVC4kHEC05acZ/EPro/XKrX7OZN5A79+dOi9aZe3PHildZhaVL0LoZuefqmP0yxkGb
         FI9sXVX4OjIPVqybjwhCj4h75vhT5xvr+DouobjesJzo/7zxoqerhF2qHiMXsjahBr9g
         qMvvz5h5W8nYICGkTVvo+L1t/FmxPVjpmTpoy5gIEqvhwJsVfHfnsrjyvn/oPshupojM
         KX/UJ7xSBI3De91/G/y9KqrXxQJArFFWJjDWdhzTOjZ94BErRu+GKHQq9nnwT2qlVEHa
         uIL64ThFHU3Bj/UqBqunOChuHsJbftNxYQjst/gjkMj0sA8SBCQIrKBBd87WPgWW6tAO
         PQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wJf8B7dKh6XgKVVKk3OeiK1FU6qggFnvwpe3MlT4nXU=;
        b=tUoz3PnbOPgoWZ3TME/04J2hC/vwrawmokCvhhfSBvA5PfrXXqNQV86jXeSmw2geCL
         5Ym1D3Lfvl0C09uQjwgiB6S5J98uVDZ65YW8qaOvSdJp5LKfvcNV3MIKPqSzHMWPXpSf
         o1EWvGOYvJPDVclJPOSe+NVJPjqBkmjqsY9xAEcXI5z8wg/a9XdVtMZx4LXKqRrEvH7u
         jT39WAWvw7Zq/3vlu5dZ0MkTtqa2yg/KS6vrfdJzr/o73J09awU64tEhLb/MfqctgIuY
         w1lBaB7EJweiY+0lXTn3tSC1R5bXNEXeKUP8wHQVnPxoNYxtvxLLvifbOGgWKyFt9drI
         ZPng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530rS8ij/TqZ1z7/AKBquV2E/5ABG/E/gnanhhKTJajhz5Z8P6ZA
	6UCzQXVguKgiha76OIBNG7I=
X-Google-Smtp-Source: ABdhPJwjpkp7t2q9tBz03/I0BWAScx7fCVw5gN6jb2Lk5iciL17RzOPJ498EM4koVPeC9dk5h7Xuhg==
X-Received: by 2002:a17:902:eb05:b029:fe:e0fa:e1f1 with SMTP id l5-20020a170902eb05b02900fee0fae1f1mr8650958plb.10.1622479853874;
        Mon, 31 May 2021 09:50:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:cd47:: with SMTP id a7ls7424625pgj.1.gmail; Mon, 31 May
 2021 09:50:53 -0700 (PDT)
X-Received: by 2002:aa7:8b44:0:b029:2dd:4cfc:7666 with SMTP id i4-20020aa78b440000b02902dd4cfc7666mr18009353pfd.73.1622479853266;
        Mon, 31 May 2021 09:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622479853; cv=none;
        d=google.com; s=arc-20160816;
        b=yrZ4bemvDquS8avKK1PYfVCXWTcLxSS4aIvkXwEmRB7FRy02EMR/yljbO9N99N6tdj
         DcJotvwe2uBDXd7mSvBO/2obL0Ht7joWEMSWEYNeJRNNS4wJFHeuQ3df0uT8++2EXFFn
         sfLuLyaCXRXywfZKAWO1JTcK+LZdeuCrvzIBTq1RITiA5k+ki7Nc2yBknIXetl1ZE9Lc
         KexX2Ap0nGNh+5A9gB5i+Dp0yr0RFhM1/oAwlnRd9cvmrJF4yzZ/tUERs0iCWf+1rUzT
         uW7IfGExKspOeCVFd19kdcATEULRKhb5qQ4bvQyFYCz71RMmog7tkwM+3AOq0kJ4psq0
         3AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=rVoiSmR2yc7+Zdzvxi9dzypB/iMaDGA2XrH+GvET5go=;
        b=I1PgK3mwBT4mG4hrSH9UVesn/TBWItxMVfnl9xjr/KL+viLHdcWoPiCfUXznazBXlx
         toOsfmly2nJJrMDlNPDHqqHL+O51nbzguWWwJH7VST6VM1gcWxkhe2cYlP+NX+rFKiHV
         CLyeTMC5vl2H/bIm1wH3dYleR3wcxff3MIPrAwbH8XhkHYN14bjbkoWQhMRZCdhu40Nj
         +MnH8pxjF+SinNAl9U43rIDVI97ofJ7VT6baf1YIXaED4s3SIV8SWs6LpwqdIc8I+ANm
         3PtE87J2PSGlYgnaBtmOFV9nNJIgYOUVAJLJC/q3a8TIAfcY29E5GWv4GYgT34nlsz2O
         k12Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p18si65413pjo.2.2021.05.31.09.50.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 09:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14VGooAt009702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 May 2021 18:50:51 +0200
Received: from [167.87.247.112] ([167.87.247.112])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14VGl81C029528;
	Mon, 31 May 2021 18:47:08 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
        Jan Kiszka <jan.kiszka@web.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
 <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
 <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
 <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1fb2994e-bc44-c9d6-1678-d574abaabbf4@siemens.com>
Date: Mon, 31 May 2021 18:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
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

On 30.05.21 13:30, Moustafa Noufale wrote:
> Hi Mr. Kiszka, 
>> To enable Jailhouse on the Coral board as well, you likely have three
>> options:
>> - ad-hoc compilation on the board, using their "Mendel Linux" (also
>>  Debian)
>> - integrating Jailhouse into Mendel Linux
>> - defining a new target "Coral dev board" in jailhouse-images, porting
>>  the integration from Mendel Linux over
> I have just got the Coral board and I think I would go with the first option. The planed workflow is:
> 1- duplicate imx8mm.c /imx8mm-inmate-demo.c/ imx8mm-linux-demo.c and edit it with the memory addresses in Coral Board, which is also using an imx8m.
> 2- compile jailhouse on the board.
> 3- insemod jailhouse and run.
> I am only asking, whether I am going in the right path.

Sounds reasonable. Problems can lie in the details, but those you will
only find when trying things out.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1fb2994e-bc44-c9d6-1678-d574abaabbf4%40siemens.com.
