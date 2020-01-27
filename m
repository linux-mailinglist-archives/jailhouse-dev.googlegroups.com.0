Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJ4JXTYQKGQEKJWDOZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 372AE14A769
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 16:41:28 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id k18sf6267846wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:41:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580139688; cv=pass;
        d=google.com; s=arc-20160816;
        b=wIm57BBBim6lf1LTW/dB40GccHWbORoToTw5Upf0RyBgd/jH59E0awrzeoGSAmYGpi
         thN5PBYMwsv5k8P62xttQj0DNtxrKhgfT9ElEWC1ZdGtGWtG1egtXepyERFQ4jnckZI7
         JH+rtvylixGn7YXXMNxzADjuP7M52W/W7jE87gth2Q0zDYa2Sgaw6s5Pos5X1F0sF0Nm
         9APVlVmJgRAd7lJlSu21w2eP71oxuCWxOK0VH3Foga9/Lo9SNcFnzofR5Sddn+hpRSvL
         Or4nWDnYFLaJQxMyhLknNR47TcfFYGcDiActFG9EtBzJZBzeR+y7ImYNZOkocAL1FzwK
         KUdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=W6WbXpDE/qXa8ZwMH97T6JPnd9hFiWawTPFGiqxtHaA=;
        b=Z4Y1jwUiC4+JlZ9nMug1OnbopntiYHZbHV5D5LEO/UOiE3dnw8mpqiOUnPaHTMYvfF
         1RD0yTIaQedbc7FcTnp6YU3YP04SexwzPEq9bg7vtTbhi84dHBkCFk2nbg+bIQvNEpZr
         VIs8q4nJfkVA4VsK5gylDNX6oKliawcISdjaxSaSf9+T2emgciPrzWRM6vWVdoYIEFI9
         4a41sB8/MuKEhXlwzeRTv3dw1fI5JYd4QSOGh5ymxbDVN0QaZWWgL3j0N1nnobBTPtSw
         xtp0KZ/7tZFVajImjxQefZGUlwZEvGM7uJaooBixGF/S40hPQSZXD9qiFwtrjpUAGuyQ
         XsGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hdK5jVtJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W6WbXpDE/qXa8ZwMH97T6JPnd9hFiWawTPFGiqxtHaA=;
        b=W57pMgr6R0kqlkUrHk6hQcqk52uInj7wPZa7kf0d2wqH8qUSzFNmOBFAwWDGjbdyY0
         iGJAhluGrLPX3RFas/WAV4ld6enPwN9E1dbdlaOn6Ft83NVARKNhrGOGZtUBPiGL9Zqr
         pglMcK85CzNsdArl0hijvmWLqOUdym69cuK4bG9mux0UxEGzVsnJ3UhAwZq/vr6T6U5i
         tIUbRyo6jh8b7Imdqo7OEI9VOkZn8KuaFd0sYzaxNnPE4DpzxFwG8HtYvBARZIUBVqRR
         PCXuGSc2118uwvRvngkDa5o8STEQa49L8GWJ8jCXHrijHahaPnRreiZfNmIFvpoI7zUE
         jtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W6WbXpDE/qXa8ZwMH97T6JPnd9hFiWawTPFGiqxtHaA=;
        b=tJcpl5t29GIIIYimP9Ek8OPpzfYdgMIG3YUDmtLbyfbmkjhIUwZwh1l7cKVyx7Xs4J
         aJQIqBId2jBclWGwoPsWEp8pdi7adiH0/SKnOimJR/14IkZgZpcQp+t1mKZAXiMaGkUi
         kv+ZtduMRiPDSBFAGe9LlyzOnHDfZWxrjqB+BWnI/KXkK6F80mXcMSA1XKyVXYzuRCvK
         eyTstK/pj98fedjEv8d3ugEoLoU6t79jLk8LZBQBwUj9c7Bh7gip6EbI7GLpiMezo/WO
         j/oXJ4EKJjT7UKmEe6zDnhWQ9DbEA0mhXNX51l1wC3ZVxaD2S06rlpt2JQKt0B2/Uy8A
         z/Pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXd6xmbOpESnsIiF5weP1iSB/5B0Rm10JZXjhWxVg0TfoU4WDkh
	XV7WfnA3enMYfHndH7yrN7Q=
X-Google-Smtp-Source: APXvYqx6T6lgUV6kz6/KPA9VavFUNVzzNuTi+ECd3HMQdxQo8mlPRSfAj1R/NGdf76M1IazNbEOh8A==
X-Received: by 2002:a05:600c:2290:: with SMTP id 16mr14551007wmf.93.1580139687956;
        Mon, 27 Jan 2020 07:41:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls6885029wrw.4.gmail; Mon, 27 Jan
 2020 07:41:27 -0800 (PST)
X-Received: by 2002:adf:ebc1:: with SMTP id v1mr23540595wrn.351.1580139687459;
        Mon, 27 Jan 2020 07:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580139687; cv=none;
        d=google.com; s=arc-20160816;
        b=wb2opE5MZBnMfZfzG7ptvLc9fm6Ph4jCble0/q4KJMmUEByR/h2bM+TOc6iENWz3Lb
         1DJ58+ZfVp1gKbkQ8bOsZdahss461WW6uo3Sj9zhNgRE9fhCCbLPGZyw8i5f1HH5vrFK
         hWx9ZgVp/Zee8oFbOx4YzkMIChXx3j2vW8goAp9J+r4LAl9wOPGAjOJr8eP8y4kCjpxf
         /FhC6cxNwiaoIrJ1zL5v0PR2CcFq6+mJwoXKktrw9Kh2DdhXJE+eOpN2n8V941pY+kto
         pAC0Ij8Pij9t569pKZYQYNC5fjJkvTRst1evLw8q0Z2FNvKdlYoSXCKR9xpdx3/NazcA
         irdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=tE9sptnMl2mpxsC482xn05MbVruQJuCa3pyIZghCbv0=;
        b=syZjVbK2NMU8hUsttauGmkaMK8q0XftwXssDXLLvBLZawGnK4NSTj1BB1HeyIWok+s
         7FTPzOMIFy1Eu0x0tWDPS1+58juwFpmuUqi74zJ5qJL8rQzpxvj7RqpPlhlf/Xgzavlv
         1lnHlBwcSyH8H4LsuyjvBgr0KXqsHzvYNcX+b0ydM9ArrBWVTjvkyVDAq8/s0ty29Ftg
         aJe6mNBqAUda1UVeXsc+mtP3mz7aPK8/o7t74MPh/twcyPlSPeVMAw1vgXLZ2bNYISx4
         SVMmxB1kOIjf9bMgO8dMy0tF10uQzihivR+2LQyBDdylXMwUL1/LI5lxIusmHXqesCs0
         g4cw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hdK5jVtJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id y185si316467wmd.2.2020.01.27.07.41.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPHC8-1j0WMp000G-004Qvj; Mon, 27
 Jan 2020 16:41:27 +0100
Subject: Re: [PATCH 2/3] arm/arm64: Pad comm region to natural alignment
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1580107046.git.jan.kiszka@web.de>
 <beb95b54284b1defd0f1952d43f8143cf303d38f.1580107046.git.jan.kiszka@web.de>
 <ef68e345-9b82-e82a-65e1-da1cb9faf2c0@oth-regensburg.de>
 <185db5e4-618f-db9c-cd1b-d199b6af0c61@web.de>
 <7c7b7f79-3d23-3e78-bda5-60d88d040bc4@web.de>
 <80ed86e4-9082-42ad-b38d-7f97d440076e@oth-regensburg.de>
 <6dca7de6-edb3-b8e7-3738-803fde2118a9@web.de>
 <cb50b8e5-94d4-21f7-a920-398ea8efaf6d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1173c9e8-4f39-bd9d-6b8b-cb4c3ac263ed@web.de>
Date: Mon, 27 Jan 2020 16:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cb50b8e5-94d4-21f7-a920-398ea8efaf6d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h+WCCrVkeQ8omTnrs9FEVzhZRa84r4emeWCKyH5uTOm9ZgcrNDM
 omH36zkAbINX2o2yNjJId+O55mu76uJA0D675W0NZXSbnv7jC72UacGJKj5vRfAHDL7CeBm
 P2ZVJxSCfdYY9U4y0tJSIZmOHEQOJRosbRXRtgvHWs9cpES9ItUWVVgGnMHGCRn/gBt1XJp
 eOWDc/zV6eGoDP2Vqwy/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QTnWT0i+88k=:7RQylqK1Mra5sRSlM8PIqe
 +jaqAoaVgpfYFOP8zM+f49VtHkqW/I93ItP1biNR85jeqoIZp0vdXEo8z+BE8YWV53cswidQp
 857FDd46one0GpJfHwhdmQ58jneledPkQ9vEleI1WD/6UJ/SxPJ9Te3pbiynmPLhHXvWOzMAP
 hpQn0k3z+CXo7XCxQAghKV0LhCMLN1Pggm3IRwl41YXCspwrwenO66BpOGtkYYzoHaIVXohal
 8h/Di6Av/5thTGRJ6BqdqRuOYW7Pb4+D2QUk6bpE9vNbR8HkqnwFy9ujiCQmK7DA1S4+WIDKx
 e+TZsVZOJW6WY7GtepG1YNVObtlgnecUn41SCqLPexvWfBG3lZAaLOZYIzAEWx18PWv1EtomD
 1Ncv7B8gkARQi/+ecYAAfBImX6ydyvltcawCu5nGaZM7WhhfdjGrsVk+iW4KCcU5+coPyySMz
 3s2fuaAyOqnJEAul9beLYasVavdKYCaN2eAa15xkP9tEIoLmpSaIQ0axzOcSVxe1oq0xwwpZ1
 ZFdvREqC2M2h2koM56y2D0YdfA5fnXQy1m+y/7SXNxhdolZ3VKMRWWvORTSfud85UZVHhbA/x
 jLBRdnKS1fA7SEXU7MctN+FTUDjlqSstRO4lDojMeeyOvW55A3YUJ87HEqvx6bnKCi7EPOsiI
 73Sn5jcGPKo0aw/5x7RZpki9iA6xzI9xSBwOkDZeIZEMpMVlrSejF0lQmXIlFet94XCrSlZjk
 7QiE/W3XNOkqNtcN1DA3pvP1vFzN98eItth+huTs3f9XaVL0MfIq8+F309RimEO9zxsb97jyr
 c+tPnL9vWs3f4NE11yiAu3S9UWkdPqaUh7Wnjh0RsIvBYvHNKlUqEokyuWs1EGoiA1Koe6IzI
 4k4LG4RvuYWP4LryhxDg5HeRUSI/aUgiHjKsQJC8uF5vslpJj5Xv/WDfnmdubwov2jVREVL3G
 ql8msuxjXaEpTzutZ2pAQprWpiDbI6cINGhqCQE/BEkfMZOq7T6HkYhdrzfZSMOxrpwyB0Ra+
 RQ96iya0d4I1M6lZXh3xLcuI72Srm/gphBpuJ5sgki3nUP+4YG3QUIpd2QCGTN/LqQQRMXn7Y
 aVtjHKyz4CIQg9TdVhJuZfqD97oH8lSur1KUhjYQcPIEFxkj+UdF4MUcBbUWBCk3HwvQg34YC
 6Iq26KKSGCk+cxjhg/xwge4WIRq7fqkakot2TU/b4/WuOlgiq/YjoCxTQw9xfq4Odxw5XQaoo
 nZOT2hsLr7fiPUBke
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=hdK5jVtJ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 27.01.20 15:58, Ralf Ramsauer wrote:
>
>
> On 27/01/2020 15:45, Jan Kiszka wrote:
>> On 27.01.20 15:22, Ralf Ramsauer wrote:
>>>
>>>
>>> On 27/01/2020 14:39, Jan Kiszka wrote:
>>>> On 27.01.20 13:15, Jan Kiszka wrote:
>>>>> On 27.01.20 12:40, Ralf Ramsauer wrote:
>>>>>>
>>>>>>
>>>>>> On 27/01/2020 07:37, Jan Kiszka wrote:
>>>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>
>>>>>>> Better pad than rely on both sides using the same compiler logic.
>>>>>>
>>>>>> Ack. But shouldn't we then, in turn, use __attribute__((unpacked)) t=
o
>>>>>> avoid that the compiler accidentally does some other unintended
>>>>>> alignment / reordering?
>>>>>
>>>>> Do you mean "packed"? It shouldn't be needed at this stage, but it
>>>>> shouldn't harm as well.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>> ---
>>>>>>>  =C2=A0=C2=A0 include/arch/arm-common/asm/jailhouse_hypercall.h | 1=
 +
>>>>>>>  =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>>> b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>>> index 83cec97b..aeab2816 100644
>>>>>>> --- a/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>>> +++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
>>>>>>> @@ -38,6 +38,7 @@
>>>>>>>
>>>>>>>  =C2=A0=C2=A0 #define COMM_REGION_COMMON_PLATFORM_INFO=C2=A0=C2=A0=
=C2=A0 \
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 gic_version;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>> +=C2=A0=C2=A0=C2=A0 __u8 padding[7];=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicd_base;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicc_base;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 gicr_base;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>
>>>>>> BTW: It's really hard to trace how the structures are being defined.
>>>>>>
>>>>>> Instead of creating the structure in arch-specific parts for each
>>>>>> architecture, I think it would be nicer to introduce the structure f=
or
>>>>>> all architectures, and then include arch-specific parts.
>>>>>
>>>>> ...as anonymous sub-structs - possibly.
>>>>
>>>> Not that easy: The anonymous struct thing does not work, and the doxyg=
en
>>>> documentation would have to be refactored as well.
>>>
>>> Ack, just realised that as well.
>>>
>>> Have a look at the attachment. If you agree on this idea, I'll make a
>>> proper patch out of it.
>>
>> Not truly convinced as this pulls arch-specific stuff into the generic
>> header while we have asm headers in the loop. To avoid that, either use
>> non-anonymous arch structs or defines again (I was considering the latte=
r).
>
> I already tried the latter one, and looks like that's not possible: We
> need to have the structure in place before we include arch-specific
> headers, as the routines in the header already make use of them. Forward
> declaration isn't sufficient.

Ah, now I see: jailhouse_send_msg_to_cell/reply_from_cell is defined in
the arch header and needs jailhouse_comm_region ready.

>
> I'd go for the non-anonymous arch structs then, but still leave them in
> the generic header.

That won't change the picture. My idea was to have the struct composed
of another one, defined in that arch header. But that won't fly. Unless
we split headers. Doesn't look like that would add much value.

I've sent some alternative cleanup, though.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1173c9e8-4f39-bd9d-6b8b-cb4c3ac263ed%40web.de.
