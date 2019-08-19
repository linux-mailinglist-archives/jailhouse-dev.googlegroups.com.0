Return-Path: <jailhouse-dev+bncBCB7D7MXMMINBMHL5ICRUBFDTJVCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B994B63
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 19:11:45 +0200 (CEST)
Received: by mail-pg1-x53c.google.com with SMTP id b18sf2959206pgg.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 10:11:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566234704; cv=pass;
        d=google.com; s=arc-20160816;
        b=ckkE7619wLw1Kjb3pHUGVBQ6kI8YHTkUDOy5BE3XdptiOHtyTxOZNo1cWW2WBGBF0T
         K/ZfYo/9y5SIQma4uGSEnJeHFf973bFDyxiNiLAck6jOIPjPTOEcVtAtHFUWn7napAFV
         sLrkrM/wfh7ihh5evonN6OVp6ouSV++lzaYMM+63EfhoyX/CCX3lXU+vp6krq9cSdUWt
         Ra9lBNW8aCYi4GPz892l3rthKmqr0VJmnZQRHXJ91bjiCQFX650fsMNkxVj6+bRlYoTU
         5z7g7nXCUOhdKcDsp82n+B+fuqYuJV9TZQBYkWLW54uUL3ZYq2edy5K72feAmzjA9gC8
         GQHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=6Yw4J1ak7H94QZsx5rVmlUu13m5P+exqVj9Wf6xvjTk=;
        b=nwU0gorhhSfwJu3M0QrdHzfysZiHb/yhmPQbSGIPzWUoB7Di+QIadWDd6N2ZrUpOol
         0Q9vsneYEp28Pq0jF4XvXPAg/wxBaIDgUUv+jfJJc+/CqK+vlFrXftJkFnMlEV0juDcM
         5T8JSN88PfF4M6f3HEq3fzqKwTWe1vrQz1kEiOmtvWiFI+bEe81PbrKgTU7IkE3C09Fy
         0dTq3/yjuesWc8nDQ98eKi6TxA/EN4e/9OLjOhfd28qkSpDHrknuv9StjRqz3n8FrMid
         ejcGPB0Qj98EnqixjjFJo7EWWeZeq62pUG76FhbTPg/G1t1Dgf+XUHPtMUElaXv+WS6C
         zegg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ihMdVVdc;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=6Yw4J1ak7H94QZsx5rVmlUu13m5P+exqVj9Wf6xvjTk=;
        b=RcyF33DYrP3H5ME1R7lTlKWTSnvcc5Dya4TbqkdTfUXFzoojg0QSE9wV8pYy7q3H3r
         BQdS4tnBNOp+SkKewK1sOpPs3VQCp8cKHnJ5ziWk6x4mnZMfPfjczrcDdYj8WvNmAIct
         lOiWvF7KrrT9dZJgx6KQC4kPez5JYTpI3YJFQnOZ5r6Hg8ORCvkOIOJXUNs0N+ElGZH4
         8HF3SZw9l2IXMiPTdOfhL1VczpMCXSmCmSt39miDvmAoNuYoPTvI4Tw3DhZGfIh+mk27
         kOIkER8lu3rwID9gfo9GtYdoHJiAPEiX/3XyVoKkH7KJU3x440dzKPFrfLLf91Qeu8TX
         ihNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6Yw4J1ak7H94QZsx5rVmlUu13m5P+exqVj9Wf6xvjTk=;
        b=o2byKreCVXyoHwjgNaRiweimj10brtXmgAm4aYpWwSgzUhgQzdCV2eS/fD+NS+pzT4
         smnMabljKvTaoTknnRZcf7bAhgyShrnhAF4nZ2sBnbfynP8IfBykbzBmqvT9dMGNT7R1
         wFqoTkaGW5vg/njbrl4Oe3OUtHyKT0X+geqc99GralecFjTkyvqD3Ry/jMSqeSe7G/Sd
         L3CyN+BP58nJIyLUavwZ/09g5fkzIHomHCTXcxS4NpASkrbvb3Lfu+tW4DqwbcDsixOi
         dlBZWdidTvRZfmF7FjIAxDnU+rEqhYLQp824xVN2SnRVoRlvbTJ51nA1p5CHlwXLHCF2
         bVCw==
X-Gm-Message-State: APjAAAWOr7WOgZcOGduNBfRkgdSRJUEINvDjcG4aDN0wCUiieJwKTsvx
	Cc/rOHHiLeFrPrXCvlN9Rb4=
X-Google-Smtp-Source: APXvYqzTKsEJN3dGTElHxQNrfu36P4x1dieE1lxAIJfkW0blSFWWAbnv+N+qHQCtwICPPr7PdqOcGQ==
X-Received: by 2002:a63:cc14:: with SMTP id x20mr21187458pgf.142.1566234704447;
        Mon, 19 Aug 2019 10:11:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:644a:: with SMTP id y71ls4115968pfb.3.gmail; Mon, 19 Aug
 2019 10:11:44 -0700 (PDT)
X-Received: by 2002:a63:534d:: with SMTP id t13mr5709918pgl.313.1566234704045;
        Mon, 19 Aug 2019 10:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566234704; cv=none;
        d=google.com; s=arc-20160816;
        b=VHLSG/AmuX0uds/084Bnnb04x9SRS5znxQ6vjuSVSdO9FppVN3ggHEGhfEVN2aQ18X
         nOt1uX6Ss/BhZtjrlwt/iYeKD4Sm1X02g7Z8hUcWjdO1S4hyVmfYI/mMJlFhw50/vLrk
         f0ejhp9c3Lgn2nmtEW5DXv3HC22YP/dfuQQM46aPtNRgz4TzVL+tsvHXXpPAJ+eskXuz
         i8rQUKu+uLQGtGla1IuvJAQizVG0xM8Ma4fkNzazwvijF/HmcKXtOZ14rhHrVfRVHxg4
         B2etgYA2ZGmWJOCtgzqxNw6BWn1kEEod7IcoX5RQRlM7RxeyAGr4N5mAb0jXeV2PPnYp
         7i3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=WSDL/ENT3v7aXI5k5WTZMNp/qZ82+aYP6k/VUr2I9hI=;
        b=tOrzdfTuyh/NqiowweVm4CWl3POvUiISdCx1d/HWleAykbmwyFJ5/L+QjXIbUOZGU2
         GqpiXxO6crPgRxJ8GZC7tNjawDVE+vTWIzfp7WiiJ85U87UCFPFX1k6eKxDEvg9uelW0
         lB1upHsPywBZdis8f2n71ivQqWl8i3QYqFQUoBJKJ5WIqtm604bjBPfyUaC2+XLXS3ul
         bvFrnqIGAGaenjwLnpp51iwYGEt/q4vSxjQpDrnP/TqZawiRf5bYNTvyJlaK8bh2iduc
         cJdFacP9llm1Bl1cueGKnxUihNrok1L25p6IZnhykI6a+4bKNT6zdG8flG1M1sXpyu5p
         s62g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ihMdVVdc;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id y6si527782pjv.2.2019.08.19.10.11.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 10:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JHBgdZ022861;
	Mon, 19 Aug 2019 12:11:43 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JHBgv2115743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 12:11:42 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 12:11:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 12:11:42 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JHBe3j071976;
	Mon, 19 Aug 2019 12:11:41 -0500
Subject: Re: [PATCH v2 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Jan Kiszka <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
 <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
 <d6ca6575-4173-b462-0123-23a93566a7f5@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <f05e09f3-9858-ea1b-fa29-aa9c6e8b99c9@ti.com>
Date: Mon, 19 Aug 2019 22:40:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d6ca6575-4173-b462-0123-23a93566a7f5@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ihMdVVdc;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 19/08/19 10:29 PM, Jan Kiszka wrote:
> On 19.08.19 18:50, Lokesh Vutla wrote:
>>
>>
>> On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
>>> Add the linux demo cell config for j721e-evm board.
>>> Also add the required device tree for booting Linux kernel
>>> in the inmate cell.
>>>
>>> This cell config acts as a reference for partitioning
>>> devices across the 2 Linux cells.
>>> This will be updated as support for more devices get added.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>> Changes from v1:
>>> * Split up the peripheral mem_region to match with kernel dts
>>> * Add GPU, multimedia decoder and display devices
>>
>> Upstream Linux doesn't support this node. Do not add un-used nodes.
> 
> Well, if it's real hardware that won't be moved around by Linux eventually
> supporting it, we can already include that.

Bindings are not finalized and not yet posted for review. Is it okay to add such
nodes in Jailhouse?

Thanks and regards,
Lokesh

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f05e09f3-9858-ea1b-fa29-aa9c6e8b99c9%40ti.com.
