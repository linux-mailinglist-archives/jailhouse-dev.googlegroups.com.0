Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5XOXPYQKGQEIZVD5II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0A14A672
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 15:45:10 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id v11sf7227223edw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 06:45:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580136310; cv=pass;
        d=google.com; s=arc-20160816;
        b=mJqhqt/zhQlZrC9t2zjQbZZbFNtNE5np40PzIn0CySNSvHBUK1/h+69azWUzVcUBf0
         Dd+2YR60eSwCvemMOJShFwy6bT7y4b2F17Rqr2y2yrgCJXxvBg/wiIRtjmrh7vvLU7mn
         1q3Lb40EuAwxXX140E75V8AKEvWIeCcfyf6ccdP0If2gM/tacARQsh0CeRKUR93BjVou
         rJ9UCN6dTA8kxNfDE1juGjjZ3RhT//BxlaogU7mDgvTzEWiB5T1r1NKKNQKnmWp6DTPz
         GlkZQNwJvSs0s/O8virIstpCHwBH3iBJMo3+shknqZ2cL+I9i4RF2fNPsfkvyX+1VQTs
         DfyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=3heBNGfxTax844GzNBPKDdNVwF/opjxe8B5yZ2BokQ4=;
        b=tp7xFxpCU00VUs7Koq1V5Ka09UqfQc1M+hN7vkaewikuf4qRYpdoJk5xYvMSBDbIjN
         gUPWtytOcwWegYsNrqfYUFkN8B5NPRtKqqW3Auu+JL6mgGd+6BvcKikFo+hBMGMOZR6A
         Hp2osdIi6Ymae7yy6g+LsBZHaXLIt83IXEdi/mHHwp3uAilBObpefDgPxF4NwLzApG5I
         vfmACnwpLs1gfHon7DwkZyE3HzWjeHqR/9+uIQgVtnOw86wyFZ4K8EuGxr+OOjrAcAWb
         YhIUlKJ0S/XJ8bYk2mYBTCGstA9ROhzX5IsTVqQ6sWO98hNQMlDJzUJqRs+KSybHD7bh
         BkRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cmRETzEF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3heBNGfxTax844GzNBPKDdNVwF/opjxe8B5yZ2BokQ4=;
        b=oE1dHau8mSoHopdBcbYElyzaFzoCkxaArQssT/RZfbg/tXz9fut/IQw6I2oXYRKTzC
         zRaLisAAJ/0PBRUlCnRxJ3/e9BB66fXj6PHhE6D9DMl+dZIiOf4RNyJFA03kcWwWUXCU
         amVawfmCXwzZbOKDLa9WZuvpb4sIRNtYwwBYCU32G5ygDF65BPeULJwZ/wG1Irp3OEfB
         7YHJfiS2vhfJ78NK8ZrOHIDzsnqZ+ypE8LhZrn+xP4g1UMacSsF2k0JMFKoX6Pcw9bs1
         cN+0R+NThgiXHhad0vI8Vd0mebQ45wxAPsgRgKsBfWB1t35Sqz46AeXOkEP2ZkECmXdp
         sz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3heBNGfxTax844GzNBPKDdNVwF/opjxe8B5yZ2BokQ4=;
        b=PgP0qzCCgyn5xQR+5eC/SHVWg13eluCRpgOf50o/YAOAGgzhcxn/nvZkAtromAWNKq
         P+s+99vX6k++Amwq+1KceZIs0pBj2aBiHYyLKYLcIxtv6PtvFlfTMwvRkYAeXM8uw07v
         7cropNFHIEYQPimf1KXP8YpQBeuGb+kLucHkehwJAJnepCFYuUb9UUxQW0DIQEhZJzwH
         kFwiiI2Ftlzym46IRP0IvdVYJodZ5NfT1FUhJRbEAzbDGUIyL/fRodkuoEiB4YoAgjXa
         oBzwvtsCVUA1c76/1FfJGWCH+frluRW5ZLIAYjU/ij9ufJmcM9Scoy7DEoljhtRNejrS
         UcQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXc6Cs7wCzbHRXARB7E7wn8RMhl1V2sS24AW1+qEuoub1XSX0F5
	+lwGyS32JpBG3jyzdzQ06L0=
X-Google-Smtp-Source: APXvYqwYsr5Z9FvdvJ9x++d3pqswwkxgNVpaewAd2kY8h9b9VSoWp5fIjqKnImDFpTOJiI8iAzxXlg==
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr13304406edr.164.1580136310472;
        Mon, 27 Jan 2020 06:45:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ed84:: with SMTP id h4ls2641874edr.7.gmail; Mon, 27 Jan
 2020 06:45:09 -0800 (PST)
X-Received: by 2002:a50:f391:: with SMTP id g17mr14124843edm.52.1580136309546;
        Mon, 27 Jan 2020 06:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580136309; cv=none;
        d=google.com; s=arc-20160816;
        b=tS8Vh1QFXuug4CSGUbyJbYEIqpwVqunL89kO1usfMubV3A31aHCNg0w/pLBsv5T16S
         Fry1jK+2wXpKxMGEv/25alc2cZXeycraHG9Y901U6f8psryiJBH7oBipH0Pec7dU7QbC
         6JReDYmbZSSP3ihLrN0ATkY9rHdld65C9Jj0CTEnoCncVTePc7ACErVOaWfCZ7NWPes2
         SjsadVyb56gul9u2I9EDzdDATlxDWXprrxjS15uSkYdulXbGObuJHRx3bd/IkxWs70b9
         kexF7DiHuxdAdZQ0DIaBDQDcszJrZYq90oUR0zU+9hMz8cx7+Xd+4LFeWQGYHQmBpFwe
         ZLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=911tBkAN1uV2i1RsuRFkiAKvsiBQnP/IyuVhN7qLmiQ=;
        b=NXw/Z/MlVgURhdhVYMUKCqoj4Acd59YT8JYvHEjAkkFhRGjTMwlapK8bSwND0EOEnB
         PTubKsPLtXxVe+3qcPcU3AA+DTkv0hp9fU0v7teycx7mplTAWHBUg6ippl2JwFQMGg7v
         Ch7mWgdE2Q0EuM58T5TM1WJqRwvRMuKPjkXuh48wW21O+2F+rJtefax0eFCfDDVbH3Cs
         UFDAMxsn6AVre9kq+M+LbJdnX/54krG0ftU7W9BQug9y0y/rtGGKFs7jXGwob5DlwRri
         YySkHKx+L3Z3K3QcjRtAPyzjZZAFA8mvH6u7ogm0N5HAv4qUolLZZokqUMknyptdWbkF
         ub5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cmRETzEF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id x18si619546eds.2.2020.01.27.06.45.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MhliZ-1jHix54AcN-00MpXe; Mon, 27
 Jan 2020 15:45:09 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
 <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
 <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
 <80ed86e4-9082-42ad-b38d-7f97d440076e@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6dca7de6-edb3-b8e7-3738-803fde2118a9@web.de>
Date: Mon, 27 Jan 2020 15:45:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <80ed86e4-9082-42ad-b38d-7f97d440076e@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L4Xo3G2/t82F7Mj+q3xwx4jHVE6IiD6QQnsbFXWGtbKLB+VXRJe
 oXXTl7QaR7l10Iuo0tHMARltst3D8wNMIZG4l2PUigI6p8Htc0Mrqxkv72WrZHoUSXqCd3v
 1rRLi/T0kkbxDZACeLcCDdp13bOfkhzdBm74V2NfBI+GaT+gCWFG0TB7zrIdH3WT6kPF3U6
 CS2eN+n0w633WqRWC9FIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6yOCGvhNHpg=:VQZ1KYlmqxNO5X8xZBgxZo
 79qeLQLzgweX5CYtbH+aVz0QEZHZMiZq9JsGgh29GAU2jA78ueyhQfGqyrSkeFO0pnaLdK6+H
 jC/9+a1qPsi8vILMHKMDwbHj+emX0vMelfWWZKJ81u/aJqge7GJVFSEAf990FeBIy2bkFX7I5
 1L+IsUKVVA7oEq36btImmWltj+y5nSqDgREUO2t7BcyDMMNJ4JKc0x4ycUfP7H8UHI3z2PvR1
 ECnrW9C/0LqHZc+Gcv960IDPeIfQBt4CVh6GUNwLp8BKsnIxgsm9aSt1z5o5SKovmQ1G7YsS9
 pnTsXTLKxm8t1FFrFNYGXWVhObonn3ENe5CkvBlotA9VYWMDsHtb0E97p9v4TXHsCScQlYpss
 aGqMNCFm3PVIfJnDhhVRYM7+uohymUbIBSz8zHbpQriPVlFISHL7Zv/qlg72TEHBcWDZCwdah
 Iw0Nr4i7BB6uJLSIFoEuhRtdS1wbBhOX3SBdsfRAPsoFR4k6ep6DH/UrnuV8iV1QHPjoIL1Gw
 11/YiY8An2kSpn17oNwtsGRGMD+kpKuDa2uXGi3e9Ia1RYjK/LnWTBqgbxG8W9Le8oOhwfcfy
 ptinXfH9kRQnWjUvpb0kxuC0ZeeHlzpJAFSFF/yPje+XaQqdo84cYTVwXF7T7vrcpZbDoJ+Xa
 pJrNzVBsUPlbpScbLtMBbbqIZbj7fIFh9p8boEASWtZUr8KEx4dOdHL9I/LcqFNUfZl6lhoEB
 vG7Q5is19bZQkDtbMVlr5l2Oj8A15wwAPd9LE1LRP5KPT7NesrqMvir6LDtM1VTaNWTY0moK5
 yHFHaL0Tk+znfakLWwKfIntWYskrPoTYLEJPEAnACNMgpCFqZvMQ0uKkTdUcmKHS8/dSEod2L
 pJ98hyFG/Pu2oeX4H9lxiSXCP7PYdbRRgPxlcFUZloKD9uUMqRu6voN0rhV0QQEfwjhaUD2U7
 y2J3mDXqRm/EsSkioIg4ddgprhTCl7BE+k/FN2yzC6Pf06+lmA2sZ6/NsCszw4YOXbiu0SHTo
 zoUQVA1mOYRXa/KKJMTiCB7e/eP1qlF42dOpaoLhxKBIr6inSzn6mBGg+WQNKkRS/Z9bT9Nhe
 mlwqOQ0CffAfPcok1xfVuDPUaPjty4AnY9QfW0LWmmEAjzMjci28hIyZ2v+Yxwz54y8n0mkpA
 10NtXXDewnLlCVuixZmqTt1WPu7/xJytNMf7lQhO82fqwz1AFgdjX+LqDlrtlP2vhfXpz9JvF
 jikczO0gaJgXuPDw1
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cmRETzEF;       spf=pass
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

On 27.01.20 15:22, Ralf Ramsauer wrote:
>
>
> On 27/01/2020 14:39, Jan Kiszka wrote:
>> On 27.01.20 13:15, Jan Kiszka wrote:
>>> On 27.01.20 12:40, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 27/01/2020 07:37, Jan Kiszka wrote:
>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>
>>>>> Better pad than rely on both sides using the same compiler logic.
>>>>
>>>> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) to
>>>> avoid that the compiler accidentally does some other unintended
>>>> alignment / reordering?
>>>
>>> Do you mean "packed"? It shouldn't be needed at this stage, but it
>>> shouldn't harm as well.
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>> ---
>>>>>  =C2=A0 include/arch/arm-common/asm/jailhouse_hypercall.h | 1 +
>>>>>  =C2=A0 1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>> b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>> index 83cec97b..aeab2816 100644
>>>>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>> @@ -38,6 +38,7 @@
>>>>>
>>>>>  =C2=A0 #define COMM_REGION_COMMON_PLATFORM_INFO=C2=A0=C2=A0=C2=A0 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 gic_version;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0 __u8 padding[7];=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicd_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicc_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicr_base;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>
>>>> BTW: It's really hard to trace how the structures are being defined.
>>>>
>>>> Instead of creating the structure in arch-specific parts for each
>>>> architecture, I think it would be nicer to introduce the structure for
>>>> all architectures, and then include arch-specific parts.
>>>
>>> ...as anonymous sub-structs - possibly.
>>
>> Not that easy: The anonymous struct thing does not work, and the doxygen
>> documentation would have to be refactored as well.
>
> Ack, just realised that as well.
>
> Have a look at the attachment. If you agree on this idea, I'll make a
> proper patch out of it.

Not truly convinced as this pulls arch-specific stuff into the generic
header while we have asm headers in the loop. To avoid that, either use
non-anonymous arch structs or defines again (I was considering the latter).

And doxygen is missing the struct at the right place now.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6dca7de6-edb3-b8e7-3738-803fde2118a9%40web.de.
