Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGWQXPYQKGQERXB4XSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692514A53A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:39:39 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id z7sf931033wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:39:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132379; cv=pass;
        d=google.com; s=arc-20160816;
        b=x4BAi4Bb0irOcUoiQ/ZtzNt+MWTyzeBV+rDN6xTnCXGHNYFhLalhXNkpg2DEJXWTjU
         lCW18m7rD+TQ66AWpVA/twxBEg6o+JdCe81oMCElH7+pCJEPl6GtHyNhmJC6bbrYU2NT
         hbCvQLsm30KB7LEm78Xsr96kEoEo/IPIJaG1Bd3LfLp6RMhzmyIZ+lJZpdgaWht0VhTS
         NZHq4UbAyleloGngdnlhzUHhyUGaj+mJb/gIB9c35WVYAHFFdktu42yAWsdh7TXfqA5o
         GD+ZrUtOuQ9E/TSnGyQsnj70lULvWU5oolAYu1doeDbhlu0kCUyhtTTfuB0mJItGiELE
         YuMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:from:subject:sender:dkim-signature;
        bh=TfQ//ntKPhUmJ3iuSCb7ORcm61YrTvUMWgsTtLt8nRM=;
        b=nvC1MT97GN4twhja5QODz0FtxxEo5P+eCgtJa2Y+faC5t13l0SKQVWSpLtMiTeHxhU
         AH/Q/QLwZQNnJhqp5sF317iRaRDmDT3nsNLu6JePTQjBLTj/wMJGZMgZVSxmk4fLaRB+
         rPc44vS8Cw6rMeURart+tcWynP73w0aWZkXuwQmXqm1Hofge3VbZh69khXmD6muSnnQf
         4pOFK6Uw4PFlFh+2auOIfDYktNDOV65gRUDy0J/OJktLnzfBGoN8qR7svClzhDeFB7FX
         WaXE2hBqoBGB5h0hTc1QL2nl3ul9ZTGh7pyrgqxomAbO9dh/K7BEqdSQ3GIGAZyBZ3Wx
         ZvkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=X1rvwLPw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TfQ//ntKPhUmJ3iuSCb7ORcm61YrTvUMWgsTtLt8nRM=;
        b=JE9alL33qVaSCdismKdDVGXb5dPuY3bQqWtTsjXdf8GUdsSmdNNZq3XbIKKGDvbkzv
         bKAykrpWj8DeXBVqWljsyfXyeLbryWU4tX0cfxD5XqvPy693UjqTYoLGL4MYaWVKdrxq
         loAjdGZVxKZDWXjHgsgXPR7mbMLkU9E7guo2WXkO5kRwsQ8mHCpMpw1npa24QUK3H3w2
         8blj/Ql7fCmPh3qXqeFpKAU/Q/QWK7djuoLMuUewhCnTl3o3OsZTwXpRrmga1q8EDJeh
         canXKZtoj7rfTOM0nTp8VSnM+DR2KF+GiupdEkvMHH9ebvVChK1IU5D7eR8wu5LWHhm9
         Zbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TfQ//ntKPhUmJ3iuSCb7ORcm61YrTvUMWgsTtLt8nRM=;
        b=uioaGu6sL3ztwlIn6y91pUvh4IVvYfWpleUbJ1B3lqIJZUpg1GRv5a3HV4wtC0sN5q
         xzG+Jz9KadzXuW7Klp7zXgJvz3njdj44kSYzrnaR6LAjFl8+zreJjD1EPyB5DDuoBRWr
         GVUBTIz4eYc5ByjOW5DhZMNIAzocuR5kmCHqMKZXe2aIgVoX2YzB2Hxs3zqJP66s9uLv
         Q2rVbPaxu8BLKGdJQ54g6x21XvAh4uOH9frFeQGyBnMxDewC2mcu2+BMgIZe5p/yJpe1
         NT6FpvkZufEx4G5K/+VEdb+SiCt0zGEM8b/11hkX7rI7Ej2r8aAJDZTYdjhgvl37BCHk
         hCFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWxM/pYsU/nS3qpA4HZcyBiM+7ACdiND3VLb70KjblP/btAU1Zb
	1FaRmFN9AUh1qX4RojgorLU=
X-Google-Smtp-Source: APXvYqw12MWzG7KwYlnK8g2eSLX21RoScVeD3S86/jIDnKLUMIdVpqyxa6d3nmW5FERSTkC3Q2otJg==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr23159941wro.249.1580132379020;
        Mon, 27 Jan 2020 05:39:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:65d0:: with SMTP id e16ls6692057wrw.1.gmail; Mon, 27 Jan
 2020 05:39:38 -0800 (PST)
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr22649814wrx.288.1580132378406;
        Mon, 27 Jan 2020 05:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132378; cv=none;
        d=google.com; s=arc-20160816;
        b=xx6xhulkiDgAJ4EYX1neBsEhyYiKen5f1TSQuhv5y/sjDvWO2NuUKN40n6VqEY6U/m
         OUBUYnzvrzafZE4a3qkm/WCoq8MRA1gEzapj2Ne4179x7NRzYBy8RIAl1Rx4Nf958b2R
         41neefrkEpFHGLpbgr0Ovl3FtPVLDeipfPnE1dOXJquYy28oAO+i+uwBUrg7tVrGqtsm
         437DDOflltv33453QD2v3F1u5+SvLYr7W9U8AvRDLV2IsfVklQwCRfF8m4ySIfX7YUBj
         u1fV9Nl7Udx+Ac+1E0UcDc78YhRMjOOXjMfaufwaMF4SgxHsup7BSbpJlHkQSgxjvSB9
         Q5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:from:subject
         :dkim-signature;
        bh=3M/rAjjDtQXv+gB0ZEgBH3ShzFqisEPQL2zELGK7Xfo=;
        b=Tr3BAMol34F2dvDzLaMujMrxskRMKI7euoQvXQ9YcKUQbKzJjgbOgTN/uiNBbMXc9o
         tFJWBSK1ZLnUAYZ/997asBsKSZQj5ueeujWkLtnIZ65Dnhc9zyEJV43ghpnyzG7X9xDC
         0DCIYG7cqcU2gQSqJ0VHeHGIn66qOZFoSzDUfW4GkctA86BXkrelsSSFhUZOmTplAYau
         WmMATi+MrSrMFUvwxiyVRPcKdL2vjSvOOG9/LFCohXL1jkVqf0J5HNAgGNMCgw8PXXrn
         9kmCoHdsNxVfDAUqEIrMvtirH9mi+07O9bifYYm/wC9a+i/8B+Wno2iHICNBhG88W8OW
         xR3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=X1rvwLPw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id y13si509817wrs.0.2020.01.27.05.39.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MD8BU-1ioLun3kRI-00GcD4; Mon, 27
 Jan 2020 14:39:37 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
From: Jan Kiszka <jan.kiszka@web.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
 <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
Cc: jailhouse-dev@googlegroups.com
Message-ID: <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
Date: Mon, 27 Jan 2020 14:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lPcoaL901bQEyvTpSvr1muldB/evzbndt2HBwZQiAk+CIHEzMGm
 Y3bERMlI14D1/mmujMS0oI/f5cCQVD7KhbDUkNkwDkyviJojo3zPDlSYfyfhd1vilbQ6jbB
 LgnyoziuAmLq0j9cbFgZ4zNFKG2QJHOO1ZIVGanKcxtcBeLw9K+FCZpqF2mKc7wCG18l2j4
 jn59cAmeJnG4OFk5aUbEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6L9e1ExlqqE=:UGubpkKfoKUCtmgm2So14D
 X2PQWPxISKNxTrpYpQzZajj9sJOxD/BdY+UysGWdj3hR3eXmfTZQg225loSKK0JkUdPb8xNvQ
 KAR3gtId6FpmbTJcvUhtJOsZ1YWq1HJI9HxRGYghWdmdt3krq8CucTU+JejX+EwcrkPd6Hdoc
 4h8hwAZsBoV9buy/sD6MjAP2i6Tc7vvb2nUx/gabSC7PPf5Lmf7WvjfdcMkZZtizTHrLKIMOT
 Qejo2AYleupc2kX8wbY6PvK3Z75ZOWkrQeTb2VlFkFvLuMa4VbvE3KCLnr5MJPO+S06j9KSVu
 2PujMYLKbjpZuKMGBGODoVGbVzhoClm8bRIO7FbiUG3z4DCqQcQq92HHaDBTHAXx4TsVzlDfu
 6PfPjlkBRdh6d+Zmt98hxKXYyyYXjEPxDsXTnhJp7Za8mtYpD7Y5nTPcatz7HZqppgu3d4jKU
 7kWhD/92XcIG2SHa0gVAu5bt7KGPO23AhAwhsS4q7SJdK5tpAqZLUT3GVHy8wlOaCFbtuNCyT
 odgye27SONexE/B69FbyB6hffyG40G8KGeF3wCNc3VvUSp+mhYZiHMJbJCcMEF55fSeqznQyI
 y45f9lJkuN6Ea0eUxkavKjCVxwse9dAfuuF+dTFTriXXt6Lz/v/aXqcjLyJLY9C18cU867sYO
 cFcYAXEQDMErLsatkHbtapaUVYNL0pA9Ua2O5ipJU76YYjoUN7NlrRLFSKhN9Fxn5gDlXxDCj
 WrTN548PhB141sATS4Yt4chSOi9kbc4FYQufwBazqw7qWYz8TsbtTpcp8+j9faUA6flBzsOMD
 vImHH01bJthrvmOQofYR5t+fS9pmVY9es2+C08/KFP/RV5L8R0S7TewpZIYe7dJRfyOYGSNpq
 OmNoQExdBNWFTbc//JRxg8pDFIPOVsulyGsV/fmnm5CQGbUdbftUcBhXdB+5T6RWrjvMDM5Cq
 MnNEDTO2H/P2HuM7qxGR0b9OtEY9ZrMMllIY+/IYpfdnscSH2KugvIliJTeh6OfC/poHT0zUi
 DejUyC6TNqIdZpmMF07TWNdPkxRb+ubf83qxyRwdZvYdNbEu7OVjwj/SgMQncVSlFZhKYv22X
 tci8I/yEEpxAw4a8jEebI4i5LtaRxpxGw6/JZp0Iv6rwXqEes7l2637mna4OrxxS7+z5R/9sK
 sTZjcI+M1GrfPY8PVeDDaOigRYk/boYHEEMBiKxK709LKSKUYfr5HQghi/LLf2IuR00UDrPrh
 hIiokolnk+TPsdfB5
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=X1rvwLPw;       spf=pass
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

On 27.01.20 13:15, Jan Kiszka wrote:
> On 27.01.20 12:40, Ralf Ramsauer wrote:
>>
>>
>> On 27/01/2020 07:37, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Better pad than rely on both sides using the same compiler logic.
>>
>> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
>> avoid that the compiler accidentally does some other unintended
>> alignment / reordering?
>
> Do you mean "packed"? It shouldn't be needed at this stage, but it
> shouldn't harm as well.
>
>>
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>> b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>> index 83cec97b..aeab2816 100644
>>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>> @@ -38,6 +38,7 @@
>>>
>>> =C2=A0 #define COMM_REGION_COMMON_PLATFORM_INFO=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 gic_version;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 __u8 padding[7];=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicd_base;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicc_base;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicr_base;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>
>> BTW: It's really hard to trace how the structures are being defined.
>>
>> Instead of creating the structure in arch-specific parts for each
>> architecture, I think it would be nicer to introduce the structure for
>> all architectures, and then include arch-specific parts.
>
> ...as anonymous sub-structs - possibly.

Not that easy: The anonymous struct thing does not work, and the doxygen
documentation would have to be refactored as well.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7c7b7f79-3d23-3e78-bda5-60d88d040bc4%40web.de.
