Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBENKXPTAKGQEJ2YWG3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id E055413F66
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 14:20:33 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id s16sf5626770edc.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 05:20:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557058833; cv=pass;
        d=google.com; s=arc-20160816;
        b=c6KPBbcz2fu5ABqcu+h/SiLroGV8JTL53ZrOMX8MO/vl/ORjsUR1sKiNOP2qWuAfKr
         Jd6VN8DRKlXb4NleVrZZfhp+LWwGP3BsF3jSM9Gj5KYfuieEA/PP8DJ2QXynAy9PsVK3
         4X3CVVoImUKGOevm5TPU8DLSdo5vHcIkEBqffJ5Kr6kLzpCKjjw3TAiI5Ur6TR/R5imj
         4NoSk1dM/JwhGQ6TThOOEiO0aSM/ZsRm798ZAAutNnEOX8p6d/uhjDRX3zHxg4nV70Lx
         BUYouDswnjsl5b21z3eJGL4O63J+gJe1eOriZ1LHF8qgom2RGuhaCCMdQwl19OjLT+nL
         l9iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=SZDxgv0GfFzBZ5QWGEYPa2GVpGM4NGFTJOF0kSauK/o=;
        b=kG0xtzzDW9TRdjMi/eTuslom0wPS4wjFBoxA1c2dwPJlTB8H682MGp7JomhrfIpOXP
         YhVEg0nhaAi9KEbmT51HfM39LrRLQd/4XGC0Ub8j4+svtMXP+pOq4TXn4cyV89Z8zHAr
         YLLcHJRc9+trM1jnSDae+3PEp9JIa2nD5sirBs/NvznDdhuuyV98YlAUd7PGaJ7o+rXs
         MKS3YZw3mKN6y1ASuJL5GaUP8lYfE65pXHkE9vrQPhbvKRLg3QJW5IqSKDxE/ihwSAYZ
         V0mJUqMUnz9fgHFHKNYYxS65s8W0T6XA32o0lStWWbueK6uHy+koJAtG8dBY+TOQj6Np
         yreQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=T0yHPMEE;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SZDxgv0GfFzBZ5QWGEYPa2GVpGM4NGFTJOF0kSauK/o=;
        b=F6/36pDZsPpBiHewAGtzkz/vlMbs+OC+aPeXcOT+TooGIrc1xoLTqLtBqH8FYw9vzL
         hWzGf852qULYoIgmZ3fyYVY6ZLs8nTpZLOI/jtU+KTZGeHTzUSX9Eblm+AwiBEx5mO/m
         bIwcxTiyLm7BPHN7gmSymQf+6azI5xcBWXCYP2INIdnR3G+YGsZzdiOZVkVMgdX0f3PO
         VgbWtWkZuwCThRFoSSuuGuFyHmNYxRHmjDp0ym/0E2ze/tg4En7Vdu9+gYL/QUSabOmG
         NpkFwNgQLtY6nXb1yAtnUBzOlK5yNznQ1WKC1MnDRo/y39TpHkf0vbngkFu59WVDf2tL
         5+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SZDxgv0GfFzBZ5QWGEYPa2GVpGM4NGFTJOF0kSauK/o=;
        b=Zn34szk3d78lbfXl/OfsAzaD8JYB56+qJyAAmYe+Q6/E7w+zdRG0sRMbDuZ2bINAMj
         6TMySvug6Xgs6IOB+tVIjfdiqxEFSIHb73GCaBPhPfJI0q/MMBCCs48guBNVjn6sLNKV
         6R/3E5vmJEwkCd8psBSilU9wbNcVnAGmNeEoki31YjGZEGy7FHwwULEKgNNkSU9YP5ay
         t6O7C4iwCB7WU6ZsJ+I5RIEUTVYWItY2sTqeopqmK6wc2hLge7hCk0uMMTURKMPXX0T5
         1tcsAKyDeMXstWiRlQN1J9BS8zLS8gE9p0UOTDLNq3Tt7H4UJni+V8o0BU2XpevFzRhJ
         EQMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2+pd9fyMIJaNpEd1Sj/HArBaWiFi8OSRpGNM/L0o02s5pgv1C
	loooEBLmMxJWe7eyRTMopBE=
X-Google-Smtp-Source: APXvYqyPNxYmyxJG7o2oRrnp/LNWUa48UHjJb3T2e9akXBXVHwClDXn9x5VPvVkEz0Mhl9QCrHiXfw==
X-Received: by 2002:a17:906:31cf:: with SMTP id f15mr14739306ejf.246.1557058833610;
        Sun, 05 May 2019 05:20:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7b9:: with SMTP id h54ls2631685ede.14.gmail; Sun, 05
 May 2019 05:20:33 -0700 (PDT)
X-Received: by 2002:a05:6402:1484:: with SMTP id e4mr19918263edv.57.1557058833177;
        Sun, 05 May 2019 05:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557058833; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMaWzRrtFUkOc64JbdoetRVTYhYPmSMv1fcxVptTBwK8m00hO1s68/U7jSOU+ISF+A
         o8kOkawMunSczGpnW+NPFWuPs//x3fTnqcrA5H2EJOtCLfyei6AoSmG38Wazivs4JbB+
         XsHqWCysO0lDMO0Pyy9DtmRSTsyPrLM4JZXgrByZyGXRRzRhkdnU3ZD10v0gBKd/hHKD
         LvMe+aNRWvA1anEWefJyFtAVnDNi18cKLA/1W5AB4oaTh7rOXpWfohr1etqofeX0+mGf
         AZm7QQfAA+GfqWqWWzJUQNPc4EuPF3bSuBOUYJgIQx7IVerSsede7TmarW7BqjAXQCH1
         pbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pzS05JrrosOFimrRJV2QSyrRSVZILPj2PzV09FpOcZw=;
        b=D7yRpZOOk3BzQXtKEEQep+lL8wyREn1g552BMLZuPS4RVysU//Tmn+GBA8/2/FXUrT
         H0XBEUwuEO8P1YaR13axkfU0GD2RwyDxxSILDnAyK3d5uN0KaMt2FRqbrTR4gRx2dskX
         3h6Chvg8pAUuQhvndodroR1HgKQ54m89eN+8EdYJZsfUzJH/0jPIlGdz9NSwF601xoDl
         vEzT9J9d7N31uKuzIs+SWse3DJdGumaWKke2nI/71dFQb0ey7GzXGACO98OtS54oIDQX
         RjAeMwlX6naPMUC4f5Ym0kqi5ZWCFSgC5B8pEhm+DcUuzb9n4NRe8oJjnJAxgqfpu0/G
         Wfjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=T0yHPMEE;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id w5si404412edw.1.2019.05.05.05.20.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 05:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSai0-1hDJzw2YGC-00RXaY; Sun, 05
 May 2019 14:20:32 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
 <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
 <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
 <e0eb4015-8ab2-115c-416c-ecfa787c440f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5dea1644-ea93-bdc0-5fcd-9bb52e4ec0f1@web.de>
Date: Sun, 5 May 2019 14:20:31 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e0eb4015-8ab2-115c-416c-ecfa787c440f@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Rw6jXvMyVb7i5TiEJj9HGELtmKSXpDAZ8cQGylIuMOI8yk2Og7
 McAzd7mAl040dGvT8HpMc27L8n9wUhbgJ7d20DbfUp7pBSAkD6A5YhJezNRRzEmXodunXLz
 Nzfav2ZYiE+lcSzFC33jPxEIdDqdnKYak/T9deWcJxJvZj6HMkrz90QojEA5HvZYF8ju5zL
 lYFUrsZCRtQVbm1YxL/2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o9SgIpPqam4=:EEr3Z0teTyzb9sL657HhXO
 ByyJOrMDrMIy2SmdLqv71rZT71M/SHiQ6NKDiCgGHeIEKQzqpnJgIA9pXODLflO99ay8YCHNb
 hGjsWUhptU3bBSg9zvaBjNoY05jZz1pE2RJprjg1QbGEJ0bp33LmSynm+imeuknw/rGKbIZE2
 JFW9yg8zv0+ynqhhidPE16FEshXqQ1/mqhuzUrb/vlN2xu4GWZyJ3VOKWWwr2qKVZW12vztj5
 6vRrAnq60Mz2yNDMVXHWDa/GKKhtA3V14qCyJu6JsMsuxRMrMDv7BoErWkgIM9F8of6b49sa/
 JWFu7i0c1HPbw3J6TK96cPN49iJNtbHuP/R1kDwBlMPnfMDBaf/ZejNOQCySM8qAiyBbDAb9L
 iogZJMBae3WZxBS1Y+OEBkulENdcXvXnjCtjCE5+6tiZPL0zug12K9eaAWqq9GXtTVeFZseUM
 ZB2gYaAIqOqTw3hcoyzeTB0UnSQ47w80CEb/HfN3EibaDWhuDr0jbqNuDa4wMVMj3a3Yx9rM8
 kBhGq5aBeGIM2MPUgo7gqy4NCAX8hf66b3NWo1kkzL5rv2JcYgS5wxruAjFkSRyTgh3awUu7T
 Ib0lLZDnogP78MrfvR+aaRIK3nOrbVZ/MErp6wzVETUaunIGsqVcE7OZrrSt6MIMJXqXsMjF8
 Q/KyXjDWEDCQ6DmSVnuy6Nm+2U/NjV9pcP6ehDIIlaX6IOjfxgJ4oOjAO/1McrC+FEqftsls3
 7w8G+8rMpRwcLLIBL44nFTRUmXvKy7jWdjRGQDpwwfJTWfFTA3U8mnKsaj2RAXk58u3dltUis
 5z0Sq+7MibMIkaYNDbUZ1ZPTUxSXVfGGBQ8x0T09c+NdqanrMP+IThrEa/cDBSK6fB7rHStbJ
 236t8kRMXLuXAQAXXgqvQ+n9aZBaytKl+dKtI/XNRPeRYjAcmQdeckFOg+2MKkvFWVp9ixt53
 PLIFD1WevwA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=T0yHPMEE;       spf=pass
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

On 05.05.19 14:06, Ralf Ramsauer wrote:
> On 5/5/19 10:25 AM, Jan Kiszka wrote:
>> On 03.05.19 16:29, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 4/23/18 6:18 PM, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> The parser my bail out on opcode byte 0-2.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>  =C2=A0 hypervisor/arch/x86/mmio.c | 2 +-
>>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>>> index c1b9f10e8..775ec4b7b 100644
>>>> --- a/hypervisor/arch/x86/mmio.c
>>>> +++ b/hypervisor/arch/x86/mmio.c
>>>> @@ -219,7 +219,7 @@ error_noinst:
>>>>
>>>>  =C2=A0 error_unsupported:
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("FATAL: unsupported instr=
uction "
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 op[0].raw, op[1].raw, op[2].raw, op[3].raw);
>>>
>>> sorry for digging out this old patch, but I think we have a logical bug
>>> here:
>>>
>>> There are cases, where we jump to error_unsupported before all opcodes
>>> are set. In this case, the Hypervisor reports the wrong instruction,
>>> which really confused us for a while (Andrej found this).
>>>
>>
>> Yes, this is a known limitation, and the patch here just tried to reduce
>> the
>> level of confusion a bit. Before that patch, the output suggested that
>> we are
>> always at opcode byte 2. But we can fail at any byte.
>>
>> This is an expert debug tool. You are expected to parse the opcode bytes
>> yourself from left to right. And as soon as you hit an opcode that is no
>> longer
>> supported by us, you know that the succeeding zeros are invalid. If you
>> want to
>> full instruction, use RIP and disassemble the guest. Adding that logic
>> to the
>> hypervisor is not planned.
>
> Okay -- maybe we could strike out (0xXX) unknown bytes and simply count
> successfully parsed ops. This would at least give a hint that sth. went
> wrong.

We could also do full instruction parsing - if that didn't blow up the code=
 base...

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
