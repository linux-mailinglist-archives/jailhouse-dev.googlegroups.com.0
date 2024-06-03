Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBSES62ZAMGQE3CMUXRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3C8D7E36
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 11:13:46 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id 38308e7fff4ca-2eaa77740desf11065731fa.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 02:13:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1717406026; cv=pass;
        d=google.com; s=arc-20160816;
        b=BifRKw1AEvs1n8zsQXwz7eoYb3wWzxOsnvM+A2FttWcbwCsZ8lxbLn2pobGKzso3/G
         fVpeTKx7axlvveIcAcAuIDpuKCEXddPdbM03LvrSJz7ceDIHgKU0jocSd89RCOltDUDG
         LT5oT+GeF5CKBftLHpO2+9ymFyq6euCUvRXc2yI2OWHZSbHqaDlTe51kKgAyb4O5Z3B4
         s2mm96SIbEnfcerEKcFbAdIWfCTGFRFZTrIewFEdWI/LmdrtviYKC1eaEUtqs1BQY43k
         HP9JA9h5lepIVaKssmBjdxK1uUUBtCFzGYjYE0tCWoQC45yCY/ejo4iAyHc1n1QOD7DL
         /Q6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=BKAH0AmHsGOyfOsC2z/nhjE0+4xsdejZljS2u6DaP/Y=;
        fh=9p4168KMI5FfF0EMCa4KkgFAjt+FwNuERSjnHt9t76s=;
        b=DFJ43zwtY+vO1Yd6pi46YwTARUQYQZxtnv1bxbWmTr0O3Y+OwaqFGvb07Lohs+0PPi
         YA8ScjI7564qa4x5nnMbdZ7nCbIwGc6qI5tJ9fxgnY8JeB4M6s4c1w851VSWKdv3um/h
         VmSuDVuhJvmGOuV7L4zRisSbfKGhd+Os1i/BNqmh4M+W7sJu2b+xYWsrlciT7VO6Lwmj
         Ftnw/XJX93nLJRape3ztfwU8tolsrr0YRjocyhUmjcuopEjVN1FbnXcBWZKNgXhM0a3G
         9dy9qkEJxSMf1R2igmRtnzZGF8rBT/lodxR6ox52d1b/tHtt8K5MEbZJAh3Rbp1mDK79
         +xqw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oEEofF85;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717406026; x=1718010826; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-language:from:references:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKAH0AmHsGOyfOsC2z/nhjE0+4xsdejZljS2u6DaP/Y=;
        b=wtdUDUXe3FzvS+3uCzW1TgvUELgxpf2umUboNfxqcv40jY+RRtrULACXKC1C7v5LSQ
         w7TQ/ADPE+1g6c8TVkbrr1Jry4jTpz/2rFUpO7rRLy1g+ckn8waAytta+Clm/oDx+Fjv
         O7IDkkSjO1GuLlHcKMBT5X082EnwLBCcOdpNi5B9H/yJKGShxZcw+wQh2zZQn5ysyIWK
         VQCuGq8YXpFQdYxkzYvPZtQ5kSfhMOAXY+rN0uJUl/KBEdXrO4jgr2WqI7U/sA82N0XY
         xGg59GxTRtMxuWHoOXEasHjdlAdIYfTlL58JhYdxlo2HNUkkMxd18bSLUEIS2cvOAzUG
         Nafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717406026; x=1718010826;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKAH0AmHsGOyfOsC2z/nhjE0+4xsdejZljS2u6DaP/Y=;
        b=Pu33b7JI7lEm71CapNHec5rYpVlGeB+Bfpl+gCrykTAtMTrpqEw81zIADOwNWoyGeO
         Q8MEc2LH38ZASf2kMr7igoJhkNAQyoZ0Ol1v+EkqUxnHnJrXu5MiUt0c0Fow4JY3LRGS
         wVP2Uq2xkGze44S0eHQYWQIle+JpFeFGPTtHD9LpF5WOkvtER1wMHbjoNSQ9VczcxBkI
         oaWXeoFEowWaZrqcegh4HFU4tp/BV2Av3E+Jxv/v6jYio40jmZLIfzMrQ4x6sces0ZxH
         nb5pYw94dJC0RvG+AChtm3T53vdr6f8cXEhfebyBvSY0Hqa9+92blgqzX8xKlj8OaFhp
         ogew==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCXy7z6RQFS9ygNMfh+FbTEV5H3JHL1apW86ZLI1Rv8ybbR+cMeQap+4atba+VSpkI3ynih2H/DKu3MUUBSeTR61HZSJfXdE3EJP4z8=
X-Gm-Message-State: AOJu0YzD6PyOO8eQrjhT3gq7IIt0QT69vjCxwlocCtdIhPOUMLrddnMo
	1QTNNiXOK/gaP54sMQUrpwWAbx8gX9uCZ0ie1c5zuTZdShRQt+L9
X-Google-Smtp-Source: AGHT+IGt4WLlWvQfCOL/aufXnEENpWH1vm/j4nU7InPsnyVaz8MoNzL6LbWN5OJwDasLuRf+HQ3EHg==
X-Received: by 2002:a2e:b5a9:0:b0:2de:7046:b8f8 with SMTP id 38308e7fff4ca-2ea950b55f5mr55025191fa.5.1717406025809;
        Mon, 03 Jun 2024 02:13:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:102c:b0:2ea:9e06:e4aa with SMTP id
 38308e7fff4ca-2ea9e06e594ls8415031fa.0.-pod-prod-03-eu; Mon, 03 Jun 2024
 02:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWw++EhkQt9WOaE/vSd3bBBX1Ak2evf7vfZo4f1j9fUyQ3RyAYjd8LWQJGZVGIv30jZWvqROV+E90mSawtV9M/PZ52IaPXGzgw494UX3M=
X-Received: by 2002:a2e:920e:0:b0:2e9:4a5b:b6c2 with SMTP id 38308e7fff4ca-2ea9519b62emr59405231fa.41.1717406022218;
        Mon, 03 Jun 2024 02:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717406022; cv=none;
        d=google.com; s=arc-20160816;
        b=xGUB/nBYrRhYJU7h2BMmFgX5xJMfeq9013ZvwDHueGROZFytRPUumtdlThMYDK6Dd+
         y4PbR8q14XewPCXVU7Odj3YUs4Q+T2nXezl+fo272i72gtH1mGQp4rc3MU8UsaLGr1jl
         Mj7K7eEyEI4N+xwE9zZjckxNALowr1h0EIHpQCPDywgutTNZCMHs5T1VtA6/L7jrFk7F
         S9J23RQVLR+Cw+drLMsKM/kFaU8KPX3WaP4ipCGSdhprwK52z2VqZYtz//Lzzk1lpCB1
         QJdwUM+PCLGk3nCloACH4uQINqZL56FedPPxwN2O5ewU6xlZ+kJwyxPD07lKy5K+V6By
         KU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k4VLG+QObAFMGeEhwAa5O9Y7y2k4lI6CMEqpRMsnzfc=;
        fh=TIW4S0OzxcvW6HVqVfKWAMrwpiVuv27XCTRpHKYt82w=;
        b=vLlGhTN1RtCV8NFslTOwzFs3vaiSjg2yT872dP/IcQld5+n/sN+dS8zplezmuSpees
         8ExVKStQdM8cR7z+/wRtC3q1Y14YSjBxtwf6N49sIVO+3YZQWP3ZJkz49VYPzOAqyPVW
         tVfKWDjQyx894aKs32oc29DnfVZ0utibtxkmLaWa0aSv/+LWB7MKhmgVUzUE8VVXFd+O
         d5OFT4e3onGM8RIbXpEovQZawwKSttfIV4UVEbK2PuMdmRmf94HN+VXLRpZW1Gqyu3pj
         fxay3HOHBJQKeN/atpYuSsGcr2R/WkgsvIZ6RoIe4F5JRrIzoregNYfttACx4UR4GNPQ
         UBhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oEEofF85;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id 5b1f17b1804b1-4214167a670si79875e9.0.2024.06.03.02.13.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id EA41A2E01BA;
	Mon,  3 Jun 2024 11:13:40 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Vt7Lr4nNpzy5y;
	Mon,  3 Jun 2024 11:13:40 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Jun
 2024 11:13:40 +0200
Message-ID: <d0b5f0bc-4209-4e06-b8af-e12471f7c9a7@oth-regensburg.de>
Date: Mon, 3 Jun 2024 11:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] README: drop IRC
To: Josh Soref <jsoref@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <20240527202523.86372-1-jsoref@gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <20240527202523.86372-1-jsoref@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oEEofF85;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
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



On 27/05/2024 22:25, Josh Soref wrote:
> From: Josh Soref <2119212+jsoref@users.noreply.github.com>
> 
> As noted in 2022 on the ML, irc has not been active:
> https://groups.google.com/g/jailhouse-dev/c/qhWeA5n2TWo/m/oiShgDinAQAJ
> 
> Neither Freenode nor Libera appear to have a live #jailhouse channel
> 
> Signed-off-by: Josh Soref <2119212+jsoref@users.noreply.github.com>

Acked-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks,
   Ralf

> ---
>   README.md | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/README.md b/README.md
> index dc2c3af..ad7aa76 100644
> --- a/README.md
> +++ b/README.md
> @@ -43,10 +43,6 @@ Frequently Asked Questions (FAQ):
>   
>    - See [FAQ file](FAQ.md)
>   
> -IRC channel:
> -  - Freenode, irc.freenode.net, #jailhouse
> -  - [![Webchat](https://img.shields.io/badge/irc-freenode-blue.svg "IRC Freenode")](https://webchat.freenode.net/?channels=jailhouse)
> -
>   Mailing list:
>   
>     - jailhouse-dev@googlegroups.com

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0b5f0bc-4209-4e06-b8af-e12471f7c9a7%40oth-regensburg.de.
