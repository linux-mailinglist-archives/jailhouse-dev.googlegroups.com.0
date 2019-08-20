Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBFPJ53VAKGQEKZ5GE7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id E507395A55
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 10:51:34 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id k70sf3628263otk.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 01:51:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566291093; cv=pass;
        d=google.com; s=arc-20160816;
        b=FbirlahmRq3DVB4CG+NZhBToH5oD/vhqQJU151xYHObZ4NNGLQa2pj2ok6AYwWNoiG
         13ST/Be4RwOKpNuj2u77bwI4arxqYHaouA3goOfPdMgAOGrrxynOA6RSBvEP60h5yFEh
         11dZz69AcDe78UXHTSymlB1QpX6n8lMDy/XFHHmNJVv4u9UDkORmIP64f6niLd+v9imt
         qR+1rN69SVMI7p/1y8nysZ/KehsmmZmeXOfOpHaKOJ7PWqcCF31bTcKSPDjRqEBgdhGA
         UE9ct6lNsm9eUG6WGAi41tTuCuggHKGLcSUTAwyZRZWLPRuGck0oRMUFqsYiFD5164Da
         r4DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=CzLjTQhXIcvKZMhBfrJViI5KO3ZQ/W3jvekzQx37rjU=;
        b=IdJl6KkGQRSUEmxAn7l+RjDvHY48D2O3gXq5uLGi/NYjhdkPYQh/73DRpzArrWOrSY
         0A7WLHKQF+UsoOX1meGuWP9xeyysD+XtsaQPE/gX82oQKwB7g/RSBRHPjwpBXDZCXIIT
         6GZgNQD4xU58sWoSWnYWrWKodnBx8EyP5ZJWwXRalzh7r+nGT6ZW5Dt5i5iMDvata7k/
         M6JEnp51mFPMoI6rlVflg4Vv3y60x+OPfxvhmxTpB1qSda+IBPPIwZTjdYThnWM5IDy8
         w4BLhgu49lPFFvbe3CC7rimMICkI7wkJ0kQL6pGTa/TMXiMCRtv0MR9AIfeyjvrBymBe
         +W1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W6VQE538;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=CzLjTQhXIcvKZMhBfrJViI5KO3ZQ/W3jvekzQx37rjU=;
        b=ZPhJYfykJ1SIaJip4kpI2v7PHEnWbYMgrFz1gFm5akxx6ihrexIbRTlRIrf3PqA7im
         goA+VrkTCRu+EY50QjDg49a3dRO93wF01bzB3aRlGpcg6rbXAxtX38hh+5MMMtH+7c/O
         7jpo6B/4j49+P+xnxLZy6+fYO6jwSZ4DklEPAhxZmWyHK3sTaJgaJeXnUOPFiXNb6sDY
         FTQQkn41K5XnS0pfp339d0/JvIYBJYBtD4IdK7Wg2dRTGWTxy+HOQvtKWS5PxnXWjo5w
         R/2OnAftRGiCpO22NTxF2XFk7GkYiRyp1BsdY3TB8p4l+6MAbftxF8VU/q4cQ8fpXimA
         KdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CzLjTQhXIcvKZMhBfrJViI5KO3ZQ/W3jvekzQx37rjU=;
        b=NkLdmoBHm747LiK6ceVXOPYemQYpa6C1vExj6hrCjhTQUhVpp2oUH6sIm8VsY9wV/B
         WoC0mholeEdMSk2JAxN51oH/fVcua1fGrPjqVsoGAb6Mhmri+SwKp2SnNcOQglw8yW3D
         2S8R0UN0NvbwQ2xSPxV+v0PzMgGtXkTuabbELsFxcLcC/I6o4j4XNBBKjtbvNauw8P5l
         DQEOPkWi5+jSkLM9KgRSqinrm9290pl/P8MrIgsaT/SH4yVhgJdo2OaYDBid81cAGC7A
         eKAKaMx3f6dv3Ll6625HwFf598Liq/jDK+7FZLaZD5BCK8iQmUQCtfLDbX+MO7CWkPzh
         0XEg==
X-Gm-Message-State: APjAAAVJXNBo7mKAbJy9vk0Cfk1Tjk/bagzgCUIJi9Q/IWj2zStH4lYm
	PChJfuZeGfopehL6/aVOkEc=
X-Google-Smtp-Source: APXvYqwt0UXCXaLKBNxcSWPg3GIwuc6QlwdQPuWIXop2hcCs9YDerTgdizs2AaeB/AXk4NgG7HDQqA==
X-Received: by 2002:aca:c50a:: with SMTP id v10mr17043543oif.174.1566291093322;
        Tue, 20 Aug 2019 01:51:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4d14:: with SMTP id a20ls2223283oib.0.gmail; Tue, 20 Aug
 2019 01:51:32 -0700 (PDT)
X-Received: by 2002:a05:6808:52:: with SMTP id v18mr16127280oic.35.1566291092879;
        Tue, 20 Aug 2019 01:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566291092; cv=none;
        d=google.com; s=arc-20160816;
        b=LWOKxfWzd3HWFgx0SeIE+Ba2wQtAZZcR5EpgKoqTVzm5KIf7iilmnjTQVI7Krl/R+S
         OgojaHIkWQLhmEw3pz1yoQ8X51XTB61jasQKl3aDQsCL5l7VVsZfWEytam0xVqHBfXKi
         9Z3YbzM6RMgPgBWkjEv3DGqJ6unvOn90s0/oTgMJPJU5y0PDgnQs3gxaEKzJGwWjFjqh
         e2yQ/AGirTL/XN8bycjm+Wyn31ccGahS1vVbmhx7+I7+s4x6i4kmb4mCVe71wOvzAzRW
         +hMrrylk1E07Ye8Qb8wLDiIlaVoGZFs9Ujam2swpWDMt499gIp0LAYfXvAsdkMfDeRod
         pegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ufFAX+6Zt7T7VU/0zb6PDH87TITy1gBEnIcjGUhAeYQ=;
        b=G1yl4SjXXqI/3MscJ3TzRrv/MbBzrHN0fe1pnDhYa+E5yDlV2uDDwtPPAOeUEXxHm9
         Bjm8/17PorxN1fjzTJ2QWnYbMlLEDFedgn8ugLOwaEuEmsfev0Z9tuQSW+ftT1QsjIIv
         DYxPuS0XqnzF6KQs2hkWX4XyHLOVxbYuxL9D+lNioBglM4Z9hlHh5EzcXB9sOd1IKAeD
         FZQNIgIJz9EjhBJR/uHJhkdUXAKYE1K6obF2qwjywj8cRaBKgkQeUGHdcXgzGKHZuB0j
         utAj9lZrpfq98bcQW4ROt7SAloP/ngg5dOyD+6rgF77TpAgfl8cteV5Cems/6q4ud0Iv
         wnJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W6VQE538;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id d123si613978oig.5.2019.08.20.01.51.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 01:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7K8pWpF026970;
	Tue, 20 Aug 2019 03:51:32 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7K8pWsM018071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2019 03:51:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 03:51:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 03:51:32 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7K8pUvU090428;
	Tue, 20 Aug 2019 03:51:30 -0500
Subject: Re: [PATCH v2 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Jan Kiszka <jan.kiszka@siemens.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
 <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
 <d6ca6575-4173-b462-0123-23a93566a7f5@siemens.com>
 <f05e09f3-9858-ea1b-fa29-aa9c6e8b99c9@ti.com>
 <d43f7fd8-8484-53b2-661c-8cf267f91917@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <200f2f25-0ee3-5127-c2f2-39fa9aa97e2f@ti.com>
Date: Tue, 20 Aug 2019 14:21:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d43f7fd8-8484-53b2-661c-8cf267f91917@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=W6VQE538;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <a0132237@ti.com>
Reply-To: Nikhil Devshatwar <a0132237@ti.com>
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

On 19/08/19 10:43 PM, Jan Kiszka wrote:
> On 19.08.19 19:10, Lokesh Vutla wrote:
>>
>>
>> On 19/08/19 10:29 PM, Jan Kiszka wrote:
>>> On 19.08.19 18:50, Lokesh Vutla wrote:
>>>>
>>>>
>>>> On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
>>>>> Add the linux demo cell config for j721e-evm board.
>>>>> Also add the required device tree for booting Linux kernel
>>>>> in the inmate cell.
>>>>>
>>>>> This cell config acts as a reference for partitioning
>>>>> devices across the 2 Linux cells.
>>>>> This will be updated as support for more devices get added.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>>> ---
>>>>> Changes from v1:
>>>>> * Split up the peripheral mem_region to match with kernel dts
>>>>> * Add GPU, multimedia decoder and display devices
>>>>
>>>> Upstream Linux doesn't support this node. Do not add un-used nodes.
>>>
>>> Well, if it's real hardware that won't be moved around by Linux eventually
>>> supporting it, we can already include that.
>>
>> Bindings are not finalized and not yet posted for review. Is it okay to add such
>> nodes in Jailhouse?
>>
> 
> Ah, dt bindings - I thought this was about Jailhouse configs only. I agree that it makes no sense to have unstable bindings in our inmate dts.


Got it, I will update in v3

Nikhil D

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/200f2f25-0ee3-5127-c2f2-39fa9aa97e2f%40ti.com.
