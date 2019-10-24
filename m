Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBC5VY3WQKGQE6QIBF7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 913BEE3273
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 14:35:24 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id m16sf1209432wmg.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 05:35:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571920524; cv=pass;
        d=google.com; s=arc-20160816;
        b=NIHCRYtuQoAwXyGSjftgEMr7TFLl/ilbziAYin5MNLlmndTqN+eQx4Q4/5r4mKB2n0
         AYEaROnlLhBFJBEnaxrv0knA74sEIDD5xwxzbR4g22D8bNseHwCa44jN4AcqM2jqnYSw
         38dl8+QLWYKjDHMFahr0uC4n+mU+LZF6oj2vSRawwhq3Rc+5UZT7N4bgcrvXZOGvQAK1
         43g9fSsRLfW/cVNG7YDBePzQp0QijAPq5nc451iSd9LKMsgUudV2QT6BBBgJW0Y0nCoZ
         QF7JkSZRxVssUsvfKtg4rdSpgYYQXG2dEjgA5j6K345EMivdF+qVZvT51CwvEFCbx4Uc
         1F6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=TT+ss1dPBOdFXin3jS0ciNNfS7AXJ2HDob5iOnjWJR0=;
        b=MO1Q5mPZaq8FNUD0ag3i3T7in9D7KLylcLJI2oEFpOCOuihqMBzznx1QMAgZJ/2H4F
         1sLIJDYm/GtEcGCAHu4D+K+fIzCeWGKCfj/Kb7fPBvVLYvUMJjXsOtK87umH8l7yEWsO
         2kp2m7BmjjS+UgmU7nSmT2jnIHOoJ0Dl6QwsgN8f4CT4w2Wb5B3xz89Mxr2uPNa3j2PO
         GinvUiY0aso9kDhlYuHByBSSRktBXsTHLwr/lUjq0ETGxvqrzLV9MODMZFpQgngxwMQR
         JT6n0tnxvpr/kODggbi6wOXq8zyWFYbK8j7bOMSAQNrBmUpnwVPGHIPRd3VyTR3YIrok
         qgWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lqYi6OhO;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TT+ss1dPBOdFXin3jS0ciNNfS7AXJ2HDob5iOnjWJR0=;
        b=RCMocyszXL8VmyijsMy0iEzrGUppsT9Lk2Yl3rP5TMABIAjx2eN8KPf1/gtUzGrKPX
         bch2K+3iC7vu4KI4khnah+3HadviRbgDnthyZQSPFvrlCa9pL9RjrLuo8Ob75lhFhZYj
         KWHTlLMpOTgZQU14FhNU/a4mj6A9sbnjNHHwHS0n5Ke5Aqhf5a/xrGfrMa6Q0tq5nXiq
         jnSPk8402Lih8vnWXjwb+oiHI8iDirLi7+pN7LoRGxHABTdGMutc88XcYijNaduovWxQ
         tHldvr3+0G9lH7E0ghz4K9rkflplshFYwtvrbdw4WE1OOxpus6wSBlRAr/hQjbak9JaH
         UydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TT+ss1dPBOdFXin3jS0ciNNfS7AXJ2HDob5iOnjWJR0=;
        b=inYdLmuvZv+VVIbCmfiBffFRd02EW6iQ5GkdKyDTTz2Y08qu2r/+FKWQy9ez4S3ukp
         VtrcJJCtwVsGd7a0UrQVHsF8rtJRXMU2pIpYbLCSarwWzX26yQOqCBjte9URKXgoVeMI
         nAYkpE7XJAny00G/ggpa2W86KCaDY6uA24FaGyyxzLuMelgmtz8OtaRm37S/xjnJRd/U
         Kv8ydvm+gIEZAvkL043fnMSFFKDwHodelVLILzXAUrYuMYz+b8ZUAbT5gFoekJp7XRFW
         od6PQrwX9yYXsgvWHWhg92WigaAc505erxcaEelAH5IAQgxHgdEngfcxgk7WsX/EYszT
         nf9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6NVNUtoB3pvOJ5kytzOTpSmypV3aAUkokFWC3yR5XvbcJib8X
	niqx2zVb48/35cZE38cxDeg=
X-Google-Smtp-Source: APXvYqzEHuxed3tyY/9zKj94XMTajEV32PSLxg4LQ+Ini5NJYFf/zM0FMQAD/qC9htV7Z+MXjIM+kQ==
X-Received: by 2002:adf:c401:: with SMTP id v1mr1506154wrf.375.1571920524218;
        Thu, 24 Oct 2019 05:35:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd03:: with SMTP id a3ls723990wrm.6.gmail; Thu, 24 Oct
 2019 05:35:23 -0700 (PDT)
X-Received: by 2002:a5d:4341:: with SMTP id u1mr3744036wrr.306.1571920523401;
        Thu, 24 Oct 2019 05:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571920523; cv=none;
        d=google.com; s=arc-20160816;
        b=UU3KLHxlhzr14aBKcPa3j31tEjvYR+BBCgqMiGPA0eSUcMUFlknQNE9rrqEOCC8oFu
         bp2ZhS3BDs2JJrtM2V4WxK8qLxX5fHoGfsUsq78FHJBPma6H0qbcY/iqeT8bqL3+AEBf
         tGrLMw0Gt6yj8o+u8SNHbcQMvxrxv42DswsDYYuRRrKqVSpIm8NyfqamyY8CT8Sp6mTv
         ocqPNBhyAohFZTfqMegc5p2BTiafzi1oNXV8jBB+TnzBrSzl3J2LQWwPoloZ2NQRyO7V
         mf5vkDEcCmCst/MeZ1Wn1mWSo/DSVu89mQsEkNHTIs45breaghD+h1lJOY6BrYGJ2NK6
         s6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1w64mClfHtCuZa5WglBLy/7aHsogS+V+mSuWfsvYsro=;
        b=V9Aq5xBP55AO864mg/TamedEhWfBR4X8aTZRXIZMIMC8n7DdAoZE2upMstJwMdGuaI
         QoR49L88wv7CMXB8VEnGpUqFLW4lnBXMDIXAH6Aaqu4yLYGTnVsUOuTlPR15TvbYN3EM
         3pFfpbVhpOkBL26qG9Ht/XLDQe/pU2UmVyn2OUru+DYjG5HVV4fGC1Wj73hTtqwwdIwh
         z/WioVd94GQVCe39dNMTbb3RqWLflStmnefc3+CwGeA5LcSaEotxHoF246zyrg1OvHvB
         kmXvtJk8cjtpJM0slZgRoaQvnHpunyFyJovqtixWYOtmqpYrz5bWgyBWeIOd4iFiFlNn
         Kwnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lqYi6OhO;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id y185si125445wmd.4.2019.10.24.05.35.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.143] ([188.20.186.1]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfTx5-1idKjp36Dr-00P8a4; Thu, 24
 Oct 2019 14:35:22 +0200
Subject: Re: kernel build failure
To: Lokesh Vutla <lokeshvutla@ti.com>, Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
 <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
 <DB7PR04MB4490DA1071D41C031DA58A75886A0@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <c1007a6f-94d8-adc8-74b7-e54f0d90c69f@web.de>
 <11b1c6d3-e4c7-71e1-4d56-6733e1208372@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9801a314-22aa-698c-a240-69ca15065498@web.de>
Date: Thu, 24 Oct 2019 14:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <11b1c6d3-e4c7-71e1-4d56-6733e1208372@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:iUFJcjjFSKKjWcNEedvW0oTlWruV3pMcZAOpT9zebkutmqjEPxi
 fAGFfbjcFVqThBdlrwi6L9r8x/EvRlMC6eWK0049livRlRX6H8VOXZyVY7YLRdGIqg1E5TS
 wSMQxSgpdYuLBIfZ8jtLTl86tRPs7bH6UtjnQ1qKsdQCSoieiwLos7VyfhuWIKnKtrOniSC
 o+sgjhNTZRy0HRwkukR2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ddQcFb5UwE4=:5RudUdg7zySsiniGcus5Cg
 5GkeyJhJ/pYKRGOQOV9MfViajvPpEcBUpgOTws2fP1okMmMdnPRgOqXgV5OPSG3xMji+/FREG
 NfJG3FixgfKzFJqKW43al0Y8Xv4rn5fxAjQjWsOSzRXfRG4CFbilDQVpggkOcG8/e6A6mCUbC
 YVkNKWskL5NR9Tbhy9u959wl9Lsp/iWFMzfAwvk/AB31tjINcNeRjMmD2qqiGr8tijH0KLLd/
 FymT2+n+Oe4sPvOhJKrekb0ZjR6jauycbE0wPPN+61jS6JsyK0f4qGKVXy1VHs8eYQ5RXkDiu
 4w60J4g/JQxGmTsMDWzcrEbsboPbJrSaD2xDePHqN9zh5UE9JgEs1rW6KnQw5SY9Fnnb64yi+
 BRv7LdCTbl2tdCxQpshL2Mh6GqopSr859fynmcULqj8E5QKo1t5fFb9B21S/U8MfqSjVBkHV9
 //aWkZs8APexg64a7p/z0D7LD+v5410af+MpBQUowI0BLWx6AEVwJ5fc2F5Vik+oeQ00P5U59
 scdftGqTmZGfyzH4gk8z/7lV5ktpQh4NGIBagsNFu/Us9POtTtI36/9sXD7Iwl0kTBb85SMQF
 m4Keo/Dyg9GGYHPLfewDqI3CEBD7qVWOalUDiOWB478ZVA31jHE1EGKVkQRBawZ8zuQp6tkKr
 UsPR2Hadkkjaa3zFFn6ZjNETwaHxSo8o7NyC6xUjyvLtigx+dEL/GuinH/0r6fZO3zkNz4xMl
 o0njU8eSopgZ2nvt5e4M/X24fe9rnyZi9jr4/+Xg2NXVFl82GWB6+AaZ8WxNt0vKPaxsS/qAp
 gajreD1n2V62wKolcWTBGdiJe7fI41VM/bp28RYEWF/A9iToDN2w8zEXrI7iU+kOr7E5Ddutl
 xQnYA/9E+2y0edefDRB+x61OWFEK915ziRjWuYbDkxzhmZ/mkTRvi6N1SoVYitu/6anLSD+Lq
 84rDgk58m0DD4PlRCo9B6s6J4HGPIttiNGTcrupBoqlSaV7E6qqdPDSriAnILTDiyz3n6aQvG
 Ohis9+EQGj54zaaMDONGVaVnczaCU0UYAW2os04Ft7p6u342BMLpy6vmEl14BUnb+b9nUN0e0
 nAfsXAosaRJ5+VUZkRJNgjno3mvVr+aQZNbFoKzrP6zMgmYRChGiMH0aj+sqWPi6+gPAUGmmb
 96Nqc8eWH/qZsRXZBg1/qxUcV5p1ayz7AiHAZHMZPL20AdVzCMzKtuxoflrLel765XbUEkPUK
 KPnrHZi5u45F+xwivuCFaQdy4LvDrDp2XfQq5ZrnH0N+ByeGoBk1f0+SGT6o=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=lqYi6OhO;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 24.10.19 13:01, Lokesh Vutla wrote:
>
>
> On 24/10/19 4:28 PM, Jan Kiszka wrote:
>> On 24.10.19 12:09, Peng Fan wrote:
>>>> Subject: Re: kernel build failure
>>>>
>>>> On 24.10.19 08:07, 'Lokesh Vutla' via Jailhouse wrote:
>>>>>
>>>>>
>>>>> On 23/10/19 3:47 PM, Peng Fan wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> When MODVERSIONS and ASM_MODVERSIONS defined, your
>>>> queue/jailhouse tree will have build failure for ARM64.
>>>>>>
>>>>>> MODPOST vmlinux.o
>>>>>> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version
>>>> generation failed, symbol will not be versioned.
>>>>>>   MODINFO modules.builtin.modinfo
>>>>>>   LD      .tmp_vmlinux1
>>>>>> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation
>>>>>> R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used
>>>>>> when making a shared object
>>>>>
>>>>> allmodconfig fails as well without this hack. We are also carrying
>>>>> something
>>>>> similar:
>>>>>
>>>>> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.t
>>>>> i.com%2Fcgit%2Fcgit.cgi%2Fti-linux-kernel%2Fti-linux-kernel.git%2Fcomm
>>>>>
>>>> it%2F%3Fh%3Dti-linux-4.19.y%26id%3D6c809904ef4483971166142a12302c
>>>> 8a052
>>>>>
>>>> 2e23f&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Ca21a8c0c9486411f
>>>> eff908d7
>>>>>
>>>> 5869857b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370750
>>>> 825381915
>>>>>
>>>> 48&amp;sdata=9QXjDYuOkKHrAyoEbIF29oI9a%2BSkulsFtNFK3%2BLOy6M%3
>>>> D&amp;re
>>>>> served=0
>>>>>
>>>>
>>>> Cannot reproduce quickly with gcc-7 and current queues/jailhouse. Do I
>>>> need >=8?
>>>
>>> I am using gcc-8.2
>>>
>>
>> 8.3-2019.03 (arm-rel-8.36)
>>
>> CONFIG_HAVE_ASM_MODVERSIONS=y
>> CONFIG_MODVERSIONS=y
>> CONFIG_ASM_MODVERSIONS=y
>
> Can you try  allmodconfig? This is the trigger point where we noticed this failure.
>

That triggered it.

I would still recommend discussing that effect with upstream folks, even
when the change is not for upstream at this stage. Seems like some
oddity of the symbol export mechanism.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9801a314-22aa-698c-a240-69ca15065498%40web.de.
